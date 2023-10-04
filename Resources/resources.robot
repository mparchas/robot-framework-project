*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
OpenAndMaximize
    [Arguments]    ${app_url}    ${app_browser}
    Open Browser    ${app_url}    ${app_browser}
    Maximize Browser Window