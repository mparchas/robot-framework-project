*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/resources.robot
Resource    ../../Resources/generic_keywords.resource
Test Setup    OpenAndMaximize    ${url}    ${browser}
Test Teardown    Close Browser

*** Variables ***
${browser}    chrome
${url}   https://www.saucedemo.com/ 

${button_add_to_cart}    xpath://button[contains(@data-test, 'add-to-cart')]
${button_go_to_cart}    xpath://a[@class='shopping_cart_link']
${title_cart}    xpath://span[@class='title']
${items_cart}    xpath://div[@class='cart_item']

*** Test Cases ***
TestAddingElementsToCart
    [Documentation]    Tests adding elements to cart
    ${logged_username}=    LoginWithValidData
    Log To Console    User: ${logged_username} has been logged in.
    @{all_elements}=    Get WebElements    ${button_add_to_cart}
    ${number}=    Get Length    ${all_elements}
    Log To Console    Number of elements found: ${number}
    FOR  ${button}  IN  @{all_elements}
        Click Button    ${button}
    END
    Click Element    ${button_go_to_cart}
    Wait Until Element Is Visible    ${title_cart}
    @{cart_items}=    Get WebElements    ${items_cart}
    ${number_in_cart}=    Get Length    ${cart_items}
    Should Be Equal As Integers    ${number}    ${number_in_cart}
    Sleep    5
*** Keywords ***

