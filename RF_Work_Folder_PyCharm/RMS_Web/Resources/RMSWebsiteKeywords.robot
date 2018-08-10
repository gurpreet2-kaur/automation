*** Settings ***
Documentation  Adding the pre-build libraries

Resource   ./PageObjects/LoginPageNav.robot  #Access to LoginPageNav Library
Resource   ./PageObjects/Common.robot  #Access to Common Library
Resource   ./PageObjects/HomeScreenPageNav.robot  #Access to Common Library
Resource   ./PageObjects/VehicleDetailPageNav.robot
Resource   ./PageObjects/PopOver.robot
Resource   ./PageObjects/SettingsPageNav.robot
Resource   ./PageObjects/TelematicsPageNav.robot


*** Keywords ***

Make Selection
    HomeScreenPageNav.Make First Selection

Make Selection v0.2
    HomeScreenPageNav.Make First Selection v0.2


Make 2nd Selection
    HomeScreenPageNav.Make 2nd Selection

Make 2nd Selection v0.2
    HomeScreenPageNav.Make 2nd Selection v0.2

Launch the Browser
    Common.Load Browser
    Common.Take 1 while
    Common.Maximize the window
Login
    [Arguments]   ${UserData}
    LoginPageNav.Clear Email and Password Textbox
    LoginPageNav.Fill Email and Password Textbox   ${UserData}
    LoginPageNav.Click on SignIn Button

Login 2
    LoginPageNav.Clear Email and Password Textbox
    LoginPageNav.Fill Email and Password Textbox 2
    LoginPageNav.Click on SignIn Button

Login Invalid Password
    LoginPageNav.Clear Email and Password Textbox
    LoginPageNav.Fill Valid Email and Invalid Password Textbox
    LoginPageNav.Click on SignIn Button
    LoginPageNav.Check Error

Login Invalid Username
    LoginPageNav.Clear Email and Password Textbox
    LoginPageNav.Fill Invalid Email and Valid Password Textbox
    LoginPageNav.Click on SignIn Button
    LoginPageNav.Check Error

Navigate to List View
    HomeScreenPageNav.Select List View

Make Selection in List View
    HomeScreenPageNav.Select Vehicle Due Registartion ListView

Make Selection in Grid View
    HomeScreenPageNav.Select Vehicle Due Registartion GridView

Make 1rst Green Selection in List View
    HomeScreenPageNav.Select Vehicle in Green

Make 2nd Green Selection in List View
    HomeScreenPageNav.Select 2nd Vehicle in Green

Select Renew Registration in Action List
    HomeScreenPageNav.Select Action Button
    HomeScreenPageNav.Select RenewRegistation Dropdown List

Select Renew Registration in Action Grid
    HomeScreenPageNav.Select Action Button
    HomeScreenPageNav.Select RenewRegistation Dropdown Grid

Browser Back to Home Screen
    Common.Browser Back

##### Page Asserts
For Your Protection Page 1 Assert
    LoginPageNav.Check For Your Protection Screen Page 1


Dashboard Page Assert
    HomeScreenPageNav.Check Dashboard
    #HomeScreenPageNav.Check First Slide
    Common.Take 1 while

Login Page Assert
    LoginPageNav.Check Link Back to Reviver Site
    LoginPageNav.Check Text Box for Email
    LoginPageNav.Check Text Box for Password
    LoginPageNav.Check Reviver Logo Image
    LoginPageNav.Check Sigin Link
    #LoginPageNav.Check Create Reviver Account Link
    #LoginPageNav.Check Forgot Password Link
    Common.Take 1 while

Back to Reviver Site
    LoginPageNav.Navigate Back to Reviver Site

Check in Search Box
    Sleep  2
    HomeScreenPageNav.Check Search Box

Type in Search box
    [Arguments]    ${RMS.SearchElement}    ${RMS.SearchText}
    HomeScreenPageNav.Type in the Search Box     ${RMS.SearchElement}     ${RMS.SearchText}
    Sleep   2

