*** Settings ***
Resource     ../Pages/product_page.robot
Resource     ../Pages/login_page.robot
Resource     ../Resources/variables.robot
Resource     ../Resources/reusable.robot
Resource     ../Pages/checkout_page.robot
Test Setup    Open url in browser and maximize window    ${browser}
Test Teardown    Close Browser    


*** Test Cases ***
Successful Customer purchases Products
    Customer attempts login    ${std_username}    ${password}
    Customer adds multiple products to the shopping cart
    Proceeds to checkout the purchase    ${first}    ${last}    ${zip}
    Purchase should be successful

Customer is able to sort the products with Prices(Low to High) successfully
    Customer attempts login    ${std_username}    ${password}
    Customer selects the sort option Price(low to high) in product view
    Products should be sorted according to the price(low to high)
