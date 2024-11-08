*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/login_keywords.resource
Suite Setup    Open Browser    browser=${BROWSER}

*** Variables ***

${BROWSER}    chrome

*** Test Cases ***
Successful Login Test
    I navigate to the login page    
    I input correct Credentials  
    I click on the login button
    I assure that login is successfull

Fail Login Test - No Credentials
    I navigate to the login page    
    I input no Credentials
    I click on the login button
    I can see the expected error message for no credentials

Fail Login Test - No username
    I navigate to the login page    
    I input only Password    
    I click on the login button
    I can see the expected error message for no username

Fail Login Test - No password
    I navigate to the login page    
    I input only Username    
    I click on the login button
    I can see the expected error message for no password

Fail Login Test - Wrong Credentials
    I navigate to the login page    
    I input wrong Credentials
    I click on the login button
    I can see the expected error message for wrong credentials