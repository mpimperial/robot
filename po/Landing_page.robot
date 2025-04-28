*** Settings ***
Documentation    Keywords of Landing Pages
Library          SeleniumLibrary

*** Keywords ***

fill the login form
    [arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      id:signInBtn