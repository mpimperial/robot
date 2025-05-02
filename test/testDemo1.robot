*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown  Close Browser session
Resource    resource.robot

*** Variables ***
${Error_Message}    css:.alert-danger

*** Test Cases ***
Validate Successful Login
    open the browser with the Mortgage payment url
    fill the login form
    wait until it checks and display error message
    verify if error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

fill the login form
    Input Text        id:username    marwinimperial
    Input Password    id:password    12345678
    Click Button      id:signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message}

verify if error message is correct
    ${result} =    Get Text    ${Error_Message}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
