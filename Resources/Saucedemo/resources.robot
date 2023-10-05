*** Settings ***
Library    SeleniumLibrary
Resource    ../resources.robot

*** Variables ***
${browser}    chrome
${url}   https://www.saucedemo.com/ 

${input_username}    xpath://input[@placeholder='Username']
${input_password}    xpath://input[@placeholder='Password'] 
${button_login}    xpath://*[@id="login-button"]
${container_inventory}    xpath://div[@id='inventory_container']

${valid_username}    standard_user
${valid_password}    secret_sauce


*** Keywords ***
LoginWithValidData
    [Documentation]    Log in to SauceData with valid username and password and returns username
    ${username_textfield}=    Get WebElement    ${input_username}
    Wait Until Element Is Visible    ${username_textfield}
    Input Text    ${username_textfield}    ${valid_username}
    Input Password    ${input_password}    ${valid_password}
    Click Button    ${button_login}
    Wait Until Element Is Visible    ${container_inventory}
    [Return]    ${valid_username}
    