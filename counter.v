module counter (input  wire clk,reset,mode,
                output reg [4:0] q );



wire flag_high,flag_low;

always @ (posedge clk or negedge reset)
 begin
  if(!reset)
   begin
    q <= 5'b00000 ;
   end
  else
   begin
    if (mode == 0)
    begin
    if ((q < 16)& (!flag_high))
    q <= q +1;
    else 
    q <= 5'b00000;
    end

    else if (mode == 1)
    begin
    if ((q < 16)& (!flag_low))  
    q <= q -1;
    else 
    q <= 5'b11111;

    end
    
   end
 end
 assign flag_high = &q; // at q= 11111
 assign flag_low  = !(|q); // at q= 00000
 endmodule