Searched Assert
    [Arguments]    ${RMS.SearchResult1}    ${RMS.SearchResult2}
    HomeScreenPageNav.Search Results Assert      ${RMS.SearchResult1}    ${RMS.SearchResult2}

Action Button Assert
    HomeScreenPageNav.Select Action Button
    HomeScreenPageNav.Check Action Button

Action Button Assert v0.2
    HomeScreenPageNav.Select Action Button    #Assert included for enabled Action button
    HomeScreenPageNav.Check Action Button v0.2

Open Change Vehicle Groups Layover
    HomeScreenPageNav.Select Action Button
    HomeScreenPageNav.Select Change Vehicle Groups Dropdown List

Cancel Change Vehicle Groups Layover
    HomeScreenPageNav.Cancel Change Vehicle

Grid View Button Assert
    HomeScreenPageNav.Check Grid View Is Selected

List View Button Assert
    HomeScreenPageNav.Check List View Is Selected

Launch and Closed Filter Layout
    Common.Take 3 while
    HomeScreenPageNav.Launch Filter
    Common.Take 1 while
    HomeScreenPageNav.Cancel Filter

Launch Filter Select and Apply 1
    Common.Take 1 while
    HomeScreenPageNav.Launch Filter
    Common.Take 1 while
    HomeScreenPageNav.Select the filter - wired
    Common.Take 1 while
    HomeScreenPageNav.Apply Filter

Launch Filter Select and Apply 2
    Common.Take 1 while
    HomeScreenPageNav.Launch Filter
    Common.Take 1 while
    HomeScreenPageNav.Select the filter - nonwired
    Common.Take 1 while
    HomeScreenPageNav.Apply Filter

Launch Filter Select and Apply 3
    Common.Take 1 while
    HomeScreenPageNav.Launch Filter
    Common.Take 1 while
    HomeScreenPageNav.Select the filter - activated
    Common.Take 1 while
    HomeScreenPageNav.Apply Filter

Launch Filter and click Reset Filters
    Common.Take 1 while
    HomeScreenPageNav.Launch Filter
    Common.Take 1 while
    HomeScreenPageNav.Reset Filter

Select Filter Plate Model - rPlatePro
    Common.Take 1 while
    HomeScreenPageNav.Select Filter Plate Model - rPlatePro

Select Filter Plate Model rPlatePro Assert
    Common.Take 1 while
    HomeScreenPageNav.Select Filter Plate Model rPlatePro Assert

Select Filter Body Type - SUV
    Common.Take 1 while
    HomeScreenPageNav.Select Filter Body Type - SUV

Select Filter Plate Status - Activated
    Common.Take 1 while
    HomeScreenPageNav.Select Filter Plate Status - Activated

Select Filter Plate Status - Pre Register
    Common.Take 1 while
    HomeScreenPageNav.Select Filter Plate Status - Pre Register

Select Filter Plate Status - DeActivated
    Common.Take 1 while
    HomeScreenPageNav.Select Filter Plate Status - DeActivated

Select Filter Plate Status Activated Assert
    Common.Take 1 while
    HomeScreenPageNav.Select Filter Plate Status Activated Assert

Select Filter Plate Status DeActivated Assert
    Common.Take 1 while
    HomeScreenPageNav.Select Filter Plate Status DeActivated Assert

Apply Filter
    Common.Take 1 while
    HomeScreenPageNav.Click on Apply Filter

Filter Plate Model Assert-rPlatePro
    Common.Take 1 while
    HomeScreenPageNav.Filter Plate Model Assert-rPlatePro

Filter Body Type Assert-SUV
    Common.Take 1 while
    HomeScreenPageNav.Filter Body Type Assert-SUV

Filter Plate Status Assert-Activated
    Common.Take 1 while
    HomeScreenPageNav.Filter Plate Status Assert-Activated

