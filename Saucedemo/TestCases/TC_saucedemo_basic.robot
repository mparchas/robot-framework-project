*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/generic_keywords.resource

*** Variables ***
${browser}    chrome
${url}   https://www.saucedemo.com/ 

${username}    standard_user
${password}    secret_sauce

${invalid_username}    locked_out_user
${locked_out_msg}    Epic sadface: Sorry, this user has been locked out.

*** Test Cases ***
TestLoginSucccessful
    OpenAndMaximize    ${url}    ${browser}
    Input Text    xpath://input[@placeholder='Username']    ${username}
    Input Password    xpath://input[@placeholder='Password']    ${password}
    Click Button    xpath://*[@id="login-button"]
    Page Should Contain Element    xpath://div[@id='inventory_container']
    Element Should Be Visible    xpath://div[@id='inventory_container']
    Close Browser

TestLoginFailure
    OpenAndMaximize    ${url}    ${browser}
    Input Text    xpath://input[@placeholder='Username']    ${invalid_username}
    Input Password    xpath://input[@placeholder='Password']    ${password}
    Click Button    xpath://*[@id="login-button"]
    Element Should Not Be Visible    xpath://div[@id='inventory_container']
    Element Should Be Visible    xpath://h3[@data-test='error']
    Element Text Should Be    xpath://h3[@data-test='error']    ${locked_out_msg}  # the same assertion as two lines below
    ${actual_text}=    Get Text    xpath://h3[@data-test='error']
    Should Be Equal As Strings    ${locked_out_msg}    ${actual_text}
    Close Browser