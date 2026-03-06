*** Settings ***
Library           Selenium2Library
Library           Collections
Resource        login_keywords.robot


*** Test Cases ***
Termék oldal megnyitása - név alapján
    Login with standard user
    Close All Browsers

Termék oldal megnyitása - kép alapján
    Login with standard user
    Sleep    2s
    Click Element    class=inventory_item_img
    Sleep    2s
    Page Should Contain Element    class=inventory_details_img
    Close Browser
    
    
Termék információk ellenőrzése - név
    Login with standard user
    ${product_name}=    Get WebElement    class=inventory_item_name
    ${product_name_text}=     Get Text    ${product_name}
    Click Element    class=inventory_item_name
    # Should Be Equal    ${product_name}   class=inventory_details_name large_size  
    Page Should Contain     ${product_name_text}
    Close Browser
    
Termék információk ellenőrzése - ár (ugyaz-e?)
    Login with standard user
    ${product_price}=    Get WebElement    class=inventory_item_price
    ${product_price_text}=     Get Text    ${product_price}
    Click Element    class=inventory_item_name
    Page Should Contain     ${product_price_text}
    Close Browser

Termék információk ellenőrzése - leírás        
    Login with standard user
    Click Element    class=inventory_item_name
    Page Should Contain Element    class=inventory_details_desc
    Close Browser 



Termék információk ellenőrzése - kép
    Login with standard user
    Sleep    2s
    Click Element    class=inventory_item_img
    Sleep    2s
    Page Should Contain Element    class=inventory_details_img
    Close Browser


Vissza navigáció - Back to products gomb
    Login with standard user
    Click Element    class=inventory_item_name
    Click Button    id=back-to-products
    Page Should Contain Element    class=inventory_item_name
    Close Browser
