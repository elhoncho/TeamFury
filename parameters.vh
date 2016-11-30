//PWM Parameters
//Do not exceed 80% on per H-Bridge specifications (Allows for a max of 2.5A Stall)
parameter PWM_FULL_SPEED_PERCENT_ON = 27;
parameter PWM_HARD_SPEED_PERCENT_ON = 80;
parameter PWM_VEER_SPEED_PERCENT_ON = 33;
parameter PWM_NINETY_SPEED_PERCENT_ON = 40;
parameter PWM_NINETY_FAST_SPEED_PERCENT_ON = 42;
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

//Junction Conditions
parameter  STRAIGHT = 3'b000;
parameter  LEFT = 3'b001;
parameter  RIGHT = 3'b010;
parameter  BACK = 3'b011;
parameter  STOP = 3'b100;

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
parameter P_PUSH_BUTTON = 2;
parameter P_DC_DIR = 3;
parameter P_DRIVE_DIR = 4;
parameter P_DRIVE_STATE = 5;
//this one has to be the max number
//because of how the case statement works
parameter P_CLEAR_TERM = 6;