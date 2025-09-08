*** Settings ***
Library           SeleniumLibrary
Library           String
Library           BuiltIn
Resource          ../resources/login_keywords.robot
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

Test Case 21: Add Review On Product
    [Documentation]    Test Case 21: Add review on product
    Add Review On Product
    [Teardown]    Close Browser

Test Case 22: Add To Cart From Recommended Items
    [Documentation]    Test Case 22: Add to cart from Recommended items
    Add To Cart From Recommended Items
    [Teardown]    Close Browser