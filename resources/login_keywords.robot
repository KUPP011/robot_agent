*** Keywords ***
Signup With Valid Details
    [Documentation]    Automates the signup process with valid details.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element   xpath=//a[contains(text(),'Signup / Login')]
    ${RANDOM}       Generate Random String    5
    Set Global Variable    ${USERNAME}    TestUser_${RANDOM}
    Set Global Variable    ${EMAIL}       testuser_${RANDOM}@example.com
    Input Text      xpath=//input[@name='name']    ${USERNAME}
    Input Text      xpath=//form[@action='/signup']/input[@name='email']   ${EMAIL}
    Click Button    xpath=//button[contains(text(),'Signup')]
    Wait Until Page Contains Element    xpath=//*[contains(text(),'Enter Account Information')]    timeout=30
    Input Text      xpath=//input[@name='password']    ${PASSWORD}
    Select From List By Value    xpath=//select[@name='days']    1
    Select From List By Value    xpath=//select[@name='months']  1
    Select From List By Value    xpath=//select[@name='years']   2000
    Input Text      xpath=//input[@name='first_name']    Test
    Input Text      xpath=//input[@name='last_name']     User
    Input Text      xpath=//input[@name='address1']      123 Test Street
    Input Text      xpath=//input[@name='state']        TestState
    Input Text      xpath=//input[@name='city']         TestCity
    Input Text      xpath=//input[@name='zipcode']      12345
    Input Text      xpath=//input[@name='mobile_number']    1234567890
    Click Button    xpath=//button[contains(text(),'Create Account')]
    Wait Until Page Contains Element    xpath=//*[contains(text(),'Account Created')]    timeout=30

Login With Valid Details
    [Documentation]    Automates the login process with valid details.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element   xpath=//a[contains(text(),'Signup / Login')]
    Input Text      xpath=//input[@name='email']    ${EMAIL}
    Input Text      xpath=//input[@name='password']    ${PASSWORD}
    Click Button    xpath=//button[contains(text(),'Login')]
    Wait Until Page Contains Element    xpath=//*[contains(text(),'Logged in as')]

Register User With Existing Email
    [Documentation]    Test Case 5: Attempts to register a user with an email that already exists.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element   xpath=//a[contains(text(),'Signup / Login')]
    
    # First create a user to ensure the email exists
    ${RANDOM}       Generate Random String    5
    Set Global Variable    ${EXISTING_USERNAME}    ExistingUser_${RANDOM}
    Set Global Variable    ${TEMP_EMAIL}       existinguser_${RANDOM}@example.com
    Input Text      xpath=//input[@name='name']    ${EXISTING_USERNAME}
    Input Text      xpath=//form[@action='/signup']/input[@name='email']   ${TEMP_EMAIL}
    Click Button    xpath=//button[contains(text(),'Signup')]
    
    # Check if we get to account information page or error
    ${signup_success}=    Run Keyword And Return Status    Wait Until Page Contains Element    xpath=//*[contains(text(),'Enter Account Information')]    timeout=5
    
    Run Keyword If    ${signup_success}    Complete First User Registration
    
    # Now go back and try to register with the same email again
    Go To    ${URL}
    Click Element   xpath=//a[contains(text(),'Signup / Login')]
    Input Text      xpath=//input[@name='name']    AnotherUser
    Input Text      xpath=//form[@action='/signup']/input[@name='email']   ${TEMP_EMAIL}
    Click Button    xpath=//button[contains(text(),'Signup')]
    
    # Verify we get an error message about existing email
    Wait Until Page Contains Element    xpath=//*[contains(text(),'Email Address already exist!')]    timeout=10

Complete First User Registration
    [Documentation]    Helper keyword to complete the first user registration
    Input Text      xpath=//input[@name='password']    ${PASSWORD}
    Select From List By Value    xpath=//select[@name='days']    1
    Select From List By Value    xpath=//select[@name='months']  1
    Select From List By Value    xpath=//select[@name='years']   2000
    Input Text      xpath=//input[@name='first_name']    Test
    Input Text      xpath=//input[@name='last_name']     User
    Input Text      xpath=//input[@name='address1']      123 Test Street
    Input Text      xpath=//input[@name='state']        TestState
    Input Text      xpath=//input[@name='city']         TestCity
    Input Text      xpath=//input[@name='zipcode']      12345
    Input Text      xpath=//input[@name='mobile_number']    1234567890
    Click Button    xpath=//button[contains(text(),'Create Account')]
    Wait Until Page Contains Element    xpath=//*[contains(text(),'Account Created')]    timeout=30

Contact Us Form Test
    [Documentation]    Test Case 6: Automates the contact us form submission.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element   xpath=//a[contains(text(),'Contact us')]
    Wait Until Page Contains Element    xpath=//*[contains(text(),'Get In Touch')]    timeout=10
    Input Text      xpath=//input[@name='name']    ${CONTACT_NAME}
    Input Text      xpath=//input[@name='email']    ${CONTACT_EMAIL}
    Input Text      xpath=//input[@name='subject']    ${CONTACT_SUBJECT}
    Input Text      xpath=//textarea[@name='message']    ${CONTACT_MESSAGE}
    Choose File     xpath=//input[@name='upload_file']    ${CONTACT_FILE_PATH}
    Click Button    xpath=//input[@name='submit']
    Wait Until Page Contains Element    xpath=//*[contains(text(),'Success! Your details have been submitted successfully.')]    timeout=10