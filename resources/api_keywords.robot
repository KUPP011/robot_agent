*** Keywords ***
Get All Products
    [Documentation]    Sends a GET request to fetch all products.
    Create Session    api_session    ${BASE_URL}
    ${response}=    GET On Session    api_session    /productsList
    Should Be Equal As Strings    ${response.status_code}    200

Post To Products
    [Documentation]    Sends a POST request to the products endpoint.
    Create Session    api_session    ${BASE_URL}
    ${response}=    POST On Session    api_session    /productsList    json={}
    Should Be Equal As Strings    ${response.status_code}    200

Get All Brands
    [Documentation]    Sends a GET request to fetch all brands.
    Create Session    api_session    ${BASE_URL}
    ${response}=    GET On Session    api_session    /brandsList
    Should Be Equal As Strings    ${response.status_code}    200

Post Login Valid
    [Documentation]    Sends a POST request to login with valid credentials.
    Create Session    api_session    ${BASE_URL}
    ${response}=    POST On Session    api_session    /login    json={"email": "${VALID_EMAIL}", "password": "${VALID_PASSWORD}"}
    Should Be Equal As Strings    ${response.status_code}    200

Post Login Without Email
    [Documentation]    Sends a POST request to login without an email parameter.
    Create Session    api_session    ${BASE_URL}
    ${response}=    POST On Session    api_session    /login    json={"password": "${VALID_PASSWORD}"}
    Should Be Equal As Strings    ${response.status_code}    400

Delete Login
    [Documentation]    Sends a DELETE request to the login endpoint.
    Create Session    api_session    ${BASE_URL}
    ${response}=    DELETE On Session    api_session    /login
    Should Be Equal As Strings    ${response.status_code}    405

Post Login Invalid
    [Documentation]    Sends a POST request to login with invalid credentials.
    Create Session    api_session    ${BASE_URL}
    ${response}=    POST On Session    api_session    /login    json={"email": "${INVALID_EMAIL}", "password": "${INVALID_PASSWORD}"}
    Should Be Equal As Strings    ${response.status_code}    401

Post Create User
    [Documentation]    Sends a POST request to create a new user account.
    Create Session    api_session    ${BASE_URL}
    ${response}=    POST On Session    api_session    /createAccount    json={"email": "${NEW_USER_EMAIL}", "password": "${NEW_USER_PASSWORD}"}
    Should Be Equal As Strings    ${response.status_code}    201

Delete User
    [Documentation]    Sends a DELETE request to delete a user account.
    Create Session    api_session    ${BASE_URL}
    ${response}=    DELETE On Session    api_session    /deleteAccount    json={"email": "${NEW_USER_EMAIL}"}
    Should Be Equal As Strings    ${response.status_code}    200

Put Update User
    [Documentation]    Sends a PUT request to update a user account.
    Create Session    api_session    ${BASE_URL}
    ${response}=    PUT On Session    api_session    /updateAccount    json={"email": "${NEW_USER_EMAIL}", "password": "updatedpassword"}
    Should Be Equal As Strings    ${response.status_code}    200

Get User By Email
    [Documentation]    Sends a GET request to fetch user details by email.
    Create Session    api_session    ${BASE_URL}
    ${response}=    GET On Session    api_session    /getAccountDetail?email=${VALID_EMAIL}
    Should Be Equal As Strings    ${response.status_code}    200