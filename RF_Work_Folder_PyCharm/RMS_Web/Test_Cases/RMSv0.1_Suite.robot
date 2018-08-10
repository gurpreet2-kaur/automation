*** Settings ***
Documentation  Adding Resources
Resource   ../Resources/RMSWebsiteKeywords.robot  #necessary for lower level keywords
Resource   ../Resources/RMSWebsiteKeywords2.robot
Resource   ../Resources/PageObjects/Common.robot   #Access to Common Library

#D:/Git_Repo/qa/RF_Work_Folder_PyCharm/Project_1
Suite Setup  Inserting Test Data
Test Setup  Launch the Browser
Test Teardown   Close the browser
Suite Teardown   Cleanup Test Data

*** Test Cases ***
#########################  Login Screen#####################
RMS - C669
    [Documentation]   Verify the layout of the Login Screen
    [Tags]  CID:669
    RMSWebsiteKeywords.Login Page Assert
    Common.Take the Screenshot  CID-669

RMS - C670
    [Documentation]  Verify User is able to login with Valid Credentials
    [Tags]  CID:670
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Dashboard Page Assert
    #RMSWebsiteKeywords.For Your Protection Page 1 Assert
    Common.Take the Screenshot  CID-670

RMS - C671
    [Documentation]  Verify User gets an error message while trying to Sign In with Invalid Password
    [Tags]  CID:671
    RMSWebsiteKeywords.Login Invalid Password
    Common.Take the Screenshot  CID-671

RMS - C672
    [Documentation]  Verify User gets an error message while trying to Sign In with Invalid Username
    [Tags]  CID:672
    RMSWebsiteKeywords.Login Invalid Username
    Common.Take the Screenshot  CID-672

RMS - C673
    [Documentation]  Verify the functionality of "Back to Reviver Site Page"
    [Tags]  CID:673
    RMSWebsiteKeywords.Back to Reviver Site
    Common.Take the Screenshot  CID-673

######  Home Screen List ##############################################################

RMS - C674
    [Documentation]  Verify Favicon should be visible at all times on the screen
    [Tags]  CID:674
    Common.Check Favicon
    Common.Take the Screenshot  CID-674

RMS - C571
    [Documentation]  Verify the layout of the Dashboard Screen
    [Tags]  CID:571
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-571

RMS - C572
    [Documentation]   Verify the functionality of the Image Carousel
    [Tags]   CID:572
    RMSWebsiteKeywords.Login
    Common.Check Caraousel
    Common.Take the Screenshot  CID-572

RMS - C578
    [Documentation]  Verify the Selection of the Vehicle
    [Tags]  CID:578
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Make Selection
    Common.Take the Screenshot  CID-578

RMS - C579
    [Documentation]  Verify layout of the search box
    [Tags]  CID:579
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Check in Search Box
    Common.Take the Screenshot  CID-579

RMS - C580
    [Documentation]  Verify Search functionality by Vehicle Name
    [Tags]  CID:580
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     SudhansAu
    RMSWebsiteKeywords.Searched Assert    SudhansAu     22222222222222222
    Common.Take the Screenshot  CID-580

RMS - C581
    [Documentation]  Verify Search functionality by VIN
    [Tags]  CID:581
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     22222222222222222
    RMSWebsiteKeywords.Searched Assert    SudhansAu   22222222222222222
    Common.Take the Screenshot  CID-581

RMS - C583
    [Documentation]  	Verify the functionality of the green color bar vehicle
    [Tags]  CID:583
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Make 1rst Green Selection in List View
    Common.Take the Screenshot  CID-583


############    Home Screen List Action list #########################################################

RMS - C577
    [Documentation]  Verify Action Button Layout
    [Tags]  CID:577
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Make Selection
    RMSWebsiteKeywords.Action Button Assert
    Common.Take the Screenshot  CID-577

RMS - C675
    [Documentation]  	Verify Action Button Enables with multiple Selection
    [Tags]  CID:675
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Make Selection
    RMSWebsiteKeywords.Make 2nd Selection
    RMSWebsiteKeywords.Action Button Assert
    Common.Take the Screenshot  CID-675

RMS - C676
    [Documentation]  Verify User see Change Vehicle Group in Action dropdown
    [Tags]  CID:676
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Make Selection
    RMSWebsiteKeywords.Action Button Assert
    Common.Take the Screenshot  CID-676

############   Home Screen List Action Change Vehicle Group #########################################

