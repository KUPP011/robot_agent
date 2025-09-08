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

Verify All Products And Product Detail Page
    [Documentation]    Test Case 8: Verify All Products and product detail page
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element   xpath=//a[contains(text(),'Products')]
    Wait Until Page Contains Element    xpath=//*[contains(text(),'ALL PRODUCTS')]    timeout=30
    Page Should Contain    ALL PRODUCTS
    Click Element   xpath=(//a[contains(text(),'View Product')])[1]
    Wait Until Page Contains Element    xpath=//div[@class='product-information']    timeout=30
    Page Should Contain Element    xpath=//div[@class='product-information']//h2
    Page Should Contain Element    xpath=//div[@class='product-information']//p[contains(text(),'Category:')]
    Page Should Contain Element    xpath=//div[@class='product-information']//span[contains(text(),'Rs.')]
    Page Should Contain Element    xpath=//div[@class='product-information']//p[contains(text(),'Availability:')]
    Page Should Contain Element    xpath=//div[@class='product-information']//p[contains(text(),'Condition:')]
    Page Should Contain Element    xpath=//div[@class='product-information']//p[contains(text(),'Brand:')]

Search Product
    [Documentation]    Test Case 9: Search Product functionality
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element   xpath=//a[contains(text(),'Products')]
    Wait Until Page Contains Element    xpath=//*[contains(text(),'ALL PRODUCTS')]    timeout=30
    Page Should Contain    ALL PRODUCTS
    Input Text      xpath=//input[@id='search_product']    dress
    Click Element   xpath=//button[@id='submit_search']
    Wait Until Page Contains Element    xpath=//*[contains(text(),'SEARCHED PRODUCTS')]    timeout=30
    Page Should Contain    SEARCHED PRODUCTS
    Page Should Contain Element    xpath=//div[@class='features_items']//div[@class='product-image-wrapper']