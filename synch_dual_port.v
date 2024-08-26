

// two synch port one for read one for write  

module synch_dual_port_BRAM
#(parameter data_width=8,address_width=7)
(
input clk,
input we_a,we_b,
input [address_width-1:0] add_a,add_b,
input [data_width-1:0] data_w_a,data_w_b,
output reg [data_width-1:0] data_r_a,data_r_b
);

reg [data_width-1:0] memory [0:2**address_width-1];

always @(posedge clk)
begin
	if (we_a)
		memory[add_a]<=data_w_a;
	data_r_a<=memory[add_a];
end

always @(posedge clk)
begin
	if (we_b)
		memory[add_b]<=data_w_b;
	data_r_b<=memory[add_b];
end

endmodule