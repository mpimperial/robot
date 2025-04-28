*** Settings ***
Documentation    To validate the Login form
Library          SeleniumLibrary
Test Teardown    Close Browser Session
Test Template    Validate Successful Login
Resource         resource.robot

*** Variables ***
${Error_Message}    css:.alert-danger

*** Test Cases ***    username               password
Invalid Username      asdasdas               learning
Invalid Password      rahulshetty            asdasda
Special               %#&=                   learning

*** Keywords ***
Validate Successful Login
    [Arguments]    ${username}    ${password}
    open the browser with the Mortgage payment url
    fill the login form     ${username}    ${password}
    wait until it checks and display error message
    verify if error message is correct
    
open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

fill the login form
    [arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      id:signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message}

verify if error message is correct
    ${result} =    Get Text    ${Error_Message}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
