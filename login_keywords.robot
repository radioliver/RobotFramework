*** Settings ***
Library           Selenium2Library

*** Keywords ***

Login with standard user
    Open Browser    https://www.saucedemo.com/    chrome
    Sleep    3s
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button
