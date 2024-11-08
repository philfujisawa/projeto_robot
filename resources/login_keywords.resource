*** Settings ***
Library    SeleniumLibrary
Variables    ../variables/variables.py
Resource    ../resources/login_keywords.resource

*** Keywords ***
I navigate to the login page
    Go To    ${URL_DATA["baseUrl"]}

I input correct Credentials
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["CorrectData"]["username"]}
    Input Text    id=password    ${LOGIN_DATA["CorrectData"]["password"]}

I click on the login button
    Click Button    id=login-button

I assure that login is successfull
    ${full_url}    catenate    SEPARATOR=    ${URL_DATA["baseUrl"]}    ${URL_DATA["inventoryUrl"]}
    Location Should Be    ${full_url}
I input wrong Credentials
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["IncorrectData"]["username"]}
    Input Text    id=password    ${LOGIN_DATA["IncorrectData"]["password"]}

I can see the expected error message for no credentials
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGES["noCredentials"]}

I can see the expected error message for no password
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGES["noPassword"]}

I can see the expected error message for no username
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGES["noUsername"]}

I can see the expected error message for wrong credentials
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGES["wrongCredentials"]}

I input only Username
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["CorrectData"]["username"]}

I input only Password
    Wait Until Element Is Visible    id=user-name
    Input Text    id=password    ${LOGIN_DATA["CorrectData"]["password"]}

I input no Credentials
    Wait Until Element Is Visible    id=user-name