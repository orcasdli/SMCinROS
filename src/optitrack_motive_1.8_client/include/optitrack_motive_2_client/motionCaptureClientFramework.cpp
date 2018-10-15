// original source:https://github.com/AgileDrones/OptiTrack-Motive-2-Client
// by Winter Guerra
// winterg@mit.edu
// https://winter.industries/

#include "motionCaptureClientFramework.h"

namespace agile {

motionCaptureClientFramework::motionCaptureClientFramework(
    std::string &szMyIPAddress, std::string &szServerIPAddress) {
  // Convert address std::string to c_str.

  my_address = szMyIPAddress.c_str();
  server_address = szServerIPAddress.c_str();

  // init connection
  ok_ = initConnection();
}

bool motionCaptureClientFramework::initConnection() {
  const int optval = 0x100000;
  socklen_t optval_size = 4;

  in_addr MulticastAddress{}, MyAddress{}, ServerAddress{};
  int retval = -1;

  // Open socket for listening
  auto DataSocket = socket(AF_INET, SOCK_DGRAM, 0);
  MulticastAddress.s_addr = inet_addr(MULTICAST_ADDRESS);
  printf("Client: %s\n", my_address);
  printf("Server: %s\n", server_address);
  printf("Multicast Group: %s\n", MULTICAST_ADDRESS);

  // ================ Create "Command" socket
  unsigned short port = 1510;
  printf("2%s:%d.\n", my_address, port);
  auto CommandSocket = CreateCommandSocket(inet_addr(my_address), port);
  if (CommandSocket == -1) {
    // error
    printf("Command socket creation error\n");
  } else {
    // [optional] set to non-blocking
    // u_long iMode=1;
    // ioctlsocket(CommandSocket,FIONBIO,&iMode);
    // set buffer
    setsockopt(CommandSocket, SOL_SOCKET, SO_RCVBUF, (char *)&optval, 4);
    getsockopt(CommandSocket, SOL_SOCKET, SO_RCVBUF, (char *)&optval,
               &optval_size);
    if (optval != 0x100000) {
      // err - actual size...
      printf("[CommandSocket] ReceiveBuffer size = %d\n", optval);
    }
  }

  // allow multiple clients on same machine to use address/port
  int value = 1;
  retval = setsockopt(DataSocket, SOL_SOCKET, SO_REUSEADDR, (char *)&value,
                      sizeof(value));
  if (retval == -1) {
    close(DataSocket);
    printf("Error while setting DataSocket options\n");
    return -1;
  }
  unsigned short dport = 1511;
  struct sockaddr_in MySocketAddr {};
  memset(&MySocketAddr, 0, sizeof(MySocketAddr));
  MySocketAddr.sin_family = AF_INET;
  MySocketAddr.sin_port = htons(PORT_DATA);
  MySocketAddr.sin_addr.s_addr = htonl(INADDR_ANY);
  if (bind(DataSocket, (struct sockaddr *)&MySocketAddr,
           sizeof(struct sockaddr)) == -1) {
    printf("[PacketClient] bind failed\n");
    return 0;
  }
  // join multicast group
  struct ip_mreq Mreq {};
  Mreq.imr_multiaddr = MulticastAddress;
  Mreq.imr_interface = MyAddress;
  retval = setsockopt(DataSocket, IPPROTO_IP, IP_ADD_MEMBERSHIP, (char *)&Mreq,
                      sizeof(Mreq));
  if (retval == -1) {
    printf("[PacketClient] join failed\n");
    return -1;
  }
  // create a 1MB buffer
  setsockopt(DataSocket, SOL_SOCKET, SO_RCVBUF, (char *)&optval, 4);
  getsockopt(DataSocket, SOL_SOCKET, SO_RCVBUF, (char *)&optval, &optval_size);
  if (optval != 0x100000) {
    printf("[PacketClient] ReceiveBuffer size = %d\n", optval);
  }

  setDataSocket(DataSocket);

  // ================ Server address for commands
  sockaddr_in HostAddr;

  memset(&HostAddr, 0, sizeof(HostAddr));
  HostAddr.sin_family = AF_INET;
  HostAddr.sin_port = htons(PORT_COMMAND);
  HostAddr.sin_addr.s_addr = inet_addr(server_address);
  // send initial connect request
  agile::sPacket PacketOut{};
  PacketOut.iMessage = NAT_CONNECT;
  PacketOut.nDataBytes = 0;
  int nTries = 3;
  while (nTries--) {
    ssize_t iRet =
        sendto(CommandSocket, (char *)&PacketOut, 4 + PacketOut.nDataBytes, 0,
               (sockaddr *)&HostAddr, sizeof(HostAddr));
    printf("Trying to connect\n");
    if (iRet != -1)
      printf("Connected!\n Waiting for server info in response.\n");

    // Wait for server response.
    // This will contain the server tick frequency.
    char ip_as_str[INET_ADDRSTRLEN];
    ssize_t nDataBytesReceived;
    sockaddr_in TheirAddress{};
    agile::sPacket PacketIn{};
    socklen_t addr_len = sizeof(struct sockaddr);

    nDataBytesReceived =
        recvfrom(CommandSocket, (char *)&PacketIn, sizeof(agile::sPacket), 0,
                 (struct sockaddr *)&TheirAddress, &addr_len);

    //  if ((nDataBytesReceived == 0) || (nDataBytesReceived == -1))
    //   continue;

    // debug - print message
    inet_ntop(AF_INET, &(TheirAddress.sin_addr), ip_as_str, INET_ADDRSTRLEN);
    printf("[Client] Received command from %s: Command=%d, nDataBytes=%d\n",
           ip_as_str, (int)PacketIn.iMessage, (int)PacketIn.nDataBytes);

    /*******************************************************************************/
    // These are commented out because the package in header file has been
    // changed, commented by Peter Li
    /*******************************************************************************/
    /*
     unsigned char *ptr = (unsigned char *) &PacketIn;
     agile::sSender_Server *server_info = (agile::sSender_Server *) (ptr + 4);

     std::cout << "server tick frequency: " <<
     server_info->HighResClockFrequency << std::endl;
     server_frequency = server_info->HighResClockFrequency;
     // Done processing server response.
    */
    break;

    return true;
    printf("Initial connect request failed\n");
    return false;
  }
}

// ============================== Data mode ================================ //
// Funtion that assigns a time code values to 5 variables passed as arguments
// Requires an integer from the packet as the timecode and timecodeSubframe
bool motionCaptureClientFramework::DecodeTimecode(
    unsigned int inTimecode, unsigned int inTimecodeSubframe, int *hour,
    int *minute, int *second, int *frame, int *subframe) {
  bool bValid = true;

  *hour = (inTimecode >> 24) & 255;
  *minute = (inTimecode >> 16) & 255;
  *second = (inTimecode >> 8) & 255;
  *frame = inTimecode & 255;
  *subframe = inTimecodeSubframe;

  return bValid;
}

// Takes timecode and assigns it to a string
bool motionCaptureClientFramework::TimecodeStringify(
    unsigned int inTimecode, unsigned int inTimecodeSubframe, char *Buffer,
    size_t BufferSize) {
  bool bValid;
  int hour, minute, second, frame, subframe;
  bValid = DecodeTimecode(inTimecode, inTimecodeSubframe, &hour, &minute,
                          &second, &frame, &subframe);

  snprintf(Buffer, BufferSize, "%2d:%2d:%2d:%2d.%d", hour, minute, second,
           frame, subframe);
  for (unsigned int i = 0; i < strlen(Buffer); i++)
    if (Buffer[i] == ' ')
      Buffer[i] = '0';

  return bValid;
}

void motionCaptureClientFramework::DecodeMarkerID(int sourceID,
                                                  int *pOutEntityID,
                                                  int *pOutMemberID) {
  if (pOutEntityID)
    *pOutEntityID = sourceID >> 16;

  if (pOutMemberID)
    *pOutMemberID = sourceID & 0x0000ffff;
}

// Data listener thread. Listens for incoming bytes from NatNet
void motionCaptureClientFramework::spin() {

  char szData[20000];
  socklen_t addr_len = sizeof(struct sockaddr);
  sockaddr_in TheirAddress{};

  // Block until we receive a datagram from the network
  // (from anyone including ourselves)
  // ssize_t nDataBytesReceived =
  recvfrom(DataSocket, szData, sizeof(szData), 0, (sockaddr *)&TheirAddress,
           &addr_len);
  // Once we have bytes recieved Unpack organizes all the data
  //
  // Clear vector of previous packets.
  processedPackets_.clear();
  Unpack(szData, processedPackets_);

  /*if (outputs.size() > 0) {
      PublishPacketRos(outputs[0]);
    }*/
}

// ============================= Command mode ============================== //
// Send a command to Motive.
int motionCaptureClientFramework::SendCommand(char *szCommand) {
  // reset global result
  gCommandResponse = -1;

  // format command packet
  sPacket commandPacket{};
  strcpy(commandPacket.Data.szData, szCommand);
  commandPacket.iMessage = NAT_REQUEST;
  commandPacket.nDataBytes =
      (unsigned short)(strlen(commandPacket.Data.szData) + 1);

  // send command and wait (a bit)
  // for command response to set global response var in CommandListenThread
  ssize_t iRet = sendto(CommandSocket, (char *)&commandPacket,
                        4 + commandPacket.nDataBytes, 0, (sockaddr *)&HostAddr,
                        sizeof(HostAddr));
  if (iRet == -1) {
    printf("Socket error sending command");
  } else {
    int waitTries = 5;
    while (waitTries--) {
      if (gCommandResponse != -1)
        break;
      std::this_thread::sleep_for(std::chrono::milliseconds(30));
    }

    if (gCommandResponse == -1) {
      printf("Command response not received (timeout)");
    } else if (gCommandResponse == 0) {
      printf("Command response received with success");
    } else if (gCommandResponse > 0) {
      printf("Command response received with errors");
    }
  }

  return gCommandResponse;
}

void motionCaptureClientFramework::Unpack(char *pData,
                                          std::vector<Packet> &outputs) {
  // Checks for NatNet Version number. Used later in function.
  // Packets may be different depending on NatNet version.
  int major = NatNetVersion[0];
  int minor = NatNetVersion[1];

  char *ptr = pData;

  // printf("Begin Packet\n-------\n");

  output_packet_ = Packet();
  output_packet_.receive_timestamp = getTimestamp();
  // First 2 Bytes is message ID
  int MessageID = 0;
  memcpy(&MessageID, ptr, 2);
  ptr += 2;

  output_packet_.message_id = MessageID;

  // Second 2 Bytes is the size of the packet
  int nBytes = 0;
  memcpy(&nBytes, ptr, 2);
  ptr += 2;

  if (MessageID == 7) // FRAME OF MOCAP DATA packet
  {
    // Next 4 Bytes is the frame number
    int frameNumber = 0;
    memcpy(&frameNumber, ptr, 4);
    ptr += 4;
    //  printf("1---Frame # : %d\n", frameNumber);

    output_packet_.frame_number = frameNumber;

    // Next 4 Bytes is the number of data sets (markersets, rigidbodies, etc)
    int nMarkerSets = 0;
    memcpy(&nMarkerSets, ptr, 4);
    ptr += 4;
    // printf("Marker Set Count : %d\n", nMarkerSets);

    // Loop through number of marker sets and get name and data
    for (int i = 0; i < nMarkerSets; i++) {
      // Markerset name
      char szName[256];
      strcpy(szName, ptr);
      int nDataBytes = (int)strlen(szName) + 1;
      ptr += nDataBytes;

      // marker data
      int nMarkers = 0;
      memcpy(&nMarkers, ptr, 4);
      ptr += 4;
      // printf("Marker Count : %d\n", nMarkers);

      for (int j = 0; j < nMarkers; j++) {
        float x = 0;
        memcpy(&x, ptr, 4);
        ptr += 4;
        float y = 0;
        memcpy(&y, ptr, 4);
        ptr += 4;
        float z = 0;
        memcpy(&z, ptr, 4);
        ptr += 4;
        // printf("\tMarker %d : [x=%3.2f,y=%3.2f,z=%3.2f]\n", j, x, y, z);
      }
    }

    // Loop through unlabeled markers
    int nOtherMarkers = 0;
    memcpy(&nOtherMarkers, ptr, 4);
    ptr += 4;
    // OtherMarker list is Deprecated
    // // printf("Unidentified Marker Count : %d\n", nOtherMarkers);
    for (int j = 0; j < nOtherMarkers; j++) {
      float x = 0.0f;
      memcpy(&x, ptr, 4);
      ptr += 4;
      float y = 0.0f;
      memcpy(&y, ptr, 4);
      ptr += 4;
      float z = 0.0f;
      memcpy(&z, ptr, 4);
      ptr += 4;

      // Deprecated
      // // printf("\tMarker %d : pos = [%3.2f,%3.2f,%3.2f]\n",j,x,y,z);
    }

    // Loop through rigidbodies
    int nRigidBodies = 0;
    memcpy(&nRigidBodies, ptr, 4);
    ptr += 4;

    // TODO create one output packet per rigid body
    // printf("Rigid Body Count : %d\n", nRigidBodies);
    for (int j = 0; j < nRigidBodies; j++) {
      // Rigid body position and orientation
      int ID = 0;
      memcpy(&ID, ptr, 4);
      ptr += 4;
      float x = 0.0f;
      memcpy(&x, ptr, 4);
      ptr += 4;
      float y = 0.0f;
      memcpy(&y, ptr, 4);
      ptr += 4;
      float z = 0.0f;
      memcpy(&z, ptr, 4);
      ptr += 4;
      float qx = 0;
      memcpy(&qx, ptr, 4);
      ptr += 4;
      float qy = 0;
      memcpy(&qy, ptr, 4);
      ptr += 4;
      float qz = 0;
      memcpy(&qz, ptr, 4);
      ptr += 4;
      float qw = 0;
      memcpy(&qw, ptr, 4);
      ptr += 4;
      //   printf("ID : %d\n", ID);
      //  printf("pos: [%3.6f,%3.6f,%3.6f]\n", x, y, z);
      //   printf("ori: [%3.6f,%3.6f,%3.6f,%3.6f]\n", qx, qy, qz, qw);

      output_packet_.rigid_body_id = ID;
      output_packet_.pos[0] = x;
      output_packet_.pos[1] = y;
      output_packet_.pos[2] = z;
      output_packet_.orientation[0] = qx;
      output_packet_.orientation[1] = qy;
      output_packet_.orientation[2] = qz;
      output_packet_.orientation[3] = qw;

      // Before NatNet 3.0, marker data was here
      if (major < 3) {
        // associated marker positions
        int nRigidMarkers = 0;
        memcpy(&nRigidMarkers, ptr, 4);
        ptr += 4;
        // printf("Marker Count: %d\n", nRigidMarkers);
        int nBytes = nRigidMarkers * 3 * sizeof(float);
        float *markerData = (float *)malloc(nBytes);
        memcpy(markerData, ptr, nBytes);
        ptr += nBytes;

        if (major >= 2) {
          // associated marker IDs
          nBytes = nRigidMarkers * sizeof(int);
          int *markerIDs = (int *)malloc(nBytes);
          memcpy(markerIDs, ptr, nBytes);
          ptr += nBytes;

          // associated marker sizes
          nBytes = nRigidMarkers * sizeof(float);
          float *markerSizes = (float *)malloc(nBytes);
          memcpy(markerSizes, ptr, nBytes);
          ptr += nBytes;

          for (int k = 0; k < nRigidMarkers; k++) {
            // printf("\tMarker %d:
            // id=%d\tsize=%3.1f\tpos=[%3.2f,%3.2f,%3.2f]\n",
            // k,
            // markerIDs[k],
            // markerSizes[k],
            // markerData[k * 3],
            // markerData[k * 3 + 1],
            // markerData[k * 3 + 2]);
          }

          if (markerIDs)
            free(markerIDs);
          if (markerSizes)
            free(markerSizes);

        } else {
          for (int k = 0; k < nRigidMarkers; k++) {
            // printf("\tMarker %d: pos = [%3.2f,%3.2f,%3.2f]\n", k,
            // markerData[k * 3], markerData[k * 3 + 1],
            // markerData[k * 3 + 2]);
          }
        }
        if (markerData)
          free(markerData);
      }

      // NatNet version 2.0 and later
      if (major >= 2) {
        // Mean marker error
        float fError = 0.0f;
        memcpy(&fError, ptr, 4);
        ptr += 4;
        // printf("Mean marker error: %3.2f\n", fError);

        output_packet_.mean_marker_error = fError;
      }

      // NatNet version 2.6 and later
      if (((major == 2) && (minor >= 6)) || (major > 2)) {
        // params
        short params = 0;
        memcpy(&params, ptr, 2);
        ptr += 2;
        // 0x01 : rigid body was successfully tracked in this frame
        bool bTrackingValid = params & 0x01;

        // todo make this an int so it's obvious when it's unset
        output_packet_.tracking_valid = true;
        if (bTrackingValid) {
          // printf("Tracking Valid: True\n");
        } else {
          // printf("Tracking Valid: False\n");
        }
      }

    } // Go to next rigid body

    // Skeletons (NatNet version 2.1 and later)
    if (((major == 2) && (minor > 0)) || (major > 2)) {
      int nSkeletons = 0;
      memcpy(&nSkeletons, ptr, 4);
      ptr += 4;
      // printf("Skeleton Count : %d\n", nSkeletons);

      // Loop through skeletons
      for (int j = 0; j < nSkeletons; j++) {
        // skeleton id
        int skeletonID = 0;
        memcpy(&skeletonID, ptr, 4);
        ptr += 4;

        // Number of rigid bodies (bones) in skeleton
        int nRigidBodies = 0;
        memcpy(&nRigidBodies, ptr, 4);
        ptr += 4;
        // printf("Rigid Body Count : %d\n", nRigidBodies);

        // Loop through rigid bodies (bones) in skeleton
        for (int j = 0; j < nRigidBodies; j++) {
          // Rigid body position and orientation
          int ID = 0;
          memcpy(&ID, ptr, 4);
          ptr += 4;
          float x = 0.0f;
          memcpy(&x, ptr, 4);
          ptr += 4;
          float y = 0.0f;
          memcpy(&y, ptr, 4);
          ptr += 4;
          float z = 0.0f;
          memcpy(&z, ptr, 4);
          ptr += 4;
          float qx = 0;
          memcpy(&qx, ptr, 4);
          ptr += 4;
          float qy = 0;
          memcpy(&qy, ptr, 4);
          ptr += 4;
          float qz = 0;
          memcpy(&qz, ptr, 4);
          ptr += 4;
          float qw = 0;
          memcpy(&qw, ptr, 4);
          ptr += 4;
          // printf("ID : %d\n", ID);
          // printf("pos: [%3.2f,%3.2f,%3.2f]\n", x, y, z);
          // printf("ori: [%3.2f,%3.2f,%3.2f,%3.2f]\n", qx, qy, qz, qw);

          // Before NatNet 3.0, marker data was here
          if (major < 3) {
            // associated marker positions
            int nRigidMarkers = 0;
            memcpy(&nRigidMarkers, ptr, 4);
            ptr += 4;
            // printf("Marker Count: %d\n", nRigidMarkers);
            int nBytes = nRigidMarkers * 3 * sizeof(float);
            float *markerData = (float *)malloc(nBytes);
            memcpy(markerData, ptr, nBytes);
            ptr += nBytes;

            if (major >= 2) {
              // associated marker IDs
              nBytes = nRigidMarkers * sizeof(int);
              int *markerIDs = (int *)malloc(nBytes);
              memcpy(markerIDs, ptr, nBytes);
              ptr += nBytes;

              // associated marker sizes
              nBytes = nRigidMarkers * sizeof(float);
              float *markerSizes = (float *)malloc(nBytes);
              memcpy(markerSizes, ptr, nBytes);
              ptr += nBytes;

              for (int k = 0; k < nRigidMarkers; k++) {
                // printf("\tMarker %d:
                // id=%d\tsize=%3.1f\tpos=[%3.2f,%3.2f,%3.2f]\n",
                // k,
                // markerIDs[k],
                // markerSizes[k],
                // markerData[k * 3],
                // markerData[k * 3 + 1],
                // markerData[k * 3 + 2]);
              }

              if (markerIDs)
                free(markerIDs);
              if (markerSizes)
                free(markerSizes);

            } else {
              for (int k = 0; k < nRigidMarkers; k++) {
                // printf("\tMarker %d: pos = [%3.2f,%3.2f,%3.2f]\n", k,
                // markerData[k * 3], markerData[k * 3 + 1],
                // markerData[k * 3 + 2]);
              }
            }
            if (markerData)
              free(markerData);
          }

          // Mean marker error (NatNet version 2.0 and later)
          if (major >= 2) {
            float fError = 0.0f;
            memcpy(&fError, ptr, 4);
            ptr += 4;
            // printf("Mean marker error: %3.2f\n", fError);
          }

          // Tracking flags (NatNet version 2.6 and later)
          if (((major == 2) && (minor >= 6)) || (major > 2)) {
            // params
            short params = 0;
            memcpy(&params, ptr, 2);
            ptr += 2;
            // 0x01 : rigid body was successfully tracked in this frame
            bool bTrackingValid = params & 0x01;
            output_packet_.tracking_valid = bTrackingValid;
          }

        } // next rigid body

      } // next skeleton
    }

    // labeled markers (NatNet version 2.3 and later)
    if (((major == 2) && (minor >= 3)) || (major > 2)) {
      int nLabeledMarkers = 0;
      memcpy(&nLabeledMarkers, ptr, 4);
      ptr += 4;
      // printf("Labeled Marker Count : %d\n", nLabeledMarkers);
      output_packet_.labeled_marker_count = nLabeledMarkers;

      // Loop through labeled markers
      for (int j = 0; j < nLabeledMarkers; j++) {
        // id
        // Marker ID Scheme:
        // Active Markers:
        //   ID = ActiveID, correlates to RB ActiveLabels list
        // Passive Markers:
        //   If Asset with Legacy Labels
        //      AssetID 	(Hi Word)
        //      MemberID	(Lo Word)
        //   Else
        //      PointCloud ID
        int ID = 0;
        memcpy(&ID, ptr, 4);
        ptr += 4;
        int modelID, markerID;
        DecodeMarkerID(ID, &modelID, &markerID);

        // x
        float x = 0.0f;
        memcpy(&x, ptr, 4);
        ptr += 4;
        // y
        float y = 0.0f;
        memcpy(&y, ptr, 4);
        ptr += 4;
        // z
        float z = 0.0f;
        memcpy(&z, ptr, 4);
        ptr += 4;
        // size
        float size = 0.0f;
        memcpy(&size, ptr, 4);
        ptr += 4;

        // NatNet version 2.6 and later
        if (((major == 2) && (minor >= 6)) || (major > 2)) {
          // marker params
          short params = 0;
          memcpy(&params, ptr, 2);
          ptr += 2;
          // marker was not visible (occluded) in this frame
          bool bOccluded = (params & 0x01) != 0;
          // position provided by point cloud solve
          bool bPCSolved = (params & 0x02) != 0;
          // position provided by model solve
          bool bModelSolved = (params & 0x04) != 0;
          if (major >= 3) {
            // marker has an associated model
            bool bHasModel = (params & 0x08) != 0;
            // marker is an unlabeled marker
            bool bUnlabeled = (params & 0x10) != 0;
            // marker is an active marker
            bool bActiveMarker = (params & 0x20) != 0;
          }
        }

        // NatNet version 3.0 and later

        float residual = 0.0f;
        /*
       if (major >= 3) {
         // Marker residual
         memcpy(&residual, ptr, 4);
         ptr += 4;
       }
       */
        Marker marker_;
        marker_.id = markerID;
        marker_.residual = residual;
        marker_.size = size;
        marker_.x = x;
        marker_.y = y;
        marker_.z = z;

        output_packet_.markers_.push_back(marker_);
        // printf("ID  : [MarkerID: %d] [ModelID: %d]\n", markerID, modelID);
        // printf("pos : [%3.2f,%3.2f,%3.2f]\n", x, y, z);
        // printf("size: [%3.2f]\n", size);
        // printf("err:  [%3.2f]\n", residual);
      }
    }
    /*******************************************************************************/
    // These are commented out because the package in header file has been
    // changed, commented by Peter Li
    /*******************************************************************************/
    /*
        // Force Plate data (NatNet version 2.9 and later)
        if (((major == 2) && (minor >= 9)) || (major > 2)) {
          int nForcePlates;
          memcpy(&nForcePlates, ptr, 4);
          ptr += 4;
          for (int iForcePlate = 0; iForcePlate < nForcePlates; iForcePlate++) {
            // ID
            int ID = 0;
            memcpy(&ID, ptr, 4);
            ptr += 4;
            // printf("Force Plate : %d\n", ID);

            // Channel Count
            int nChannels = 0;
            memcpy(&nChannels, ptr, 4);
            ptr += 4;

            // Channel Data
            for (int i = 0; i < nChannels; i++) {
              // printf(" Channel %d : ", i);
              int nFrames = 0;
              memcpy(&nFrames, ptr, 4);
              ptr += 4;
              for (int j = 0; j < nFrames; j++) {
                float val = 0.0f;
                memcpy(&val, ptr, 4);
                ptr += 4;
                printf("%3.2f   ", val);
              }
              printf("\n");
            }
          }
        }
    */

    /*
        // Device data (NatNet version 3.0 and later)
        if (((major == 2) && (minor >= 11)) || (major > 2)) {
          int nDevices;
          memcpy(&nDevices, ptr, 4);
          ptr += 4;
          for (int iDevice = 0; iDevice < nDevices; iDevice++) {
            // ID
            int ID = 0;
            memcpy(&ID, ptr, 4);
            ptr += 4;
            // printf("Device : %d\n", ID);

            // Channel Count
            int nChannels = 0;
            memcpy(&nChannels, ptr, 4);
            ptr += 4;

            // Channel Data
            for (int i = 0; i < nChannels; i++) {
              // printf(" Channel %d : ", i);
              int nFrames = 0;
              memcpy(&nFrames, ptr, 4);
              ptr += 4;
              for (int j = 0; j < nFrames; j++) {
                float val = 0.0f;
                memcpy(&val, ptr, 4);
                ptr += 4;
                printf("%3.2f   ", val);
              }
              printf("\n");
            }
          }
        }
    */
    // software latency (removed in version 3.0)
    if (major < 3) {
      float softwareLatency = 0.0f;
      memcpy(&softwareLatency, ptr, 4);
      ptr += 4;
      // printf("software latency : %3.3f\n", softwareLatency);
    }

    // timecode
    unsigned int timecode = 0;
    memcpy(&timecode, ptr, 4);
    ptr += 4;
    unsigned int timecodeSub = 0;
    memcpy(&timecodeSub, ptr, 4);
    ptr += 4;
    char szTimecode[128] = "";
    TimecodeStringify(timecode, timecodeSub, szTimecode, 128);

    // timestamp
    double timestamp = 0.0f;

    // NatNet version 2.7 and later - increased from single to double precision
    if (((major == 2) && (minor >= 7)) || (major > 2)) {
      memcpy(&timestamp, ptr, 8);
      ptr += 8;
    } else {
      float fTemp = 0.0f;
      memcpy(&fTemp, ptr, 4);
      ptr += 4;
      timestamp = (double)fTemp;
    }

    // Convert to microseconds
    output_packet_.timestamp = (timestamp * 1e9) / server_frequency;
    // printf("Timestamp : %3.3f\n", timestamp);

    /*******************************************************************************/
    // These are commented out because the package in header file has been
    // changed, commented by Peter Li
    /*******************************************************************************/
    /*
        // high res timestamps (version 3.0 and later)
        if (major >= 3) {
          uint64_t cameraMidExposureTimestamp = 0;
          memcpy(&cameraMidExposureTimestamp, ptr, 8);
          ptr += 8;
          // printf("Mid-exposure timestamp : %" PRIu64 "\n",
          //        cameraMidExposureTimestamp);

          uint64_t cameraDataReceivedTimestamp = 0;
          memcpy(&cameraDataReceivedTimestamp, ptr, 8);
          ptr += 8;
          // printf("Camera data received timestamp : %" PRIu64 "\n",
          //        cameraDataReceivedTimestamp);

          uint64_t transmitTimestamp = 0;
          memcpy(&transmitTimestamp, ptr, 8);
          ptr += 8;
          // printf("Transmit timestamp : %" PRIu64 "\n", transmitTimestamp);

          // Convert timestamps to microseconds and save them in the output
       packet

          output_packet_.mid_exposure_timestamp =
       (cameraMidExposureTimestamp*1e9)/server_frequency;
          output_packet_.camera_data_received_timestamp =
       (cameraDataReceivedTimestamp*1e9)/server_frequency;
          output_packet_.transmit_timestamp =
       (transmitTimestamp*1e9)/server_frequency;
        }
    */
    // frame params
    short params = 0;
    memcpy(&params, ptr, 2);
    ptr += 2;
    // 0x01 Motive is recording
    bool bIsRecording = (params & 0x01) != 0;
    // 0x02 Actively tracked model list has changed
    bool bTrackedModelsChanged = (params & 0x02) != 0;

    // end of data tag
    int eod = 0;
    memcpy(&eod, ptr, 4);
    ptr += 4;
    // printf("End Packet\n-------------\n");

  } else if (MessageID == 5) // Data Descriptions
  {
    // number of datasets
    int nDatasets = 0;
    memcpy(&nDatasets, ptr, 4);
    ptr += 4;
    printf("Dataset Count : %d\n", nDatasets);

    for (int i = 0; i < nDatasets; i++) {
      printf("Dataset %d\n", i);

      int type = 0;
      memcpy(&type, ptr, 4);
      ptr += 4;
      printf("Type : %d\n", type);

      if (type == 0) // markerset
      {
        // name
        char szName[256];
        strcpy(szName, ptr);
        int nDataBytes = (int)strlen(szName) + 1;
        ptr += nDataBytes;
        printf("Markerset Name: %s\n", szName);

        // marker data
        int nMarkers = 0;
        memcpy(&nMarkers, ptr, 4);
        ptr += 4;
        printf("Marker Count : %d\n", nMarkers);

        for (int j = 0; j < nMarkers; j++) {
          char szName[256];
          strcpy(szName, ptr);
          int nDataBytes = (int)strlen(szName) + 1;
          ptr += nDataBytes;
          printf("Marker Name: %s\n", szName);
        }
      } else if (type == 1) // rigid body
      {
        if (major >= 2) {
          // name
          char szName[MAX_NAMELENGTH];
          strcpy(szName, ptr);
          ptr += strlen(ptr) + 1;
          printf("Name: %s\n", szName);
        }

        int ID = 0;
        memcpy(&ID, ptr, 4);
        ptr += 4;
        printf("ID : %d\n", ID);

        int parentID = 0;
        memcpy(&parentID, ptr, 4);
        ptr += 4;
        printf("Parent ID : %d\n", parentID);

        float xoffset = 0;
        memcpy(&xoffset, ptr, 4);
        ptr += 4;
        printf("X Offset : %3.2f\n", xoffset);

        float yoffset = 0;
        memcpy(&yoffset, ptr, 4);
        ptr += 4;
        printf("Y Offset : %3.2f\n", yoffset);

        float zoffset = 0;
        memcpy(&zoffset, ptr, 4);
        ptr += 4;
        printf("Z Offset : %3.2f\n", zoffset);

        // Per-marker data (NatNet 3.0 and later)
        if (major >= 3) {
          int nMarkers = 0;
          memcpy(&nMarkers, ptr, 4);
          ptr += 4;

          // Marker positions
          nBytes = nMarkers * 3 * sizeof(float);
          float *markerPositions = (float *)malloc(nBytes);
          memcpy(markerPositions, ptr, nBytes);
          ptr += nBytes;

          // Marker required active labels
          nBytes = nMarkers * sizeof(int);
          int *markerRequiredLabels = (int *)malloc(nBytes);
          memcpy(markerRequiredLabels, ptr, nBytes);
          ptr += nBytes;

          for (int markerIdx = 0; markerIdx < nMarkers; ++markerIdx) {
            float *markerPosition = markerPositions + markerIdx * 3;
            const int markerRequiredLabel = markerRequiredLabels[markerIdx];

            printf("\tMarker #%d:\n", markerIdx);
            printf("\t\tPosition: %.2f, %.2f, %.2f\n", markerPosition[0],
                   markerPosition[1], markerPosition[2]);

            if (markerRequiredLabel != 0) {
              printf("\t\tRequired active label: %d\n", markerRequiredLabel);
            }
          }

          free(markerPositions);
          free(markerRequiredLabels);
        }
      } else if (type == 2) // skeleton
      {
        char szName[MAX_NAMELENGTH];
        strcpy(szName, ptr);
        ptr += strlen(ptr) + 1;
        printf("Name: %s\n", szName);

        int ID = 0;
        memcpy(&ID, ptr, 4);
        ptr += 4;
        printf("ID : %d\n", ID);

        int nRigidBodies = 0;
        memcpy(&nRigidBodies, ptr, 4);
        ptr += 4;
        printf("RigidBody (Bone) Count : %d\n", nRigidBodies);

        for (int i = 0; i < nRigidBodies; i++) {
          if (major >= 2) {
            // RB name
            char szName[MAX_NAMELENGTH];
            strcpy(szName, ptr);
            ptr += strlen(ptr) + 1;
            printf("Rigid Body Name: %s\n", szName);
          }

          int ID = 0;
          memcpy(&ID, ptr, 4);
          ptr += 4;
          printf("RigidBody ID : %d\n", ID);

          int parentID = 0;
          memcpy(&parentID, ptr, 4);
          ptr += 4;
          printf("Parent ID : %d\n", parentID);

          float xoffset = 0;
          memcpy(&xoffset, ptr, 4);
          ptr += 4;
          printf("X Offset : %3.2f\n", xoffset);

          float yoffset = 0;
          memcpy(&yoffset, ptr, 4);
          ptr += 4;
          printf("Y Offset : %3.2f\n", yoffset);

          float zoffset = 0;
          memcpy(&zoffset, ptr, 4);
          ptr += 4;
          printf("Z Offset : %3.2f\n", zoffset);
        }
      }

    } // next dataset

    printf("End Packet\n-------------\n");

  } else {
    printf("Unrecognized Packet Type.\n");
  }

  outputs.push_back(output_packet_);
}

int motionCaptureClientFramework::CreateCommandSocket(in_addr_t IP_Address,
                                                      unsigned short uPort) {
  struct sockaddr_in my_addr {};
  static unsigned long ivalue;
  static unsigned long bFlag;
  int nlengthofsztemp = 64;
  int sockfd;

  // Create a blocking, datagram socket
  if ((sockfd = socket(AF_INET, SOCK_DGRAM, 0)) == -1) {

    return -1;
  }

  // bind socket
  memset(&my_addr, 0, sizeof(my_addr));
  my_addr.sin_family = AF_INET;
  my_addr.sin_port = htons(uPort);
  my_addr.sin_addr.s_addr = IP_Address;
  if (bind(sockfd, (struct sockaddr *)&my_addr, sizeof(struct sockaddr)) ==
      -1) {

    close(sockfd);
    return -1;
  }

  // set to broadcast mode
  ivalue = 1;
  if (setsockopt(sockfd, SOL_SOCKET, SO_BROADCAST, (char *)&ivalue,
                 sizeof(ivalue)) == -1) {
    printf("3.\n");
    close(sockfd);
    return -1;
  }

  return sockfd;
}

// Command response listener thread
void motionCaptureClientFramework::CommandListenThread() {
  char ip_as_str[INET_ADDRSTRLEN];
  ssize_t nDataBytesReceived;
  sockaddr_in TheirAddress{};
  sPacket PacketIn{};
  socklen_t addr_len = sizeof(struct sockaddr);

  while (true) {
    // blocking
    nDataBytesReceived =
        recvfrom(CommandSocket, (char *)&PacketIn, sizeof(sPacket), 0,
                 (struct sockaddr *)&TheirAddress, &addr_len);

    if ((nDataBytesReceived == 0) || (nDataBytesReceived == -1))
      continue;

    // debug - print message
    inet_ntop(AF_INET, &(TheirAddress.sin_addr), ip_as_str, INET_ADDRSTRLEN);
    printf("[Client] Received command from %s: Command=%d, nDataBytes=%d\n",
           ip_as_str, (int)PacketIn.iMessage, (int)PacketIn.nDataBytes);
    /*
    unsigned char *ptr = (unsigned char *) &PacketIn;
    sSender_Server *server_info = (sSender_Server *) (ptr + 4);

    std::cout << "server tick frequency: " << server_info->HighResClockFrequency
    << std::endl;
  */
    std::vector<Packet> outputs;

    // handle command
    switch (PacketIn.iMessage) {
    case NAT_MODELDEF:
      std::cout << "[Client] Received NAT_MODELDEF packet";
      Unpack((char *)&PacketIn, outputs);
      break;
    case NAT_FRAMEOFDATA:
      std::cout << "[Client] Received NAT_FRAMEOFDATA packet";
      Unpack((char *)&PacketIn, outputs);
      break;

    case NAT_SERVERINFO:

      /*******************************************************************************/
      // These are commented out because the package in header file has been
      // changed, commented by Peter Li
      /*******************************************************************************/
      /*
        // Streaming app's name, e.g., Motive
      std::cout << server_info->Common.szName << " ";
        // Streaming app's version, e.g., 2.0.0.0
        for (int i = 0; i < 4; ++i) {
          std::cout << static_cast<int>(server_info->Common.Version[i]) << ".";
        }
        std::cout << '\b' << std::endl;
        // Streaming app's NatNet version, e.g., 3.0.0.0
        std::cout << "NatNet ";
        int digit;
        for (int i = 0; i < 4; ++i) {
          digit = static_cast<int>(server_info->Common.NatNetVersion[i]);
          std::cout << digit << ".";
        }
        std::cout << '\b' << std::endl;
        // Save versions in global variables
        for (int i = 0; i < 4; i++) {
          NatNetVersion[i] = server_info->Common.NatNetVersion[i];
          ServerVersion[i] = server_info->Common.Version[i];
        }
        */
      std::cout << "do nothing";
      break;

    case NAT_RESPONSE:
      gCommandResponseSize = PacketIn.nDataBytes;
      if (gCommandResponseSize == 4)
        memcpy(&gCommandResponse, &PacketIn.Data.lData[0],
               gCommandResponseSize);
      else {
        memcpy(&gCommandResponseString[0], &PacketIn.Data.cData[0],
               gCommandResponseSize);
        printf("Response : %s", gCommandResponseString);
        gCommandResponse = 0; // ok
      }
      break;
    case NAT_UNRECOGNIZED_REQUEST:
      printf("[Client] received 'unrecognized request'\n");
      gCommandResponseSize = 0;
      gCommandResponse = 1; // err
      break;
    case NAT_MESSAGESTRING:
      printf("[Client] Received message: %s\n", PacketIn.Data.szData);
      break;
    }
  }
}

// Convert IP address string to address
bool motionCaptureClientFramework::IPAddress_StringToAddr(
    char *szNameOrAddress, struct in_addr *Address) const {
  int retVal;
  struct sockaddr_in saGNI;
  char hostName[256];
  char servInfo[256];
  u_short port;
  port = 0;

  // Set up sockaddr_in structure which is passed to the getnameinfo function
  saGNI.sin_family = AF_INET;
  saGNI.sin_addr.s_addr = inet_addr(szNameOrAddress);
  saGNI.sin_port = htons(port);

  // getnameinfo in WS2tcpip is protocol independent
  // and resolves address to ANSI host name
  if ((retVal = getnameinfo((sockaddr *)&saGNI, sizeof(sockaddr), hostName, 256,
                            servInfo, 256, NI_NUMERICSERV)) != 0) {
    // Returns error if getnameinfo failed
    printf("[PacketClient] GetHostByAddr failed\n");
    return false;
  }

  Address->s_addr = saGNI.sin_addr.s_addr;
  return true;
}
}
