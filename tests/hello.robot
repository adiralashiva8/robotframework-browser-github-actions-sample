*** Settings ***
Library     Browser    strict=${False}


*** Variables ***
${USER_NAME_TEXTBOX}    id=user-name
${PASSWORD_TEXTBOX}    id=password
${LOGIN_BUTTON}    id=login-button
${INVENTORY_ITEMS}    xpath=//div[@class="inventory_item"]


*** Test Cases ***
Simple Swag Labs Login Test
    Launch Swag Labs Login Page
    Login To Swag Labs    standard_user    secret_sauce
    Swag Labs Landing Page Should Be Loaded


*** Keywords ***
Launch Swag Labs Login Page
    New Browser    headless=${False}    channel=chrome
    New Context
    New Page    https://www.saucedemo.com/v1/    networkidle

Login To Swag Labs
    [Arguments]    ${uname}    ${pwd}
    Fill Text    ${USER_NAME_TEXTBOX}    ${uname}
    Fill Text    ${PASSWORD_TEXTBOX}    ${pwd}
    Click    ${LOGIN_BUTTON}

Swag Labs Landing Page Should Be Loaded
    Wait For Load State    networkidle
    Wait For Elements State    ${INVENTORY_ITEMS}    visible
    Get Url    contains    inventory
