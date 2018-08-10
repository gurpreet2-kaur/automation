*** Settings ***
Documentation  Adding the pre-build libraries
Library           Selenium2Library
Library           Collections
Library           Screenshot

*** Variables ***
${RMS.Email_Xpath}    xpath=//*[@id="e-mail"]    # Email Xpath
${RMS.Password_Xpath}    xpath=//*[@id="password"]    # Password Xpath
${RMS.SignIn_Button}    xpath=//button[text()="Sign In"]    # SignIn Button xpath
${RMS.Link_Back_to_Reviver}   id=backlink

${RMS.Reviver_Logo}    xpath=//img[contains(@src, 'rconnect-logo.png')]
${RMS.Create_Reviver_Account_Link}    Create ReviverAuto Account
${RMS.Reviver_Teaser_Logo}   xpath=//img[contains(@src, 'REVIVER_logo_PRIMARY_REVERSED_CROPPED.png')]
${RMS.Email}  saksun2003@gmail.com
${RMS.Forurprotection1}   We don't recognize the computer you are using.
${RMS.Forurprotection1Cancel}      css=#cancel_nc
${RMS.Forurprotection1Next}    css=#next_nc
${RMS.LoginError}             Incorrect Username or Password.


*** Keywords ***
Clear Email and Password Textbox
    Clear Element Text    ${RMS.Email_Xpath}
    Clear Element Text    ${RMS.Password_Xpath}

Fill Email and Password Textbox
    [Arguments]      ${UserData}


    Input Text    ${RMS.Email_Xpath}         ${UserData.Username}
    Sleep  1s
    Input Text    ${RMS.Password_Xpath}        ${UserData.Password}        #Neelam@143
    Sleep  1s

Fill Email and Password Textbox 2
    Input Text    ${RMS.Email_Xpath}         automationreviver@gmail.com
    Sleep  1s
    Input Text    ${RMS.Password_Xpath}        ar1cenT%        #Neelam@143
    Sleep  1s

Fill Valid Email and Invalid Password Textbox
    Input Text    ${RMS.Email_Xpath}    automationreviver@gmail.com
    Sleep  1s
    Input Text    ${RMS.Password_Xpath}    Neelam@14
    Sleep  1s

Fill Invalid Email and Valid Password Textbox
    Input Text    ${RMS.Email_Xpath}    automation_q
    Sleep  1s
    Input Text    ${RMS.Password_Xpath}    ar1cenT%
    Sleep  1s

Check Error
    Page Should Contain    ${RMS.LoginError}

Click on SignIn Button
    Click Element    ${RMS.SignIn_Button}
    Sleep   5s

Check Link Back to Reviver Site
    Page Should Contain Link   ${RMS.Link_Back_to_Reviver}

Check Text Box for Email
    Page Should Contain Element   ${RMS.Email_Xpath}

Check Text Box for Password
    Page Should Contain Element   ${RMS.Password_Xpath}

Check Reviver Logo Image
    Page Should Contain Image       ${RMS.Reviver_Logo}


Check Sigin Link
    Page Should Contain Element    ${RMS.SignIn_Button}

Check Create Reviver Account Link
    Page Should Contain Link    ${RMS.Create_Reviver_Account_Link}

Navigate Back to Reviver Site
    Click Element  ${RMS.Link_Back_to_Reviver}
    Sleep   15
    Page Should Contain Image  ${RMS.Reviver_Teaser_Logo}
    Location Should Be   https://www.reviverauto.com/

Check For Your Protection Screen Page 1
    Page Should Contain   ${RMS.Forurprotection1}
    Page Should Contain Element    ${RMS.Forurprotection1Cancel}
    Page Should Contain Element    ${RMS.Forurprotection1Next}