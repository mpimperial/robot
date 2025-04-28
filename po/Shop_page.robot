*** Settings ***
Documentation    Keywords of Landing Pages
Library          SeleniumLibrary

*** Variables ***
${Shop_page_loads}      css:.nav-link

*** Keywords ***

wait until the element in page is visible
    Wait Until Element Is Visible    ${Shop_page_loads}    ${timeout}
