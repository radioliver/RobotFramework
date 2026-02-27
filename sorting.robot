*** Settings ***
Library           Selenium2Library
Library           Collections
Resource        login_keywords.robot



*** Test Cases ***

Sort products A to Z
    Login with standard user