*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Saucedemo/resources.robot
Resource    ../../Resources/resources.robot
Test Setup    OpenAndMaximize    ${url}    ${browser}
Test Teardown    Close Browser

*** Variables ***
${browser}    chrome
${url}   https://www.saucedemo.com/ 

*** Test Cases ***
TestAddingElementsToCart
    [Documentation]    Tests adding elements to cart
    ${logged_username}=    LoginWithValidData
    Log To Console    User: ${logged_username} has been logged in.
    Sleep    5

*** Keywords ***

