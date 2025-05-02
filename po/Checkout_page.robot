*** Settings ***
Documentation    Keywords of Landing Pages
Library          SeleniumLibrary

*** Variables ***
${Shop_page_loads}      css:.nav-link

*** Keywords ***

validate checkout products then proceed
    Click Button    css:.btn-success
