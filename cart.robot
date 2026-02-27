*** Settings ***
Library           Selenium2Library



*** Test Cases ***

Add to cart
    Open Browser    https://www.saucedemo.com/    chrome
    Sleep    3s
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Button    id=add-to-cart-sauce-labs-bolt-t-shirt
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Sleep    2s
    Close Browser

Remove from cart
    Open Browser    https://www.saucedemo.com/    chrome
    Sleep    3s
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button
    Click Button    id=add-to-cart-sauce-labs-backpack
    Sleep    2s
    Click Button    id=add-to-cart-sauce-labs-bolt-t-shirt
    Sleep    2s
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Sleep    2s
    Click Button    id=remove-sauce-labs-backpack
    Sleep    2s
    Click Button    id=remove-sauce-labs-bike-light
    Sleep    2s
    Click Button    id=remove-sauce-labs-bolt-t-shirt
    Sleep    10s
    Close Browser



#  Check the contents of the shopping cart
Check cart
    Login to saucedemo
    Click Button    id=add-to-cart-sauce-labs-backpack
    Sleep    2s
    Click Button    id=add-to-cart-sauce-labs-bolt-t-shirt
    Sleep    2s
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Sleep    2s

    Element Should Contain    id=shopping_cart_container    3

    Click Button    id=remove-sauce-labs-backpack
    Sleep    2s
    Click Button    id=remove-sauce-labs-bike-light
    Sleep    2s
    Click Button    id=remove-sauce-labs-bolt-t-shirt
 
    Sleep    10s
    Close Browser

*** Keywords ***

Login to saucedemo
    Open Browser    https://www.saucedemo.com/    chrome
    Sleep    3s
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button


 

