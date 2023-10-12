*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/generic_keywords.resource
Variables    ../Locators/locators.py

*** Variables ***
${url}    https://automationexercise.com/
${browser}    chrome
${home_page_title}    Automation Exercise


*** Keywords ***
# Home Page keywords
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

# SignupLoginPage keywords
VerifyHeader
    [Documentation]    Verifies the header of the form, available forms: login_form, signup_form
    [Arguments]    ${form}    ${expected_header}   
    Element Should Be Visible    ${SignupLoginPage.${form}}
    ${actual_header}    Get Text    ${SignupLoginPage.${form}}//h2
    Should Be Equal As Strings    ${actual_header}    ${expected_header}

InputTextSignupForm
    [Arguments]    ${name}    ${email}
    Input Text    ${SignupLoginPage.input_name}    ${name}
    Input Text    ${SignupLoginPage.input_email}    ${email}

InputTextLoginForm
    [Arguments]    ${email}    ${password}
    Input Text    ${SignupLoginPage.input_email1}    ${email}
    Input Text    ${SignupLoginPage.input_password}    ${password}

SubmitForm
    [Documentation]    
    ...    Submits one of the forms by pressing button. 
    ...    Available forms: 'signup_form', 'login_form'
    [Arguments]    ${form}
    Click Button    ${SignupLoginPage.${form}}//button[@type='submit']

VerifyFormHeader
    [Documentation]    
    ...    Checks if visible header matches expected one in new user form
    [Arguments]    ${expected_header}
    ${header_webelement}    Get WebElement    ${AccountDetailsPage.first_header}
    Element Should Be Visible    ${header_webelement}
    ${actual_header}    Get Text    ${header_webelement}
    Should Be Equal As Strings    ${actual_header}    ${expected_header}

SetPassword
    [Arguments]    ${password}
    Input Text    ${AccountDetailsPage.input_password}    ${password}

SetDateOfBirth
    [Documentation]    
    ...    Select date of birth: 
    ...    'day' as int (0-31)
    ...    'month' as int (e.g. 1 for January, 3 for March etc.) 
    ...    'year' as int
    [Arguments]    ${day}    ${month}    ${year}
    Select From List By Value    ${AccountDetailsPage.dropdown_day}    ${day}
    Select From List By Value    ${AccountDetailsPage.dropdown_month}    ${month}
    Select From List By Value    ${AccountDetailsPage.dropdown_year}    ${year}
