#ifndef MOTIONCAPTURECLIENTFRAMEWORK_H
#define MOTIONCAPTURECLIENTFRAMEWORK_H

#include <arpa/inet.h>
#include <boost/optional.hpp>
#include <chrono>
#include <cstring>
#include <iostream>
#include <linux/limits.h>
#include <netdb.h>
#include <netinet/in.h>
#include <thread>
#include <unistd.h>

/// @todo: varun move these defines to a enum
#define NAT_CONNECT 0
#define NAT_SERVERINFO 1
#define NAT_REQUEST 2
#define NAT_RESPONSE 3
#define NAT_REQUEST_MODELDEF 4
#define NAT_MODELDEF 5
#define NAT_REQUEST_FRAMEOFDATA 6
#define NAT_FRAMEOFDATA 7
#define NAT_MESSAGESTRING 8
#define NAT_UNRECOGNIZED_REQUEST 100

#define MAX_PACKETSIZE 100000 // actual packet size is dynamic
#define MAX_NAMELENGTH 256

#define MULTICAST_ADDRESS "239.255.42.99"
#define PORT_COMMAND 1510 // NatNet Command channel
#define PORT_DATA 1511    // NatNet Data channel

namespace agile {

typedef struct {
  char szName[MAX_NAMELENGTH]; // sending app's name
  uint8_t Version[4];          // [major.minor.build.revision]
  uint8_t NatNetVersion[4];    // [major.minor.build.revision]
} sSender;

/*******************************************************************************/
// These are commented out because NatNet 2.8 (Motive 1.8) doesn't have this
// at all.You can check your own packageclient example in NatNet SDK for
// your own version. Commented by Peter Li
/*******************************************************************************/

/*
    typedef struct sSender_Server {
        sSender Common;
        // host's high resolution clock frequency (ticks per second)
        uint64_t HighResClockFrequency;
        uint16_t DataPort;
        bool IsMulticast;
        uint8_t MulticastGroupAddress[4];
    } sSender_Server;
*/
typedef struct {
  uint16_t iMessage;   // message ID (e.g. NAT_FRAMEOFDATA)
  uint16_t nDataBytes; // Num bytes in payload
  union {
    uint8_t cData[MAX_PACKETSIZE];
    char szData[MAX_PACKETSIZE];
    uint32_t lData[MAX_PACKETSIZE / sizeof(uint32_t)];
    float fData[MAX_PACKETSIZE / sizeof(float)];
    sSender Sender;
    //     sSender_Server SenderServer;
  } Data; // Payload incoming from NatNet Server
} sPacket;

struct Marker {
  int id;
  double x;
  double y;
  double z;
  double size;
  double residual;
};

struct Packet {
  int message_id;

  std::string model_name;
  int rigid_body_id;
  double pos[3];
  double orientation[4];
  std::vector<Marker> markers_;

  bool tracking_valid;
  float mean_marker_error;
  int labeled_marker_count;

  int frame_number;

  // NOTE: All are nanosecond timestamps
  uint64_t timestamp;
  uint64_t mid_exposure_timestamp;
  uint64_t camera_data_received_timestamp;
  uint64_t transmit_timestamp;
  // Calculated on receive.
  uint64_t receive_timestamp;
};

class motionCaptureClientFramework {

public:
  motionCaptureClientFramework(std::string &szMyIPAddress,
                               std::string &szServerIPAddress);

  // Starts connection to mocap and initializes settings.
  bool initConnection();

  // Blocking call that waits for a mocap packet to arrive. Then returns.
  void spin();

  bool isOK() { return ok_; }

  uint64_t getServerFrequency() { return server_frequency; };

  uint64_t getTimestamp() {
    return std::chrono::high_resolution_clock::now().time_since_epoch() /
           std::chrono::nanoseconds(1);
  }

  void setMulticastAddress(std::string address_) {
    multicast_address = address_;
  }

  std::vector<Packet> getPackets() { return processedPackets_; }

  bool IPAddress_StringToAddr(char *szNameOrAddress,
                              struct in_addr *Address) const;

  int CreateCommandSocket(in_addr_t IP_Address, unsigned short uPort);

  void setDataSocket(int sock) { DataSocket = sock; }

private:
  // Sockets
  int CommandSocket;
  int DataSocket;
  in_addr ServerAddress;
  sockaddr_in HostAddr;
  const char *my_address;
  const char *server_address;

  // Versioning
  int NatNetVersion[4] = {2, 8, 0, 0};
  int ServerVersion[4] = {1, 8, 0, 0};

  // Command mode global variables
  int gCommandResponse = 0;
  int gCommandResponseSize = 0;
  unsigned char gCommandResponseString[PATH_MAX];
  void CommandListenThread();

  // Instance vars
  uint64_t server_frequency = 0;
  bool ok_ = false;

  bool DecodeTimecode(unsigned int inTimecode, unsigned int inTimecodeSubframe,
                      int *hour, int *minute, int *second, int *frame,
                      int *subframe);

  // Takes timecode and assigns it to a string
  bool TimecodeStringify(unsigned int inTimecode,
                         unsigned int inTimecodeSubframe, char *Buffer,
                         size_t BufferSize);

  void DecodeMarkerID(int sourceID, int *pOutEntityID, int *pOutMemberID);

  void Unpack(char *pData, std::vector<Packet> &outputs);

  int SendCommand(char *szCommand);

  std::string multicast_address;

  std::vector<Packet> processedPackets_;
  Packet output_packet_;
};
}

#endif // MOTIONCAPTURECLIENTFRAMEWORK_H
