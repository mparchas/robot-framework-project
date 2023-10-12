*** Settings ***
Library    SeleniumLibrary
Library    ../Keywords/user_defined_keywords.py
Resource    ../../Resources/generic_keywords.resource
Variables    ../Locators/locators.py

*** Variables ***
${url}    https://ultimateqa.com/
${browser}    chrome


*** Keywords ***
GenerateRandomCredentials
    [Arguments]    ${number}
    &{credentials_dict}    Gen Random Credentials    ${number}
    [Return]    ${credentials_dict}

OpenMainPage
    OpenAndMaximize    ${url}    ${browser}
    Wait Until Element Is Visible    ${navbar}
    Mouse Over    ${dropdown_learning}
    Click Element    ${dropdown_list_learning}
    Wait Until Element Is Visible    ${pages_list} 