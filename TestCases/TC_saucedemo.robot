*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}   https://www.saucedemo.com/ 

${username}    standard_user
${password}    secret_sauce

*** Test Cases ***
TestLoginSucccessful
    OpenAndMaximize
    Input Text    xpath://input[@placeholder='Username']    ${username}
    Input Password    xpath://input[@placeholder='Password']    ${password}
    Click Button    xpath://*[@id="login-button"]
    Page Should Contain Element    xpath://div[@id='inventory_container']
    Element Should Be Visible    xpath://div[@id='inventory_container']
    Close Browser
    
*** Keywords ***
OpenAndMaximize
    Open Browser    ${url}    ${browser}
    Maximize Browser Window