*** Settings ***
Library           Selenium2Library


*** Test Cases ***

Login with standard user
    Open Browser    https://www.saucedemo.com/    firefox
    #Input Text    //*[@id="user-name"]    standard_user
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button
    Page Should Contain Element    id=shopping_cart_container
    

    Sleep    3s
    Close Browser

Login with standard user wrong password
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    id=user-name    standard_user
    Input Password    id=password    wrong_password
    Click Button    id=login-button    
    Page Should Contain      text=Epic sadface: Username and password do not match
    Sleep    3s
    Close Browser

Login with wrong user valid password
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    id=user-name    wrong_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button    
    Page Should Contain      text=Epic sadface: Username and password do not match
    Sleep    3s
    Close Browser

login with wrong user wrong password
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    id=user-name    wrong_user
    Input Password    id=password    wrong_password
    Click Button    id=login-button    
    Page Should Contain      text=Epic sadface: Username and password do not match

    Sleep    3s
    Close Browser

    

