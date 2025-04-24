*** Settings ***
Documentation    To validate the Login form
Library          SeleniumLibrary

*** Variables ***
${username} =          marmar
${valid_password} =    Imperi@l123
${invalid_password} =  123456789
${url} =               https://web.uat.ucms.palawanpawnshop.com/business/#/login

*** Keywords ***

open ucms browser
    [Documentation]    Open the browser and navigate to the login page
    Create Webdriver   Edge
    Go To    ${url}

Sleep and Close Browser session
    [Documentation]    Close the browser after test execution
    Sleep    3s
    Close Browser
