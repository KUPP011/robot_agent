*** Settings ***
Library           RequestsLibrary
Resource          ../resources/api_keywords.robot
Resource          ../resources/api_variables.robot

# This test suite contains API tests for the Automation Exercise website.
# It verifies various endpoints such as product listing, user login, account creation, and account management.
# Each test case is designed to validate the expected HTTP status codes and responses for the respective API endpoints.

*** Test Cases ***
Get All Products List
    [Documentation]    This test verifies that the API returns a list of all products with a 200 status code.
    Get All Products

Post To All Products List
    [Documentation]    This test verifies that the API accepts a POST request to the products list endpoint and returns a 200 status code.
    Post To Products

Get All Brands List
    [Documentation]    This test verifies that the API returns a list of all brands with a 200 status code.
    Get All Brands

Post To Verify Login With Valid Details
    [Documentation]    This test verifies that the API allows login with valid credentials and returns a 200 status code.
    Post Login Valid

Post To Verify Login Without Email Parameter
    [Documentation]    This test verifies that the API returns a 400 status code when the email parameter is missing in the login request.
    Post Login Without Email

Delete To Verify Login
    [Documentation]    This test verifies that the API does not allow DELETE requests on the login endpoint and returns a 405 status code.
    Delete Login

Post To Verify Login With Invalid Details
    [Documentation]    This test verifies that the API returns a 401 status code when invalid login credentials are provided.
    Post Login Invalid

Post To Create Register User Account
    [Documentation]    This test verifies that the API allows creating a new user account and returns a 201 status code.
    Post Create User

Delete Method To Delete User Account
    [Documentation]    This test verifies that the API allows deleting a user account and returns a 200 status code.
    Delete User

Put Method To Update User Account
    [Documentation]    This test verifies that the API allows updating a user account and returns a 200 status code.
    Put Update User

Get User Account Detail By Email
    [Documentation]    This test verifies that the API returns the details of a user account by email with a 200 status code.
    Get User By Email