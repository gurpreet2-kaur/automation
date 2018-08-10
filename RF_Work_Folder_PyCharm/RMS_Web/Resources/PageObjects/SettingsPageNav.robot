*** Settings ***
Documentation  Adding the pre-build libraries
Library           Selenium2Library
Library           Collections
Library           Screenshot
#Library           ExtendedSelenium2Library
Library    String

*** Variables ***

${RMS.AddNewGroup}    id=addNew
${RMS.GroupNameText}    id=inputfield
${RMS.GroupNameSaveElement}    css=#addVehicleGroupModel > div > div > div > div.modal-footer > span > button.btn.save_button
${RMS.GroupNameSave}     xpath=//button[text()="Save"]
${RMS.GroupNameDisabledSave}   xpath=//button[text()="Save" and @disabled=""]
${RMS.GroupNameCancel}   id=cancel
${RMS.DashboardButton}   xpath=//*[@id="sidebar-wrapper"]/ul/li[2]/a
${RMS.SelectFirstGroup}   id=row0
${RMS.DeleteButton}   id=deleteActive
${RMS.DeleteNoButton}     id=no
${RMS.DeleteYesButton}   id=yes
${RMS.DeleteOKButton}    xpath=//button[text()="OK"]
${RMS.ManageCampaignZoneBox}    xpath=//h4[text()='Campaign Zones']
${RMS.ManageCampaignZoneTitle}    xpath=//p[text()='Manage Campaign Zones']
${RMS.NewCampaignZoneButton}    id=add
${RMS.DisabledDeleteCampaignZoneButton}    id=deleteDisabled
${RMS.EnabledDeleteCampaignZoneButton}    id=deleteActive
${RMS.FirstZoneBox}    id=rowclick0
${RMS.FirstZoneActive}   xpath=//div[2]/div[@class='row_body cursorPointer active']
${RMS.EditCampaignZoneButton}   id=editbtn0
${RMS.EditCampaignZoneTopHeading}   xpath=//span[text()="Settings "]/following-sibling::span[text()="Manage Campaign Zones "]/following-sibling::span[contains(text(),"Edit zone")]
${RMS.ConfirmDeleteCampaignButton}   xpath=//button[text()="Yes"]
${RMS.CancelDeleteCampaignButton}   xpath=//button[text()="No"]
${RMS.EditZoneTextbox}   id=edit_zone
${RMS.EditZoneAddress}   id=edit_zone_address
${RMS.UserManagementCard}   xpath=//h4[text()="User Management"]
${RMS.SecurityandPasswordBox}    xpath=//h4[text()='Security & Password']
${RMS.EnterOldPassword}    id=oldpassword
${RMS.EnterNewPassword}    id=newpassword
${RMS.ConfirmNewPassword}   id=confirmnewpassword
${RMS.CancelPassword}    id=cancel
${RMS.SavePassword}   id=save
${RMS.AccountPreferences}   xpath=//h4[text()="Account Preferences"]
${RMS.FMCCompanyGrid}   xpath=//*[contains(@src, 'my_company.svg')]     #xpath=//*[@id="myrPlates"]/div/div/div[2]/strong
${RMS.FMCClientCompanyGrid}  xpath=//*[@id="clientDetails"]/div[1]/div/div[2]/strong
${RMS.ClientManagementBox}    xpath=//h4[text()='Client Management']
${RMS.AddGroupVehicleList}    xpath=//button[@title="Nothing selected"]

${RMS.AddNewClientButton}    id=add
${RMS.ClientCompanyNameTextBox}  id=clientCompanyName
${RMS.ClientCompanyNameFirstName}  id=firstName
${RMS.ClientCompanyNamelastName}  id=lastName
${RMS.ClientCompanyNameEmail}  id=email
${RMS.ClientCompanyNameConfirmEmail}    id=cofirmEmail
${RMS.ClientCompanyNameCancelButton}   id=cancelBtn
${RMS.ClientCompanyNameSendInvi}   id=sendInvitationBtn
${RMS.AlertImage}    xpath=//img[contains(@src,"alert.svg")]
${RMS.ClientCompanyNamePhoneNumber}   id=phoneNumber