RMS - C677
    [Documentation]   Verify the functionality of Cancel button for single vehicle
    [Tags]   CID:677
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Make Selection
    RMSWebsiteKeywords.Open Change Vehicle Groups Layover
    RMSWebsiteKeywords.Cancel Change Vehicle Groups Layover
    Common.Take the Screenshot  CID-677

RMS - C679
    [Documentation]   Verify the layout of the Change vehicle group popover
    [Tags]   CID:679
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Make Selection
    RMSWebsiteKeywords.Open Change Vehicle Groups Layover
    RMSWebsiteKeywords.Change Vehicle Layover Assert
    Common.Take the Screenshot  CID-679

RMS - C680
    [Documentation]   Verify User is navigated to Change vehicle group popover
    [Tags]   CID:680
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Make Selection
    RMSWebsiteKeywords.Open Change Vehicle Groups Layover
    RMSWebsiteKeywords.Change Vehicle Layover Assert
    Common.Take the Screenshot  CID-680

### Filter #########################################################################

RMS - C573
    [Documentation]   Verify the "Cancel" Button Functionality on Filter Layover
    [Tags]   CID:573
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Launch and Closed Filter Layout
    Common.Take the Screenshot  CID-573

RMS - C574
    [Documentation]   Verify Selection while Filtering by Plate Model
    [Tags]   CID:574
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter Plate Model - rPlatePro
    RMSWebsiteKeywords.Select Filter Plate Model rPlatePro Assert
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords.Filter Plate Model Assert-rPlatePro

RMS - C575
    [Documentation]   Verify Selection while Filtering by Body Type
    [Tags]   CID:575
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter Body Type - SUV
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords.Filter Body Type Assert-SUV

RMS - C576
    [Documentation]   Verify Selection while Filtering by "RPlate Status" - "Activated" Only
    [Tags]   CID:576
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter Plate Status - Activated
    RMSWebsiteKeywords.Select Filter Plate Status Activated Assert
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords.Filter Plate Status Assert-Activated

RMS - C681
    [Documentation]   Verify Selection while Filtering by Specific "State" Only
    [Tags]   CID:681
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter State - CA
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords.Filter State Assert-CA

RMS - C683
    [Documentation]   Verify the layout of the Filter Selection Screen
    [Tags]   CID:683
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter State - CA
    RMSWebsiteKeywords.Select Filter Plate Status - Activated
    RMSWebsiteKeywords.Select Filter Body Type - SUV
    RMSWebsiteKeywords.Select Filter Plate Model - rPlatePro
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords.Filtered Screen Layout Assert

RMS - C684
    [Documentation]   Verify the filter functionality with multiple "Year"
    [Tags]   CID:684
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter Year - 2016
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords.Filter Year Assert-2016

RMS - C686
    [Documentation]   Verify Selection while Filtering by "RPlate Status" - "De-Activated" Only
    [Tags]   CID:686
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter Plate Status - DeActivated
    RMSWebsiteKeywords.Select Filter Plate Status DeActivated Assert
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords.Filter Plate Status Assert-Deactivated

### Vehicle Details ################################################################


RMS - C688
    [Documentation]   Verify the functionality of Cancel Button After changing 'Vehicle Name'
    [Tags]   CID:688
     RMSWebsiteKeywords.Login
     RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     PTHHP5AYKJA002773
     RMSWebsiteKeywords.Open Vehicle Details
     RMSWebsiteKeywords.Check Vehicle Detail Page
     RMSWebsiteKeywords.Edit Vehicle Name   edtVehicle
     RMSWebsiteKeywords.Cancel Operation on Vehicle Detail

RMS - C870
    [Documentation]   Verify User is able to add comment
    [Tags]   CID:870
     RMSWebsiteKeywords.Login
     RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     PTHHP5AYKJA002773
     RMSWebsiteKeywords.Open Vehicle Details
     RMSWebsiteKeywords.Add and Save comment

### Settings #######################################################################

RMS - C701
    [Documentation]   Verify the layout of the settings page
    [Tags]   CID:701
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Settings Page Assert

RMS - C702
    [Documentation]   Verify user is navigated to Dashboard from Settings page
    [Tags]   CID:702
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Settings Page Assert
    RMSWebsiteKeywords.Enter Dashboard
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-702

RMS - C703
    [Documentation]   Verify user is able to navigate Vehicle group settings
    [Tags]   CID:703
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Manage Vehicle Groups Assert

### Settings - Vehicle Groups ######################################################

