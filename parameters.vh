//PWM Parameters
//Do not exceed 80% on per H-Bridge specifications (Allows for a max of 2.5A Stall)
//HARD > Veer at all times
parameter PWM_FULL_SPEED_PERCENT_ON = 80;
parameter PWM_HARD_SPEED_PERCENT_ON = 80;
parameter PWM_VEER_SPEED_PERCENT_ON = 42;
parameter PWM_NINETY_SPEED_PERCENT_ON = 50;
parameter PWM_NINETY_FAST_SPEED_PERCENT_ON = 80;
parameter PWM_FREQUENCY  = 80;
parameter PWM_COUNT_FREQ = 50_000_000/(PWM_FREQUENCY);
parameter PWM_COUNT_FULL_SPEED_ON   = PWM_COUNT_FREQ*PWM_FULL_SPEED_PERCENT_ON/100;
parameter PWM_COUNT_VEER_SPEED_ON   = PWM_COUNT_FREQ*PWM_VEER_SPEED_PERCENT_ON/100;
parameter PWM_COUNT_HARD_SPEED_ON   = PWM_COUNT_FREQ*PWM_HARD_SPEED_PERCENT_ON/100;
parameter PWM_COUNT_NINETY_SPEED_ON   = PWM_COUNT_FREQ*PWM_NINETY_SPEED_PERCENT_ON/100;
parameter PWM_COUNT_NINETY_FAST_SPEED_ON   = PWM_COUNT_FREQ*PWM_NINETY_FAST_SPEED_PERCENT_ON/100;

//Drive State Machine States
parameter DRIVE = 2'b00;
parameter COLLISION = 2'b10;
parameter JUNCTION = 2'b11;

//Direction Control
parameter DC_PROCEED = 2'b00;
parameter DC_TURN_LEFT = 2'b01;
parameter DC_TURN_RIGHT = 2'b10;
parameter DC_STOP = 2'b11;
parameter DC_FULL = 2'b00;
parameter DC_VEER = 2'b01;
parameter DC_HARD = 2'b10;

//Tone Detection
parameter TD_FORWARD = 3'b000;
parameter TD_LEFT = 3'b001;
parameter TD_RIGHT = 3'b010;
parameter TD_REVERSE = 3'b011;
parameter TD_STOP = 3'b100;
parameter TD_HOLD = 3'b101;

//Junction
parameter J_DETECT = 2'b00;
parameter J_MANEUVER = 2'b01;
parameter J_COMPLETE = 2'b10;

//H-Bridge Parameters
parameter HB_RIGHT = 4'b1010;
parameter HB_LEFT = 4'b0101;
parameter HB_STRAIGHT = 4'b0110;
parameter HB_STOP = 4'b0000;
parameter FORWARDS = 1'b1;
parameter REVERSE = 1'b0;

//UART Parameters
parameter P_IDLE = 0;
parameter P_LOAD_MESSAGE = 1;
parameter P_DC_DIR = 2;
//parameter P_DRIVE_DIR = 3;
parameter P_DIR_STATE = 3;
parameter P_DRIVE_STATE = 4;
parameter P_JUNCTION_STATE = 5;
parameter P_TONE_DIR = 6;
//parameter P_RIGHT_COUNT = 7;
//this one has to be the max number
//because of how the case statement works
parameter P_CLEAR_TERM = 7;

parameter CLEAR_SCREEN_COUNT = 300;

//Collision Detection
parameter C_HOLD_DOWN_SIGNAL = 7_500_000;
parameter C_HOLD_DOWN_NO_SIGNAL = 7_000_000;
parameter C_NO_COL_PAUSE = 25_000_000;
parameter C_FORWARDS = 1;
parameter C_BACKWARDS = 0;
parameter C_NO_COL_DETECT = 0;
parameter C_VALIDATE_SIGNAL = 1;
parameter C_COLLISION_STATE = 2;
parameter C_DRIVE = 1;
parameter C_STOP = 0; 

//Direction Control
//parameter MAX_COUNT = 5_000; //debounce time delay
parameter INTERSECT_TIMER = 20_000_000; //Detect 90 or intersect
parameter NORMAL = 3'b000;
parameter DEBOUNCE = 3'b001;
parameter CHANGE_DIR = 3'b010;
parameter CHK_INTERSECT = 3'b011;
parameter CHK_SKINNY = 3'b100;
parameter SKINNY_MAX = 25_000_000;
parameter SKINNY_LEFT = SKINNY_MAX/4;
parameter SKINNY_RIGHT = SKINNY_MAX/2+SKINNY_LEFT;
parameter SKINNY_ORIGIN = SKINNY_MAX;

//Turning
parameter VEER_RIGHT = 4'b10_01;
parameter HARD_RIGHT = 4'b10_10;
parameter NINETY_RIGHT = 4'b10_11;
parameter VEER_LEFT = 4'b01_01;
parameter HARD_LEFT = 4'b01_10;
parameter NINETY_LEFT = 4'b01_11;
parameter PROCEED = 4'b00_00;
parameter STOP = 4'b11_11;