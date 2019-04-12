module dec2_3(switch, led);
   input [1:0] switch; // 2bit
   output [2:0] led;   // 3bit

   // function ----------------------
   function [2:0] dec;
      input [1:0] dec_in;

      begin
	 case (dec_in)
	   2'b00: dec = 3'b000;
	   2'b01: dec = 3'b001;
	   2'b10: dec = 3'b010;
	   2'b11: dec = 3'b100;
	   default: dec = 3'b000;
	 endcase // case (dec_in)
      end
   endfunction // dec

   // -------------------------------
   assign led = dec(switch);
endmodule // 2_3dec

	   
