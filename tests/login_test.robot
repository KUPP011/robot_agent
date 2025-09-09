*** Settings ***
Documentation     This test suite contains login-related tests for the Automation Exercise website.
...               It verifies the login functionality with valid and invalid credentials, as well as edge cases such as missing parameters.
...               Each test case is designed to validate the expected HTTP status codes and responses for the login API endpoint.
Library           SeleniumLibrary
Library           String
Library           BuiltIn
Resource          ../resources/login_keywords.robot

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

Test Case 9: Logout User
    [Documentation]    Test Case 9: Verify that user is able to logout successfully
    Logout User
    [Teardown]    Close Browser

Test Case 10: Register User With Existing Email
    [Documentation]    Test Case 10: Verify error when registering with existing email
    Register User With Existing Email
    [Teardown]    Close Browser