#include <ros/ros.h>
/**变量声明区开始**/
int counter;
const double pi = 3.14159265358979323846264;
const int STOR_LEN = 10;//储存数组

const int ctrl_rate = 30;//控制频率 hz

const int Filter_Len = 30;//中值滤波长度，每个数对应1/30s，这个不好全局调整，目前写在这里。如果为1就是不滤波。

double imu_test;
double temp_data;
//SMC参数
typedef struct _SMC_paras{
  double K_pa11;
  double K_pa12;
  double K_pa13;
  double K_pa21;
  double K_pa22;
  double K_pa23;

  double A_pa11;
  double A_pa12;
  double A_pa21;
  double A_pa22;

  double Mu_pa11;
  double Mu_pa12;
  double Mu_pa21;
  double Mu_pa22;
}SMC_paras;


  typedef struct _Robo_State{
  double X_a;
  double Y_a;
  double Theta_a; //当前实际的x，y，theta

  double dX_a;
  double dY_a;

  double X_c;
  double Y_c;
  double Theta_c; //期望的x，y，theta

  double X_e;
  double Y_e;
  double Theta_e; //期望与实际位置的偏差

  double V_a;
  double W_a;
  double V_c;
  double W_c;
  double V_e;
  double W_e;
  }Robo_State;

 SMC_paras SMC_paras1 = {0,0,0,0,0,0,0,0,0,0,0,0,0,0};
 SMC_paras SMC_paras2 = {0,0,0,0,0,0,0,0,0,0,0,0,0,0};
 Robo_State Robo_State_cur = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};//机器人当前的状态
 Robo_State Robo_State_des = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};//发出机器人控制状态
 Robo_State Robo_State_init = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};//发出机器人控制状态

bool is_vision_ini;

double X_cStor[STOR_LEN];
double Y_cStor[STOR_LEN];
double Theta_cStor[STOR_LEN];
double V_cStor[STOR_LEN];
double W_cStor[STOR_LEN];

double traj_counter;
double sys_time_his[STOR_LEN];

double ASMC_dD1[STOR_LEN];
double ASMC_dD2[STOR_LEN];

double slip_l;
double slip_r;
double slip_c;
double slip_cv;

double fil_slip_c;
double fil_slip_cv;

double Slip_cStor[STOR_LEN];
double Slip_cvStor[STOR_LEN];

double Fil_Slip_CStor[Filter_Len];
double Fil_Slip_CVStor[Filter_Len];

double Fil_Slip_C_Sort[Filter_Len];
double Fil_Slip_CV_Sort[Filter_Len];

double SMC_S1;
double SMC_S2;
double ASMC_dD1_cur;
double ASMC_dD2_cur;

double ASMC_D1_cur;
double ASMC_D2_cur;

double ASMC_D1_accu;
double ASMC_D2_accu;


int file_counter;

double V_limit;//设置v和w上下限，m/s和rad/s
double W_limit;

double time_interval;
double time_file;
/**变量声明区结束**/

//函数声明
void get_desired_pose();
void get_err_pose();
void run_SMC();
void run_A_SMC();
void set_paras();
void get_ASMC_D();
void get_SMC_S();

void get_slip();
void slip_compen();

double Sgn(double s, double epsilon);

double CentralDerivative(double time, int i,int signature);
double TrapezoidIntegral(double time, int i,int signature);
double CtrlDataFilter(int sign);
void TransStorage(int tran_signature);

double sysLocalTime();//获取系统时间，精确到毫秒
double real_time_span();//计算真实的时间间隔

void writefile();//建立新文档并写入
std::string int2string(int value);

void GetEulerAngles(double qx, double qy, double qz, double qw, double& pitch, double& roll, double& yaw);