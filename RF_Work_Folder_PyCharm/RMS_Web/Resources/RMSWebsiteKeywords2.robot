*** Settings ***
Documentation  Adding the pre-build libraries

Resource   ./PageObjects/LoginPageNav.robot  #Access to LoginPageNav Library
Resource   ./PageObjects/Common.robot  #Access to Common Library
Resource   ./PageObjects/HomeScreenPageNav.robot  #Access to Common Library
Resource   ./PageObjects/VehicleDetailPageNav.robot
Resource   ./PageObjects/PopOver.robot
Resource   ./PageObjects/SettingsPageNav.robot
Resource   ./PageObjects/TelematicsPageNav.robot
Resource   ./PageObjects/CampaignPageNav.robot
Resource   ./PageObjects/CampaignZoneCreateEditNav.robot
Resource   ./PageObjects/NoResultFoundNav.robot
Resource   ./PageObjects/UserManagementPageNav.robot
Resource   ./PageObjects/NotificationPageNav.robot
Resource   ./PageObjects/AccountPreferencesNav.robot
Resource   ./PageObjects/ForgotPasswordUsernameNav.robot
Resource   ./PageObjects/AssignVehiclePageNav.robot
Resource   ./PageObjects/FMCHomeScreenPageNav.robot
Resource   ./PageObjects/Platecustomization.robot

*** Keywords ***
Navigate to Campaign Screen
    Common.Take 3 while
    CampaignPageNav.Click on Campaign
    CampaignPageNav.Campaign Assert

Navigate to FMC Campaign Screen
    Common.Take 3 while
    CampaignPageNav.Click on Campaign
    Common.Take 1 while
    #CampaignPageNav.Select FMC QA Company
    Sleep  1s

Search Campaign
    CampaignPageNav.Clear Campaign Search Text Box
    CampaignPageNav.Fill Campaign Search Text Box and Search

Delete a Campaign
    Common.Take 1 while
    CampaignPageNav.Click on the first Campaign and then Delete

Confirm Campaign Delete
    Common.Take 1 while
    CampaignPageNav.Confirm Campaign Delete

Delete Campaign From Table Assert
    Common.Take 3 while
    CampaignPageNav.Delete Campaign From Table Assert

Enter Manage Campaign Zones
    Common.Take 1 while
    SettingsPageNav.Click on Manage Campaign Zones
    Common.Take 1 while
    SettingsPageNav.Manage Campaign Zones Assert

Enter Manage Campaign Zones FMC
    Common.Take 1 while
    SettingsPageNav.Click on Manage Campaign Zones
    Common.Take 3 while

Manage Campaign Zones FMC Assert
    SettingsPageNav.Manage Campaign Zones Assert FMC

Select Any Zone
    [Arguments]    ${RMS.SelectCampaignZone}
    Common.Take 1 while
    SettingsPageNav.Click on Specified Zone  ${RMS.SelectCampaignZone}

Select Zone Assert
    Common.Take 1 while
    SettingsPageNav.Select Zone Assert

Deselect Selected Zone
    Common.Take 1 while
    SettingsPageNav.Click on First Selected Zone

Deselect Zone Assert
    Common.Take 1 while
    SettingsPageNav.Deselect Zone Assert

Hover Mouse Pointer On Any Zone
    Common.Take 1 while
    SettingsPageNav.Hover Mouse Pointer On Any Zone
    SettingsPageNav.Hover Mouse Pointer On Any Zone Assert

Click on Edit Campaign Zone Button
    Common.Take 1 while
    SettingsPageNav.Click on Edit Campaign Zone Button

Edit Campaign Zone Assert
    Common.Take 1 while
    SettingsPageNav.Edit Campaign Zone Assert

Select Delete Campaign Zone
    Common.Take 1 while
    SettingsPageNav.Select Delete Campaign Zone

Delete Campaign Zone Popup Assert
    Common.Take 1 while
    SettingsPageNav.Delete Campaign Zone Popup Assert

Confirm Delete Campaign Zone
    Common.Take 1 while
    SettingsPageNav.Confirm Delete Campaign Zone

Campaign Zone Deleted Confirmation Assert
    Common.Take 3 while
    SettingsPageNav.Campaign Zone Deleted Confirmation Assert