RMS - C704
    [Documentation]   Verify the layout of Vehicle Groups in the settings page
    [Tags]   CID:704
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Manage Vehicle Groups Layout Assert

RMS - C706
    [Documentation]   Verify user is navigated to Dashboard from Vehicle group page
    [Tags]   CID:706
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Enter Dashboard
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-706

RMS - C707
    [Documentation]   Verify user is able to sign out from the Vehicle group
    [Tags]   CID:707
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert

### Settings - Vehicle Group Edit Name #############################################

RMS - C711
    [Documentation]   Verify user is able to sign out from the Edit Vehicle Group State (Without clicking on check) and it should not change the vehicle group name
    [Tags]   CID:711
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Click Edit Group Button
    RMSWebsiteKeywords.Get First group Name
    RMSWebsiteKeywords.Clear And Enter New Group Name
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Edit Group Logout Assert

RMS - C708
    [Documentation]   Verify user is able to edit group name in the Vehicle group page
    [Tags]   CID:708
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Click Edit Group Button
    RMSWebsiteKeywords.Clear And Enter New Group Name
    RMSWebsiteKeywords.Click on Check
    RMSWebsiteKeywords.Edit Group Name Assert

#### Settings - Vehicle New Vehicle Group #############################################

RMS - C712
    [Documentation]   	Verify user can able to create new vehicle group in the Manage Vehicle Group
    [Tags]   CID:712
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Add New Group  id=inputfield   AutoGroup
    Common.Take the Screenshot  CID-712

RMS - C713
    [Documentation]   Verify the layout while create new vehicle group
    [Tags]   CID:713
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Add New Group Assert
    Common.Take the Screenshot  CID-713

RMS - C714
    [Documentation]   Verify user can enter numbers in the group name
    [Tags]   CID:714
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Add New Group  id=inputfield   123456
    Common.Take the Screenshot  CID-714


RMS - C715
    [Documentation]   Verify user can able to cancel the entered group name
    [Tags]   CID:715
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Cancel Add New Group  id=inputfield   CancelGrp
    Common.Take the Screenshot  CID-715

RMS - C716
    [Documentation]   	Verify user can select all the vehicle to add in the created group
    [Tags]   CID:716
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Select All in Add New Group  id=inputfield   AAutoGrp2
    Common.Take the Screenshot  CID-716

RMS - C717
    [Documentation]   	Verify user not able to navigate to Dashboard page during create a new vehicle group
    [Tags]   CID:717
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Navigate to New Vehicle Group  #No Navigation to Dashboard Included
    Common.Take the Screenshot  CID-717

#### Settings - Vehicle Group Delete #############################################

RMS - C718
    [Documentation]   	Verify user is able to select a particular group for deletion
    [Tags]   CID:718
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Select First Group
    RMSWebsiteKeywords.Click on Delete Vehicle Group
    Common.Take the Screenshot  CID-718


RMS - C719
    [Documentation]   	Verify user not able to navigate to Dashboard during delete process
    [Tags]   CID:719
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Select First Group
    RMSWebsiteKeywords.Click on Delete Vehicle Group   #No Navigation to Dashboard Included
    Common.Take the Screenshot  CID-719

RMS - C720
    [Documentation]   	Verify the layout during the delete the group
    [Tags]   CID:720
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Select First Group
    RMSWebsiteKeywords.Click on Delete Vehicle Group   #No Navigation to Dashboard Included
    Common.Take the Screenshot  CID-720


RMS - C721
    [Documentation]   	Verify user is able to cancel delete operation
    [Tags]   CID:721
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Select First Group
    RMSWebsiteKeywords.Click on Delete Vehicle Group   #No Navigation to Dashboard Included
    RMSWebsiteKeywords.Cancel Delete
    Common.Take the Screenshot  CID-721

#### Settings - Vehicle Group Delete Confirmation #############################################

RMS - C723
    [Documentation]   	Verify user confirm the deletion for Groups
    [Tags]   CID:723
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Select First Group
    RMSWebsiteKeywords.Click on Delete Vehicle Group   #No Navigation to Dashboard Included
    RMSWebsiteKeywords.Delete the Group

RMS - C724
    [Documentation]   	Verify user not able to navigate to Dashboard while delete confirmation received
    [Tags]   CID:724
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Select First Group
    RMSWebsiteKeywords.Click on Delete Vehicle Group
    RMSWebsiteKeywords.Delete the Group
    RMSWebsiteKeywords.Delete Group Dashboard Navigation      #No Navigation to Dashboard Included

