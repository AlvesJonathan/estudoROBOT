*** Settings ***
Documentation    Robot Framework Sem Complicação
Library          SeleniumLibrary    timeout=500
Library          String

*** Variables ***
${url}    https://www.demoblaze.com/
${navegador}    chrome

*** Keywords ***
Adicionar Laptops no carrinho de compra
    Open Browser                     ${url}    ${navegador}
    Maximize Browser Window
    Click Link                       Laptops
    Wait Until Element Is Visible    link=MacBook Pro
    Click Link                       MacBook Pro
    Wait Until Element Is Visible    xpath=//div[2]//a
    Click Element                    xpath=//div[2]//a
    Alert Should Be Present

Adicionar Phones no carrinho de compra
    Open Browser                     ${url}    ${navegador}
    Maximize Browser Window
    Click Link                       Phones
    Wait Until Element Is Visible    link=Iphone 6 32gb
    Click Link                       Iphone 6 32gb
    Wait Until Element Is Visible    xpath=//div[2]//a
    Click Element                    xpath=//div[2]//a
    Alert Should Be Present
    
Adicionar Monitors no carrinho de compra
    Open Browser                     ${url}    ${navegador}
    Maximize Browser Window
    Click Link                       Monitors
    Wait Until Element Is Visible    link=Apple monitor 24
    Click Link                       Apple monitor 24
    Wait Until Element Is Visible    xpath=//div[2]//a
    Click Element                    xpath=//div[2]//a
    Alert Should Be Present

Finalizar compra
    Click Link                        Cart
     Click Button                     css=.btn-success
     Wait Until Element Is Visible    id=name
     Input Text                       id=name       Jonathan
     Input Text                       id=country    Brasil
     Input Text                       id=city       AguasLindas
     Input Text                       id=card       12345678910
     Input Text                       id=month      07
     Input Text                       id=year       2031
     Click Button                     xpath=//button[text()='Purchase']
     Element Text Should Be           css=.showSweetAlert > h2    Thank you for your purchase!
     Click Button                     css=.confirm

Entrar em contato
    Open Browser                     ${url}    ${navegador}
    Maximize Browser Window
    Click Link                       Contact
    Wait Until Element Is Visible    id=recipient-email
    Input Text                       id=recipient-email    email@teste.compra
    Input Text                       id=recipient-name     Jonathan
    Input Text                       id=message-text       texto de exemplo
    Click Button                     xpath=//button[text()='Send message']
    Alert Should Be Present

Visualizar Video
    Open Browser                     ${url}    ${navegador}
    Maximize Browser Window
    Click Link                       About us
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div/div/div[2]/form/div/div/button
    Click Button                     xpath=/html/body/div[4]/div/div/div[2]/form/div/div/button

*** Test Cases ***
Comprar Laptops
    Adicionar Laptops no carrinho de compra
    Finalizar compra

Comprar Phones
    Adicionar Phones no carrinho de compra
    Finalizar compra

Comprar Monitors
    Adicionar Monitors no carrinho de compra
    Finalizar compra
    
Aba Contact
    Entrar em contato

Aba About us
    Visualizar Video
    


     

    
    