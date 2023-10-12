*** Settings ***
Library    SeleniumLibrary
Resource    ../Keywords/ae_keywords.robot

Test Teardown    Close Browser


*** Variables ***
&{credentials}    name=TestName1    email=test_email@gmail.com
${expected_signup_header}    New User Signup!

*** Test Cases ***
TestRegisterUser
    [Documentation]    Test registering process of a user
    OpenHomePage    
    VerifyHomePage
    SelectPage    signup_login
    VerifyHeader    signup_form    ${expected_signup_header}
    InputTextSignUpForm    ${credentials.name}    ${credentials.email}
    Sleep    5
*** Keywords ***
    
