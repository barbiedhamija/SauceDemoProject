*** Settings ***
Library        SeleniumLibrary
*** Variables ***
${uname_txt}    user-name
${password_txt}    password
${login_btn}    login-button
${error_msg}    Sorry, this user has been locked out.

*** Keywords ***
Customer attempts login
    [Arguments]    ${uname}    ${pass}
    Input Text    ${uname_txt}    ${uname}
    Input Password    ${password_txt}    ${pass}
    Click Button    ${login_btn}

Login should fail and error message should be displayed
    Page Should Contain    ${error_msg} 
    Element Should Be Visible    ${login_btn}
