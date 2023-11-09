module top_tb;
  timeunit 1ps;
  timeprecision 1ps;

  //--------------------------------------------------------------------------------
  // Some basic parameters.
  //--------------------------------------------------------------------------------
  int clock_period_ps = 10;
  int timeout = 10000; // in cycles

  //--------------------------------------------------------------------------------
  // Clock generation
  //--------------------------------------------------------------------------------
  bit clk;
  initial clk = 1'b1;
  always #(clock_period_ps) clk = ~clk;

  //--------------------------------------------------------------------------------
  // Timeout setup
  //--------------------------------------------------------------------------------
  always @(posedge clk) begin
    if (timeout == 0) begin
      $error("TB Error: Timed out");
      $finish;
    end
    timeout <= timeout - 1;
  end

  //--------------------------------------------------------------------------------
  // Wave dumping
  //--------------------------------------------------------------------------------
  initial begin
    $fsdbDumpfile("dump.fsdb");
    $fsdbDumpvars(0, "+all");
  end

  //--------------------------------------------------------------------------------
  // Signals to connect to DUT.
  //--------------------------------------------------------------------------------

  // Task 0
  logic          task0_a;
  logic          task0_b;
  logic          task0_z;
  // Task 1
  logic [31:0]   task1_a;
  logic [31:0]   task1_b;
  logic          task1_s;
  logic [31:0]   task1_z;
  // Task 2
  logic [31:0]   task2_a;
  logic [31:0]   task2_b;
  logic [31:0]   task2_c;
  logic [31:0]   task2_d;
  logic [1:0]    task2_s;
  logic [31:0]   task2_z;
  // Task 3
  logic [7:0]    task3_in;
  logic [3:0]    task3_out;

  //--------------------------------------------------------------------------------
  // DUT instance
  //--------------------------------------------------------------------------------
  combinational_logic dut (.*);

  //--------------------------------------------------------------------------------
  // Tasks for verification
  //--------------------------------------------------------------------------------
  task verify_task0();
    print_seperator();
    for (int i = 0; i < 2; ++i) begin
      for (int j = 0; j < 2; ++j) begin
        task0_a <= i[0];
        task0_b <= j[0];
        @(posedge clk);
        assert (task0_z === (task0_a ^ task0_b)) else begin
          $error("[RESULT] Task 0 failed.");
          $finish;
        end
      end
    end

    $display("[RESULT] Task 0 passed.");
  endtask : verify_task0

  task verify_task1();
    print_seperator();
    task1_a <= $urandom();
    task1_b <= $urandom();

    task1_s <= 1'b0;
    @(posedge clk);
    assert (task1_z === task1_a) else begin
      $error("[RESULT] Task 1 failed.");
      $finish;
    end


    task1_s <= 1'b1;
    @(posedge clk);
    assert (task1_z === task1_b) else begin
      $error("[RESULT] Task 1 failed.");
      $finish;
    end

    $display("[RESULT] Task 1 passed.");
  endtask : verify_task1

  task verify_task2();
    bit [31:0] arr[4];

    foreach (arr[i]) begin
      arr[i] = $urandom();
    end

    print_seperator();

    task2_a <= arr[0];
    task2_b <= arr[1];
    task2_c <= arr[2];
    task2_d <= arr[3];

    for (int i = 0; i < 4; ++i) begin
      task2_s <= i[1:0];
      @(posedge clk);
      assert (task2_z === arr[i]) else begin
        $error("[RESULT] Task 2 failed.");
        $finish;
      end
    end
    $display("[RESULT] Task 2 passed.");
  endtask : verify_task2

  task verify_task3();
    print_seperator();
    $error("TODO for you: fill out the verification for task 3!");
  endtask : verify_task3

  //--------------------------------------------------------------------------------
  // Helper functions
  //--------------------------------------------------------------------------------
  function print_seperator();
    repeat (80) $write("=");
    $write("\n");
  endfunction : print_seperator


  //--------------------------------------------------------------------------------
  // Main process
  //--------------------------------------------------------------------------------
  initial begin
    verify_task0();
    verify_task1();
    verify_task2();
    verify_task3();

    print_seperator();
    $finish;
  end

  final begin
    print_seperator();
  end

endmodule