${RMS.AddNewUserButton}  id=invite
${RMS.NewUserFirstName}  id=firstName
${RMS.NewUserlastName}   id=lastName
${RMS.NewUserEmail}   id=email
${RMS.NewUserConfirmEmail}   id=cofirmEmail
${RMS.NewUserCancelButton}   id=cancelBtn
${RMS.NewUserSendInvi}   id=sendInvitationBtn
${RMS.NewUserPhoneNumber}  id=number
${RMS.FMCCampaignGroup1Trip}   xpath=//div[text()="FMC Company QA"]/parent::div/following-sibling::div/a[text()="Add Campaign Groups"]
${RMS.FMCClientCampaignGroup1Trip}  xpath=//div[text()="Sudhanshu Client Company 5"]/parent::div/following-sibling::div/a[text()="Add Campaign Groups"]

${RMS.FMCCampaignZone1Trip}   xpath=//div[text()="FMC Company QA"]/parent::div/following-sibling::div/span[text()="Add Campaign Zones"]
${RMS.FMCClientCampaignZone1Trip}  xpath=//div[text()="Sudhanshu Client Company 1"]/parent::div/following-sibling::div/span[text()="Add Campaign Zone"]
${RMS.FMCClientCampaignZone0Trip}  xpath=//div[text()="GurpreetKau"]/parent::div/following-sibling::div/a[text()="Add Campaign Zone"]

#Dealer
${RMS.DealerSettingsCard}   xpath=//h4[text()="Dealership Settings"]
${RMS.UploadDealerImage}    id=fileupload

${RMS.UploadDealerImage1}    id=imageinput
*** Keywords ***
Take 3 while
    Sleep  3s

Take 1 while
    Sleep  1

Click Add New Group
    Sleep  2
    wait until page contains element   ${RMS.AddNewGroup}
    Click Button   ${RMS.AddNewGroup}
    Sleep  3

Enter Group Name
    [Arguments]    ${RMS.GroupNameText}    ${RMS.GroupName}    ${RMS.VName}
    Clear Element Text    ${RMS.GroupNameText}
    Input Text   ${RMS.GroupNameText}    ${RMS.GroupName}
    Sleep  2s
    Click Button   xpath=//button[@data-id="vehicleGroups" and @title="Nothing selected"]
    Sleep  2s
    Input Text   //input[@type="text" and @placeholder="Search For Vehicles"]    ${RMS.VName}
    Sleep  1s
    Click Element  //a[@tabindex="0"]

Click on Save
    Sleep   3s
    Click Button    ${RMS.GroupNameSave}
    #Press Key     ${RMS.GroupNameSaveElement}
    Sleep  2s

Add Vehicle In Group
    Click Button    ${RMS.AddGroupVehicleList}
    Click Element   xpath=//li[@data-original-index='0']//a[@tabindex='0']

FMC Group Created Assert
    page should contain element   xpath=//div[text()="FMCGroup"]

Group With No Vehicles Assert
    page should contain   You must assign at least one vehicle to the vehicle group

Click on Cancel
    Sleep   3
    Click Button    ${RMS.GroupNameCancel}
    Sleep   2

New Group Assert
    [Arguments]     ${RMS.GroupName1}
    Sleep  3s
    Page Should Contain     ${RMS.GroupName1}

Cancel Group Assert
    [Arguments]     ${RMS.GroupName1}
    Page Should Not Contain     ${RMS.GroupName1}

Add New Group Popup Assert
    Page Should Contain   Create a New Vehicle Group
    Page Should Contain Element  ${RMS.GroupNameText}
    Page Should Contain Element   ${RMS.GroupNameCancel}
    page should contain element   ${RMS.GroupNameDisabledSave}

Select All Vehicles
    Sleep   2
    click element   xpath=//button[@data-id="vehicleGroups"]
    Input Text    css=#addVehicleGroupContainer > div > div.modal-body.modalBodyBgcolor.height468 > p > div > div > div > input     All
    Sleep  2s
    Click Element   xpath=//span[text()='All']
    Sleep  1s
    click element   xpath=//button[@data-id="vehicleGroups"]
    Sleep  2s