Filter Plate Status Assert-DeActivated
    Common.Take 1 while
    HomeScreenPageNav.Filter Plate Status Assert-DeActivated

Filter Plate Status Assert-DeActivated v0.2
    Common.Take 1 while
    HomeScreenPageNav.Filter Plate Status Assert-DeActivated v0.2

Select Filter State - CA
    Common.Take 1 while
    HomeScreenPageNav.Select Filter State - CA

Filter State Assert-CA
    Common.Take 1 while
    HomeScreenPageNav.Filter State Assert-CA

Filtered Screen Layout Assert
    Common.Take 3 while
    HomeScreenPageNav.Filtered Screen Layout Assert

Filtered Screen Assert Preregistered
    Common.Take 3 while
    HomeScreenPageNav.Filtered Screen Layout Assert Preregistered

Select Filter Year - 2017
    Common.Take 1 while
    HomeScreenPageNav.Select Filter Year - 2017

Filter Year Assert-2017
    Common.Take 1 while
    HomeScreenPageNav.Filter Year Assert-2017

Change Vehicle Layover Assert
    PopOver.Change Vehicle Assert

Open Vehicle Details
    Common.Take 1 while
    HomeScreenPageNav.Open Vehicle Details

Enter Settings Page
    Common.Take 3 while
    HomeScreenPageNav.Enter Settings Page

Settings Page Assert
    Common.Take 1 while
    HomeScreenPageNav.Settings Page Assert

Settings Page Assert V0.2
    Common.Take 3 while
    HomeScreenPageNav.Settings Page Assert V0.2

Settings Page Assert FMC
    Common.Take 1 while
    HomeScreenPageNav.Settings Page Assert FMC

Enter Dashboard
    Common.Take 1 while
    HomeScreenPageNav.Enter Dashboard

Enter Vehicle Groups Settings
    Common.Take 1 while
    HomeScreenPageNav.Enter Vehicle Groups Settings

Enter Campaign Groups Settings
    Common.Take 1 while
    HomeScreenPageNav.Enter Campaign Groups Settings

Manage Campaign Groups Assert
    Common.Take 1 while
    HomeScreenPageNav.Manage Campaign Groups Assert

Manage Vehicle Groups Assert
    Common.Take 1 while
    HomeScreenPageNav.Manage Vehicle Groups Assert

Manage Vehicle Groups Layout Assert
    Common.Take 1 while
    HomeScreenPageNav.Manage Vehicle Groups Layout Assert

Manage Campaign Groups Layout Assert
    Common.Take 1 while
    HomeScreenPageNav.Manage Campaign Groups Layout Assert Indepth

Logout
    Common.Take 1 while
    HomeScreenPageNav.Logout
    Common.Take 3 while

Click Edit Group Button
    Common.Take 1 while
    HomeScreenPageNav.Click Edit Group Button

Clear And Enter New Group Name
    Common.Take 1 while
    HomeScreenPageNav.Clear And Enter New Group Name

Click on Check
    Common.Take 1 while
    HomeScreenPageNav.Click on Check

Edit Group Name Assert
    Common.Take 3 while
    HomeScreenPageNav.Edit Group Name Assert

Get First group Name
    Common.Take 1 while
    HomeScreenPageNav.Get First group Name

Edit Group Logout Assert
    Common.Take 1 while
    HomeScreenPageNav.Edit Group Logout Assert

Add New Group
    [Arguments]    ${RMS.GroupNameText}    ${RMS.GroupName}    ${RMS.VName}
    Common.Take 3 while
    SettingsPageNav.Click Add New Group
    Common.Take 3 while
    SettingsPageNav.Enter Group Name    ${RMS.GroupNameText}    ${RMS.GroupName}    ${RMS.VName}
    SettingsPageNav.Click on Save
    #HomeScreenPageNav.Enter Dashboard
    #HomeScreenPageNav.Enter Settings Page
    #HomeScreenPageNav.Enter Campaign Groups Settings
    SettingsPageNav.New Group Assert   ${RMS.GroupName}

