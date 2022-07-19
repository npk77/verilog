`timescale 1ns/ 1ps
`include "LFSR.v"

module test;
  reg clk,Enable,seed_en;
  reg [7:0] Seed_Data;
  wire [7:0] RandNum;
  wire Gen_done;
  LFSR m1(.clk(clk),.Enable(Enable),.Seed_Data(Seed_Data),.seed_en(seed_en),.RandNum(RandNum),.Gen_done(Gen_done)); 
    

  initial 
  begin
  clk=0;
  end
  always #2 clk=~clk;
    
  initial 
    begin
        seed_en=1;
        Enable=1;      
        Seed_Data=8'b11010101;
        #20 seed_en=0;
  end
  
  initial 
  begin
    $dumpfile("LFSR.vcd");
    $dumpvars(0,test);
    
    #500 $finish;
  end

endmodule