No Navigation to Dashboard
    Page Should Contain Element   //*[@id="addVehicleGroupModel"]  #Layover which block the navigation

No Navigation to Dashboard from Delete
    Page Should Contain Element   //*[@id="deleteVehicleGroupModal"]  #Layover which block the navigation

No Navigation to Dashboard from Delete Group Confirmation
    Page Should Contain Element       //*[@id="deleteVehicleGroupConfModal"]  #Layover which block the navigation

Select a Group
    wait until page contains element   ${RMS.SelectFirstGroup}
    Click Element    ${RMS.SelectFirstGroup}

Click Delete Vehicle Group
    click button   ${RMS.DeleteButton}
    Sleep   2
    Page Should Contain    Are you sure you want to delete following group(s)?
    Page Should Contain    Delete Vehicle Groups
    Page Should Contain    Vehicles and Rplates in above group(s) will not be deleted.
    Page Should Contain Element    ${RMS.DeleteNoButton}
    Page Should Contain Element    ${RMS.DeleteYesButton}
    Sleep   2

Click Delete Campaign Group
    click button   ${RMS.DeleteButton}
    Sleep   2
    Page Should Contain    Are you sure you want to delete following group(s)?
    Page Should Contain    Delete Vehicle Groups
    Page Should Contain    Vehicles and Rplates in above group(s) will not be deleted.
    Page Should Contain Element    ${RMS.DeleteNoButton}
    Page Should Contain Element    ${RMS.DeleteYesButton}
    Sleep   2

Cancel Delete Operation
    Click Button    ${RMS.DeleteNoButton}
    Page Should Contain    Manage Vehicle Groups

Delete Group
    Click Button   ${RMS.DeleteYesButton}
    Sleep  2s
    Page Should Contain    Group deleted successfully!
    Page Should Contain   Following group(s) is/are now deleted
    Page Should Contain Element    ${RMS.DeleteOKButton}

Click on Manage Campaign Zones
    click element   ${RMS.ManageCampaignZoneBox}

Manage Campaign Zones Assert
    Sleep  2s
    page should contain element   ${RMS.ManageCampaignZoneTitle}
    page should contain element   ${RMS.NewCampaignZoneButton}
    page should contain element   ${RMS.DisabledDeleteCampaignZoneButton}

Click on Specified Zone
    [Arguments]    ${RMS.SelectCampaignZone}
    click element   ${RMS.SelectCampaignZone}

Click on First Selected Zone
    click element   ${RMS.FirstZoneActive}

Select Zone Assert
    page should contain element   ${RMS.FirstZoneActive}
    page should contain element   ${RMS.EnabledDeleteCampaignZoneButton}
    page should not contain element   ${RMS.DisabledDeleteCampaignZoneButton}

Deselect Zone Assert
    page should contain element   ${RMS.FirstZoneBox}
    page should not contain element   ${RMS.FirstZoneActive}
    page should contain element   ${RMS.DisabledDeleteCampaignZoneButton}

Hover Mouse Pointer On Any Zone
    mouse over   ${RMS.FirstZoneBox}

Hover Mouse Pointer On Any Zone Assert
    page should contain button   ${RMS.EditCampaignZoneButton}
    page should contain element   ${RMS.ManageCampaignZoneTitle}
    page should contain element   ${RMS.NewCampaignZoneButton}
    page should contain element   ${RMS.DisabledDeleteCampaignZoneButton}

Click on Edit Campaign Zone Button
    click button   ${RMS.EditCampaignZoneButton}

Edit Campaign Zone Assert
    #page should contain element  ${RMS.EditCampaignZoneTopHeading}
    page should contain element  ${RMS.EditZoneTextbox}
    page should contain element  ${RMS.EditZoneAddress}

Select Delete Campaign Zone
    click button   ${RMS.EnabledDeleteCampaignZoneButton}

Delete Campaign Zone Popup Assert
    page should contain   Delete Campaign Zones
    page should contain   Are you sure you want to delete following zone(s)?
    page should contain   Campaign associated with zone(s) will not be deleted.
    page should contain   Campaigns with no alternate zone(s) will display everywhere
    page should contain button  ${RMS.ConfirmDeleteCampaignButton}
    page should contain button  ${RMS.CancelDeleteCampaignButton}