Add New Group Assert
    Common.Take 1 while
    SettingsPageNav.Click Add New Group
    SettingsPageNav.Add New Group Popup Assert

Cancel Add New Group
    [Arguments]    ${RMS.GroupNameText}    ${RMS.GroupName}    ${RMS.VName}
    Common.Take 1 while
    SettingsPageNav.Click Add New Group
    SettingsPageNav.Enter Group Name    ${RMS.GroupNameText}    ${RMS.GroupName}    ${RMS.VName}
    SettingsPageNav.Click on Cancel
    SettingsPageNav.Cancel Group Assert   ${RMS.GroupName}

Select All in Add New Group
    [Arguments]    ${RMS.GroupNameText}    ${RMS.GroupName}
    Common.Take 1 while
    SettingsPageNav.Click Add New Group
    SettingsPageNav.Enter Group Name    ${RMS.GroupNameText}    ${RMS.GroupName}
    SettingsPageNav.Select All Vehicles
    SettingsPageNav.Click on Save
    #HomeScreenPageNav.Enter Dashboard
    #HomeScreenPageNav.Enter Settings Page
    #HomeScreenPageNav.Enter Campaign Groups Settings
    SettingsPageNav.New Group Assert   ${RMS.GroupName}

Navigate to New Vehicle Group
    Common.Take 1 while
    SettingsPageNav.Click Add New Group
    SettingsPageNav.No Navigation to Dashboard

Select First Group
    SettingsPageNav.Select a Group

Click on Delete Vehicle Group
    Common.Take 1 while
    SettingsPageNav.Click Delete Vehicle Group   #Assert included
    SettingsPageNav.No Navigation to Dashboard from Delete

Click on Delete Campaign Group
    Common.Take 1 while
    SettingsPageNav.Click Delete Campaign Group   #Assert included
    SettingsPageNav.No Navigation to Dashboard from Delete


Cancel Delete
    Common.Take 1 while
    SettingsPageNav.Cancel Delete Operation

Delete the Group
    Common.Take 1 while
    SettingsPageNav.Delete Group

Delete Group Dashboard Navigation
    Common.Take 1 while
    SettingsPageNav.No Navigation to Dashboard from Delete Group Confirmation

Check Vehicle Detail Page
    Common.Take 1 while
    VehicleDetailPageNav.Vehicle Detail Assert

Edit Vehicle Name
    [Arguments]    ${RMS.VehicleNameEdit}
    Common.Take 1 while
    VehicleDetailPageNav.Click on Edit Vehicle Icon
    VehicleDetailPageNav.Type new Vehicle Icon Name   ${RMS.VehicleNameEdit}

Cancel Operation on Vehicle Detail
    VehicleDetailPageNav.Click on Cancel Button on Vehicle Detail
    VehicleDetailPageNav.Cancel Vehicle Name Edit Assert

Add and Save comment
    [Arguments]    ${RMS.Comment}
    Common.Take 3 while
    VehicleDetailPageNav.Add Comment    ${RMS.Comment}
    Common.Take 1 while
    VehicleDetailPageNav.Save Comment    ${RMS.Comment}

Check Telematics Icon of Left Nav
    TelematicsPageNav.Telematics Left Nav Assert

Navigate to Telematics Screen
    TelematicsPageNav.Click on Telematics
    #TelematicsPageNav.Telematics Assert

Input Text and Search Telematics
    TelematicsPageNav.Enter Text in Telematics Search Field

Input Text and Search Telematics - Negative
    TelematicsPageNav.Enter Text in Telematics Search Field - Negative

Navigate to Vehicle Trips
    TelematicsPageNav.Goto Vehicle Trip Detail Page

Check the list of trips
    TelematicsPageNav.List of Trips for a vehicle

Map Minimize
    TelematicsPageNav.Click on Minimize Icon

Timing Address and Date Assert
    TelematicsPageNav.Check Timing Address and Date


