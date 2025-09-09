*** Variables ***
${LOGIN_URL}    https://automationexercise.com/api/login
${SIGNUP_URL}    https://automationexercise.com/api/signup
${VALID_LOGIN_EMAIL}    validuser@example.com
${VALID_LOGIN_PASSWORD}    validpassword123
${SIGNUP_EMAIL}    signupuser@example.com
${SIGNUP_PASSWORD}    signuppassword123

# Test Case 5: Register User with Existing Email Variables
${EXISTING_USER_NAME}    ExistingUser
${EXISTING_EMAIL}    existinguser@example.com

# Test Case 6: Contact Us Form Variables
${CONTACT_NAME}    Test User
${CONTACT_EMAIL}    testuser@example.com
${CONTACT_SUBJECT}    Test Automation Query
${CONTACT_MESSAGE}    This is a test message for automation testing purposes.
${CONTACT_FILE_PATH}    /tmp/test_file.txt