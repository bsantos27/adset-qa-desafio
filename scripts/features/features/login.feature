
Feature: Login do usuario


    Scenario: realizar login de usuario

        Given que acesso a pagina de login
        When submeto o seguinte formulario de login com "qa@adset.com.br" e "9PK6#E8m"
        Then sou redirecionado para o Dashboad


    Scenario Outline: realizar login com dados invalidos

        Given que acesso a pagina de login
        When submeto o seguinte formulario de login com "<email>" e "<senha>"
        Then mensagem de alerta: "<mensagem_output>"

        Examples:
            | email           | senha    | mensagem_output                                |
            | qaadset.com.br  | 9PK6#E8m | O e-mail não é válido.                         |
            | qa@adset.com.br | 9PK6     | O e-mail e/ou a senha digitada está incorreta. |