Background Screen Disable Assert
    Common.Take 1 while
    SettingsPageNav.Background Screen Disable Assert

Cancel Delete Campaign Zone Action
    Common.Take 1 while
    SettingsPageNav.Cancel Delete Campaign Zone Action

Cancel Delete Campaign Zone Assert
    Common.Take 1 while
    SettingsPageNav.Cancel Delete Campaign Zone Assert

Mouse Hover on Edit Tool Tip
    Common.Take 1 while
    CampaignZoneCreateEditNav.Mouse Hover on Edit Tool Tip
    Common.Take 3 while
    CampaignZoneCreateEditNav.Edit Tool Tip Popover Assert

Edit Campaign Zone Name
    [Arguments]    ${RMS.SelectCampaignZone}
    Common.Take 1 while
    CampaignZoneCreateEditNav.Edit Campaign Zone Name    ${RMS.SelectCampaignZone}

Save Edited Zone
    Common.Take 1 while
    CampaignZoneCreateEditNav.Save Edited Zone

Save Edited Zone Assert
    Common.Take 3 while
    CampaignZoneCreateEditNav.Save Edited Zone Assert

Hover Mouse Pointer On Edited Zone
    Common.Take 1 while
    CampaignZoneCreateEditNav.Hover Mouse Pointer On Edited Zone

Cancel Edited Zone
    Common.Take 1 while
    CampaignZoneCreateEditNav.Cancel Edited Zone

Cancel Edited Zone Assert
    Common.Take 3 while
    CampaignZoneCreateEditNav.Cancel Edited Zone Assert

Add Campaign
    CampaignPageNav.Click on Add Campaign

Check Campaign Name plus 10 Characters
   CampaignPageNav.Check Campaign Name with more than 10 characters

Click on Always
    CampaignPageNav.Check Selection

Deselect Always
    Common.Take 3 while
    CampaignPageNav.Uncheck Selection

Select All Groups and Zones
   CampaignPageNav.Select all group
   CampaignPageNav.Select all zone

Save Campaign
    [Arguments]    ${RMS.CampaignNameNew}
    CampaignPageNav.Set Campaign Name    ${RMS.CampaignNameNew}
    CampaignPageNav.Check Selection
    CampaignPageNav.Select all group
    CampaignPageNav.Select all zone
    CampaignPageNav.Save Campaign

Check Camapign Created Popup
    CampaignPageNav.Create Campign Assert

Click Group
    CampaignPageNav.Navigate to Group

Click Zone
    CampaignPageNav.Navigate to Zone

Discard Zone Pop Up
    CampaignPageNav.Click on Ok button

Discard Zone Pop Up by Clicking
    CampaignPageNav.Click anywhere except popup

Upload Message
   # CampaignPageNav.Click Upload Message
    CampaignPageNav.Select an Image
    CampaignPageNav.Image Assert

Save Message
    CampaignPageNav.Save the image

Cancel Message
    CampaignPageNav.Cancel the image

Save Campaign w/o
    [Arguments]    ${RMS.CampaignNameNew}
    CampaignPageNav.Set Campaign Name    ${RMS.CampaignNameNew}
    CampaignPageNav.Check Selection
    CampaignPageNav.Save Campaign

Search a Campaign
    [Arguments]    ${RMS.CampaignNameSearch}
    CampaignPageNav.Search for a Campaign   ${RMS.CampaignNameSearch}

Edit Campaign
    [Arguments]    ${RMS.CampaignNameSpecified}
    CampaignPageNav.Open Specified Campaign    ${RMS.CampaignNameSpecified}
    Common.Take 3 while

Click on Add New Campaign Zone
    Common.Take 1 while
    SettingsPageNav.Click on Add New Campaign Zone

Add Zone Page Assert
    Common.Take 3 while
    CampaignZoneCreateEditNav.Add Zone Page Assert

Enter Zone Name
    [Arguments]    ${RMS.ZoneName}
    Common.Take 1 while
    CampaignZoneCreateEditNav.Enter Zone Name   ${RMS.ZoneName}

Click on Zone Area
    Common.Take 1 while
    CampaignZoneCreateEditNav.Just Click on Zone Area

