*** Settings ***
Library    SeleniumLibrary
Test Setup    OpenAndMaximize
Test Teardown    Close Browser

*** Variables ***
${browser}    chrome
${url}   https://www.saucedemo.com/ 

${username}    standard_user
${password}    secret_sauce


*** Test Cases ***
TestExample
    Input Text    xpath://input[@placeholder='Username']    ${username}
    Input Password    xpath://input[@placeholder='Password']    ${password}

*** Keywords ***
OpenAndMaximize
    Open Browser    ${url}    ${browser}
    Maximize Browser Window