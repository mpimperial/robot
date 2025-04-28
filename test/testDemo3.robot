*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    String
Library    Collections
Test Setup    open the browser with the Mortgage payment url
Test Teardown    Close Browser Session
Resource    resource.robot

*** Variables ***


*** Test Cases ***
Validate Child Functionality
    select the link of child window
    verify the user is switched to child window
    grab the email from child window
    switch to parent window and enter the email

*** Keywords ***
select the link of child window
    Click Element    css:.blinkingText
    Sleep            5s

verify the user is switched to child window
    Switch Window    NEW
    Element Text Should Be    css:h2    DOCUMENTS REQUEST

grab the email from child window
    ${text} =    Get Text    css:.red
    @{words} =    Split String    ${text}    at
    ${text_split} =    Get From List    ${words}    1
    Log    ${text_split}
    @{words_2} =    Split String    ${text_split}
    ${email} =    Get From List    ${words_2}    0
    Set Global Variable   ${email}

switch to parent window and enter the email
    Switch Window        MAIN
    Title Should Be      LoginPage Practise | Rahul Shetty Academy
    Input Text           id:username     ${email}