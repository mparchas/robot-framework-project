*** Settings ***
Library    SeleniumLibrary
Resource    ../Keywords/ae_keywords.robot

Test Teardown    Close Browser


*** Variables ***

*** Test Cases ***
TestRegisterUser
    [Documentation]    Test registering process of a user
    OpenHomePage    
    VerifyHomePage
    SelectPage    signup_login
    
    
*** Keywords ***
    
