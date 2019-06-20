module UpCounter(CLOCK_50, KEY, LEDG);

	// port declaration
	input CLOCK_50;
	input [1:0] KEY;
	output [3:0] LEDG;
	
	// register declaration
	reg latch=1'b0;
	reg flag=1'b0;

	// latch KEY[1] Signal 
	always @(posedge CLOCK_50 or negedge KEY[0]) begin
		if (!KEY[0]) begin						// Reset 
			latch <= 1'b0;
			flag <= 1'b0;
		end else if(!flag && !KEY[1]) begin // KEY[1] ON
			latch <= 1'b1;
			flag <= 1'b1;
		end else if (KEY[1]) begin // KEY[1] OFF
			flag <= 1'b0;
		end else if (flag)  begin 				
			latch <= 1'b0;			
		end		
	end	

	 reg [3:0] cnt = 4'b0000;

	always@(posedge latch or negedge KEY[0]) begin
	if (!KEY[0]) begin
		cnt=4'b0000;
	end else if (latch) begin
		if(cnt == 4'b1111) begin
			cnt<=4'b0000;
		end else
			cnt<=cnt+4'b0001;
		end
	end
 
	assign LEDG[3:0]=cnt;
		
endmodule
 