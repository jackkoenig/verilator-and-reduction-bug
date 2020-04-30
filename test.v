
module top(
    input clock,
    input reset
);

  reg [67:0] r;
  reg [3:0] count;

  wire and_reduce;
  wire not_equals;

  assign and_reduce = &r;
  assign not_equals = r == 68'hffff_ffff_ffff_ffff_f;

  always @(posedge clock or posedge reset) begin
    if (!reset)
      $display("reset = %x, r = %x, and_reduce = %x, not_equals = %x", reset, r, and_reduce, not_equals);
    if (reset)
      r <= 68'd0;
    else if (count == 4'd0)
      r <= 68'hffff_ffff_ffff_ffff_e;
    else if (count == 4'd1)
      r <= 68'hffff_ffff_ffff_ffff_f;
    else
      r <= 68'd0;
    if (reset)
      count <= 4'd0;
    else
      count <= count + 4'd1;

  end
endmodule
