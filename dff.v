module dff (clk, data,  q);
			input data, clk;
			output q;

reg q;

always @(posedge clk)
q = data;

endmodule