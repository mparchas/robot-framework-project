*** Settings ***
Library    SeleniumLibrary
Test Setup    OpenAndMaximize    ${url}    ${browser}
Test Teardown    Close Browser

*** Variables ***
${browser}    chrome
${url}   https://www.saucedemo.com/ 

${valid_username}    standard_user
@{invalid_usernames}    locked_out_user    locked_out_user1    locked_out_user2

${password}    secret_sauce


*** Test Cases ***

TestSaucedemo
    [Documentation]    Practicing parametrizing setups and teardowns, can be deleted later.
    Input Text    xpath://input[@placeholder='Username']    ${valid_username}
    Input Password    xpath://input[@placeholder='Password']    ${password}
    Sleep    2
    No Operation    

TestGoogle
    [Documentation]    Practicing parametrizing setups and teardowns, can be deleted later.
    [Setup]    OpenAndMaximize    app_url=https://www.google.com    app_browser=chrome
    Sleep    2

TestInvalidUsers
    Set Selenium Speed    3
    FOR  ${invalid_username}  IN  ${invalid_usernames}
        Log To Console    ${invalid_username}
        Input Text    xpath://input[@placeholder='Username']    ${invalid_username}
        Input Password    xpath://input[@placeholder='Password']    ${password}
        Click Button    xpath://*[@id="login-button"]
        Element Should Not Be Visible    xpath://div[@id='inventory_container']
        Element Should Be Visible    xpath://h3[@data-test='error']
    END
    

*** Keywords ***
OpenAndMaximize
    [Arguments]    ${app_url}    ${app_browser}
    Open Browser    ${app_url}    ${app_browser}
    Maximize Browser Window
