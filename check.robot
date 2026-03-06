*** Settings ***
Library           Selenium2Library
Library           Collections
Resource        login_keywords.robot


*** Test Cases ***



Üres mezők ellenőrzése - név
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Button    id=checkout
    Input Text    id=first-name    Karoly
    Input Text    id=postal-code    1234
    Click Button    id=continue
    Page Should Contain     text=Error: First Name is required
    Close Browser

Üres mezők ellenőrzése - cím
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Button    id=checkout
    Input Text    id=first-name    Karoly
    Input Text    id=last-name    Robert
    Click Button    id=continue
    Page Should Contain     text=Error: Postal Code is required
    Close Browser

Üres mezők ellenőrzése - minden mező üres
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Button    id=checkout
    Click Button    id=continue
    Page Should Contain     text=Error: First Name is required
    Close Browser

Érvénytelen adatok kezelése - túl hosszú név        ${long_name}=    Evaluate    "A" * 100
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Button    id=checkout
    ${long_name}=    Evaluate    "A" * 1000
    Input Text    id=first-name    ${long_name}
    Input Text    id=last-name    ${long_name}
    Input Text    id=postal-code    5000
    Click Button    id=continue
    Page Should Contain     text=Checkout: Your Information
    Close Browser


Érvénytelen adatok kezelése - speciális karakterek
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Button    id=checkout
    Input Text    id=first-name    Karoly$ß¤
    Input Text    id=last-name    Robert$ß¤
    Input Text    id=postal-code    5000
    Click Button    id=continue
    Page Should Contain     text=Checkout: Your Information
    Close Browser


Érvénytelen adatok kezelése - csak számok a névben
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Button    id=checkout
    Input Text    id=first-name    1234
    Input Text    id=last-name    1234
    Input Text    id=postal-code    5000
    Click Button    id=continue
    Page Should Contain     text=Checkout: Your Information
    Close Browser

Checkout megszakítása - Cancel gombbal    
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Button    id=checkout
    Click Button    id=cancel
    Page Should Contain     text=Your Cart
    Close Browser

Érvényes adatokkal sikeres checkout folytatása
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Button    id=checkout
    Input Text    id=first-name    Karoly
    Input Text    id=last-name    Robert
    Input Text    id=postal-code    5000
    Click Button    id=continue
    Click Button    id=finish
    Page Should Contain     text=Checkout: Overview
    Close Browser