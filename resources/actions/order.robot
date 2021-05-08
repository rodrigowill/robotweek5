* Settings *

Documentation       Ações da funcionalidade de fechamento do pedido

* Keywords *
Go Checkout
    Click                       text=Fechar Pedido
    ${element}                  Set Variable  css=.page-header
    Wait For Elements State     ${element}    visible     ${DEFAULT_TIMEOUT}
    Get Text                    ${element}    contains    Finalize o seu pedido

Fill Data Customer
    [Arguments]     ${customer}
    Fill text       css=input[placeholder="Nome"]            ${customer["name"]}
    Fill text       css=input[placeholder="E-mail"]          ${customer["email"]}
    Fill text       css=input[placeholder^="Confirmação"]    ${customer["email"]}
    Fill text       css=input[placeholder="Endereço"]        ${customer["address"]}
    Fill text       css=input[placeholder="Número"]          ${customer["number"]}

Select Payment Option
    [Arguments]     ${payment}

    IF  "${payment}" == "Dinheiro"

        Click           xpath=(//mt-radio//label)[1]//div

    ELSE IF     ${payment} == "Cartão de Débito"

        Click           xpath=(//mt-radio//label)[2]//div

    ELSE IF     ${payment} == "Refeição"

        Click           xpath=(//mt-radio//label)[3]//div

    ELSE

        Fail     Incorrect payment type

    END

Pay Order
    Click       text=Concluir Pedido

Order Should Be Completed
    Wait For Elements State      css=p >> text=Seu pedido foi recebido pelo restaurante.     visible     ${DEFAULT_TIMEOUT}