RMS - C725
    [Documentation]   		Verify the layout while group deleted successfully
    [Tags]   CID:725
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Vehicle Groups Settings
    RMSWebsiteKeywords.Select First Group
    RMSWebsiteKeywords.Click on Delete Vehicle Group
    RMSWebsiteKeywords.Delete the Group
    RMSWebsiteKeywords.Delete Group Dashboard Navigation      #No Navigation to Dashboard Included
    Common.Take the Screenshot  CID-725

#### Telematics - Main #############################################

RMS - C913
    [Documentation]   		Verify Telematics page display using Telematics left navigation bar
    [Tags]   CID:913
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Check Telematics Icon of Left Nav
    Common.Take the Screenshot  CID-913

RMS - C914
    [Documentation]   		Verify layout of the Telematics screen
    [Tags]   CID:914
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    Common.Take the Screenshot  CID-914


RMS - C915
    [Documentation]   		Verify user is able to sign out in the Telematic main screen page
    [Tags]   CID:915
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert
    Common.Take the Screenshot  CID-915

RMS - C922
    [Documentation]   			Verify user can move to Dashboard screen
    [Tags]   CID:922
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Enter Dashboard
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-922

RMS - C923
    [Documentation]   			Verify browser back functionality from Telematics Screen
    [Tags]   CID:923
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Browser Back to Home Screen   #Assert Included
    Common.Take the Screenshot  CID-923


####   Vehicle Detail Telematics  #############################################

RMS - C896
    [Documentation]   		Verify user can enter Vehicle name in the search field
    [Tags]   CID:896
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    Common.Take the Screenshot  CID-896

RMS - C897
    [Documentation]   			Verify vehicle not display while wrong vehicle name search
    [Tags]   CID:897
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics - Negative
    Common.Take the Screenshot  CID-897

RMS - C904
    [Documentation]   			Verify user is able to sign out during search
    [Tags]   CID:904
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert
    Common.Take the Screenshot  CID-904

RMS - C905
    [Documentation]   		Verify user can move to Dashboard screen during search
    [Tags]   CID:905
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Enter Dashboard
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-905


RMS - C908
    [Documentation]   		Verify User is able to go Back to Vehicle Detail Screen from Telematic Screen using browser back
    [Tags]   CID:908
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Browser Back to Home Screen   #Assert Included
    Common.Take the Screenshot  CID-908

#### Telematics - Main Vehicle Trips Progress  #############################################

RMS - C934
    [Documentation]   	Verify the layout for vehicle trips
    [Tags]   CID:934
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Navigate to Vehicle Trips
    Common.Take the Screenshot  CID-934


RMS - C935
    [Documentation]   	Verify view all the trips made for vehicle
    [Tags]   CID:935
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Navigate to Vehicle Trips  #Assert Included
    RMSWebsiteKeywords.Check the list of trips
    Common.Take the Screenshot  CID-935

RMS - C943
    [Documentation]   	Verify user is able to sign out in the vehicles trip progress
    [Tags]   CID:943
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Navigate to Vehicle Trips  #Assert Included
    RMSWebsiteKeywords.Check the list of trips
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert
    Common.Take the Screenshot  CID-943

#### Telematics - Main Vehicle Trips Expand  #########################################

RMS - C947
    [Documentation]   		Verify the layout while vehicle trip expand
    [Tags]   CID:947
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Navigate to Vehicle Trips  #Assert Included
    RMSWebsiteKeywords.Check the list of trips
    Common.Take the Screenshot  CID-947

RMS - C948
    [Documentation]   		Verify the timing, date and place information for trips made
    [Tags]   CID:948
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Navigate to Vehicle Trips  #Assert Included
    RMSWebsiteKeywords.Check the list of trips
    RMSWebsiteKeywords.Timing Address and Date Assert
    Common.Take the Screenshot  CID-948

RMS - C949
    [Documentation]   		Verify the number of trips made and duration for trips
    [Tags]   CID:949
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Navigate to Vehicle Trips  #Assert Included
    RMSWebsiteKeywords.Check the list of trips
    RMSWebsiteKeywords.Timing Address and Date Assert
    Common.Take the Screenshot  CID-949

RMS - C956
    [Documentation]   		Verify user is able to sign out in the trips expand view page
    [Tags]   CID:956
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Navigate to Vehicle Trips  #Assert Included
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert
    Common.Take the Screenshot  CID-956

