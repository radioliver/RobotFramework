*** Settings ***
Library           Selenium2Library
Library           Collections
Resource        login_keywords.robot



*** Test Cases ***

Sort products Z to A
    Login with standard user
    Click Element    class=product_sort_container
    Sleep    2s
    Select From List By Label    class=product_sort_container    Name (Z to A)
    Sleep    4s
    ${product_names}=    Get all products
    Veryfy Z to A sorting     ${product_names}
    Close All Browsers

Sort products A to Z
    Login with standard user
    Click Element    class=product_sort_container
    Sleep    2s
    Select From List By Label    class=product_sort_container    Name (A to Z)
    Sleep    4s
    ${product_names}=    Get all products
    Veryfy A to Z sorting     ${product_names}

    Close All Browsers  

Sort products price low to high
    Login with standard user
    Click Element    class=product_sort_container
    Sleep    2s
    Select From List By Label    class=inventory_item_price    Price (low to high)
    Sleep    4s
    ${product_names}=    Get all products
    Veryfy price low to high sorting     ${product_names}
    Close All Browsers


*** Keywords ***
Get all products
    ${products}=     Create List    
    @{product_elements}=    GEt WebElements    class=inventory_item_name
    FOR    ${element}    IN    @{product_elements}
        ${product_name}=    Get Text    ${element}
        Append To List    ${products}    ${product_name}
    END
    RETURN    ${products}

Veryfy Z to A sorting
    [Arguments]    ${product_names}
    ${length}=    Get Length    ${product_names}
    FOR    ${i}    IN RANGE    1    ${length}-1
        ${current}=    Get From List    ${product_names}    ${i}
        ${next}=    Get From List   ${product_names}    ${i+1}

        Should Be True    '${current}'>='${next}'    Sorting is not Z to A at index ${i}

    END

Veryfy A to Z sorting
    [Arguments]    ${product_names} 
    ${length}=    Get Length    ${product_names}
    FOR    ${i}    IN RANGE    1    ${length}-1
        ${current}=    Get From List    ${product_names}    ${i}
        ${next}=    Get From List   ${product_names}    ${i+1}

        Should Be True    '${current}'<='${next}'    Sorting is not A to Z at index ${i}

    END   

Veryfy price low to high sorting 
    [Arguments]    ${product_names} 
    ${length}=    Get Length    ${product_names}
    FOR    ${i}    IN RANGE    1    ${length}-1
        ${current}=    Get From List    ${product_names}    ${i}
        ${next}=    Get From List   ${product_names}    ${i+1}

        Should Be True    ${current}<=${next}    Sorting is not price low to high at index ${i}