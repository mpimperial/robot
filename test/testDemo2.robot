*** Settings ***
Library        SeleniumLibrary
Library        Collections
Test Setup     open the browser with the Mortgage payment url
Test Teardown  Close Browser session
Resource       resource.robot

*** Variables ***
${Error_Message}        css:.alert-danger
${Shop_page_loads}      css:.nav-link

*** Test Cases ***
#Validate Unsuccessful Login
#
#    [Documentation]    Test login with invalid credentials and verify error message
#    fill the login form    ${username}    ${invalid_password}
#    wait until the element in page is visible    ${Error_Message}    10s
#    verify if error message is correct

#Validate Cards display in the shopping page
#
#    [Documentation]    Test login with valid credentials and verify that shopping page loads
#    fill the login form    ${username}    ${valid_password}
#    wait until the element in page is visible    ${Shop_page_loads}    10s
#    verify card titles in the page
#    select the card    Nokia Edge

select form and navigate to child window
    fill the login form and select user option     ${username}    ${valid_password}


*** Keywords ***

fill the login form
    [arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      id:signInBtn

wait until the element in page is visible
    [arguments]    ${element}    ${timeout}
    Wait Until Element Is Visible    ${element}    ${timeout}

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