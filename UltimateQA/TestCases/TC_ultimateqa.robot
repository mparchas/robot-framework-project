*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/generic_keywords.resource
Resource    ../Keywords/ultimate_qa_keywords.robot

Test Teardown    Close Browser

*** Variables ***

*** Test Cases ***
TestTest
    OpenMainPage

*** Keywords ***