####  Campaign Main ################################################

RMS - C1176
    [Documentation]   			Verify the layout of the Campaign main Screen
    [Tags]   CID:1176
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    Common.Take the Screenshot  CID-1176

RMS - C1178
    [Documentation]   			Verify layout of the Campaign search box
    [Tags]   CID:1178
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search Campaign
    Common.Take the Screenshot  CID-1178

RMS - C1181
    [Documentation]      Verify Search functionality by Campaign Name
    [Tags]   CID:1181
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search Campaign
    Common.Take the Screenshot  CID-1181


RMS - C1186
    [Documentation]    Verify user is able to sign out while searching in the Campaign
    [Tags]   CID:1186
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search Campaign
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert
    Common.Take the Screenshot  CID-1186


RMS - C1187
    [Documentation]    Verify the confirmation message on Delete campaign
    [Tags]   CID:1187
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Delete a Campaign
    Common.Take the Screenshot  CID-1187

RMS - C1188
    [Documentation]    Verify User can Delete a Campaign
    [Tags]   CID:1188
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Delete a Campaign   #Assert included
    RMSWebsiteKeywords2.Confirm Campaign Delete
    RMSWebsiteKeywords2.Delete Campaign From Table Assert
    Common.Take the Screenshot  CID-1188

RMS - C1190
    [Documentation]    Verify browser back functionality from Campaign Screen
    [Tags]   CID:1190
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords.Browser Back to Home Screen   #Assert Included
    Common.Take the Screenshot  CID-1190

####  Manage Campaign Zones  ################################################

RMS - C1169
    [Documentation]    Verify the layout of Manage Campaign Zones Screen
    [Tags]   CID:1169
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    Common.Take the Screenshot  CID-1169

RMS - C1170
    [Documentation]    Verify User is able to select a particular zone and delete button is highlighted
    [Tags]   CID:1170
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Select Any Zone  //div[1][@class='col-sm-4 col-md-4 col-lg-4 row_body cursorPointer']
    RMSWebsiteKeywords2.Select Zone Assert
    Common.Take the Screenshot  CID-1170

RMS - C1191
    [Documentation]    Verify Delete button is disabled after de-selecting the zones
    [Tags]   CID:1191
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Select Any Zone  //div[1][@class='col-sm-4 col-md-4 col-lg-4 row_body cursorPointer']
    RMSWebsiteKeywords2.Select Zone Assert
    RMSWebsiteKeywords2.Deselect Selected Zone
    RMSWebsiteKeywords2.Deselect Zone Assert
    Common.Take the Screenshot  CID-1191

RMS - C1174
    [Documentation]    Verify User is able to navigate to Dashboard from Manage Campaign Zones post selection
    [Tags]   CID:1174
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Select Any Zone  //div[1][@class='col-sm-4 col-md-4 col-lg-4 row_body cursorPointer']
    RMSWebsiteKeywords.Enter Dashboard
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-1174

####  Manage Campaign Zones Hover  ################################################

RMS - C1165
    [Documentation]    Verify the layout of Manage Campaign Zones Hover Screen
    [Tags]   CID:1165
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Hover Mouse Pointer On Any Zone
    Common.Take the Screenshot  CID-1165

RMS - C1166
    [Documentation]    Verify User is able to click on Edit Button
    [Tags]   CID:1166
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Hover Mouse Pointer On Any Zone
    RMSWebsiteKeywords2.Click on Edit Campaign Zone Button
    RMSWebsiteKeywords2.Edit Campaign Zone Assert
    Common.Take the Screenshot  CID-1166

####  Manage Campaign Zones Delete  ###############################################

RMS - C1152
    [Documentation]    Verify the layout of Delete Campaign Zone Confirmation Pop up
    [Tags]   CID:1152
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Select Any Zone  //div[1][@class='col-sm-4 col-md-4 col-lg-4 row_body cursorPointer']
    RMSWebsiteKeywords2.Select Delete Campaign Zone
    RMSWebsiteKeywords2.Delete Campaign Zone Popup Assert
    Common.Take the Screenshot  CID-1152

RMS - C1154
    [Documentation]    Verify the layout of Zone Deleted Successfully Confirmation Pop up
    [Tags]   CID:1154
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Select Any Zone  //div[1][@class='col-sm-4 col-md-4 col-lg-4 row_body cursorPointer']
    RMSWebsiteKeywords2.Select Delete Campaign Zone
    RMSWebsiteKeywords2.Confirm Delete Campaign Zone
    RMSWebsiteKeywords2.Campaign Zone Deleted Confirmation Assert
    Common.Take the Screenshot  CID-1154

