module sequential_logic (
  input               clk,
  input               rst,

  // Task 0
  input logic [31:0]  task0_d,
  output logic [31:0] task0_q,

  // Task 1
  input logic [31:0]  task1_d,
  input logic         task1_load_en,
  output logic [31:0] task1_q,

  // Task 2
  input logic [7:0]   task2_in,
  input logic         task2_load_en,
  input logic         task2_shift_en,
  output logic        task2_shift_out,

  // Task 3
  input logic         task3_count_en,
  output logic        task3_max
);

  //============================================================================
  // Task 0
  //============================================================================
  // Implement a 32-bit register whose reset value is 0.

  // Hint:
  // always_ff @(posedge clk) begin
  // ...
  // end

  //============================================================================
  // Task 1
  //============================================================================
  // Implement a 32-bit register with a load enable.

  //============================================================================
  // Task 2
  //============================================================================
  // Implement an 8-bit shift register (parallel-in, shift-out).

  //============================================================================
  // Task 3
  //============================================================================
  // Implement a counter that counts up to 100, raises task3_max, then starts
  // counting from zero again. Counting up only happens when count_en is high.

endmodule : sequential_logic
