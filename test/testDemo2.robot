*** Settings ***
Library        SeleniumLibrary
Test Setup     open the browser with the Mortgage payment url
Test Teardown  Close Browser session
Resource       resource.robot

*** Variables ***
${Error_Message}        css:.alert-danger
${Shop_page_loads}      css:.nav-link

*** Test Cases ***
Validate Unsuccessful Login
    [Documentation]    Test login with invalid credentials and verify error message
    fill the login form    ${username}    ${invalid_password}
    wait until the element in page is visible    ${Error_Message}    10s
    verify if error message is correct

Validate Cards display in the shopping page
    [Documentation]    Test login with valid credentials and verify that shopping page loads
    fill the login form    ${username}    ${valid_password}
    wait until the element in page is visible    ${Shop_page_loads}    10s
    verify card titles in the page

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

    
