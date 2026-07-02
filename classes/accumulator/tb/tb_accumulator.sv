module tb_accumulator;

    import accumulator_pkg::*;

    parameter WIDTH = 8;

    logic clk;
    logic rst;
    logic enable;

    logic [2:0] op;
    logic [WIDTH-1:0] data_in;

    logic [WIDTH-1:0] acc;

    //------------------------------------
    // DUT
    //------------------------------------
    accumulator #(
        .WIDTH(WIDTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .op(op),
        .data_in(data_in),
        .acc(acc)
    );

    //------------------------------------
    // Clock de 10 ns
    //------------------------------------
    always #5 clk = ~clk;

    //------------------------------------
    // Dump para waveform
    //------------------------------------
    initial begin
        $fsdbDumpfile("waves.fsdb");
        $fsdbDumpvars(0, tb_accumulator);
    end

    //------------------------------------
    // Estímulos
    //------------------------------------
    initial begin

        clk     = 0;
        rst     = 1;
        enable  = 0;
        op      = HOLD;
        data_in = 0;

        //--------------------------------
        // Reset
        //--------------------------------
        #20 begin
            rst    = 0;
            enable = 1;
        end

        //--------------------------------
        // LOAD 20
        //--------------------------------
        @(posedge clk) begin
            op = LOAD;
            data_in = 20;
        end

        @(posedge clk) begin
            #1 $display("LOAD 20  -> acc = %0d", acc);
        end

        //--------------------------------
        // ADD 5
        //--------------------------------
        op = ADD;
        data_in = 5;

        @(posedge clk) begin
            #1 $display("ADD 5    -> acc = %0d", acc);
        end

        //--------------------------------
        // ADD 7
        //--------------------------------
        data_in = 7;

        @(posedge clk) begin
            #1 $display("ADD 7    -> acc = %0d", acc);
        end

        //--------------------------------
        // SUB 10
        //--------------------------------
        op = SUB;
        data_in = 10;

        @(posedge clk)begin
            #1 $display("SUB 10   -> acc = %0d", acc);
        end

        //--------------------------------
        // HOLD
        //--------------------------------
        op = HOLD;

        @(posedge clk) begin
            #1 $display("HOLD     -> acc = %0d", acc);
        end

        //--------------------------------
        // enable = 0
        //--------------------------------
        enable = 0;

        op = ADD;
        data_in = 100;

        @(posedge clk) begin
            #1 $display("enable=0 -> acc = %0d", acc);
        end

        //--------------------------------
        // Reabilita e carrega 100
        //--------------------------------
        enable = 1;
        op = LOAD;
        data_in = 100;

        @(posedge clk);
        #1 $display("LOAD 100 -> acc = %0d", acc);

        //--------------------------------
        // Saturações
        //--------------------------------

        op = LOAD;
        data_in = 128;

        @(posedge clk);
        #1 $display("LOAD 128 -> acc = %0d", acc);

        op = ADD;
        data_in = 128;

        @(posedge clk);
        #1 $display("ADD 128 -> acc (saturado 255) = %0d", acc);


        op = LOAD;
        data_in = 128;

        @(posedge clk);
        #1 $display("LOAD 128 -> acc = %0d", acc);

        op = SUB;
        data_in = 255;

        @(posedge clk);
        #1 $display("SUB 255 -> acc (saturado 0) = %0d", acc);


        op = LOAD;
        data_in = 128;

        @(posedge clk);
        #1 $display("LOAD 128 -> acc = %0d", acc);

        op = MULT;
        data_in = 4;

        @(posedge clk);
        #1 $display("MULT 4 -> acc (saturado 255) = %0d", acc);


        #20 $finish;

    end

endmodule