Enter Zone Area
    [Arguments]    ${RMS.ZoneAddress}
    Common.Take 1 while
    CampaignZoneCreateEditNav.Enter Zone Area   ${RMS.ZoneAddress}

Zone Name or Address Assert
    Common.Take 1 while
    CampaignZoneCreateEditNav.Zone Name or Address Assert

Cancel Add Zone
    Common.Take 3 while
    CampaignZoneCreateEditNav.Cancel Add Zone

Cancel Add Zone Assert
    Common.Take 3 while
    CampaignZoneCreateEditNav.Cancel Add Zone Assert

Campaign Detail Page Layout Assert
    Common.Take 3 while
    CampaignPageNav.Campaign Detail Page Layout Assert

Campaign Detail No Campaign Message
    Common.Take 3 while
    CampaignPageNav.No Campaign Message Layout Assert

Edit Campaign Name
    Common.Take 3 while
    CampaignPageNav.Edit Campaign Name

Upload New Message
    Common.Take 3 while
    CampaignPageNav.Upload New Message

Publish or Unpublished Message
    [Arguments]    ${RMS.PublishUnpublishMessage}
    Common.Take 3 while
    CampaignPageNav.Publish or Unpublished Message    ${RMS.PublishUnpublishMessage}

Message Published Assert
    Common.Take 3 while
    CampaignPageNav.Message Published Assert

Message UnPublished Assert
    Common.Take 3 while
    CampaignPageNav.Message UnPublished Assert

Delete Campaign From Campaign Detail
    Common.Take 3 while
    CampaignPageNav.Delete Campaign From Campaign Detail

Invalid Search Assert
    Common.Take 1 while
    NoResultFoundNav.Invalid Search Assert

Invalid Filtering Assert
    Common.Take 1 while
    NoResultFoundNav.Invalid Filter Assert

Delete Campaign Assert
    Common.Take 1 while
    CampaignPageNav.Delete Campaign Assert

Enter User Management Screen
    Common.Take 1 while
    SettingsPageNav.Enter User Management Screen

User Management Screen Assert
    Common.Take 3 while
    UserManagementPageNav.User Management Screen Assert

Click on Notifications icon
    Common.Take 3 while
    NotificationPageNav.Click on Notifications icon

Notification Screen Assert
    Common.Take 1 while
    NotificationPageNav.Notification Screen Assert

Enter Settings Page From User Management Top Nav
    Common.Take 3 while
    UserManagementPageNav.Enter Settings Page From User Management Top Nav

Enter Add User Screen
    Common.Take 1 while
    UserManagementPageNav.Enter Add User Screen

Add User Screen Assert
    Common.Take 1 while
    UserManagementPageNav.Add User Screen Assert

Enter Valid Email Address
    [Arguments]    ${RMS.ValidEmailAddress}
    Common.Take 1 while
    UserManagementPageNav.Enter Valid Email Address    ${RMS.ValidEmailAddress}

Enter Different Confirm Email Address
    [Arguments]    ${RMS.ConfirmEmailAddress}
    Common.Take 1 while
    UserManagementPageNav.Enter Different Confirm Email Address    ${RMS.ConfirmEmailAddress}

Fill Data in Add User Screen
    Common.Take 1 while
    UserManagementPageNav.Fill Data in Add User Screen

Send Invitation Button Activation Assert
    Common.Take 1 while
    UserManagementPageNav.Send Invitation Button Activation Assert

Send User Invite
    Common.Take 1 while
    UserManagementPageNav.Send User Invite

Invitation sent successfully Assert
    Common.Take 3 while
    Common.Take 3 while
    UserManagementPageNav.Invitation sent successfully Assert

Confirm User Invite
    Common.Take 1 while
    UserManagementPageNav.Confirm User Invite

Select and Delete Invited User
    Common.Take 3 while
    UserManagementPageNav.Select and Delete Invited User

Click on Security and Password
    SettingsPageNav.Enter Security and Password
    Sleep  2

Check Security and Password Assert
     SettingsPageNav.Security and Password Assert
     Sleep   1

Check Valid Old Password
     SettingsPageNav.Check for Valid Old password

