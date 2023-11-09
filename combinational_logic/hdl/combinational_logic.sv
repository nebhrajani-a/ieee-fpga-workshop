module combinational_logic (
  // Task 0
  input logic         task0_a,
  input logic         task0_b,
  output logic        task0_z,

  // Task 1
  input logic [31:0]  task1_a,
  input logic [31:0]  task1_b,
  input logic         task1_s,
  output logic [31:0] task1_z,

  // Task 2
  input logic [31:0]  task2_a,
  input logic [31:0]  task2_b,
  input logic [31:0]  task2_c,
  input logic [31:0]  task2_d,
  input logic [1:0]   task2_s,
  output logic [31:0] task2_z,

  // Task 3
  input logic [7:0]   task3_in,
  output logic [3:0]  task3_out
);

  //============================================================================
  // Task 0: basic combinational logic
  //============================================================================
  // Implement the function task0_z = task0_a XOR task0_b.

  // Hint: assign task0_z = ...;


  //============================================================================
  // Task 1: 2:1 MUX
  //============================================================================
  // Implement a 2:1 MUX that selects task1_a when task1_s is 0, and task1_b
  // when task1_s is 1.

  // Hint:
  // assign task1_z = task1_s ? ...;
  // Or:
  // always_comb begin
  //   if (...) begin
  //     task1_a = ...;
  //   end else begin
  //     ...
  //
  // end


  //============================================================================
  // Task 2: 4:1 MUX
  //============================================================================
  // Implement a 4:1 MUX:
  // when s == 00 task2_z = task2_a
  // when s == 01 task2_z = task2_b
  // when s == 10 task2_z = task2_c
  // when s == 11 task2_z = task2_d

  // Hint: if-else chain, or use a case statement.


  //============================================================================
  // Task 3: One-hot encoder
  //============================================================================

  // Implement the testbench for an 8-bit encoder (one-hot to binary
  // converter). For example:
  // 8'b1000000 -> 3'b111

  // Note: this implementation has a bug: find and fix it!
  always_comb begin
    task3_out = '0;
    unique case (task3_in)
      8'h01: task3_out = 3'd0;
      8'h02: task3_out = 3'd1;
      8'h04: task3_out = 3'd2;
      8'h08: task3_out = 3'd3;
      8'h10: task3_out = 3'd4;
      8'h20: task3_out = 3'd5;
      8'h80: task3_out = 3'd6;
      default: task3_out = '0;
    endcase
  end

endmodule : combinational_logic
