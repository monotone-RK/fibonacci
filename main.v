`timescale 1ns / 1ps
`default_nettype none

`define WIDTH 32
`define CNT   20
`define CLKIN_HALF_PERIOD  5 //100MHz input clock
  
module test;
  /* input */   
  reg CLK;
  reg RST_X;
    
  /* output */   
  wire [`WIDTH-1:0] RESULT;

  fibonacci uut(CLK, RST_X, RESULT);
  
  initial begin
    CLK = 0;
    forever #(`CLKIN_HALF_PERIOD) CLK = ~CLK;
  end
  initial begin
    RST_X = 0;
    #1000;
    RST_X = 1;
  end
  initial begin
    $dumpfile("uut.vcd");
    $dumpvars(0, uut);
  end

endmodule
    
module fibonacci(CLK, RST_X, RESULT);
  input CLK;
  input RST_X;
  
  output reg [`WIDTH-1:0] RESULT;
  
  function automatic [`WIDTH-1:0] fib;
    input [`WIDTH-1:0] num;
    fib = (num == 1 || num == 2) ? 1 : fib(num-1) + fib(num-2);
  endfunction

  reg [`WIDTH-1:0] cnt;
  always @(posedge CLK) begin
    if (!RST_X) begin
	 cnt    <= 1;
	 RESULT <= 0;
    end else if (cnt < `CNT) begin
	 if (cnt == 1) $write("Verilog HDL\n");	 
	 $write("%-1d ", fib(cnt));
	 cnt    <= cnt + 1;
	 RESULT <= fib(cnt);
    end else begin
	 $write("\n");
	 $finish;
    end
  end		
  
endmodule
`default_nettype wire
