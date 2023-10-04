*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}   https://www.saucedemo.com/ 

${username}    standard_user
${password}    secret_sauce

${invalid_username}    locked_out_user
${locked_out_msg}    Epic sadface: Sorry, this user has been locked out.

*** Test Cases ***
TestLoginSucccessful
    OpenAndMaximize
    Input Text    xpath://input[@placeholder='Username']    ${username}
    Input Password    xpath://input[@placeholder='Password']    ${password}
    Click Button    xpath://*[@id="login-button"]
    Page Should Contain Element    xpath://div[@id='inventory_container']
    Element Should Be Visible    xpath://div[@id='inventory_container']
    Close Browser

TestLoginFailure
    OpenAndMaximize
    Input Text    xpath://input[@placeholder='Username']    ${invalid_username}
    Input Password    xpath://input[@placeholder='Password']    ${password}
    Click Button    xpath://*[@id="login-button"]
    Element Should Not Be Visible    xpath://div[@id='inventory_container']
    Element Should Be Visible    xpath://h3[@data-test='error']
    Element Text Should Be    xpath://h3[@data-test='error']    ${locked_out_msg}
    Close Browser

*** Keywords ***
OpenAndMaximize
    Open Browser    ${url}    ${browser}
    Maximize Browser Window