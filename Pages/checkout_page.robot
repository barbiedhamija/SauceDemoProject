*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${checkout_btn}    checkout
${first_name}    first-name
${last_name}    last-name
${zip_code}    postal-code
${finish_btn}    finish
${continue_btn}    continue
${successful_msg_txt}    Thank you for your order!
${back_btn}    back-to-products

*** Keywords ***
Proceeds to checkout the purchase
    [Arguments]    ${f_name}    ${l_name}    ${zip}
    Click Button    ${checkout_btn}
    Input Text    ${first_name}    ${f_name}    
    Input Text    ${last_name}    ${l_name}
    Input Text    ${zip_code}    ${zip}
    Wait Until Element Is Visible    ${continue_btn}
    Click Button    ${continue_btn}
    Wait Until Element Is Visible    ${finish_btn}
    Click Button    ${finish_btn}

Purchase should be successful
    Page Should Contain    ${successful_msg_txt}
    Page Should Contain Button    ${back_btn}