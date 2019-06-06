module LEDGcontrol_SM_top(CLOCK_50, KEY, LEDG);
	input CLOCK_50;
	input [0:0] KEY;
	output [9:0] LEDG;
	
	wire control;
	wire [2:0] counter;
	wire counter_reset;
	
	LEDGcontrol_SM SM(.reset(KEY[0]), .clock(CLOCK_50), .counter(counter), .control(control), .counter_reset(counter_reset));
	Timer timer1 (.clock(CLOCK_50), .reset(KEY[0]), .counter_reset(counter_reset), .counter(counter));
	
	assign LEDG=((control==1'b1) ? 10'b10101_01010 : 10'b01010_10101);
	//assign LEDG[2:0]=counter;
	
endmodule