RMS - C1156
    [Documentation]    Verify user is able to delete multiple zone
    [Tags]   CID:1156
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Select Any Zone  //div[1][@class='col-sm-4 col-md-4 col-lg-4 row_body cursorPointer']
    RMSWebsiteKeywords2.Select Any Zone  //div[2][@class='col-sm-4 col-md-4 col-lg-4 row_body cursorPointer']
    RMSWebsiteKeywords2.Select Delete Campaign Zone
    RMSWebsiteKeywords2.Confirm Delete Campaign Zone
    RMSWebsiteKeywords2.Campaign Zone Deleted Confirmation Assert
    Common.Take the Screenshot  CID-1156

RMS - C1158
    [Documentation]    Verify the navigation to Dashboard on Delete Campaign Zone Confirmation Pop up
    [Tags]   CID:1158
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Select Any Zone  //div[1][@class='col-sm-4 col-md-4 col-lg-4 row_body cursorPointer']
    RMSWebsiteKeywords2.Select Delete Campaign Zone
    RMSWebsiteKeywords2.Background Screen Disable Assert
    Common.Take the Screenshot  CID-1158

RMS - C1163
    [Documentation]    Verify user is able to Cancel Delete operation for multiple Zones
    [Tags]   CID:1163
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Select Any Zone  //div[1][@class='col-sm-4 col-md-4 col-lg-4 row_body cursorPointer']
    RMSWebsiteKeywords2.Select Any Zone  //div[2][@class='col-sm-4 col-md-4 col-lg-4 row_body cursorPointer']
    RMSWebsiteKeywords2.Select Delete Campaign Zone
    RMSWebsiteKeywords2.Cancel Delete Campaign Zone Action
    RMSWebsiteKeywords2.Cancel Delete Campaign Zone Assert
    Common.Take the Screenshot  CID-1163

####  Campaign Edit Zones  ####################################################

RMS - C1401
    [Documentation]    Verify the Edit Tool Tip Layout
    [Tags]   CID:1401
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Hover Mouse Pointer On Any Zone
    RMSWebsiteKeywords2.Click on Edit Campaign Zone Button
    RMSWebsiteKeywords2.Mouse Hover on Edit Tool Tip    #Include Assert

RMS - C1402
    [Documentation]    Verify the layout of the Edit Zone Screen
    [Tags]   CID:1402
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Hover Mouse Pointer On Any Zone
    RMSWebsiteKeywords2.Click on Edit Campaign Zone Button
    RMSWebsiteKeywords2.Edit Campaign Zone Assert
    Common.Take the Screenshot  CID-1402

RMS - C1403
    [Documentation]    Verify User can edit the Zone Name
    [Tags]   CID:1403
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Hover Mouse Pointer On Any Zone
    RMSWebsiteKeywords2.Click on Edit Campaign Zone Button
    RMSWebsiteKeywords2.Edit Campaign Zone Name    EditedZone
    RMSWebsiteKeywords2.Save Edited Zone
    RMSWebsiteKeywords2.Save Edited Zone Assert
    Common.Take the Screenshot  CID-1403

RMS - C1405
    [Documentation]    Verify Cancel operation while editing the Zone name
    [Tags]   CID:1405
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Hover Mouse Pointer On Edited Zone
    RMSWebsiteKeywords2.Click on Edit Campaign Zone Button
    RMSWebsiteKeywords2.Edit Campaign Zone Name    Edited
    RMSWebsiteKeywords2.Cancel Edited Zone
    RMSWebsiteKeywords2.Cancel Edited Zone Assert
    Common.Take the Screenshot  CID-1405

RMS - C1408
    [Documentation]    Verify navigation to Edit Screen should be shown
    [Tags]   CID:1408
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Hover Mouse Pointer On Any Zone
    RMSWebsiteKeywords2.Click on Edit Campaign Zone Button
    RMSWebsiteKeywords2.Edit Campaign Zone Assert
    Common.Take the Screenshot  CID-1408

####################  Campaign Add Zones ###################################

RMS - C1430
    [Documentation]    Verify User can enter Add zone screen
    [Tags]   CID:1430
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Click on Add New Campaign Zone
    RMSWebsiteKeywords2.Add Zone Page Assert
    Common.Take the Screenshot  CID-1430

