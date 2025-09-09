*** Settings ***
Library           SeleniumLibrary
Library           String
Library           BuiltIn
Resource          resources/login_keywords.robot
Documentation     This test suite contains login-related tests for the Automation Exercise website.
...               It verifies the login functionality with valid and invalid credentials, as well as edge cases such as missing parameters.
...               Each test case is designed to validate the expected HTTP status codes and responses for the login API endpoint.

*** Variables ***
${URL}            https://automationexercise.com
${PASSWORD}       TestPassword123

*** Test Cases ***
Test Signup With Valid Details
    Signup With Valid Details
    [Teardown]    Close Browser

Test Login With Valid Details
    Login With Valid Details
    [Teardown]    Close Browser

Test Case 25 Verify Scroll Up Using Arrow Button And Scroll Down
    [Documentation]    Test Case 25: Verify Scroll Up using 'Arrow' button and Scroll Down functionality
    Verify Scroll Up Using Arrow Button And Scroll Down
    [Teardown]    Close Browser

Test Case 26 Verify Scroll Up Without Arrow Button And Scroll Down
    [Documentation]    Test Case 26: Verify Scroll Up without 'Arrow' button and Scroll Down functionality
    Verify Scroll Up Without Arrow Button And Scroll Down
    [Teardown]    Close Browser