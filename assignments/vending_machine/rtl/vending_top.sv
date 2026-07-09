
module vending_top 
    import vending_pkg::*;
(
    input  logic            clk,
    input  logic            rst,
    input  logic            confirm,
    input  logic            cancel,
    input  coin_in_e        coin_in,
    input  item_e           sel_item,

    output logic            dispense,
    output logic            error,
    output price_t          change_out,
    output price_t          display,
    output state_e          state_out
);

    logic credit_load;
    logic mem_read;
    logic mem_write;
    logic can_sell;
    logic credit_cancel;
    state_e current_state;
    price_t sub_change_out;
    coin_in_e coin_in_reg;

    price_t credit;
    item_info_t item_info;


    assign display   = credit;
    assign state_out = current_state;
    

    always_ff @(posedge clk) begin : change_out_logic_register
        if (rst) begin
            change_out <= price_t'(0);
        end else begin
            if (cancel)
                change_out <= credit;
            else if(current_state == DISPENSE)
                change_out <= sub_change_out;
            else
                change_out <= price_t'(0);
        end
    end

    credit_reg u_credit_reg (
        .clk           (clk),
        .rst           (rst),
        .cancel        (credit_cancel),
        .credit_load   (credit_load),
        .coin_in       (coin_in),
        .credit        (credit)
    );

    memory u_memory (
        .clk       (clk),
        .rst       (rst),
        .mem_read  (mem_read),
        .mem_write (mem_write),
        .sel_item  (sel_item),
        .item_info (item_info)
    );

    comparator u_comparator (
        .credit     (credit),
        .item_info  (item_info),
        .can_sell   (can_sell)
    );

    subtractor u_subtractor (
        .credit     (credit),
        .item_info  (item_info),
        .change     (sub_change_out)
    );

    control_unit u_control_unit (
        .clk           (clk),
        .rst           (rst),
        .cancel        (cancel),
        .confirm       (confirm),
        .can_sell      (can_sell),
        .coin_in       (coin_in),
        .credit_load   (credit_load),
        .credit_cancel (credit_cancel),
        .mem_read      (mem_read),
        .mem_write     (mem_write),
        .dispense      (dispense),
        .error         (error),
        .current_state (current_state)
    );

endmodule