RMS - C1435
    [Documentation]    Verify User cannot create zone by only adding Zone Name
    [Tags]   CID:1435
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Click on Add New Campaign Zone
    RMSWebsiteKeywords2.Enter Zone Name   AutoZone1
    RMSWebsiteKeywords2.Zone Name or Address Assert
    Common.Take the Screenshot  CID-1435

RMS - C1436
    [Documentation]    Verify User cannot create zone by only adding Zone Area
    [Tags]   CID:1436
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Click on Add New Campaign Zone
    RMSWebsiteKeywords2.Enter Zone Area   Gurgaon
    RMSWebsiteKeywords2.Zone Name or Address Assert
    Common.Take the Screenshot  CID-1436

RMS - C1438
    [Documentation]    Verify Cancel operation while Adding the Zone
    [Tags]   CID:1438
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Click on Add New Campaign Zone
    RMSWebsiteKeywords2.Enter Zone Name   AutoZone2
    RMSWebsiteKeywords2.Enter Zone Area   Gurgaon
    RMSWebsiteKeywords2.Cancel Add Zone
    RMSWebsiteKeywords2.Cancel Add Zone Assert
    Common.Take the Screenshot  CID-1438

####################  Add New Campaign #######################################

RMS - C1368
    [Documentation]    Verify User navigates to Add Campaign Page while clicking on "Add Campaign" button
    [Tags]   CID:1368
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    Common.Take the Screenshot  CID-1368

RMS - C1370
    [Documentation]    Verify Campaign name allowed max 10 character
    [Tags]   CID:1370
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Check Campaign Name plus 10 Characters
    Common.Take the Screenshot  CID-1370

RMS - C1374
    [Documentation]    	Verify user can select and unselect Campaign validity
    [Tags]   CID:1374
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Click on Always
    RMSWebsiteKeywords2.Deselect Always
    Common.Take the Screenshot  CID-1374

RMS - C1376
    [Documentation]    	Verify start date and end date field disable if Campaign validity selected always
    [Tags]   CID:1376
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Click on Always
    Common.Take the Screenshot  CID-1376


RMS - C1384
    [Documentation]    	Verify user can able to select All group for new campaign
    [Tags]   CID:1384
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Select All Groups and Zones
    Common.Take the Screenshot  CID-1384


RMS - C1385
    [Documentation]    	Verify user can able to select All Zone for new campaign
    [Tags]   CID:1385
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Click on Always
    RMSWebsiteKeywords2.Select All Groups and Zones
    Common.Take the Screenshot  CID-1385

RMS - C1386
    [Documentation]    	Verify User can save the data for new Campaign
    [Tags]   CID:1386
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Save Campaign     newcamp
    Common.Take the Screenshot  CID-1386

RMS - C1388
    [Documentation]    	Verify Group name is clickable in the Add New Campaign screen page
    [Tags]   CID:1388
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Click Group
    Common.Take the Screenshot  CID-1388

RMS - C1391
    [Documentation]    	Verify Zone name is clickable in the Add New Campaign screen page
    [Tags]   CID:1391
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Click Zone
    Common.Take the Screenshot  CID-1391

RMS - C1393
    [Documentation]    	Verify campaign detail view zone popup disapear while click ok button
    [Tags]   CID:1393
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Click Zone
    RMSWebsiteKeywords2.Discard Zone Pop Up
    Common.Take the Screenshot  CID-1393

RMS - C1396
    [Documentation]    	Verify outside of campaign detail view zone window is clickable
    [Tags]   CID:1396
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Click Zone
    RMSWebsiteKeywords2.Discard Zone Pop Up
    Common.Take the Screenshot  CID-1396

###### Campaign Messages ###############################

RMS - C1409
    [Documentation]    	Verify User can able to Upload messages when user in the added campaign confirmation popup
    [Tags]   CID:1409
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Save Campaign w/o     latecamp
    RMSWebsiteKeywords2.Upload Message
    Common.Take the Screenshot  CID-1409

RMS - C1411
    [Documentation]    	Verify user can see Uploaded message
    [Tags]   CID:1411
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Save Campaign w/o     latecamp1
    RMSWebsiteKeywords2.Upload Message
    Common.Take the Screenshot  CID-1411

RMS - C1412
    [Documentation]    		Verify user can able to save uploaded message
    [Tags]   CID:1412
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Save Campaign w/o     latecamp2
    RMSWebsiteKeywords2.Upload Message
    RMSWebsiteKeywords2.Save Message
    Common.Take the Screenshot  CID-1412

