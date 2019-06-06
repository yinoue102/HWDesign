module Timer(clock, reset, counter_reset, counter);
input clock;
input reset;
input counter_reset;
output [2:0] counter;

reg count_100msec=1'b0;
reg count_1sec=1'b0;

reg [3:0] counter100m=4'd0;
reg [2:0] counter1=3'd0;
reg [25:0] count_full=26'd0;

always @(posedge clock or negedge reset) begin
	if (!reset) begin
		count_100msec=1'b0;
		count_full=26'd0;
	end else if(count_full == 26'd5000000) begin //50 * 10^5
		count_100msec<=1'b1;
		count_full<=26'd0;
	end else begin 
		count_100msec<=1'b0;
		count_full<= count_full+26'd1;
	end		
end

always @(posedge count_100msec or negedge reset) begin
	if(!reset) begin
		counter100m<=4'd0;
		count_1sec<=1'b0;
	end else if(counter100m==4'd9) begin
		counter100m <= 4'd0;
		count_1sec<=1'b1;
	end else begin
		counter100m <= counter100m + 4'd1;
		count_1sec<=1'b0;
	end
end

always @(posedge count_1sec or negedge reset) begin
	if(!reset) begin
		counter1 <= 3'd0;
	end else if(counter_reset==1'd1) begin
		counter1 <= 3'd0;
	end else begin
		counter1 <= counter1 + 3'd1;
	end
end
 
 assign counter = counter1;
endmodule