Check InValid Old Password
    SettingsPageNav.Check for InValid Old password

Check Valid Password GT 8
    SettingsPageNav.Check Valid Password GT 8 Characters
    LoginPageNav.Check Link Back to Reviver Site
    LoginPageNav.Check Text Box for Email
    LoginPageNav.Check Text Box for Password
    LoginPageNav.Check Reviver Logo Image
    LoginPageNav.Check Sigin Link

Change the Password Back
    SettingsPageNav.Revert to old Password

Password does not match
    SettingsPageNav.Password not matching


Click on Account Preferences
    Common.Take 3 while
    SettingsPageNav.Click on Account Preferences

Account Preferences Assert
    Common.Take 1 while
    AccountPreferencesNav.Account Preferences Assert

Select Text Message Notification
    Common.Take 3 while
    AccountPreferencesNav.Select Text Message Notification
    Common.Take 3 while
    AccountPreferencesNav.Text Message Notification Assert

Select Email Notification
    Common.Take 3 while
    AccountPreferencesNav.Select Email Notification
    Common.Take 3 while
    AccountPreferencesNav.Email Notification Assert

Edit Contact Details
    Common.Take 3 while
    AccountPreferencesNav.Edit Contact Details

Edit Contact Details Assert
    Common.Take 1 while
    AccountPreferencesNav.Edit Contact Details Assert

Cancel Edit Contact Details Pop Up
    Common.Take 1 while
    AccountPreferencesNav.Cancel Edit Contact Details Pop Up

Edit and Save Phone Number
    Common.Take 1 while
    AccountPreferencesNav.Edit and Save Phone Number

Click on Forgot Password
    Common.Take 1 while
    ForgotPasswordUsernameNav.Click on Forgot Password

Forgot Password Screen Assert
    Common.Take 1 while
    ForgotPasswordUsernameNav.Forgot Password Screen Assert

Input Username To Get Password Reset link
    [Arguments]    ${RMS.Username}
    Common.Take 1 while
    ForgotPasswordUsernameNav.Input Username To Get Password Reset link   ${RMS.Username}

Click on Send Password Reset Link
    Common.Take 1 while
    ForgotPasswordUsernameNav.Click on Send Password Reset Link

Send Password Reset Link Screen Assert
    Common.Take 1 while
    ForgotPasswordUsernameNav.Send Password Reset Link Screen Assert

Click on Back to Signin Button
    Common.Take 1 while
    ForgotPasswordUsernameNav.Click on Back to Signin Button

Click on Forgot Username
    Common.Take 1 while
    ForgotPasswordUsernameNav.Click on Forgot Username

Forgot Username Screen Assert
    Common.Take 1 while
    ForgotPasswordUsernameNav.Forgot Username Screen Assert

Input Email/Phone To Get Password Reset link
    [Arguments]    ${RMS.EmaiOrPhone}
    Common.Take 1 while
    ForgotPasswordUsernameNav.Input Email/Phone To Get Username   ${RMS.EmaiOrPhone}

Click on Next Button
    Common.Take 1 while
    ForgotPasswordUsernameNav.Click on Next Button

Message With Username Sent Screen Assert
    Common.Take 1 while
    ForgotPasswordUsernameNav.Message With Username Sent Screen Assert

Open Sudha Vehicle Details
    Common.Take 1 while
    VehicleDetailPageNav.Open Sudha Vehicle Details

Click on View All
    Common.Take 3 while
    VehicleDetailPageNav.Click on View All

View All Comments Box Assert
    Common.Take 3 while
    VehicleDetailPageNav.View All Comments Box Assert

Edit and Save Comment
    Common.Take 3 while
    VehicleDetailPageNav.Edit and Save Comment

Delete Comment
    Common.Take 3 while
    VehicleDetailPageNav.Delete Comment

Click on Add Comment
    Common.Take 3 while
    VehicleDetailPageNav.Click on Add Comment

Add Comment Box Assert
    Common.Take 1 while
    VehicleDetailPageNav.Add Comment Box Assert

Input Comment into Add Comment Box
    [Arguments]    ${RMS.Comment}
    Common.Take 1 while
    VehicleDetailPageNav.Input Comment into Add Comment Box    ${RMS.Comment}

