module TOP (
				clk,              
				rst_n,            
				key_in,           
				led_out
				);

//===========================================================================
// PORT declarations
//===========================================================================						
input clk; 
input rst_n;
input key_in;
output led_out;
wire CE;
wire rst;
wire bbt_ce;
wire bbt;
reg led = 1'b1;
filter BTN_1(.clk(clk),
.in_signal(key_in),
.clock_enable(CE),
.out_signal_en(bbt_ce),
.out_signal(bbt)
);
filter RST(.clk(clk),
.in_signal(rst_n),
.clock_enable(CE),
.out_signal_en(rst)
);
CE_gen gen(.clk(clk),
.rst_n(rst),
.CE(CE));
always@(posedge clk)
begin
if (rst) begin
led = 1'd0;
end
else if (bbt_ce)
led = ~led;
end
assign led_out = led;


endmodule
