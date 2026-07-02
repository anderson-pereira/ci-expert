module accumulator #(
    /* 
     * Esse parâmetro define a largura do acumulador e dos dados de entrada.
     * Ele é configurável para permitir flexibilidade no design,
     * podendo ser ajustado conforme as necessidades do projeto.
     */
    parameter WIDTH = 8
)(
    input  logic              clk,
    input  logic              rst,
    input  logic              enable,

    input  logic [2:0]        op,
    input  logic [WIDTH-1:0]  data_in,

    output logic [WIDTH-1:0]  acc
);

    // Dessa forma, criamos um tipo enumerado para representar as operações que o acumulador pode realizar.
    // Usando um package, podemos definir esse tipo de forma centralizada,
    // facilitando a manutenção e a legibilidade do código.
    import accumulator_pkg::*;

    logic [WIDTH:0]         sum_res;
    logic [WIDTH:0]         sub_res;
    logic [(2*WIDTH)-1:0]   mult_res;

    assign sum_res  = {1'b0, acc} + {1'b0, data_in};
    assign sub_res  = {1'b0, acc} - {1'b0, data_in};
    assign mult_res = acc * data_in;

    always_ff @(posedge clk) begin

        if (rst)
            acc <= '0;

        else if (enable) begin

            case (operation_t'(op))

                HOLD: acc <= acc;

                LOAD: acc <= data_in;

                ADD : acc <= sum_res[WIDTH] ? '1 : sum_res[WIDTH-1:0];
                
                SUB : acc <= sub_res[WIDTH] ? '0 : sub_res[WIDTH-1:0];

                MULT: acc <= (mult_res > 8'hff ) ? '1 : mult_res[WIDTH-1:0];

                default: acc <= '0;

            endcase

        end

    end

endmodule