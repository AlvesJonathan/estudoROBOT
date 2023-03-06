*** Settings ***
Documentation    Robot Framework Sem Complicação
Library          SeleniumLibrary    timeout=1000
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

    

*** Test Cases ***
ChronosTest
    Adicionar Laptops no carrinho de compra
    Finalizar compra
    Adicionar Phones no carrinho de compra
    Finalizar compra
     

    
    