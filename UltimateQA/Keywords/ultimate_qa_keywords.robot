*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/generic_keywords.resource
Variables    ../Locators/locators.py

*** Variables ***
${url}    https://ultimateqa.com/
${browser}    chrome


*** Keywords ***
OpenMainPage
    OpenAndMaximize    ${url}    ${browser}
    Wait Until Element Is Visible    ${navbar}
    Mouse Over    ${dropdown_learning}
    Click Element    ${dropdown_list_learning}
    Sleep    5


