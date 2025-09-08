# Robot Agent - Test Automation Framework
Robot Agent is a test automation project using Robot Framework to test the Automation Exercise website (automationexercise.com). The project contains both API and UI (browser-based) tests written in Robot Framework with SeleniumLibrary and RequestsLibrary.

Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.

## Working Effectively

### Prerequisites and Environment Setup
- Python 3.12+ is required (verified working with Python 3.12.3)
- Robot Framework 7.3.2 
- SeleniumLibrary for web UI automation
- RequestsLibrary for API testing
- Browser drivers (chromium-browser and chromedriver are available)

### Bootstrap and Setup Commands
Execute these commands in order to set up the environment:

```bash
# Verify Python version (must be 3.12+)
python3 --version

# Install required dependencies - takes 30-60 seconds on fresh install
pip3 install -r requirements.txt

# Verify Robot Framework installation
robot --version
```

**TIMING**: Initial pip install takes 30-60 seconds with fresh environment. Subsequent runs take <5 seconds. Dry run validation takes <1 second.

### Running Tests

#### API Tests (Recommended for most testing)
```bash
# Run API tests - these test REST endpoints
robot --pythonpath . tests/api_test.robot

# Run API tests with output directory
robot --pythonpath . -d results tests/api_test.robot
```

**CRITICAL LIMITATION**: API tests fail in environments without internet access to automationexercise.com. Tests will show ConnectionError/NameResolutionError but the framework and syntax are correct.

#### UI/Browser Tests (Limited functionality)
```bash
# Run UI tests - these test web browser automation
robot --pythonpath . tests/login_test.robot

# Run with headless browser (may help with environment issues)
robot --pythonpath . --variable BROWSER:headlesschrome tests/login_test.robot

# Alternative browsers if Chrome fails
robot --pythonpath . --variable BROWSER:firefox tests/login_test.robot
robot --pythonpath . --variable BROWSER:headlessfirefox tests/login_test.robot
```

**CRITICAL LIMITATION**: UI tests have significant challenges in headless environments:
- Browser driver conflicts (SessionNotCreatedException)
- Missing display/GUI support 
- Network connectivity requirements
- Chrome driver configuration issues in automated environments

**Browser Workarounds**: Try Firefox if Chrome fails, or use headless variants.

#### Run All Tests
```bash
# Run all tests
robot --pythonpath . tests/

# Run all tests with output directory
robot --pythonpath . -d results tests/
```

**TIMING**: Individual test execution attempts take 10-60 seconds each, but may timeout or fail due to network/browser limitations.

## Known Issues and Limitations

### Network Dependencies
- **CRITICAL**: All tests require internet access to automationexercise.com
- Tests will fail with ConnectionError in isolated environments
- This is expected behavior, not a framework issue

### Browser/UI Test Issues
- **Syntax Error**: login_test.robot has incorrect Documentation section placement (line 7) - Documentation should be inside Test Cases section or in Settings
- **Browser Driver Issues**: Chrome/Chromium conflicts in automated environments  
- **Headless Environment**: UI tests may not work properly without display
- **Available browsers**: chromium-browser, firefox, and their headless variants

### Resource Path Requirements
- **CRITICAL**: Must use `--pythonpath .` flag when running Robot Framework
- Resource files use relative paths that require proper path resolution
- Running without `--pythonpath .` will result in "Resource file does not exist" errors

## Validation and Testing Your Changes

### Always Run These Commands Before Committing
```bash
# 1. Verify syntax and basic functionality (validates all keywords and structure)
robot --dryrun --pythonpath . tests/

# 2. Test API framework (will fail on network, but validates syntax)
robot --pythonpath . tests/api_test.robot

# 3. Verify Robot Framework version and installation
robot --version
```

### Manual Validation Scenarios
After making changes to test files:

1. **API Test Validation**: Run API tests to verify keywords and variables are properly defined
2. **Resource File Validation**: Ensure all resource files are properly referenced with relative paths
3. **Syntax Validation**: Use `--dryrun` to catch syntax errors without executing tests

**Note**: Full end-to-end validation requires network access to automationexercise.com and proper browser setup.

## Common Tasks and Navigation

### Repository Structure
```
/home/runner/work/robot_agent/robot_agent/
├── .github/
│   └── copilot-instructions.md
├── tests/
│   ├── api_test.robot         # API endpoint tests
│   └── login_test.robot       # Web UI login/signup tests
├── resources/
│   ├── api_keywords.robot     # Reusable API keywords
│   ├── api_variables.robot    # API test variables
│   ├── login_keywords.robot   # Web UI keywords
│   └── login_variables.robot  # Web UI test variables
├── requirements.txt           # Python dependencies
├── README.md                 # Project documentation
└── .gitignore               # Excludes test artifacts
```

### Key Files to Check After Changes
- **Always check resource files** when modifying test imports or keywords
- **Verify variable definitions** in api_variables.robot and login_variables.robot after API changes
- **Test resource paths** are relative and require `--pythonpath .` flag

### Understanding Test Results
Test execution creates three important files:
- **log.html**: Detailed execution log with all steps, timing, and full error details (~240KB)
- **output.xml**: Machine-readable results for CI/CD integration (~11KB)  
- **report.html**: Summary report with test statistics and pass/fail overview (~248KB)

**Expected Error Patterns**:
- **ConnectionError/NameResolutionError**: Expected in isolated environments without internet access
- **SessionNotCreatedException**: Browser driver issues, expected in headless environments
- **"Resource file does not exist"**: Missing `--pythonpath .` flag in command

## Troubleshooting Common Issues

### "Resource file does not exist" Error
**Solution**: Always use `robot --pythonpath . tests/` command format

### "No keyword with name 'X' found" Error  
**Solution**: Check that resource files are properly imported and `--pythonpath .` is used

### Browser/Chrome Driver Errors
**Solution**: Browser tests are not reliable in automated environments. Focus on API tests for validation.

### Network Connection Errors
**Expected Behavior**: Tests targeting automationexercise.com will fail in environments without internet access.

## Development Guidelines

### When Adding New Tests
1. Place API tests in `tests/api_test.robot`
2. Place UI tests in `tests/login_test.robot` 
3. Add reusable keywords to appropriate resource files in `resources/`
4. Use relative paths for resource imports
5. Always test with `--pythonpath .` flag

### When Modifying Tests
1. Run syntax validation: `robot --dryrun --pythonpath . tests/`
2. Test specific files: `robot --pythonpath . tests/[filename].robot`
3. Check resource file imports are still valid
4. Verify variable references are correct

**CRITICAL**: Never run tests without the `--pythonpath .` flag as it will cause resource import failures.