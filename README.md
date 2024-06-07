# SauceDemoProject

This project automates testing for the Sauce Demo website using Robot Framework and SeleniumLibrary.

## Project Structure

Here's an overview of the project structure:

```plaintext
SauceDemoProject/
│
├── Pages/                      # Page-specific locators and keywords
│   ├── checkout_page.robot
│   ├── login_page.robot
│   └── product_page.robot
│
├── Resources/                  # Resource files (common variables and reusable keywords)
│   ├── reusable.robot
│   └── variables.robot
│
├── Tests/                      # Test scripts organized by page 
│   ├── login_tests.robot
│   ├── products_tests.robot
│   └── testresults/            # Test results directory
│
├── README.md                   # Project documentation
├── requirements.txt            # Robot Framework and Python dependencies

```

## Prerequisites

Before you begin, ensure you have the following installed on your machine:
- [Python 3.x](https://www.python.org/downloads/)
- [ChromeDriver](https://googlechromelabs.github.io/chrome-for-testing/#stable)
- [GeckoDriver](https://github.com/mozilla/geckodriver/releases)
- [Pycharm](https://www.jetbrains.com/pycharm/)

## Setup
Follow these steps to set up the project:

1. **Clone the repository**:
    ```bash
    git clone https://github.com/barbiedhamija/SauceDemoProject.git
    cd SauceDemoProject
    ```

2. **Install dependencies**:
    ```bash
    pip install -r requirements.txt
    ```

3. **Download and set up WebDriver**:
    Download the appropriate WebDriver (ChromeDriver, GeckoDriver) for your browser and ensure it's in your system's PATH. For Chrome, you might use:
    ```bash
    wget https://storage.googleapis.com/chrome-for-testing-public/125.0.6422.141/win64/chromedriver-win64.zip
    unzip chromedriver-win64.zip
    sudo mv chromedriver /usr/local/bin/
    ```
    Adjust the version and commands based on your operating system and browser.

## Running the Test Suite

To run the test suite, follow these steps:

1. **Navigate to the project directory**:
    ```bash
    cd path/to/SauceDemoProject
    cd Tests
    ```

2. **Execute all the tests one by one**:
    ```bash
    robot -d testresults .
    ```

3. **Execute all the tests in parallel**:
    ```bash
    pabot -d testresults .
    ```
    - `-d testresults`: Specifies the output directory for results.
    - `.`: The directory where your Robot Framework test cases are located.
