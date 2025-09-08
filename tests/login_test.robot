*** Settings ***
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

Test Case 19: View & Cart Brand Products After Login
    [Documentation]    Test to view products by brand and add them to cart after login
    [Tags]    brands    cart    login
    Login And View Brand Products
    [Teardown]    Close Browser

Test Case 20: Search Products and Verify Cart After Login
    [Documentation]    Test to search for products and verify cart functionality after login
    [Tags]    search    cart    login
    Login And Search Products With Cart Verification
    [Teardown]    Close Browser