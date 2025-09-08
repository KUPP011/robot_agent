# Robot Agent - GitHub Copilot Instructions

## Project Overview
This is a Robot Framework test automation project for the "Automation Exercise" website (https://automationexercise.com). The project provides comprehensive test coverage for both web UI and API functionality, focusing on user authentication, account management, and product catalog operations.

## Technology Stack
- **Robot Framework 7.3.2** - Main test automation framework
- **SeleniumLibrary** - Web UI automation
- **RequestsLibrary** - API testing
- **Python 3.12+** - Runtime environment
- **Chrome WebDriver** - Browser automation

## Project Structure
```
robot_agent/
├── tests/                 # Test suite files
│   ├── login_test.robot   # Web UI login/signup tests
│   └── api_test.robot     # API endpoint tests
├── resources/             # Reusable keywords and variables
│   ├── login_keywords.robot    # Web UI automation keywords
│   ├── login_variables.robot   # Web UI test data
│   ├── api_keywords.robot      # API testing keywords
│   └── api_variables.robot     # API test data
├── requirements.txt       # Python dependencies
└── README.md             # Project documentation
```

## Coding Patterns & Best Practices

### File Organization
- **Test files** (`*.robot` in `/tests/`): Contain test cases and should import resources
- **Keyword files** (`*_keywords.robot` in `/resources/`): Contain reusable automation steps
- **Variable files** (`*_variables.robot` in `/resources/`): Contain test data and configuration

### Robot Framework Conventions
1. **File Structure**: Always start with `*** Settings ***`, followed by `*** Variables ***`, `*** Keywords ***`, and `*** Test Cases ***`
2. **Naming**: Use descriptive names with spaces for test cases and keywords
3. **Documentation**: Include `[Documentation]` for all test cases and complex keywords
4. **Import Resources**: Use `Resource` to import keyword and variable files

### Test Case Patterns
```robot
*** Test Cases ***
Test Case Name
    [Documentation]    Clear description of what the test validates
    Keyword Call With Parameters
    [Teardown]    Cleanup Keyword
```

### Keyword Patterns
```robot
*** Keywords ***
Keyword Name
    [Documentation]    Description of what the keyword does
    # Implementation steps
    Action Step 1
    Action Step 2
    Validation Step
```

### Web UI Testing Guidelines
- Use **SeleniumLibrary** for browser automation
- Always maximize browser window: `Maximize Browser Window`
- Use descriptive XPath selectors with meaningful attributes
- Generate random data for unique test scenarios
- Set global variables for data sharing between keywords
- Include explicit waits: `Wait Until Page Contains Element`
- Always close browser in teardown: `[Teardown]    Close Browser`

### API Testing Guidelines
- Use **RequestsLibrary** for HTTP requests
- Create sessions for efficient connection reuse: `Create Session    api_session    ${BASE_URL}`
- Validate HTTP status codes: `Should Be Equal As Strings    ${response.status_code}    200`
- Test both positive and negative scenarios
- Use JSON format for request payloads
- Test different HTTP methods (GET, POST, PUT, DELETE)

### Variable Naming Conventions
- **URLs**: `${BASE_URL}`, `${LOGIN_URL}`, `${SIGNUP_URL}`
- **Credentials**: `${VALID_EMAIL}`, `${VALID_PASSWORD}`, `${INVALID_EMAIL}`
- **Test Data**: `${USERNAME}`, `${EMAIL}`, `${PASSWORD}`
- **Locators**: Use descriptive names like `${LOGIN_BUTTON}`, `${EMAIL_FIELD}`

### Common Keywords to Suggest
- **Web UI**: `Open Browser`, `Click Element`, `Input Text`, `Select From List By Value`, `Wait Until Page Contains Element`
- **API**: `Create Session`, `GET On Session`, `POST On Session`, `PUT On Session`, `DELETE On Session`
- **Validation**: `Should Be Equal As Strings`, `Should Contain`, `Page Should Contain Element`
- **Utilities**: `Generate Random String`, `Set Global Variable`

## Test Data Management
- Store test URLs and credentials in variable files
- Use environment-specific variable files when needed
- Generate random data for uniqueness in test runs
- Separate valid and invalid test data clearly

## Error Handling & Debugging
- Use descriptive error messages in assertions
- Include timeouts for web elements: `timeout=30`
- Log important values for debugging
- Use explicit waits instead of sleep statements

## Integration Guidelines
When suggesting new test cases or keywords:
1. Follow the existing file organization pattern
2. Import necessary resources in the Settings section
3. Use consistent variable naming from existing variable files
4. Include proper documentation for new test cases
5. Add teardown steps for resource cleanup
6. Validate both success and failure scenarios

## Example Templates

### New Web UI Test Case Template
```robot
*** Settings ***
Library           SeleniumLibrary
Resource          resources/login_keywords.robot

*** Test Cases ***
Test New Feature
    [Documentation]    Description of the test scenario
    Open Browser And Navigate To Feature
    Perform Feature Action
    Validate Expected Result
    [Teardown]    Close Browser
```

### New API Test Case Template
```robot
*** Settings ***
Library           RequestsLibrary
Resource          resources/api_keywords.robot
Resource          resources/api_variables.robot

*** Test Cases ***
Test API Endpoint
    [Documentation]    Description of the API test
    Create Session    api_session    ${BASE_URL}
    Call API Endpoint
    Validate Response
```

## Command Line Usage
- Run all tests: `robot tests`
- Run specific test file: `robot tests/login_test.robot`
- Run with custom browser: `robot --variable BROWSER:firefox tests`
- Generate reports: Tests automatically generate log.html and report.html

This project focuses on comprehensive test coverage with maintainable, reusable code following Robot Framework best practices.