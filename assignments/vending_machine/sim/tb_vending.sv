`timescale 1ns/1ps

module tb_vending;
    
    import vending_pkg::*;

    logic       clk;
    logic       rst;
    coin_in_e   coin_in;
    item_e      sel_item;
    logic       confirm;
    logic       cancel;
    logic       dispense;
    price_t     change_out;
    logic       error;
    price_t     display;
    state_e     state_out;

    int total_errors = 0; // Tracks failures for regression reporting

    vending_top dut (
        .clk(clk) ,
        .rst(rst) ,
        .confirm(confirm) ,
        .cancel(cancel) ,
        .coin_in(coin_in) ,
        .sel_item(sel_item) ,
        .dispense(dispense) ,
        .error(error) ,
        .change_out(change_out) ,
        .display(display) ,
        .state_out(state_out) 
    );

    `define WAIT_AND_CHECK(cycles, expected, actual, label) \
        begin \
            wait_posedge_clk(cycles); \
            #1 check(expected, actual, label); \
        end

    task automatic wait_posedge_clk(input int cycles = 1);
        repeat(cycles) @(posedge clk) begin end // Solve warnings
    endtask

    task automatic wait_negedge_clk(input int cycles = 1);
        repeat(cycles) @(negedge clk) begin end // Solve warnings
    endtask

    task automatic apply_coin(input coin_in_e val);
        wait_negedge_clk();
        coin_in = val;
        wait_negedge_clk();
        coin_in = COIN_0;
    endtask

    task automatic apply_sel(input item_e val);
        wait_negedge_clk();
        sel_item = val;
    endtask

    task automatic apply_pulse(ref logic sig);
        wait_negedge_clk();
        sig = 1'b1;
        wait_negedge_clk();
        sig = 1'b0;
    endtask

    task automatic buy_item(input item_e item, input coin_in_e coins[]);
        foreach(coins[i]) apply_coin(coins[i]);
        apply_sel(item);
        apply_pulse(confirm);
    endtask

    task automatic check(input int expected, input int actual, input string label);
        if (expected === actual) begin
            $display("[PASS] %s | Expected: %0d, Actual: %0d", label, expected, actual);
        end else begin
            $display("[FAIL] %s | Expected: %0d, Actual: %0d", label, expected, actual);
            total_errors++;
        end
    endtask

    task automatic init_with_defaults(); 
        wait_negedge_clk();
        rst = 1'b1;
        coin_in  = COIN_0;
        sel_item = COFFE;
        confirm  = 1'b0;
        cancel   = 1'b0;
        wait_posedge_clk(2);
        wait_negedge_clk();
        rst = 1'b0;
    endtask

    //------------------------------------
    // Waveform Dump
    //------------------------------------
    initial begin
        $fsdbDumpfile("waves.fsdb");
        $fsdbDumpvars("+struct");
        $fsdbDumpvars(0, tb_vending);
    end

    // Clock Generation (10ns period)
    initial clk = 0;
    always #5 clk = ~clk;

    // Timeout Watchdog
    initial begin
        #5000 $display("\n[FATAL] Simulation timeout reached! Check FSM for deadlocks.");
        $finish(2);
    end

    // Main Stimulus
    initial begin
        init_with_defaults();

        $display("\n==================================================");
        $display("SCENARIO 1: Successful purchase with change (Coffee)");
        $display("==================================================");
        
        buy_item(COFFE, '{COIN_100});
        check(CHECK, state_out, "State = CHECK");

        `WAIT_AND_CHECK(1, DISPENSE, state_out, "State = DISPENSE")
        #1 check(1, dispense, "Dispense pulse active");
        
        `WAIT_AND_CHECK(1, CHANGE, state_out, "State = CHANGE")
        #1 check(75, change_out, "Change returned: 75 cents"); 
        
        `WAIT_AND_CHECK(1, IDLE, state_out, "Return to IDLE")
        check(0, display, "Credit cleared after sale (display = 0)");


        $display("\n==================================================");
        $display("SCENARIO 2: Insufficient balance (Snack)");
        $display("==================================================");
        init_with_defaults();

        buy_item(SNACK, '{COIN_25});
        check(CHECK, state_out, "State = CHECK");

        `WAIT_AND_CHECK(1, ERROR, state_out, "State = ERROR")
        check(1, error, "Error signal asserted");
        
        `WAIT_AND_CHECK(3, ERROR, state_out, "Stays in ERROR waiting for cancel")
        
        apply_pulse(cancel);
        `WAIT_AND_CHECK(1, IDLE, state_out, "Return to IDLE after cancel")


        $display("\n==================================================");
        $display("SCENARIO 3: Cancellation and refund");
        $display("==================================================");
        init_with_defaults();

        apply_coin(COIN_100);
        apply_coin(COIN_100); 
        
        wait_posedge_clk(1); 
        
        apply_pulse(cancel);
        
        // Check for refund exactaly after cancel signal triggered
        check(200, change_out, "Full refund via change_out: 200 cents");
        check(0, display, "Display cleared (credit = 0)");
        `WAIT_AND_CHECK(1, IDLE, state_out, "State = IDLE (Immediate return)")


        $display("\n==================================================");
        $display("SCENARIO 4: Out of stock (Attempt to buy Coffee 6 times)");
        $display("==================================================");
        init_with_defaults();

        for (int i = 1; i <= 5; i++) begin
            $display("--- Coffee purchase attempt %0d/5 ---", i);
            buy_item(COFFE, '{COIN_25});
            check(CHECK, state_out, "State = CHECK");
            `WAIT_AND_CHECK(1, DISPENSE, state_out, "State = DISPENSE (In stock)")
            `WAIT_AND_CHECK(1, CHANGE, state_out, "State = CHANGE")
            `WAIT_AND_CHECK(1, IDLE, state_out, "State = IDLE")
        end
        
        $display("--- Attempt 6 (Stock should be empty) ---");
        buy_item(COFFE, '{COIN_25});
        check(CHECK, state_out, "State = CHECK");

        `WAIT_AND_CHECK(1, ERROR, state_out, "State = ERROR (Out of stock)")
        check(1, error, "Error signal asserted due to empty stock");
        
        apply_pulse(cancel);
        `WAIT_AND_CHECK(1, IDLE, state_out, "Final return to IDLE")


        $display("\n==================================================");
        $display("SIMULATION COMPLETE");
        $display("==================================================");
        if (total_errors == 0) begin
            $display("STATUS: PASSED (0 Errors)");
        end else begin
            $display("STATUS: FAILED (%0d Errors Found)", total_errors);
        end
        $finish;
    end
endmodule