Confirm Delete Campaign Zone
    click button   ${RMS.ConfirmDeleteCampaignButton}

Campaign Zone Deleted Confirmation Assert
    page should contain   Following zone(s) is/are now deleted
    page should contain button  //button[text()="OK"]

Background Screen Disable Assert
    page should contain element   //div[@data-backdrop="false" and not(@tabindex="-1")]    #This xpath signifies that upon opening the delete campaign zone popup the background screen disables. Esc will also not work

Cancel Delete Campaign Zone Action
    Sleep   2
    click button   ${RMS.CancelDeleteCampaignButton}
    Sleep  2

Cancel Delete Campaign Zone Assert
    page should contain element   ${RMS.ManageCampaignZoneTitle}
    page should contain element   ${RMS.NewCampaignZoneButton}
    SettingsPageNav.Select Zone Assert
    page should not contain element   //div[@data-backdrop="false" and not(@tabindex="-1")]

Click on Add New Campaign Zone
    click element   id=add
Enter User Management Screen
    click element   ${RMS.UserManagementCard}


Enter Security and Password
    Click Element   ${RMS.SecurityandPasswordBox}

Security and Password Assert
    Page Should Contain Element   ${RMS.EnterOldPassword}
    Page Should Contain Element    ${RMS.EnterNewPassword}
    Page Should Contain Element    ${RMS.ConfirmNewPassword}
    Page Should Contain Element     ${RMS.SavePassword}
    Page Should Contain Element     ${RMS.CancelPassword}


Check for Valid Old password
    clear element text  ${RMS.EnterOldPassword}
    Sleep   1
    input text  ${RMS.EnterOldPassword}   ar1enT%
    Sleep  1
    Click Button  ${RMS.SavePassword}
    Sleep   2s
    Page Should Not Contain     Old Password has invalid format

Check for InValid Old password
    clear element text  ${RMS.EnterOldPassword}
    Sleep   1
    input text  ${RMS.EnterOldPassword}   Neelam@14
    Sleep  1
    input text  ${RMS.EnterNewPassword}   Neelam@1434
    sleep  1
    input text  ${RMS.ConfirmNewPassword}   Neelam@1434
    sleep  1
    Click Button  ${RMS.SavePassword}
    Sleep   2s
    Page Should Contain     Old password entered is not correct

Check Valid Password GT 8 Characters
    clear element text  ${RMS.EnterOldPassword}
    Sleep   1
    input text  ${RMS.EnterOldPassword}   ar1cenT%
    Sleep  1
    input text  ${RMS.EnterNewPassword}   ar1cenT%
    Sleep  1
    input text  ${RMS.ConfirmNewPassword}   ar1cenT%
    Sleep   1s
    Click Button  ${RMS.SavePassword}
    Sleep  2s
    Click Button   id=ok
    Sleep  2s


Revert to old Password
    clear element text  ${RMS.EnterOldPassword}
    Sleep   1
    input text  ${RMS.EnterOldPassword}   Neelam@1434
    Sleep  1
    input text  ${RMS.EnterNewPassword}   ar1enT%
    Sleep  1
    input text  ${RMS.ConfirmNewPassword}   ar1enT%
    Sleep   1s
    Click Button  ${RMS.SavePassword}
    Sleep  2s


Password not matching
    clear element text  ${RMS.EnterOldPassword}
    Sleep   1
    input text  ${RMS.EnterOldPassword}   Neelam@143
    Sleep  1
    input text  ${RMS.EnterNewPassword}   Neelam@143
    Sleep  1
    input text  ${RMS.ConfirmNewPassword}   Ncddlam@143
    Sleep   1s
    Click Button  ${RMS.SavePassword}
    Sleep  2s
    Page Should Contain     These passwords don't match. Try again.


Click on Account Preferences
    click element   ${RMS.AccountPreferences}

Navigate to FMC Company
    Sleep   1s
    Click Element   ${RMS.FMCCompanyGrid}
    Sleep   1s

Check Error for Special Characters
    Page Should Contain   Vehicle Group name cannot contain special characters


