module anti_chatter(clk, in_signal, clock_enable, out_signal, out_signal_en);
			input clk, in_signal, clock_enable;
			output out_signal, out_signal_en;


wire out_sync, _out_signal;
wire out_and4, out_and2_1, out_and2_2, out_xnor;
wire [3:0] cnt_wire;		

assign _out_signal = out_signal; 
sync sync1(.clk(clk), .in(in_signal), .out(out_sync)); 

count count_1(.clk(clk), .re(out_xnor), .ce(clock_enable), .cnt(cnt_wire));°
assign out_and4 = &cnt_wire;°
and(out_and2_1, out_and4, clock_enable);
and(out_and2_2, out_and2_1, out_sync);

xnor(out_xnor, out_signal, out_sync);

dff_reg out_signal_reg(.clk(clk), .en(out_and2_1), .data(out_sync),  .q(out_signal)); // 	

dff out_signal_enable_reg(.clk(clk), .data(out_and2_2),  .q(out_signal_en));

endmodule