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


    // Geração de Clock (Período de 10 ns)
    always #5 clk = ~clk;

    // Tarefa para aplicar moedas
    task apply_coin(input coin_in_e val);
        begin
            @(posedge clk) begin end
            coin_in = val;
            // Dois pulsos de clock para garantir que o valor seja registrado
            repeat(2) @(posedge clk) begin end 
            coin_in = COIN_0;
        end
    endtask

    // Tarefa de verificação (Self-checking)
    task check(input int expected, input int actual, input string label);
        begin
            if (expected === actual) begin
                $display("[PASS] %s | Esperado: %0d, Obtido: %0d", label, expected, actual);
            end else begin
                $display("[FAIL] %s | Esperado: %0d, Obtido: %0d", label, expected, actual);
            end
        end
    endtask


    //------------------------------------
    // Dump para waveform
    //------------------------------------
    initial begin
        $fsdbDumpfile("waves.fsdb");
        $fsdbDumpvars("+struct");
        $fsdbDumpvars(0, tb_vending);
    end


    initial begin
        // Inicialização de sinais
        clk      = 0;
        rst      = 1;
        coin_in  = COIN_0;
        sel_item = COFFE;
        confirm  = 0;
        cancel   = 0;

        // Reset inicial por 2 ciclos
        repeat(2) @(posedge clk) begin end
        rst = 0;
        @(posedge clk) begin end

        $display("==================================================");
        $display("CENÁRIO 1: Compra bem-sucedida com troco (Café)");
        $display("==================================================");
        apply_coin(COIN_100); // Insere R$1,00 (100 centavos)
        sel_item = COFFE;  // Seleciona Café (25 centavos)
        repeat(2) @(posedge clk) begin end
        confirm = 1;
        @(posedge clk) begin end
        confirm = 0;
        
        repeat(4) @(posedge clk) begin end
        check(1, dispense, "Verificação de Dispense");
        check(75, change_out, "Verificação de Troco (Esperado: 75)");

        $display("\n==================================================");
        $display("CENÁRIO 2: Crédito Insuficiente (Snack)");
        $display("==================================================");
        apply_coin(COIN_25); // Insere R$0,25 (25 centavos)
        sel_item = SNACK;  // Seleciona Snack (100 centavos)
        repeat(2) @(posedge clk) begin end
        confirm = 1;
        @(posedge clk) begin end
        confirm = 0;
        
        repeat(2) @(posedge clk) begin end
        check(1, error, "Verificação de Sinal de Erro");
        
        cancel = 1;
        @(posedge clk) begin end
        cancel = 0;

        $display("\n==================================================");
        $display("FIM DOS TESTES AUTÔNOMOS");
        $display("==================================================");
        $finish;
    end
endmodule
