*** Settings ***
Documentation    Keywords of Landing Pages
Library          SeleniumLibrary
Resource         ../test/resource.robot

*** Variables ***
${Shop_page_loads}      css:.nav-link

*** Keywords ***

enter the country and select terms then proceed
    [Arguments]    ${country_name}
    Input Text    country    ${country_name}
    wait until element passed is located on page    xpath=//a[text()="${country_name}"]     10s
    Click Element    xpath=//a[text()="${country_name}"]
    Click Element    css:.checkbox label

purchase products and verify if successful
    Click Button     css:.btn-success
    wait until element passed is located on page    css:.alert-success    10s
    ${success_purchase} =    Get Text    css:.alert-success
    Page Should Contain    Success!