RMS - C1413
    [Documentation]    		Verify user can able to cancel uploaded message
    [Tags]   CID:1413
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Save Campaign w/o     latecamp3
    RMSWebsiteKeywords2.Upload Message
    RMSWebsiteKeywords2.Cancel Message
    Common.Take the Screenshot  CID-1413

RMS - C1414
    [Documentation]    		Verify uploaded message reflected on campaign details page
    [Tags]   CID:1414
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    latecamp2
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="latecamp2"]
    Common.Take the Screenshot  CID-1414

###### Campaign Details ##################################

RMS - C1419
    [Documentation]    		Verify the layout of Campaign details
    [Tags]   CID:1419
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    latecamp2
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="latecamp2"]
    RMSWebsiteKeywords2.Campaign Detail Page Layout Assert
    Common.Take the Screenshot  CID-1419

RMS - C1420
    [Documentation]    		Verify User can able to edit the Campaign name
    [Tags]   CID:1420
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    latecamp2
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="latecamp2"]
    RMSWebsiteKeywords2.Edit Campaign Name
    RMSWebsiteKeywords2.Navigate to Campaign Screen
    RMSWebsiteKeywords2.Search a Campaign    editedcamp
    Common.Take the Screenshot  CID-1420

RMS - C1425
    [Documentation]    		Verify user can upload the campaign message
    [Tags]   CID:1425
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    editedcamp
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="editedcamp"]
    RMSWebsiteKeywords2.Upload New Message
    Common.Take the Screenshot  CID-1425

RMS - C1428
    [Documentation]    		Verify user can able Publish the Campaign Message
    [Tags]   CID:1428
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    editedcamp
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="editedcamp"]
    RMSWebsiteKeywords2.Publish or Unpublished Message   //span[text()="Unpublished"]
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    editedcamp
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="editedcamp"]
    RMSWebsiteKeywords2.Message Published Assert
    Common.Take the Screenshot  CID-1428

RMS - C1429
    [Documentation]    		Verify user can able to Unpublish the Campaign Message
    [Tags]   CID:1429
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    editedcamp
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="editedcamp"]
    RMSWebsiteKeywords2.Publish or Unpublished Message   //span[text()="Published"]
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    editedcamp
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="editedcamp"]
    RMSWebsiteKeywords2.Message UnPublished Assert
    Common.Take the Screenshot  CID-1429

RMS - C1426
    [Documentation]    		Verify user can able to delete the Campaign
    [Tags]   CID:1426
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    editedcamp
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="editedcamp"]
    RMSWebsiteKeywords2.Delete Campaign From Campaign Detail
    RMSWebsiteKeywords2.Search a Campaign    editedcamp
    RMSWebsiteKeywords2.Delete Campaign Assert
    Common.Take the Screenshot  CID-1426

###### No Result Found ##############################################

RMS - C998
    [Documentation]  Verify "No result Found" Screen on Search Page
    [Tags]  CID:998
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     invalid user name
    RMSWebsiteKeywords2.Invalid Search Assert
    Common.Take the Screenshot  CID-998

RMS - C1000
    [Documentation]    		Verify "No result Found" Screen on Campaign Page
    [Tags]   CID:1000
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    invalidcam
    RMSWebsiteKeywords2.Invalid Search Assert
    Common.Take the Screenshot  CID-1000

###### User Management ##############################################

RMS - C1639
    [Documentation]    Verify the layout of "User Management" Page
    [Tags]   CID:1639
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter User Management Screen
    RMSWebsiteKeywords2.User Management Screen Assert
    Common.Take the Screenshot  CID-1639

RMS - C1643
    [Documentation]    Verify user can able to navigate Notification page
    [Tags]   CID:1639
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter User Management Screen
    RMSWebsiteKeywords2.Click on Notifications icon
    RMSWebsiteKeywords2.Notification Screen Assert
    Common.Take the Screenshot  CID-1643

RMS - C1644
    [Documentation]    Verify that user can able to sign out from user management screen
    [Tags]   CID:1644
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter User Management Screen
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert
    Common.Take the Screenshot  CID-1644

RMS - C1645
    [Documentation]    Verify that user can navigate to Settings from top left of the screen
    [Tags]   CID:1644
    RMSWebsiteKeywords.Login
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter User Management Screen
    RMSWebsiteKeywords2.Enter Settings Page From User Management Top Nav
    RMSWebsiteKeywords.Settings Page Assert
    Common.Take the Screenshot  CID-1645