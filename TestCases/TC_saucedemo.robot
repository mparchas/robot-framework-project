*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${username}    standard_user
${password}    secret_sauce

*** Test Cases ***
TestLoginSucccessful
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    xpath://input[@placeholder='Username']    ${username}
    Input Password    xpath://input[@placeholder='Password']    ${password}
    Click Button    xpath://*[@id="login-button"]
    Page Should Contain Element    xpath://div[@id='inventory_container']
    Element Should Be Visible    xpath://div[@id='inventory_container']
    Close Browser
*** Keywords ***