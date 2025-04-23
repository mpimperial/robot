*** Settings ***
Documentation    To validate the Login form
Library          SeleniumLibrary

*** Variables ***
${username} =    rahulshettyacademy
${invalid_password} =    marwin
${valid_password} =    learning
${url} =         https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***

open the browser with the Mortgage payment url
    [Documentation]    Open the browser and navigate to the login page
    Create Webdriver    Chrome
    Go To    ${url}

Close Browser session
    [Documentation]    Close the browser after test execution
    Close Browser
