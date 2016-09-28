Tabs should be set to 4 spaces

Variable are in camel case (1st word all lower with all others having the 1st letter capatalized)
>myVariable

Parameter are in all caps seperated by \_
>MY_PARAMETER

If statement format
```
if (x) begin
    some code here
end
else begin
    some other code
end
```
inputs are defined in the module declaration 
```
module MyModule(
    input in,
    input clock,
    output led, 
    output led1, 
    output led2
    );
```
the general layout of the code is
```
Module
    parameters
    
    regesters

    assigns

    the rest of the code
```
Ex:
```
module VerifySignal(
    input in,
    input clock,
    output led, 
    output led1, 
    output led2, 
    output led3, 
    output led4, 
    output an0, 
    output an1, 
    output an2, 
    output an3 
    );
	
    //Parameters
    parameter	NO_SIGNAL   = 2'b00;
    parameter	CHK_BOUNSE  = 2'b01;
    parameter	SIGNAL      = 2'b10;
    parameter	CHK_SIGNAL  = 2'b11;
    parameter	BOUNCE_TIME = 25'd25_000_000;
    parameter	SAMPLE_TIME = 18'd260_000;
	
    //Regesters
    reg [25:0]	signalCount;
    reg [17:0]  sampleCount;
    reg [1:0]	state = 0;
    reg		ledReg;
    reg		ledReg1;
    reg		ledReg2;
    reg		ledReg3;
    reg		ledReg4;
	
    //Turn off the 7-seg display
    assign an0 = 1;
    assign an1 = 1;
    assign an2 = 1;
    assign an3 = 1;

    //Hook up led's to regesters
    assign led = ledReg;
    assign led1 = ledReg1;
    assign led2 = ledReg2;
    assign led3 = ledReg3;
    assign led4 = ledReg4;
	
    //State machine
    always @(posedge clock) begin
        case(state)
            NO_SIGNAL: begin
                ledReg1 <= 1;
                ledReg2 <= 0;
                ledReg3 <= 0;
                ledReg4 <= 0;
```
