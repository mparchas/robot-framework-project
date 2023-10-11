*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   ../Resources/resources.resource
Resource    ../../Resources/generic_keywords.resource
Test Setup    OpenAndMaximize    ${url}    ${browser}
Test Teardown    Close Browser

*** Variables ***
${browser}    chrome
${url}   https://www.saucedemo.com/ 

${valid_username}    standard_user
#@{invalid_usernames}    invalid_user1    invalid_user2    invalid_user2

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
    &{credentials_dict}    GenerateRandomCredentials    number=${5}
    @{credentials_keys}    Get Dictionary Keys    ${credentials_dict}
    FOR  ${user}  IN  @{credentials_keys}
        Log To Console    Checking user: ${user}
        Input Text    xpath://input[@placeholder='Username']    ${user}
        Input Password    xpath://input[@placeholder='Password']    ${credentials_dict.${user}}
        Click Button    xpath://*[@id="login-button"]
        Element Should Not Be Visible    xpath://div[@id='inventory_container']
        Element Should Be Visible    xpath://h3[@data-test='error']
    END    

*** Keywords ***
