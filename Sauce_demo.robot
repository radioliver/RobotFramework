*** Settings ***
Library           Selenium2Library




*** Test Cases ***

Open Saucedemo
    Open Browser    https://www.saucedemo.com/    firefox
    Sleep    3s
    Close Browser    

