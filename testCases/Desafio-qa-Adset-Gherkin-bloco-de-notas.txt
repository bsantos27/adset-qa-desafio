Feature: Inclusão de novo veículo

     #Cenários Positivos
     Scenario Outline: Incluir um novo veículo com dados válidos
          Given "<testcase>"
          When estou logado no sistema
          And incluo um novo veiculo
          And preencho os campos:
               | marca   | modelo   | anoFabricacao | anoModelo   | versao   | condicaoVeiculo   | quilometragem   | portas   | cor   | combustivel   | cambio   | placa   | chassi   | blindado   | preco   | caracteristicas   | obsercacoes   | link   | itensOpcionais   | fotos   |
               | <marca> | <modelo> | <anoFabricao> | <anoModelo> | <versao> | <condicaoVeiculo> | <quilometragem> | <portas> | <cor> | <combustivel> | <cambio> | <placa> | <chassi> | <blindado> | <preco> | <caracteristicas> | <obsercacoes> | <link> | <itensOpcionais> | <fotos> |
          Then sou redirecionado para página de estoque de carro

          Examples:
               | testcase                                  | marca | modelo | anoFabricao | anoModelo | versao                                 | condicaoVeiculo | quilometragem | portas | cor     | combustivel | cambio | placa   | chassi   | blindado | preco     | caracteristicas                      | obsercacoes           | link                                        | itensOpcionais | fotos                |
               | Todos os campos preenchidos corretamente  | AUDI  | 100    | 1995        | 1995      | 2.2 S-4 AVANT TURBO GASOLINA 4P MANUAL | Usado           | 18000         | 4      | Amarelo | Gasolina    | Manual | ASD5522 | FFG-5555 | True     | 50.000,00 | AdaptadoDeficientes,BaixaKm,IPVAPago | CARRO USADO MUITO BOM | https://www.youtube.com/watch?v=iqg0M5PvdpM | 161,113        | carro.jpg,carro2.jpg |
               | Apenas os campos obrigatórios preenchidos | AUDI  | 100    | 1995        | 1995      | 2.2 S-4 AVANT TURBO GASOLINA 4P MANUAL | ZeroKm          |               | 4      | Amarelo | Gasolina    | Manual | ASD5525 |          |          | 50.000,00 |                                      |                       |                                             |                |                      |



     #Cenários Negativos
     Scenario Outline: Tentar incluir um novo veículo com dados inválidos
          Given "<testcase>"
          When estou logado no sistema
          And incluo um novo veiculo
          And preencho os campos:
               | marca   | modelo   | anoFabricacao | anoModelo   | versao   | condicaoVeiculo   | quilometragem   | portas   | cor   | combustivel   | cambio   | placa   | chassi   | blindado   | preco   | caracteristicas   | obsercacoes   | link   | itensOpcionais   | fotos   |
               | <marca> | <modelo> | <anoFabricao> | <anoModelo> | <versao> | <condicaoVeiculo> | <quilometragem> | <portas> | <cor> | <combustivel> | <cambio> | <placa> | <chassi> | <blindado> | <preco> | <caracteristicas> | <obsercacoes> | <link> | <itensOpcionais> | <fotos> |
          Then mensagem de alerta cenario negativo: "<mensagem_output>"

          Examples:
               | testcase                   | marca | modelo | anoFabricao | anoModelo | versao                           | condicaoVeiculo | quilometragem | portas | cor     | combustivel | cambio     | placa        | chassi   | blindado | preco     | caracteristicas | obsercacoes | link | itensOpcionais | fotos | mensagem_output                               |
               | Campo Marca vazio          |       |        |             |           |                                  | Usado           | 18000         | 4      | Azul    | Diesel      | CVT        | ASD5523      | FFG-5555 | False    | 50.000,00 |                 |             |      |                |       | Marca do Veículo: Preenchimento obrigatório.  |
               | Campo Modelo vazio         | AUDI  |        |             |           |                                  | Usado           |               | 4      | Amarelo | Gasolina    | Manual     | ASD55254     |          |          | 50.000,00 |                 |             |      |                |       | Modelo do Veículo: Preenchimento obrigatório. |
               | Campo Ano Fabricação vazio | AUDI  | 100    |             |           |                                  | Usado           |               | 4      | Amarelo | Gasolina    | Manual     | ASDFG045405  |          |          | 50.000,00 |                 |             |      |                |       | Ano Fabricação: Preenchimento obrigatório.    |
               | Campo Versão vazio         | AUDI  | 100    | 1995        | 1995      |                                  | Usado           |               | 4      | Amarelo | Gasolina    | Manual     | ASDFG045407  |          |          | 50.000,00 |                 |             |      |                |       | Versão do Veículo: Preenchimento obrigatório. |
               | Campo Câmbio Veículo vazio | AUDI  | 100    | 1994        | 1994      |                                  | Usado           | 20000         | 2      | Branco  | Gasolina    |            | ASDFG0425898 |          |          | 50.000,00 |                 |             |      |                |       | Câmbio do Veículo: Preenchimento obrigatório. |
               | Campo Portas vazio         | FIAT  | 1100   | 1955        | 1955      |                                  | Usado           | 18000         |        | Bege    | Álcool      | Automático | ASDFG0425874 |          |          | 60.000,00 |                 |             |      |                |       | Portas: Preenchimento obrigatório.            |
               | Campo Cor vazio            | FORD  | 81A    | 1937        | 1938      | 1.8 V8 GASOLINA 2P MANUAL        | ZeroKm          |               | 4      |         | Gasolina    | Manual     | ASDFG0442178 |          |          | 50.000,00 |                 |             |      |                |       | Cor do Veículo: Preenchimento obrigatório.    |
               | Campo Placa Veículo vazio  | AUDI  | 100    | 1994        | 1994      | 2.8 AVANT V6 GASOLINA AUTOMÁTICO | Usado           | 20000         | 2      | Branco  | Gasolina    | Manual     |              |          |          | 50.000,00 |                 |             |      |                |       | Placa do Veículo : Preenchimento obrigatório. |
               | Campo Preço vazio          | FIAT  | 1100   | 1955        | 1955      | 1.0 A BERLINA 4P GASOLINA MANUAL | Usado           | 18000         | 3      | Bege    | Álcool      | Automático | ASDFG0425874 |          |          |           |                 |             |      |                |       | Valor do Veículo: Preenchimento obrigatório.  |





