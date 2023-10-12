*** Settings ***
Library    SeleniumLibrary
Resource    ../Keywords/ae_keywords.robot

Test Teardown    Close Browser


*** Variables ***
&{credentials}    name=TestName1    email=test_email@gmail.com
${expected_signup_header}    New User Signup!
${expected_register_header}    ENTER ACCOUNT INFORMATION

*** Test Cases ***
TestRegisterUser
    [Documentation]    Test registering process of a user
    OpenHomePage    
    VerifyHomePage
    SelectPage    signup_login
    VerifyHeader    signup_form    ${expected_signup_header}
    InputTextSignupForm    ${credentials.name}    ${credentials.email}
    SubmitForm    signup_form
    VerifyFormHeader    ${expected_register_header}
