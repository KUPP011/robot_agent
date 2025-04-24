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
    [Documentation]    This test verifies that the API returns a list of all products with a 200 status code.
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    GET On Session    api    /api/productsList
    Should Be Equal As Strings    ${response.status_code}    200

Post To All Products List
    [Documentation]    This test verifies that the API accepts a POST request to the products list endpoint and returns a 200 status code.
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    POST On Session    api    /api/productsList    json={"key":"value"}
    Should Be Equal As Strings    ${response.status_code}    200

Get All Brands List
    [Documentation]    This test verifies that the API returns a list of all brands with a 200 status code.
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    GET On Session    api    /api/brandsList
    Should Be Equal As Strings    ${response.status_code}    200

Post To Verify Login With Valid Details
    [Documentation]    This test verifies that the API allows login with valid credentials and returns a 200 status code.
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    POST On Session    api    /api/verifyLogin    json={"email":"test@example.com", "password":"password123"}
    Should Be Equal As Strings    ${response.status_code}    200

Post To Verify Login Without Email Parameter
    [Documentation]    This test verifies that the API returns a 400 status code when the email parameter is missing in the login request.
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    POST On Session    api    /api/verifyLogin    json={"password":"password123"}
    Should Be Equal As Strings    ${response.status_code}    400

Delete To Verify Login
    [Documentation]    This test verifies that the API does not allow DELETE requests on the login endpoint and returns a 405 status code.
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    DELETE On Session    api    /api/verifyLogin
    Should Be Equal As Strings    ${response.status_code}    405

Post To Verify Login With Invalid Details
    [Documentation]    This test verifies that the API returns a 401 status code when invalid login credentials are provided.
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    POST On Session    api    /api/verifyLogin    json={"email":"invalid@example.com", "password":"wrongpassword"}
    Should Be Equal As Strings    ${response.status_code}    401

Post To Create Register User Account
    [Documentation]    This test verifies that the API allows creating a new user account and returns a 201 status code.
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    POST On Session    api    /api/createAccount    json={"name":"Test User", "email":"test@example.com", "password":"password123"}
    Should Be Equal As Strings    ${response.status_code}    201

Delete Method To Delete User Account
    [Documentation]    This test verifies that the API allows deleting a user account and returns a 200 status code.
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    DELETE On Session    api    /api/deleteAccount    json={"email":"test@example.com"}
    Should Be Equal As Strings    ${response.status_code}    200

Put Method To Update User Account
    [Documentation]    This test verifies that the API allows updating a user account and returns a 200 status code.
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    PUT On Session    api    /api/updateAccount    json={"email":"test@example.com", "name":"Updated User"}
    Should Be Equal As Strings    ${response.status_code}    200

Get User Account Detail By Email
    [Documentation]    This test verifies that the API returns the details of a user account by email with a 200 status code.
    Create Session    api    ${BASE_URL}    verify=False
    ${response}=    GET On Session    api    /api/getAccountDetail    params={"email":"test@example.com"}
    Should Be Equal As Strings    ${response.status_code}    200