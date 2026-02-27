*** Settings ***
Library           Selenium2Library
Library           Collections
Resource        login_keywords.robot



*** Test Cases ***

Sort products price low to high
    Login with standard user
    Click Element    class=product_sort_container
    Sleep    2s
    Select From List By Label    class=product_sort_container     Price (low to high)
    Sleep    4s
    ${product_prices}=    Get all products
    Veryfy price low to high sorting     ${product_prices}
    Close All Browsers

*** Keywords ***

Get all products
    ${products}=     Create List    
    @{product_elements}=    Get WebElements    class=inventory_item_price
    
    FOR    ${element}    IN    @{product_elements}
         ${szoveg}=           Get Text        ${element}
         ${product_price}=    Set Variable    ${szoveg[1:]}
         Append To List       ${products}     ${product_price}
    END
    RETURN    ${products}


Veryfy price low to high sorting
    [Arguments]    ${product_prices} 
    ${length}=    Get Length    ${product_prices}
    FOR    ${i}    IN RANGE    1    ${length}-1
        ${current}=    Get From List    ${product_prices}    ${i}
        ${next}=    Get From List   ${product_prices}    ${i+1}

        Should Be True    ${current}<=${next}    Sorting is not A to Z at index ${i}

    END   