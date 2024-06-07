*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String

*** Variables ***
${url}    https://www.saucedemo.com/
${prices}    //div[@class='inventory_item_price']

*** Keywords ***
Open url in browser and maximize window
    [Arguments]    ${browser_name}
    Open Browser    ${url}    ${browser_name}
    Maximize Browser Window    

Create a list of prices
    Wait Until Element Is Visible    ${prices}
    ${total_prices}=    Get Webelements    ${prices}
    @{get_prices}=    Create List
    FOR    ${element}    IN    @{total_prices}
        ${price_list}=    Get Text    ${element}
        ${price}=    Removes Dollar Symbol From Price    ${price_list}
        Append To List    ${get_prices}    ${price}
    END
    [Return]    ${get_prices}

Removes dollar symbol from price
    [Arguments]    ${dollar_price}
    ${clean_price}=    Evaluate    "${dollar_price.replace('$', '').strip()}"
    ${number_price}=    Evaluate    float(${clean_price})
    [Return]    ${number_price}
