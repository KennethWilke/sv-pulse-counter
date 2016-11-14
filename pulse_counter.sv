`timescale 1ns/1ns

module pulse_counter
    #(parameter TRIGGER_VALUE = 32,
      parameter COUNTER_WIDTH = 8) (
  input logic reset,
  input logic increment,
  output logic [COUNTER_WIDTH-1:0] count,
  output logic trigger
);

  always_ff @ (posedge increment or posedge reset) begin
    if (reset) begin
      count <= 0;
      trigger <= 0;
    end else begin
      if (count + 1 >= TRIGGER_VALUE) begin
        trigger <= 1;
        count <= TRIGGER_VALUE;
      end else begin
        count <= count + 1;
        trigger <= 0;
      end
    end
  end

endmodule
