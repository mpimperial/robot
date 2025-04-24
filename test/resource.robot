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
    Create Webdriver   Edge
    Go To    ${url}

Close Browser Session
    [Documentation]    Close the browser after test execution
    Sleep    5s
    Close Browser
