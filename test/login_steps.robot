*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/login_keywords.resource
Test Setup    Open Browser    browser=${BROWSER}
*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
${LOGINPAGE}    https://www.saucedemo.com/inventory.html

*** Test Cases ***
Successful Login Test
    I navigate to the login page    ${URL}
    I input correct Credentials    ${USERNAME}    ${PASSWORD}
    I click on the login button
    I assure that login is successful    ${LOGINPAGE}

Fail Login Test - No Credentials
    I navigate to the login page    ${URL}
    I input no Credentials
    I click on the login button
    I can see the expected error message    Epic sadface: Username is required

Fail Login Test - No username
    I navigate to the login page    ${URL}
    I input only Password    ${PASSWORD}
    I click on the login button
    I can see the expected error message    Epic sadface: Username is required

Fail Login Test - No password
    I navigate to the login page    ${URL}
    I input only Username    ${USERNAME}
    I click on the login button
    I can see the expected error message    Epic sadface: Password is required

Fail Login Test - Wrong Credentials
    I navigate to the login page    ${URL}
    I input wrong Credentials    WRONG    123456
    I click on the login button
    I can see the expected error message    Epic sadface: Username and password do not match any user in this service