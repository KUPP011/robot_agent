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

Verify Scroll Up Using Arrow Button And Scroll Down
    [Documentation]    Test Case 25: Verify Scroll Up using 'Arrow' button and Scroll Down functionality
    Open Browser    ${URL}    headlesschrome
    Set Selenium Timeout    30s
    Maximize Browser Window
    # Verify that home page is visible successfully
    Wait Until Page Contains Element    xpath=//body    timeout=30
    Page Should Contain    AutomationExercise
    # Scroll down page to bottom
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    3s
    # Verify 'SUBSCRIPTION' text is visible
    Page Should Contain    SUBSCRIPTION
    # Click on arrow at bottom right side to move upward (if present)
    ${arrow_exists}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//a[@id='scrollUp']
    Run Keyword If    ${arrow_exists}    Click Element    xpath=//a[@id='scrollUp']
    ...    ELSE    Log    Arrow button not found, scrolling manually
    Run Keyword If    not ${arrow_exists}    Execute JavaScript    window.scrollTo(0, 0)
    Sleep    3s
    # Verify that page is scrolled up and text is visible on screen
    Page Should Contain    AutomationExercise

Verify Scroll Up Without Arrow Button And Scroll Down
    [Documentation]    Test Case 26: Verify Scroll Up without 'Arrow' button and Scroll Down functionality
    Open Browser    ${URL}    headlesschrome
    Set Selenium Timeout    30s
    Maximize Browser Window
    # Verify that home page is visible successfully
    Wait Until Page Contains Element    xpath=//body    timeout=30
    Page Should Contain    AutomationExercise
    # Scroll down page to bottom
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    3s
    # Verify 'SUBSCRIPTION' text is visible
    Page Should Contain    SUBSCRIPTION
    # Scroll up page to top (without using arrow button)
    Execute JavaScript    window.scrollTo(0, 0)
    Sleep    3s
    # Verify that page is scrolled up and text is visible on screen
    Page Should Contain    AutomationExercise