Save Entered Comment
    Common.Take 3 while
    VehicleDetailPageNav.Save Entered Comment

Saved Comment Assert
    Common.Take 3 while
    VehicleDetailPageNav.Saved Comment Assert

No Tick Button Assert
    Common.Take 1 while
    VehicleDetailPageNav.No Tick Button Assert

Cancel Entered Comment
    Common.Take 3 while
    VehicleDetailPageNav.Cancel Entered Comment

Cancelled Comment Assert
    Common.Take 1 while
    VehicleDetailPageNav.Cancelled Comment Assert

Check Bar of Vehicle with renewal Date Jan 01 1970
    Common.Take 3 while
    HomeScreenPageNav.Check Bar of Vehicle with renewal Date Jan 01 1970

Check Bar of Vehicle with renewal Date Apr 18 2019
    Common.Take 3 while
    HomeScreenPageNav.Check Bar of Vehicle with renewal Date Apr 18 2019

Current Page Number Highlighted Assert
    Common.Take 3 while
    HomeScreenPageNav.Current Page Number Highlighted Assert

Previous Greyed Out Assert
    Common.Take 3 while
    HomeScreenPageNav.Previous Greyed Out Assert

Click on 2nd Page
    Common.Take 3 while
    HomeScreenPageNav.Click on 2nd Page

Next Greyed Out Assert
    Common.Take 3 while
    HomeScreenPageNav.Next Greyed Out Assert

Click on Assign Vehicle
    Common.Take 1 while
    HomeScreenPageNav.Click on Assign Vehicle

Assign Vehicle Page Assert
    Common.Take 3 while
    AssignVehiclePageNav.Assign Vehicle Page Assert

Select My rPlate
    HomeScreenPageNav.Navigate to My rPlate

Open rPlate Details
    HomeScreenPageNav.Navigate to rPlate Details

Check rPlate Detail Page
    HomeScreenPageNav.rPlate Detail Assert

Check rPlate Default Image
    HomeScreenPageNav.rPlate Default Image

Navigate to rPlates Settings Page
    HomeScreenPageNav.Click on rplate Settings

Navigate to rPlates Settings Page for Deactivated Vehicle
    HomeScreenPageNav.Click on rplate Settings for deactivated Vehicle

Save Comments
    HomeScreenPageNav.Save a Comment

Cancel the Comments
    HomeScreenPageNav.Cancel a Comment

View All Comments
    HomeScreenPageNav.Navigate to View All Comments

Change Vehicle Name
    HomeScreenPageNav.Modify vehicle Name

Check Special Characters in Vehicle Name
    HomeScreenPageNav.Check Special Characters in Vehicle Name Error

Enter FMC Company
    SettingsPageNav.Navigate to FMC Company

Add New Group v0.2
    [Arguments]    ${RMS.GroupNameText}    ${RMS.GroupName}   ${RMS.VehicleCount}
    Common.Take 3 while
    SettingsPageNav.Click Add New Group
    Common.Take 3 while
    SettingsPageNav.Enter Group Name    ${RMS.GroupNameText}    ${RMS.GroupName}
    Run Keyword If   ${RMS.VehicleCount}==1   SettingsPageNav.Add Vehicle In Group
    SettingsPageNav.Click on Save
    Run Keyword If   ${RMS.VehicleCount}==1   SettingsPageNav.FMC Group Created Assert
    Run Keyword If   ${RMS.VehicleCount}==0   SettingsPageNav.Group With No Vehicles Assert

Add New Group with Special Characters
    [Arguments]    ${RMS.GroupNameText}    ${RMS.GroupName}
    Common.Take 3 while
    SettingsPageNav.Click Add New Group
    Common.Take 3 while
    SettingsPageNav.Enter Group Name    ${RMS.GroupNameText}    ${RMS.GroupName}
    Common.Take 1 while
    SettingsPageNav.Check Error for Special Characters

Assign Stolen Confirmation
    VehicleDetailPageNav.Navigate to Stolen Assert

Cancel Stolen Confirmation
    VehicleDetailPageNav.Navigate back to rPlate Settings


Assign REATTACHED Confirmation
    VehicleDetailPageNav.Navigate to REATTACHED Assert

