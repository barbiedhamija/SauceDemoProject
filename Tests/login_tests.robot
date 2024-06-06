*** Settings ***
Resource    ../Pages/product_page.robot
Resource    ../Pages/login_page.robot
Resource    ../Resources/variables.robot
Resource    ../Resources/reusable.robot
Test Setup    Open url in browser and maximize window    ${browser}
Test Teardown    Close Browser

*** Test Cases ***
User is not able to login when locked out
    Customer attempts login    ${locked_username}    ${password}
    Login should fail and error message should be displayed
