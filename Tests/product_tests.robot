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
    customer attempts login    ${std_username}    ${password}
    Customer adds multiple products to the shopping cart
    Proceeds to checkout the purchase    ${first}    ${last}    ${zip}
    Purchase should be successful

Customer is able to sort the products successfully
    customer attempts login    ${std_username}    ${password}
    Customer sorts the product in product view
    products are ordered according to the chosen sort method