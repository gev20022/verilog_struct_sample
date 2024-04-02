`timescale 1ns / 1ps
module CE_gen(
		input clk,
		input rst_n,
		output reg CE
    );
	reg [3:0] X;
	always@(posedge clk, posedge rst_n)
		if(rst_n) begin
			X <= 4'b0;
			CE <= 0;
		end
		else if (X == 10)
			begin
				X<=0;
				CE <= 1;
			end
		else
			begin
				X <= X + 1'b1;
				CE <= 0;
			 end

endmodule
