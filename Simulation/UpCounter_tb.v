module count_test();
	// port declaration
	// input -> reg
	reg CLOCK_50;
	reg [1:0] KEY;
	// output -> wire
	wire [3:0] LEDG;
	
	UpCounter uc(CLOCK_50, KEY, LEDG);
	
	// inverte every clock
	always #1 CLOCK_50=~CLOCK_50;
	
	initial begin
		//$monitor("clk=%b, reset=%b, btn=%b, 
		CLOCK_50=0;
		KEY[0]=1;
		KEY[1]=1;
		
		#10
		KEY[0]=0;
		
		#5
		KEY[0]=1;
		
		#10
		KEY[1]=0;
		
		#5
		KEY[1]=1;
		
		#300
		
		$finish;
	end
endmodule