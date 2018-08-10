*** Settings ***
Documentation  Adding the pre-build libraries
Library           Selenium2Library
Library           Collections
Library           Screenshot

*** Variables ***

${RMS.ForgotPasswordLink}   id=forgotpwd
${RMS.UsernameBox}   id=username_fp
${RMS.DisabledPasswordResetButton}   xpath=//button[text()="Send Password Reset Link" and @disabled=""]
${RMS.EnabledPasswordResetButton}   xpath=//button[text()="Send Password Reset Link"]
${RMS.BackToSigninLink}   id=navtologin
${RMS.ForgotUsernameLink}   id=forgotpwd
${RMS.EmailPhoneBox}        id=username_fp
${RMS.DisabledNextButton}   xpath=//input[id="reset" and @disabled=""]
${RMS.EnabledNextButton}   id=reset
${RMS.OKButton}   xpath=//button[text()="OK"]

*** Keywords ***

Click on Forgot Password
    wait until page contains element    ${RMS.ForgotPasswordLink}
    click link   ${RMS.ForgotPasswordLink}
    Sleep   1s

Forgot Password Screen Assert
    page should contain   Having trouble signing in?
    page should contain element   //div[contains(text(),"Please provide additional information to aid in the recovery process")]
    page should contain   Enter email associated with your account
    page should contain element   ${RMS.UsernameBox}
    page should contain element   id=username_fp
    page should contain element   ${RMS.DisabledPasswordResetButton}
    page should contain element   ${RMS.BackToSigninLink}
    page should contain   Help

Input Username To Get Password Reset link
    [Arguments]    ${RMS.Username}
    input text   ${RMS.UsernameBox}   ${RMS.Username}
    sleep  1s
    page should contain element   ${RMS.EnabledPasswordResetButton}
    page should not contain element   ${RMS.DisabledPasswordResetButton}

Click on Send Password Reset Link
    click button   ${RMS.EnabledPasswordResetButton}

Send Password Reset Link Screen Assert
    Sleep  2s
    page should contain   The email address entered does not exist.
    #page should contain element   //div[contains(text(),"Please provide additional information to aid in the recovery process")]
    #page should contain element   //p[normalize-space()="ReviverAuto has sent a password reset link to the email address on file for your account"]
    #page should contain button   ${RMS.OKButton}
    #page should contain link   ${RMS.BackToSigninLink}
    #page should contain   Help

Click on Back to Signin Button
    click link   ${RMS.BackToSigninLink}

Click on Forgot Username
    click link   ${RMS.ForgotUsernameLink}
    Sleep  1s

Forgot Username Screen Assert
    Sleep   1s
    page should contain element   //div[contains(text(),"Please provide additional information to aid in the recovery process")]
    page should contain   Enter email associated with your account
    page should contain element   ${RMS.EmailPhoneBox}
    page should contain element   id=username_fp
    page should contain element   ${RMS.DisabledNextButton}
    page should contain element   ${RMS.BackToSigninLink}
    page should contain   Help

Input Email/Phone To Get Username
    [Arguments]    ${RMS.EmailOrPhone}
    input text   ${RMS.EmailPhoneBox}   ${RMS.EmailOrPhone}
    sleep  1s
    page should contain element   ${RMS.EnabledNextButton}
    page should not contain element   ${RMS.DisabledNextButton}

Click on Next Button
    click button   ${RMS.EnabledNextButton}

Message With Username Sent Screen Assert
    Sleep  2s
    page should contain   User with email absdvdvc@aaa.com not found.
    #page should contain element   //div[contains(text(),"Please provide additional information to aid in the recovery process")]
    #sleep  2s
    #page should contain element   //p[normalize-space()="ReviverAuto has sent an email with username to email address on file"]
    #page should contain element   ${RMS.OKButton}
    #page should contain link   ${RMS.BackToSigninLink}
    #page should contain   Help