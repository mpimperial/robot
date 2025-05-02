*** Settings ***
Documentation    Keywords of Landing Pages
Library          SeleniumLibrary
Resource         ../test/resource.robot

*** Variables ***
${Shop_page_loads}      css:.nav-link

*** Keywords ***

wait until the element in page is visible
    wait until element passed is located on page    ${Shop_page_loads}    10s

verify card titles in the page
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =    Get Webelements    css:.card-title
    @{actualList} =    Create List
    FOR    ${el}    IN    @{elements}
        Append To List    ${actualList}    ${el.text}
        log     ${actualList}
    END
    Lists Should Be Equal    ${expectedList}   ${actualList}

select the card
    [arguments]    ${cardName}
    ${elements} =    Get Webelements    css:.card-title
    ${index} =    Set Variable    1
     FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${element.text}' == '${cardName}'
        ${index} =    Evaluate    ${index} + 1
    END
    Click Button    xpath=(//*[@class='card-footer'])[${index}]/button

validate checkout products then proceed
    [Arguments]    ${list_of_products}
