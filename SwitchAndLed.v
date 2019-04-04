module SwitchAndLed(switch,led);	// Declaration of the module. The switch and led can access to this module.
	input switch;			// The switch is defined as input.
	output led;                     // The led is defined as input. User can define argument as input, output, and inout.
	                                // FYI, inout is only for TOP module.
	assign led=switch;              // "assign" is "WARIATERU" in Japanese.
	
endmodule
