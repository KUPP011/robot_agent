*** Settings ***
Resource          resources/login_keywords.robot
Resource          resources/login_variables.robot

*** Test Cases ***
Test Signup With Valid Details
    [Documentation]    This test verifies that a user can sign up with valid details.
    Signup With Valid Details

Test Login With Valid Details
    [Documentation]    This test verifies that a user can log in with valid credentials.
    Login With Valid Details