Navigate to Client Management
    Click Element   ${RMS.ClientManagementBox}
    Sleep  2s

Navigate to Add New Client
    Click Element   ${RMS.AddNewClientButton}
    Sleep  2s

Client Management Assert
    Page Should Contain Element  ${RMS.AddNewClientButton}
    Page Should Contain Element  ${RMS.AddNewUserButton}
    Page Should Contain   Client Company List

Add New Client Layout Assert
    Page Should Contain Element   ${RMS.ClientCompanyNameTextBox}
    Page Should Contain Element   ${RMS.ClientCompanyNameFirstName}
    Page Should Contain Element   ${RMS.ClientCompanyNamelastName}
    Page Should Contain Element   ${RMS.ClientCompanyNameEmail}
    Page Should Contain Element   ${RMS.ClientCompanyNameConfirmEmail}
    Page Should Contain Element   ${RMS.ClientCompanyNameCancelButton}
    Page Should Contain Element   ${RMS.ClientCompanyNameSendInvi}


Check AN Chars in Client Name
    Input Text   ${RMS.ClientCompanyNameTextBox}    ABCD
    Page Should Not Contain Element   ${RMS.AlertImage}

Check SP Chars in Client Name
    Input Text   ${RMS.ClientCompanyNameTextBox}    @#$%
    Sleep  1
    Page Should Contain Element   ${RMS.AlertImage}

Check Space in Client Name
    Input Text   ${RMS.ClientCompanyNameTextBox}    ${SPACE}jhasd
    Sleep  1
    Page Should Contain Element   ${RMS.AlertImage}

Check Invalid Email in Client Name
    Input Text   ${RMS.ClientCompanyNameEmail}    ${SPACE}jhasd
    Sleep  1
    Page Should Contain Element   ${RMS.AlertImage}

Check Confirm Email in Client Name
    Input Text   ${RMS.ClientCompanyNameEmail}    saksun2003@gmail.com
    Input Text   ${RMS.ClientCompanyNameConfirmEmail}    saksun2003@gmail.com
    Sleep  1
    Page Should Not Contain Element   ${RMS.AlertImage}


Check Send Invitation for Client
    ${ClientName} =  Generate Random String  8  	[LOWER]
    ${email} =   Generate Random String  4  [LOWER]
    ${domain} =  Generate Random String  4  [LOWER]
    ${country} =  Generate Random String   3  [LOWER]
    ${DomCount} =  Catenate   SEPARATOR=.  ${domain}   ${country}
    ${EMAIL} =  Catenate    SEPARATOR=@  ${email}   ${DomCount}
    Sleep   1
    Input Text    ${RMS.ClientCompanyNameTextBox}     ${ClientName}
    Input Text    ${RMS.ClientCompanyNameFirstName}   Automation
    Input Text    ${RMS.ClientCompanyNamelastName}      Company
    Input Text    ${RMS.ClientCompanyNameEmail}          ${EMAIL}
    Input Text    ${RMS.ClientCompanyNameConfirmEmail}   ${EMAIL}
    Input Text    ${RMS.ClientCompanyNamePhoneNumber}  9899878073
    Sleep  2s
    Click Element    ${RMS.ClientCompanyNameSendInvi}
    Sleep  2s
    Page Should Contain     Client added successfully !!
    Page Should Contain     Automation
    Page Should Contain     Company

Navigate to Add New Invite
    Click Element   ${RMS.AddNewUserButton}
    Sleep  2s

Add New Invite Layout Assert
    Page Should Contain Element   ${RMS.NewUserFirstName}
    Page Should Contain Element   ${RMS.NewUserlastName}
    Page Should Contain Element   ${RMS.NewUserEmail}
    Page Should Contain Element   ${RMS.NewUserConfirmEmail}
    Page Should Contain Element   ${RMS.NewUserCancelButton}
    Page Should Contain Element   ${RMS.NewUserSendInvi}

Check valid Email in User
    Input Text   ${RMS.NewUserEmail}    saksun2003@gmail.com
    Sleep  1s
    Page Should Not Contain Element   ${RMS.AlertImage}

