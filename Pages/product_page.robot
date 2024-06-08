*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../Resources/reusable.robot

*** Variables ***
${add_btn}    //button[text() ='Add to cart']
${cart_link}    css:a.shopping_cart_link
${sort_dropdown}    css:select.product_sort_container
${sort_low_to_high}    lohi

*** Keywords ***
Customer adds multiple products to the shopping cart
    Wait Until Element Is Visible    ${add_btn}
    ${products}=        Get Webelements   ${add_btn}
    FOR    ${button}    IN    @{products}
        Click Element    ${button}
    END
    Click Link        ${cart_link}

Customer selects the sort option Prices(low to high) in product view
    ${before_sort_list}=    Create a list of prices
    Log    ${before_sort_list}
    Set Global Variable    ${before_sort_list}
    Select From List By Value    ${sort_dropdown}    ${sort_low_to_high}
    ${after_sort_list}=        Create A List Of Prices
    Set Global Variable    ${after_sort_list}

Products should be sorted according to the price(low to high)
    Should Not Be Equal    ${before_sort_list}    ${after_sort_list}
    ${sorted_list}=    Evaluate    sorted(${before_sort_list},key=float)
    Lists Should Be Equal    ${after_sort_list}    ${sorted_list}



    
