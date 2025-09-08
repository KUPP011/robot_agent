*** Settings ***
Resource    login_variables.robot

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

Add Review On Product
    [Documentation]    Test Case 21: Add review on product
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element   xpath=//a[contains(text(),'Products')]
    Wait Until Page Contains Element    xpath=//h2[contains(text(),'All Products')]    timeout=10
    Click Element   xpath=//div[@class='product-image-wrapper'][1]//a[contains(text(),'View Product')]
    Wait Until Page Contains Element    xpath=//div[@class='product-information']    timeout=10
    Scroll Element Into View    xpath=//a[@href='#reviews']
    Click Element   xpath=//a[@href='#reviews']
    Wait Until Element Is Visible    xpath=//input[@id='name']    timeout=10
    Input Text      xpath=//input[@id='name']    ${REVIEWER_NAME}
    Input Text      xpath=//input[@id='email']   ${REVIEWER_EMAIL}
    Input Text      xpath=//textarea[@id='review']    ${REVIEW_TEXT}
    Click Button    xpath=//button[@id='button-review']
    Wait Until Page Contains    Thank you for your review.    timeout=10

Add To Cart From Recommended Items
    [Documentation]    Test Case 22: Add to cart from Recommended items
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Scroll Element Into View    xpath=//div[@class='recommended_items']
    Wait Until Element Is Visible    xpath=//div[@class='recommended_items']    timeout=10
    Click Element   xpath=//div[@class='recommended_items']//div[@class='product-image-wrapper'][1]//a[@class='btn btn-default add-to-cart']
    Wait Until Page Contains Element    xpath=//div[@class='modal-content']    timeout=10
    Wait Until Page Contains    Added!    timeout=5
    Click Element   xpath=//button[contains(text(),'Continue Shopping')]
    Click Element   xpath=//a[contains(text(),'Cart')]
    Wait Until Page Contains Element    xpath=//table[@id='cart_info_table']    timeout=10