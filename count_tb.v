`timescale 1ns/1ps

module counter_tb  () ;
  
 
  reg              clk_tb,reset_tb,mode_tb;
  wire   [4:0]     q_tb;  
 
  
//initial block
initial 
  begin
    $dumpfile("counter.vcd") ;
    $dumpvars ;
    //initial values
    reset_tb = 0;
    clk_tb = 1'b0 ;
    mode_tb  = 0;
    #10

    reset_tb = 1;
    mode_tb  = 0;
    #40
    if(q_tb != 5'b00100)
      $display ("TEST CASE  IS FAILED") ;
    else
      $display ("TEST CASE  IS PASSED") ; 
    #110

    if(q_tb != 5'b01111)
      $display ("TEST CASE  IS FAILED") ;
    else
      $display ("TEST CASE  IS PASSED") ; 
    #10
    if(q_tb != 5'b00000)
      $display ("TEST CASE  IS FAILED") ;
    else
      $display ("TEST CASE  IS PASSED") ; 
    
    mode_tb = 1'b1;
    #10

    if(q_tb != 5'b01111)
      $display ("TEST CASE  IS FAILED") ;
    else
      $display ("TEST CASE  IS PASSED") ; 
    #50
    
    if(q_tb != 5'b01010)
      $display ("TEST CASE  IS FAILED") ;
    else
      $display ("TEST CASE  IS PASSED") ; 
    #100
    $finish ;
    
  end
  
// Clock Generator  
  always #5 clk_tb = !clk_tb ;
  
// instaniate design instance 
  counter DUT (
    .clk(clk_tb),
    .reset(reset_tb),
    .mode(mode_tb),
    .q(q_tb)
  );

  
  endmodule
  
