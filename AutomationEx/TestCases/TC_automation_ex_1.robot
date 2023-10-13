*** Settings ***
Library    SeleniumLibrary
Resource    ../Keywords/ae_keywords.robot

Test Teardown    Close Browser


*** Variables ***
&{credentials}    name=TestName1    email=test_email@gmail.com    password=test_password
&{address_information}    
...    first_name=TestFirstName 
...    last_name=TestLastName 
...    company=TestCompany 
...    address1=TestAddress1 
...    address2=TestAddress2 
...    country=Singapore 
...    state=TestState1 
...    city=TestCity1 
...    zipcode=TestZipcode 
...    mobile_number=1235123
${expected_signup_header}    New User Signup!
${expected_register_header}    ENTER ACCOUNT INFORMATION

*** Test Cases ***
TestRegisterUser
    [Documentation]    Test successfull register process of a user.
    OpenHomePage    
    VerifyHomePage
    SelectPage    signup_login
    VerifyHeader    signup_form    ${expected_signup_header}
    InputTextSignupForm    ${credentials.name}    ${credentials.email}
    SubmitForm    signup_form
    VerifyFormHeader    ${expected_register_header}
    SetPassword    ${credentials.password}
    SetDateOfBirth    ${1}    ${1}    ${1999}
    FillUpAddressInformation    ${address_information}
    # Select Checkbox    locator=xpath://input[contains(@id, 'optin')]
    # Select Checkbox    locator=xpath://input[contains(@id, 'newsletter')]
    Sleep    5
    