
module control_unit 
    import vending_pkg::*;
(
    input  logic        clk,
    input  logic        rst,
    input  logic        cancel,
    input  logic        confirm,
    input  logic        can_sell,
    input  coin_in_e    coin_in,

    output logic        credit_load,
    output logic        credit_cancel,
    output logic        mem_read,
    output logic        mem_write,
    output logic        dispense,
    output logic        error,
    output state_e      current_state
);

    assign credit_cancel = cancel || (current_state == CHANGE);

    state_e next_state;

    // Registrador de estado
    always_ff @(posedge clk) begin
        if (rst || cancel) begin
            current_state <= IDLE;
        end else begin
            current_state <= next_state;
        end
    end

    // Lógica de próximo estado
    always_comb begin
        next_state = current_state;
        unique case (current_state)
            IDLE: begin
                if (coin_in != COIN_0)  next_state = COLLECT;
                else                    next_state = IDLE;
            end
            COLLECT: begin
                if (confirm)            next_state = CHECK;
                else                    next_state = COLLECT;
            end
            CHECK: begin
                if (can_sell)           next_state = DISPENSE;
                else                    next_state = ERROR;
            end
            DISPENSE: begin
                next_state = CHANGE;
            end
            CHANGE: begin
                next_state = IDLE;
            end
            ERROR: begin
                if (cancel)           next_state = IDLE;
                else                  next_state = ERROR;
            end
            default:                  next_state = IDLE;
        endcase
    end

    // Lógica de saídas (FSM de Moore)
    // Alguns sinais de controle antecipados em estados antecessores para deixar os dados síncronos prontos.
    always_comb begin
        credit_load = 1'b0;
        mem_read    = 1'b0;
        mem_write   = 1'b0;
        dispense    = 1'b0;
        error       = 1'b0;

        unique case (current_state)
            IDLE: begin
                credit_load = 1'b1;
                // Antecipa credit_load, caso coin_in != 0, o valor é armazenado em credit_reg e o estado avança para COLLECT.
            end
            COLLECT: begin
                credit_load = 1'b1;
                mem_read = 1'b1;
            end
            CHECK: begin
                // Nenhuma ação necessária, apenas aguarda o próximo estado.
                // mem_read antecipado no estado COLLECT para o dado sincrono estar ponto em CHECK.
            end
            DISPENSE: begin
                dispense  = 1'b1;
                mem_write = 1'b1;
            end
            CHANGE: begin
                // Nenhuma ação necessária, apenas aguarda o próximo estado.
                // Credit_reg limpo em função do estado CHANGE (lógica realizada pelo sinal cancel de credit_reg).
            end
            ERROR: begin
                error = 1'b1;
            end
            default: begin end
        endcase
    end
endmodule
