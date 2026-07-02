
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
    
    state_e current_state;
    
    price_t credit;
    item_info_t item_info;
    price_t change_comb;

    assign display   = credit;
    assign state_out = current_state;

    credit_reg u_credit_reg (
        .clk           (clk),
        .rst           (rst),
        .cancel        (cancel),
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
        .credit (credit),
        .price  (item_info.price),
        .change (change_comb)
    );

    control_unit u_control_unit (
        .clk           (clk),
        .rst           (rst),
        .cancel        (cancel),
        .confirm       (confirm),
        .can_sell      (can_sell),
        .coin_in       (coin_in),
        .credit_load   (credit_load),
        .mem_read      (mem_read),
        .mem_write     (mem_write),
        .dispense      (dispense),
        .error         (error),
        .current_state (current_state)
    );

    always_ff @(posedge clk) begin
        if (rst) begin
            change_out <= price_t'(0);
        end else if (cancel) begin
            change_out <= credit; // Devolve o crédito acumulado ao cancelar
        end else if (current_state == CHANGE) begin
            change_out <= change_comb;
        end
    end



endmodule
