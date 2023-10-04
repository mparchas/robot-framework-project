*** Settings ***
Library    SeleniumLibrary
Resource   ../../Resources/resources.robot
Test Setup    OpenAndMaximize    ${url}    ${browser}
Test Teardown    Close Browser

*** Variables ***
${browser}    chrome
${url}   https://www.saucedemo.com/ 

${valid_username}    standard_user
@{invalid_usernames}    invalid_user1    invalid_user2    invalid_user2

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
    Set Selenium Speed    0.5
    FOR  ${invalid_username}  IN  @{invalid_usernames}
        Log To Console    ${invalid_username}
        Input Text    xpath://input[@placeholder='Username']    ${invalid_username}
        Input Password    xpath://input[@placeholder='Password']    ${password}
        Click Button    xpath://*[@id="login-button"]
        Element Should Not Be Visible    xpath://div[@id='inventory_container']
        Element Should Be Visible    xpath://h3[@data-test='error']
    END

*** Keywords ***
