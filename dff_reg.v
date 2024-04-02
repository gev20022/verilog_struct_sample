module dff_reg (clk, en, data, q);
			input clk, en, data;
			output q;

reg q;

always @(posedge clk)
if (en) q = data;

endmodule