*** Settings ***
Library           SeleniumLibrary
Library           String
Library           BuiltIn
Resource          ../resources/login_keywords.robot
Resource          ../resources/login_variables.robot

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

Test Case 5: Register User With Existing Email
    [Documentation]    Test Case 5: Verify user registration with existing email shows appropriate error message
    Register User With Existing Email
    [Teardown]    Close Browser

Test Case 6: Contact Us Form
    [Documentation]    Test Case 6: Verify contact us form submission works correctly
    Contact Us Form Test
    [Teardown]    Close Browser