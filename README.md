# Robot Agent

This repository contains test automation scripts for the Automation Exercise website. The tests are written using the Robot Framework.

## Project Structure

- `tests/`: Contains all test files.
- `resources/`: Contains reusable keywords and variables for the tests.

## Prerequisites

- Python 3.12 or later
- Robot Framework
- SeleniumLibrary
- RequestsLibrary

## Environment Setup

Follow these steps to set up the environment for running the tests:

1. **Install Python**:
   - Ensure Python 3.12 or later is installed on your system.
   - Verify the installation by running:
     ```
     python --version
     ```

2. **Install Required Libraries**:
   - Navigate to the project directory.
   - Run the following command to install the required Python libraries:
     ```
     pip install -r requirements.txt
     ```

3. **Verify Installation**:
   - Ensure Robot Framework is installed by running:
     ```
     robot --version
     ```

4. **Run Tests**:
   - Execute all tests by running:
     ```
     robot tests
     ```

## How to Run Tests

1. Navigate to the project directory.
2. Run the following command to execute all tests:
   ```
   robot tests
   ```

## Contribution

Feel free to fork this repository and submit pull requests for improvements or bug fixes.

## License

This project is licensed under the MIT License.