Cancel REATTACHED Confirmation
    VehicleDetailPageNav.Navigate back to rPlate Settings

Add CG Cancel
    [Arguments]    ${RMS.GroupNameText}    ${RMS.GroupName}
    Common.Take 3 while
    SettingsPageNav.Click Add New Group
    Common.Take 3 while
    SettingsPageNav.Enter Group Name    ${RMS.GroupNameText}    ${RMS.GroupName}
    Common.Take 1 while
    SettingsPageNav.Click on Cancel
    SettingsPageNav.Cancel Group Assert   CheckSave

Enter Client Management Settings
    SettingsPageNav.Navigate to Client Management
    SettingsPageNav.Client Management Assert

Click on Add New Client
    SettingsPageNav.Navigate to Add New Client
    SettingsPageNav.Add New Client Layout Assert

Check Client Name Accepts AN Chars
    SettingsPageNav.Check AN Chars in Client Name

Check Client Name Accepts SP Chars
    SettingsPageNav.Check SP Chars in Client Name

Check Client Name Accepts Space
    SettingsPageNav.Check Space in Client Name

Check Client Name Invalid Email
    SettingsPageNav.Check Invalid Email in Client Name

Check Client Name Confirm Email
    SettingsPageNav.Check Confirm Email in Client Name

Check Send Invitation
    SettingsPageNav.Check Send Invitation for Client

Click on New Invite
    SettingsPageNav.Navigate to Add New Invite
    SettingsPageNav.Add New Invite Layout Assert

Check User Valid Email
    SettingsPageNav.Check valid Email in User

Check User Invalid Email
    SettingsPageNav.Check invalid Email in User

Check User Invalid Confirm Email
    SettingsPageNav.Check valid Email in User
    SettingsPageNav.Check invalid Confirm Email in User

Check User Phone Number SP
    SettingsPageNav.Check Phone Number SP in User

Click on Cancel User Invite Button
    SettingsPageNav.Check Cancel User Invite

Check FMC Dashboard
    FMCHomeScreenPageNav.FMC Dashboard Assert

Open Set Geofence Screen
    Common.Take 3 while
    VehicleDetailPageNav.Open Set Geofence Screen

Set Geofence Screen Assert
    VehicleDetailPageNav.Set Geofence Screen Assert

Click on Avatar
    Common.Take 3 while
    AccountPreferencesNav.Click on Avatar

Select Different Avatars
    Common.Take 3 while
    AccountPreferencesNav.Select Different Avatars

Change Avtar Popup Assert
    Common.Take 3 while
    AccountPreferencesNav.Change Avtar Popup Assert

Click on Plate Stolen and Choose Your Option
    [Arguments]    ${RMS.StolenStatus}
    Common.Take 1 while
    VehicleDetailPageNav.Click on Plate Stolen and Choose Your Option   ${RMS.StolenStatus}

rPlate Settings Assert
    Common.Take 1 while
    VehicleDetailPageNav.rPlate Settings Assert

Click on Dashboard Hyperlink
    Common.Take 1 while
    VehicleDetailPageNav.Click on Dashboard Hyperlink

rPlate Stolen Assert
    Common.Take 3 while
    VehicleDetailPageNav.rPlate Stolen Assert

Check FMC Dashboard for A rPlates and 0 Clients
    Common.Take 3 while
    HomeScreenPageNav.FMC Dashboard Assert for A rPlates and 0 Clients

Check FMC Telematics for 0 trips
    Common.Take 3 while
    TelematicsPageNav.FMC Telematics Assert for 0 trips

Check 1 Campaign for FMC and 0 for Client
    Common.Take 3 while
    CampaignPageNav.FMC Campaign Assert for 1-0 combination

Check 1 Campaign for FMC and 1 for Client
    Common.Take 3 while
    CampaignPageNav.FMC Campaign Assert for 1-1 combination

Check 1 Campaign Group for FMC and 1 for Client
    Common.Take 3 while
    SettingsPageNav.FMC Campaign Group Assert for 1-1 combination


Check 1 Campaign Zone for FMC and 0 for Client
    Common.Take 3 while
    SettingsPageNav.FMC Campaign Zone Assert for 1-0 combination

