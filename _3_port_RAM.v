
// tree port ram one port for read (asynch --> when read add come the data appeare on the data read immediatlly) and 
// synch  port for write and another one for read--> write only when clock edge come

module _3_port_RAM
#(parameter data_width=8,address_width=7)
(
input clk,
input we,
input [address_width-1:0] add_r0,add_r1,add_w,
input [data_width-1:0] data_w,
output [data_width-1:0] data_r0,
output reg [data_width-1:0] data_r1
);

reg [data_width-1:0] memory [0:2**address_width-1];

// synch write port
always @(posedge clk)
begin
	if (we)
		memory[add_w]=data_w;
	data_r1=memory[add_r1];
end
// asynch read port

assign data_r0=memory[add_r0];
endmodule