Check invalid Email in User
    Input Text   ${RMS.NewUserEmail}    saksun2003gmail.com
    Sleep  1s
    Page Should Contain Element   ${RMS.AlertImage}


Check invalid Confirm Email in User
    Input Text   ${RMS.NewUserConfirmEmail}    saksun2003gmail.com
    Sleep  1s
    Page Should Contain Element   ${RMS.AlertImage}

Check Phone Number SP in User
    Input Text   ${RMS.NewUserPhoneNumber}   aja@@2
    Sleep  1s
    Page Should Contain Element   ${RMS.AlertImage}

Check Cancel User Invite
    Input Text   ${RMS.NewUserEmail}    saksun2003@gmail.com
    Input Text   ${RMS.NewUserFirstName}    Sudhanshu
    Input Text   ${RMS.NewUserlastName}    Wadhwa
    Input Text   ${RMS.NewUserConfirmEmail}    saksun2003@gmail.com
    Sleep  1s
    Click Element  ${RMS.NewUserCancelButton}
    Sleep  2s
    Page Should Contain  Client Company List

Manage Campaign Zones Assert FMC
    page should contain element   ${RMS.ManageCampaignZoneTitle}
    page should contain element   ${RMS.NewCampaignZoneButton}
    page should contain element   ${RMS.DisabledDeleteCampaignZoneButton}


FMC Campaign Group Assert for 1-1 combination
    Page Should not Contain Element      ${RMS.FMCClientCampaignGroup1Trip}
    Page Should not Contain Element      ${RMS.FMCCampaignGroup1Trip}


SettingsPageNav.FMC Campaign Zone Assert for 1-0 combination
    Page Should not Contain Element      ${RMS.FMCCampaignZone1Trip}
    input text    id=search    GurpreetKau
    Page Should Contain Element      ${RMS.FMCClientCampaignZone0Trip}

SettingsPageNav.FMC Campaign Zone Assert for 1-1 combination
    Page Should not Contain Element      ${RMS.FMCCampaignZone1Trip}
    Page Should not Contain Element      ${RMS.FMCClientCampaignZone1Trip}

SMB Campaign Zone Assert for 0 Zones
    Page Should Contain    No Campaign Zone Found
    Page Should Contain   Create Campaign Zone and try again
    Page Should Contain Element    xpath=//button[@class="btn buttonSecondaryGeneric genericSecondaryBtnColor"]

SMB Campaign Group Assert for 0 Groups
    Page Should Contain    No Vehicle Group Found
    Page Should Contain   Create Vehicle Group and try again
    Page Should Contain Element    id=addNew

Move to Dealer Settings
    Sleep  1s
    Click Element   ${RMS.DealerSettingsCard}
    Sleep  3s

Dealer Settings Assert
    Page Should Contain  Dealership Settings
    Page Should Contain  Default Dealer Image
    Page Should Contain  This image will be displayed across all Rplates with no assigned license plate number.
    Page Should Contain   Image Guidelines
    Page Should Contain Element   ${RMS.UploadDealerImage}

Upload Dealer Image TXT
    choose file  ${RMS.UploadDealerImage1}    /var/lib/jenkins/workspace/rms-web-staging-robot-qa-workspace/prerequisitescript/Dealer.txt
    sleep  3s
    Choose Ok On Next Confirmation
    sleep  3s
    Page Should Contain   File type txt is not supported. Please try again!


Click on Settings on Breadcrumb
    Click Element   id=navtosettings
    Sleep   2s

Click on Upload Dealer Image
    Click Element   ${RMS.UploadDealerImage}
    Sleep  2s

Check asserts Upload Dealer Image
    ${name}   Get Window Titles
    log list  ${name}

Upload Dealer Image JPG
    choose file  ${RMS.UploadDealerImage1}    /var/lib/jenkins/workspace/rms-web-staging-robot-qa-workspace/prerequisitescript/Dealer.jpg
    sleep  3s
    Choose Ok On Next Confirmation
    sleep  3s
    Page Should Contain   Upload Image
    Page Should Contain   Default Dealership Image
    Page Should Contain Element   id=save
    Page Should Contain Element  id=cancel