*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
I navigate to the login page
    [Arguments]    ${URL}
    Go To    ${URL}

I input correct Credentials
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}

I click on the login button
    Click Button    id=login-button

I assure that login is successful
    [Arguments]    ${LOGINPAGE}
    Location Should Be    ${LOGINPAGE}
I input wrong Credentials
    [Arguments]    ${WRONG_USERNAME}    ${WRONG_PASSWORD}
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${WRONG_USERNAME}
    Input Text    id=password    ${WRONG_PASSWORD}

I can see the expected error message
    [Arguments]    ${ERROR_MESSAGE}
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGE}

I input only Username
    [Arguments]    ${USERNAME}
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${USERNAME}

I input only Password
    [Arguments]    ${PASSWORD}
    Wait Until Element Is Visible    id=user-name
    Input Text    id=password    ${PASSWORD}

I input no Credentials
    Wait Until Element Is Visible    id=user-name