Check 1 Campaign Zone for FMC and 1 for Client
    Common.Take 3 while
    SettingsPageNav.FMC Campaign Zone Assert for 1-1 combination

No Zone Scenario SMB
    Common.Take 3 while
    SettingsPageNav.SMB Campaign Zone Assert for 0 Zones

No Group Scenario SMB
    Common.Take 3 while
    SettingsPageNav.SMB Campaign Group Assert for 0 Groups

0 Trips SMB Telematics
    Common.Take 3 while
    TelematicsPageNav.0 Trips Assert

Open Naman2 Vehicle Details
    Common.Take 1 while
    VehicleDetailPageNav.Open Naman2 Vehicle Details

Open Vehicle Details
    Common.Take 1 while
    VehicleDetailPageNav.Open Vehicle Details

Dealer Naman2 Vehicle Details Assert
    Common.Take 1 while
    VehicleDetailPageNav.Dealer Naman2 Vehicle Details Assert


Click on Transfer RPlate
    Common.Take 1 while
    VehicleDetailPageNav.Navigate to RPlate Transfer Page
    VehicleDetailPageNav.RPlate Transfer Page Assert

Cancel Transfer
    Common.Take 1 while
    VehicleDetailPageNav.Cancel the Trasnfer Process

Check Character Limit on FirstName
    Common.Take 1 while
    VehicleDetailPageNav.Character Restriction on First Name

Check Valid Email
    Common.Take 1 while
    VehicleDetailPageNav.Check Email validation


Fill Mandatory Field and Send Invitation on RPlate Transfer Page
    Common.Take 1 while
    VehicleDetailPageNav.Fill Mandatory Field on RPlate Transfer Page

Fill Mandatory Field with VIN Change and Send Invitation on RPlate Transfer Page
    Common.Take 1 while
    VehicleDetailPageNav.Fill Mandatory Field on RPlate Transfer Page VIN Change

Invitation Sent Assert
    Common.Take 1 while
    VehicleDetailPageNav.Check Invitation Sent Assert

Inviation Delete
    VehicleDetailPageNav.Delete Invite

Invitation Delete Cancel
    VehicleDetailPageNav.Delete Invitation Cancel

Resend Invitation to User
    VehicleDetailPageNav.Resend Invitation

VIN Mismatch
    Common.Take 3 while
    VehicleDetailPageNav.Check VIN Mismatch

Check Consumer Dashboard
    wait until page contains   Dashboard
    Page Should Contain   Dashboard
    Page Should Contain   1FVHCYDJ85HV14123
    Page Should Contain   DontDelete1

Navigate to Vehicle Detail Page
     VehicleDetailPageNav.Check Transfer button on Vehicle Details

Navigate to Dealer Settings
    SettingsPageNav.Move to Dealer Settings
    SettingsPageNav.Dealer Settings Assert

Navigate to Settings via breadcrumb
    SettingsPageNav.Click on Settings on Breadcrumb

Check Upload Layout
    SettingsPageNav.Click on Upload Dealer Image
    SettingsPageNav.Check asserts Upload Dealer Image

Upload Txt File
    SettingsPageNav.Upload Dealer Image TXT

Upload JPG File
    SettingsPageNav.Upload Dealer Image JPG

Navigate to Customize plate screen
     Platecustomization.Click Customize button

Customize RPlate assert
     Platecustomization.customize RPlate assert

Choose a snoopy logo
      Platecustomization.choose a snoopy logo

Click on cancel button
      Platecustomization.click on cancel button

Page should not contain snoopy logo assert
      Platecustomization.page should not contain snoopy logo assert

Click on publish button
      Platecustomization.click on publish button

Page should contain snoopy logo assert
       Platecustomization.page should contain snoopy logo assert

Choose a Hello banner
        Platecustomization.choose a Hello banner

Page should not contain Hello banner assert
      Platecustomization.Page should not contain Hello banner assert

Delete snoopy logo
       Platecustomization.delete snoopy logo

Delete a Hello banner
        Platecustomization.Delete a Hello banner

Page should contain Hello banner assert
      Platecustomization.Page should contain Hello banner assert

Navigate to Tele
      VehicleDetailPageNav.Click on View telematics