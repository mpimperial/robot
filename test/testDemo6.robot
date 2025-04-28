*** Settings ***
Library        SeleniumLibrary
Library        Collections
Library        ../customLibraries/Shop.py
Test Setup     open the browser with the Mortgage payment url
Test Teardown  Close Browser session
Resource       resource.robot
Resource       ../po/Landing_page.robot
Resource       ../po/Shop_page.robot

*** Variables ***
${Error_Message}        css:.alert-danger
@{list_of_products}     Blackberry    Nokia Edge

*** Test Cases ***
#Validate Unsuccessful Login
#
#    [Documentation]    Test login with invalid credentials and verify error message
#    fill the login form    ${username}    ${invalid_password}
#    wait until the element in page is visible    ${Error_Message}    10s
#    verify if error message is correct

Validate Cards display in the shopping page

    [Documentation]    Test login with valid credentials and verify that shopping page loads
    Landing_page.fill the login form    ${username}    ${valid_password}
    Shop_page.wait until the element in page is visible
    verify card titles in the page
    Hello World
    Add Items To Cart And Checkout    ${list_of_products}

#select form and navigate to child window
#    fill the login form and select user option     ${username}    ${valid_password}



verify if error message is correct
    ${result} =    Get Text    ${Error_Message}
    Should Be Equal As Strings    ${result}    Incorrect username/password.

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

fill the login form and select user option
    [arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Element     css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body
    Click Element     okayBtn
    Click Element     okayBtn
    Wait Until Element Is Not Visible    css:.modal-body
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    terms
    Checkbox Should Be Selected    terms