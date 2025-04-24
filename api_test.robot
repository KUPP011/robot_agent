*** Settings ***
Library           RequestsLibrary

*** Documentation ***
This test suite contains API tests for the Automation Exercise website.
It verifies various endpoints such as product listing, user login, account creation, and account management.

Each test case is designed to validate the expected HTTP status codes and responses for the respective API endpoints.

*** Variables ***
${BASE_URL}       https://automationexercise.com

*** Test Cases ***
Get All Products List
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    GET On Session    api    /api/productsList
    Should Be Equal As Strings    ${response.status_code}    200

Post To All Products List
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    POST On Session    api    /api/productsList    json={"key":"value"}
    Should Be Equal As Strings    ${response.status_code}    200

Get All Brands List
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    GET On Session    api    /api/brandsList
    Should Be Equal As Strings    ${response.status_code}    200

Post To Verify Login With Valid Details
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    POST On Session    api    /api/verifyLogin    json={"email":"test@example.com", "password":"password123"}
    Should Be Equal As Strings    ${response.status_code}    200

Post To Verify Login Without Email Parameter
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    POST On Session    api    /api/verifyLogin    json={"password":"password123"}
    Should Be Equal As Strings    ${response.status_code}    400

Delete To Verify Login
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    DELETE On Session    api    /api/verifyLogin
    Should Be Equal As Strings    ${response.status_code}    405

Post To Verify Login With Invalid Details
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    POST On Session    api    /api/verifyLogin    json={"email":"invalid@example.com", "password":"wrongpassword"}
    Should Be Equal As Strings    ${response.status_code}    401

Post To Create Register User Account
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    POST On Session    api    /api/createAccount    json={"name":"Test User", "email":"test@example.com", "password":"password123"}
    Should Be Equal As Strings    ${response.status_code}    201

Delete Method To Delete User Account
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    DELETE On Session    api    /api/deleteAccount    json={"email":"test@example.com"}
    Should Be Equal As Strings    ${response.status_code}    200

Put Method To Update User Account
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    PUT On Session    api    /api/updateAccount    json={"email":"test@example.com", "name":"Updated User"}
    Should Be Equal As Strings    ${response.status_code}    200

Get User Account Detail By Email
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    GET On Session    api    /api/getAccountDetail    params={"email":"test@example.com"}
    Should Be Equal As Strings    ${response.status_code}    200