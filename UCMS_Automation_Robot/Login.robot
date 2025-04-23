*** Settings ***
Library          SeleniumLibrary
Test Setup       open ucms browser
Test Teardown    Sleep and Close Browser session
Resource         resource.robot

*** Variables ***
${error_message} =       css:.alert-danger
${account_username} =    id:userName

*** Test Cases ***
validate unsuccessful login
    fill up login form    ${username}     ${invalid_password}
    accept terms and conditions
    wait until the error message display
    verify error message

validate successful login
    fill up login form    ${username}     ${valid_password}
    accept terms and conditions
    verify username is visible

*** Keywords ***

fill up login form
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    id:username
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}

accept terms and conditions
    Click Link        xpath=//a[text()=' terms & condition']
    Wait Until Element Is Visible    xpath=//a[text()=' terms & condition']
    Click Button    xpath=//button[text()='Accept']
    Click Button    id:businessLogin

wait until the error message display
    Wait Until Element Is Visible    ${error_message}

verify error message
    ${result} =     Get Text    ${error_message}
    Should Be Equal As Strings    ${result}    Invalid username and/or password.

verify username is visible
    Wait Until Element Is Visible    ${account_username}
    ${user} =     Get Text    ${account_username}
    Should Be Equal As Strings    ${user}    MARMAR