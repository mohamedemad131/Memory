

// synch write and read single port

module simple_dual_port_RAM
#(parameter data_width=8,address_width=7)
(
input clk,
input we,
input [address_width-1:0] add,
input [data_width-1:0] data_w,
output reg [data_width-1:0] data_r
);

reg [data_width-1:0] memory [0:2**address_width-1];

// synch write port
always @(posedge clk)
begin
	if (we)
		memory[add]<=data_w;
	 data_r<=memory[add];
end

endmodule
