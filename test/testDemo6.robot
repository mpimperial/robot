*** Settings ***
Library        SeleniumLibrary
Library        Collections
Library        ../customLibraries/Shop.py
Test Setup     open the browser with the Mortgage payment url
Test Teardown  Close Browser session
Resource       resource.robot
Resource       ../po/Landing_page.robot
Resource       ../po/Shop_page.robot
Resource       ../po/Confirmation_page.robot
Resource       ../po/Checkout_page.robot

*** Variables ***
@{list_of_products}     Blackberry    Nokia Edge
${country_name}    India

*** Test Cases ***
Validate Unsuccessful Login

    [Documentation]    Test login with invalid credentials and verify error message
    Landing_page.fill the login form    ${username}    ${invalid_password}
    Landing_page.wait until the element in page is visible
    Landing_page.verify if error message is correct

Validate Cards display in the shopping page

    [Documentation]    Test login with valid credentials and verify that shopping page loads
    Landing_page.fill the login form    ${username}    ${valid_password}
    Shop_page.wait until the element in page is visible
    Shop_page.verify card titles in the page
    Add Items To Cart And Checkout    ${list_of_products}
    Checkout_page.validate checkout products then proceed
    Confirmation_page.enter the country and select terms then proceed    ${country_name}
    Confirmation_page.purchase products and verify if successful
#    select the card    iphone X

select form and user option
    Landing_page.fill the login form and select user option    ${username}    ${valid_password}

