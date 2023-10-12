*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/generic_keywords.resource
Variables    ../Locators/locators.py

*** Variables ***
${url}    https://automationexercise.com/
${browser}    chrome
${home_page_title}    Automation Exercise


*** Keywords ***
OpenHomePage
    OpenAndMaximize    ${url}    ${browser}
    Wait Until Element Is Visible    ${HomePage.main_navbar}

VerifyHomePage
    Wait Until Element Is Visible    ${HomePage.main_navbar}
    Element Should Be Visible    ${HomePage.feature_items}
    ${actual_title}    Get Title
    Should Be Equal As Strings    Automation Exercise    ${actual_title}

SelectPage
    [Documentation]    Select 'sub_page' from: home, products, cart, signup_login, contact_us
    [Arguments]    ${sub_page}
    Click Element    ${HomePage.${sub_page}}


    