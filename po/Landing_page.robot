*** Settings ***
Documentation    Keywords of Landing Pages
Library          SeleniumLibrary
Resource         ../test/resource.robot

*** Variables ***
${Error_Message}        css:.alert-danger

*** Keywords ***

fill the login form
    [arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      id:signInBtn

wait until the element in page is visible
    wait until element passed is located on page    ${Error_Message}    10s

verify if error message is correct
    ${result} =    Get Text    ${Error_Message}
    Should Be Equal As Strings    ${result}    Incorrect username/password.

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