*** Settings ***
Documentation  Adding the pre-build libraries
Library           Selenium2Library
Library           Collections
Library           Screenshot

*** Variables ***
${RMS.AddUserButton}   id=add
${RMS.AddUserTopHeading}   xpath=//span[contains(text(),"Settings ")]/following-sibling::span[contains(text(),"User Management")]
${RMS.TopSettingsNav}   id=navtosettings
${RMS.FirstNameTextBox}   xpath=//input[@placeholder="First"]
${RMS.LastNameTextBox}   xpath=//input[@placeholder="Last"]
${RMS.EmailTextBox}   xpath=//input[@formcontrolname="email"]
${RMS.ConfirmEmailTextBox}   xpath=//input[@formcontrolname="confirmEmail"]
${RMS.PhoneNumberTextBox}   xpath=//input[@formcontrolname="phoneNumber"]
${RMS.CancelButton}   xpath=//button[text()="Cancel"]
${RMS.DisabledSendInvitationButton}   xpath=//button[text()="Send Invitation" and @disabled=""]
${RMS.EnabledSendInvitationButton}   xpath=//button[text()="Send Invitation"]
${RMS.SendInviteOkButton}   xpath=//button[text()="OK"]
${RMS.SelectUserToDelete}   id=userclick1
${RMS.DeleteUserButton}   id=deleteActive
#Above specified DeleteUserButton is specific to user with first name as Automation.

*** Keywords ***
User Management Screen Assert
    page should contain   User Management
    page should contain   Name
    page should contain   Email Address
    page should contain   Phone Number
    page should contain   Status
    #page should contain element   ${RMS.AddUserTopHeading}
    page should contain element   ${RMS.AddUserButton}

Enter Settings Page From User Management Top Nav
    click element   ${RMS.TopSettingsNav}

Enter Add User Screen
    click element   ${RMS.AddUserButton}

Add User Screen Assert
    page should contain   Add New User
    page should contain element   //label[contains(text(),"Name")]
    page should contain element   ${RMS.FirstNameTextBox}
    page should contain element   ${RMS.LastNameTextBox}
    page should contain element   ${RMS.EmailTextBox}
    page should contain element   ${RMS.ConfirmEmailTextBox}
    page should contain element   ${RMS.PhoneNumberTextBox}
    page should contain element   ${RMS.CancelButton}
    page should contain element   ${RMS.DisabledSendInvitationButton}

Enter Valid Email Address
    [Arguments]    ${RMS.ValidEmailAddress}
    clear element text   ${RMS.EmailTextBox}
    input text   ${RMS.EmailTextBox}   ${RMS.ValidEmailAddress}
    sleep  2s
    page should not contain  Please enter valid email

Enter Different Confirm Email Address
    [Arguments]    ${RMS.ConfirmEmailAddress}
    clear element text   ${RMS.ConfirmEmailTextBox}
    input text   ${RMS.ConfirmEmailTextBox}   ${RMS.ConfirmEmailAddress}
    sleep  1s
    page should contain   Please make sure the email addresses match

Fill Data in Add User Screen
    ${email} =   Generate Random String  4  [LOWER]
    ${domain} =  Generate Random String  4  [LOWER]
    ${country} =  Generate Random String   3  [LOWER]
    ${DomCount} =  Catenate   SEPARATOR=.  ${domain}   ${country}
    ${EMAIL} =  Catenate    SEPARATOR=@  ${email}   ${DomCount}
    clear element text   ${RMS.FirstNameTextBox}
    input text   ${RMS.FirstNameTextBox}    Automation
    sleep  1s
    clear element text   ${RMS.LastNameTextBox}
    input text   ${RMS.LastNameTextBox}    Invite
    sleep  1s
    clear element text   ${RMS.EmailTextBox}
    input text   ${RMS.EmailTextBox}   ${EMAIL}
    sleep  1s
    clear element text   ${RMS.ConfirmEmailTextBox}
    input text   ${RMS.ConfirmEmailTextBox}   ${EMAIL}
    sleep  1s
    clear element text   ${RMS.PhoneNumberTextBox}
    input text   ${RMS.PhoneNumberTextBox}    5684298742

Send Invitation Button Activation Assert
    page should contain element   ${RMS.EnabledSendInvitationButton}
    page should not contain element   ${RMS.DisabledSendInvitationButton}

Send User Invite
    click button   ${RMS.EnabledSendInvitationButton}

Invitation sent successfully Assert
    page should contain   Invitation sent successfully !!
    page should contain   Invitation has been sent to the following user
    page should contain   Name
    page should contain   Email Address
    page should contain   Phone Number
    page should contain button   ${RMS.SendInviteOkButton}

Confirm User Invite
    click button    ${RMS.SendInviteOkButton}
    sleep  2s
    page should contain element   //td[contains(text(),"Automation")]

Select and Delete Invited User
    click element   ${RMS.SelectUserToDelete}
    sleep  2s
    click button   ${RMS.DeleteUserButton}
    sleep  2s
    click button   id=yes
    Sleep  2s
    page should contain   user(s) deleted successfully !!
    click button   //button[text()="OK"]
    sleep  3s
    page should not contain   test@testautomation.com