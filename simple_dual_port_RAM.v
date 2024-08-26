

// synch write and read 

module simple_dual_port_RAM
#(parameter data_width=8,address_width=7)
(
input clk,
input we,
input [address_width-1:0] add_r,add_w,
input [data_width-1:0] data_w,
output reg [data_width-1:0] data_r
);

reg [data_width-1:0] memory [0:2**address_width-1];

// synch write port
always @(posedge clk)
begin
	if (we)
		memory[add_w]<=data_w;
	data_r<=memory[add_r];
end
endmodule