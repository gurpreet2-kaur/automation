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
*** Variables ***
&{USER_FMCAdmin}          Username=sudhanshu.wadhwa@aricent.com  Password=ar1cenT%
&{USER_SMBAdmin}          Username=automationreviver@gmail.com  Password=ar1cenT%
&{USER_SMBAdmin2}         Username=sudhanshuadmin@rmsweb.com  Password=ar1cenT%   #No Zone No Group#TC
&{USER_Dealer}            Username=keepsunnyupdated@gmail.com  Password=ar1cenT%
&{USER_DealerConsumer}    Username=automationdealerconsumer@gmail.com  Password=ar1cenT%

#SMB
#Should have 1 comment from a different user and 1 from the same logged in user in "Sudha" vehicle of SMB company.
#the 1st comment would be from the same logged in user and the 2nd from the other user.
#There should be atleast 6 Zones in Manage Campaigne Zone (Zone1, Zone2, Zone3, Zone4, Zone5) for both SMB and FMC
#Change the Path to your directory in CampaignPageNav.robot "Select an Image" and "Upload New Message"
#Delete Campaign "newcamp" "latecamp1,2,3" from SMB Admin Users
#Delete "EditedZone" zone in SMB Settings Campaign Zone.
#Should be atleast 5 Groups in Campaign Group SMB Settings
#In SMB make delete the Campaign Group named "Automation"
# Update C948 with the latest date of telematics trip (SMB)
# Change the status of rPlate of Sudha vehicle to Activated SMB
#Should have at least 1 Plate with status as Deactivated (SMB)
# Confirm that the vehicle with name as "1112" has plate status as Activated and the bar is green in color SMB
# There should be a Campaign with Name "Dontdelete" which should not have any Campaign Message Uploaded
# Delete groups 12345 and AutoGroup
# Should have 2-3 unassigned Rplates
# should have atleast 1 plate in detached state
# Delete EditeCamp

#FMC
#There should be atleast 5 Zones in Manage Campaigne Zone (Zone1, Zone2, Zone3, Zone4, Zone5) for both SMB and FMC
#There should be atleast 1 rPlate with vehicle assigned to it in FMC company with default rPlate image
#Change the Path to your directory in CampaignPageNav.robot "Select an Image" and "Upload New Message"
#"DontDelete" Should be available in Campaign and 3-4 other campaigns
#Delete "EditedZone" zone in FMC Settings Campaign Zone.
#FMC Telematics FMC ompany QA - No trip found and Sudhanshu Client Cmpany 1 - No trips Found
#FMC Dashboard GurpreetKau should not have plates allocated.

#Should be atleast 5 Groups in Vehicle Group FMC Settings
#Delete vehicle group with the name FMC Group

#Dealer
#There should be a Text File 1.txt on path
#There should be a JPG File 1.JPG on path
#Set up the path for Upload in Settings.nav

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

    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Dashboard Page Assert
    #RMSWebsiteKeywords.For Your Protection Page 1 Assert
    Common.Take the Screenshot  CID-670

RMS - C671
    [Documentation]  Verify User gets an error message while trying to Sign In with Invalid Password
    [Tags]  CID:671
    RMSWebsiteKeywords.Login Invalid Password
    #Common.Take the Screenshot  CID-671

RMS - C672
    [Documentation]  Verify User gets an error message while trying to Sign In with Invalid Username
    [Tags]  CID:672
    RMSWebsiteKeywords.Login Invalid Username
    #Common.Take the Screenshot  CID-672

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
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-571

#RMS - C572
 #   [Documentation]   Verify the functionality of the Image Carousel
  #  [Tags]   CID:572
   # RMSWebsiteKeywords.Login
    #Common.Check Caraousel
    #Common.Take the Screenshot  CID-572

RMS - C578
    [Documentation]  Verify the Selection of the Vehicle
    [Tags]  CID:578
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Make Selection v0.2
    Common.Take the Screenshot  CID-578

RMS - C579
    [Documentation]  Verify layout of the search box
    [Tags]  CID:579
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    Common.Take the Screenshot  CID-579

RMS - C580
    [Documentation]  Verify Search functionality by Vehicle Name
    [Tags]  CID:580
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     Sudha
    RMSWebsiteKeywords.Searched Assert    Sudha     12113131111111111
    Common.Take the Screenshot  CID-580

RMS - C581
    [Documentation]  Verify Search functionality by VIN
    [Tags]  CID:581
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords.Searched Assert    Sudha   12113131111111111
    Common.Take the Screenshot  CID-581

RMS - C583
    [Documentation]  	Verify the functionality of the green color bar vehicle
    [Tags]  CID:583
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords.Make 1rst Green Selection in List View
    Common.Take the Screenshot  CID-583

############    Home Screen List Action list #########################################################

RMS - C577
    [Documentation]  Verify Action Button Layout
    [Tags]  CID:577
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Make Selection v0.2
    RMSWebsiteKeywords.Action Button Assert v0.2
    Common.Take the Screenshot  CID-577

RMS - C675
    [Documentation]  	Verify Action Button Enables with multiple Selection
    [Tags]  CID:675
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Make Selection v0.2
    RMSWebsiteKeywords.Make 2nd Selection v0.2
    RMSWebsiteKeywords.Action Button Assert v0.2
    Common.Take the Screenshot  CID-675

RMS - C676
    [Documentation]  Verify User see Change Vehicle Group in Action dropdown
    [Tags]  CID:676
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Make Selection v0.2
    RMSWebsiteKeywords.Action Button Assert v0.2
    Common.Take the Screenshot  CID-676


########### Filter #########################################################################

RMS - C573
    [Documentation]   Verify the "Cancel" Button Functionality on Filter Layover
    [Tags]   CID:573
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Launch and Closed Filter Layout
    Common.Take the Screenshot  CID-573

RMS - C681
    [Documentation]   Verify Selection while Filtering by Specific "State" Only
    [Tags]   CID:681
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter State - CA
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords.Filter State Assert-CA

RMS - C683
    [Documentation]   Verify the layout of the Filter Selection Screen
    [Tags]   CID:683
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter Plate Status - Pre Register
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords.Filtered Screen Assert Preregistered

RMS - C684
    [Documentation]   Verify the filter functionality with multiple "Year"
    [Tags]   CID:684
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter Year - 2017
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords.Filter Year Assert-2017

RMS - C686
    [Documentation]   Verify Selection while Filtering by "RPlate Status" - "De-Activated" Only
    [Tags]   CID:686
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter Plate Status - DeActivated
    RMSWebsiteKeywords.Select Filter Plate Status DeActivated Assert
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords.Filter Plate Status Assert-DeActivated v0.2


### Settings #######################################################################

RMS - C701
    [Documentation]   Verify the layout of the settings page
    [Tags]   CID:701
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Settings Page Assert V0.2

RMS - C702
    [Documentation]   Verify user is navigated to Dashboard from Settings page
    [Tags]   CID:702
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Settings Page Assert V0.2
    RMSWebsiteKeywords.Enter Dashboard
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-702

RMS - C703
    [Documentation]   Verify user is able to navigate Vehicle group settings
    [Tags]   CID:703
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Manage Campaign Groups Assert

### Settings - Campaign Groups ######################################################

RMS - C704
    [Documentation]   Verify the layout of Vehicle Groups in the settings page
    [Tags]   CID:704
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Manage Campaign Groups Layout Assert

RMS - C706
    [Documentation]   Verify user is navigated to Dashboard from Vehicle group page
    [Tags]   CID:706
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Enter Dashboard
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-706

RMS - C707
    [Documentation]   Verify user is able to sign out from the Vehicle group
    [Tags]   CID:707
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert

### Settings - Campaign Group Edit Name #############################################

#RMS - C711
#    [Documentation]   Verify user is able to sign out from the Edit Vehicle Group State (Without clicking on check) and it should not change the vehicle group name
#    [Tags]   CID:711
#    RMSWebsiteKeywords.Login
#    RMSWebsiteKeywords.Enter Settings Page
#    RMSWebsiteKeywords.Enter Campaign Groups Settings
#    RMSWebsiteKeywords.Click Edit Group Button
#    RMSWebsiteKeywords.Get First group Name
#    RMSWebsiteKeywords.Clear And Enter New Group Name
#    RMSWebsiteKeywords.Logout
#    RMSWebsiteKeywords.Login
#    RMSWebsiteKeywords.Enter Settings Page
#    RMSWebsiteKeywords.Enter Campaign Groups Settings
#    RMSWebsiteKeywords.Edit Group Logout Assert

RMS - C708
    [Documentation]   Verify user is able to edit group name in the Vehicle group page
    [Tags]   CID:708
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Click Edit Group Button
    RMSWebsiteKeywords.Clear And Enter New Group Name
    RMSWebsiteKeywords.Click on Check
    RMSWebsiteKeywords.Edit Group Name Assert

#### Settings - Vehicle New Vehicle Group #############################################

RMS - C712
    [Documentation]   	Verify user can able to create new vehicle group in the Manage Vehicle Group
    [Tags]   CID:712
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Add New Group  id=inputfield   AutoGroup  Sudha
    Common.Take the Screenshot  CID-712

RMS - C713
    [Documentation]   Verify the layout while create new vehicle group
    [Tags]   CID:713
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Add New Group Assert
    Common.Take the Screenshot  CID-713

RMS - C714
    [Documentation]   Verify user can enter numbers in the group name
    [Tags]   CID:714
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Add New Group  id=inputfield   123456   DontDelete
    Common.Take the Screenshot  CID-714


RMS - C715
    [Documentation]   Verify user can able to cancel the entered group name
    [Tags]   CID:715
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Cancel Add New Group  id=inputfield   CancelGrp   XYZ
    Common.Take the Screenshot  CID-715

#RMS - C716
 #   [Documentation]   	Verify user can select all the vehicle to add in the created group
 #  [Tags]   CID:716
 #  RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
 #  RMSWebsiteKeywords.Enter Settings Page
 #  RMSWebsiteKeywords.Enter Campaign Groups Settings
 #  RMSWebsiteKeywords.Select All in Add New Group  id=inputfield   AutoGroup3
 #  Common.Take the Screenshot  CID-716

RMS - C717
    [Documentation]   	Verify user not able to navigate to Dashboard page during create a new vehicle group
    [Tags]   CID:717
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Navigate to New Vehicle Group  #No Navigation to Dashboard Included
    Common.Take the Screenshot  CID-717

#### Settings - Vehicle Group Delete #############################################

RMS - C718
    [Documentation]   	Verify user is able to select a particular group for deletion
    [Tags]   CID:718
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Select First Group
    RMSWebsiteKeywords.Click on Delete Campaign Group
    Common.Take the Screenshot  CID-718

RMS - C719
    [Documentation]   	Verify user not able to navigate to Dashboard during delete process
    [Tags]   CID:719
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Select First Group
    RMSWebsiteKeywords.Click on Delete Campaign Group   #No Navigation to Dashboard Included
    Common.Take the Screenshot  CID-719

RMS - C720
    [Documentation]   	Verify the layout during the delete the group
    [Tags]   CID:720
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Select First Group
    RMSWebsiteKeywords.Click on Delete Campaign Group   #No Navigation to Dashboard Included
    Common.Take the Screenshot  CID-720

RMS - C721
    [Documentation]   	Verify user is able to cancel delete operation
    [Tags]   CID:721
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Select First Group
    RMSWebsiteKeywords.Click on Delete Campaign Group   #No Navigation to Dashboard Included
    RMSWebsiteKeywords.Cancel Delete
    Common.Take the Screenshot  CID-721

#### Settings - Vehicle Group Delete Confirmation #############################################

RMS - C723
    [Documentation]   	Verify user confirm the deletion for Groups
    [Tags]   CID:723
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Select First Group
    RMSWebsiteKeywords.Click on Delete Campaign Group   #No Navigation to Dashboard Included
    RMSWebsiteKeywords.Delete the Group

RMS - C724
    [Documentation]   	Verify user not able to navigate to Dashboard while delete confirmation received
    [Tags]   CID:724
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Select First Group
    RMSWebsiteKeywords.Click on Delete Campaign Group
    RMSWebsiteKeywords.Delete the Group
    RMSWebsiteKeywords.Delete Group Dashboard Navigation      #No Navigation to Dashboard Included

RMS - C725
    [Documentation]   		Verify the layout while group deleted successfully
    [Tags]   CID:725
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords.Select First Group
    RMSWebsiteKeywords.Click on Delete Campaign Group
    RMSWebsiteKeywords.Delete the Group
    RMSWebsiteKeywords.Delete Group Dashboard Navigation      #No Navigation to Dashboard Included
    Common.Take the Screenshot  CID-725

#### Telematics - Main #############################################

RMS - C913
    [Documentation]   		Verify Telematics page  display using Telematics left navigation bar
    [Tags]   CID:913
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check Telematics Icon of Left Nav
    Common.Take the Screenshot  CID-913

RMS - C914
    [Documentation]   		Verify layout of the Telematics screen
    [Tags]   CID:914
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    Common.Take the Screenshot  CID-914


RMS - C915
    [Documentation]   		Verify user is able to sign out in the Telematic main screen page
    [Tags]   CID:915
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert
    Common.Take the Screenshot  CID-915

RMS - C922
    [Documentation]   			Verify user can move to Dashboard screen
    [Tags]   CID:922
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Enter Dashboard
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-922

RMS - C923
    [Documentation]   			Verify browser back functionality from Telematics Screen
    [Tags]   CID:923
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Browser Back to Home Screen   #Assert Included
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-923


####   Vehicle Detail Telematics  #############################################

RMS - C896
    [Documentation]   		Verify user can enter Vehicle name in the search field
    [Tags]   CID:896
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    Common.Take the Screenshot  CID-896

RMS - C897
    [Documentation]   			Verify vehicle not display while wrong vehicle name search
    [Tags]   CID:897
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics - Negative
    Common.Take the Screenshot  CID-897

RMS - C904
    [Documentation]   			Verify user is able to sign out during search
    [Tags]   CID:904
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert
    Common.Take the Screenshot  CID-904

RMS - C905
    [Documentation]   		Verify user can move to Dashboard screen during search
    [Tags]   CID:905
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Enter Dashboard
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-905


RMS - C908
    [Documentation]   		Verify User is able to go Back to Vehicle Detail Screen from Telematic Screen using browser back
    [Tags]   CID:908
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Browser Back to Home Screen   #Assert Included
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-908

#### Telematics - Main Vehicle Trips Progress  #############################################

RMS - C934
    [Documentation]   	Verify the layout for vehicle trips
    [Tags]   CID:934
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Navigate to Vehicle Trips
    Common.Take the Screenshot  CID-934


RMS - C935
    [Documentation]   	Verify view all the trips made for vehicle
    [Tags]   CID:935
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Navigate to Vehicle Trips  #Assert Included
    RMSWebsiteKeywords.Check the list of trips
    Common.Take the Screenshot  CID-935

RMS - C943
    [Documentation]   	Verify user is able to sign out in the vehicles trip progress
    [Tags]   CID:943
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
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
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Navigate to Vehicle Trips  #Assert Included
    RMSWebsiteKeywords.Check the list of trips
    Common.Take the Screenshot  CID-947

RMS - C948
    [Documentation]   		Verify the timing, date and place information for trips made
    [Tags]   CID:948
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Navigate to Vehicle Trips  #Assert Included
    RMSWebsiteKeywords.Check the list of trips
    RMSWebsiteKeywords.Timing Address and Date Assert
    Common.Take the Screenshot  CID-948

RMS - C949
    [Documentation]   		Verify the number of trips made and duration for trips
    [Tags]   CID:949
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    RMSWebsiteKeywords.Input Text and Search Telematics
    RMSWebsiteKeywords.Navigate to Vehicle Trips  #Assert Included
    RMSWebsiteKeywords.Check the list of trips
    RMSWebsiteKeywords.Timing Address and Date Assert
    Common.Take the Screenshot  CID-949

RMS - C956
    [Documentation]   		Verify user is able to sign out in the trips expand view page
    [Tags]   CID:956
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
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
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    Common.Take the Screenshot  CID-1176

RMS - C1178
    [Documentation]   			Verify layout of the Campaign search box
    [Tags]   CID:1178
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search Campaign
    Common.Take the Screenshot  CID-1178

RMS - C1181
    [Documentation]      Verify Search functionality by Campaign Name
    [Tags]   CID:1181
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search Campaign
    Common.Take the Screenshot  CID-1181


RMS - C1186
    [Documentation]    Verify user is able to sign out while searching in the Campaign
    [Tags]   CID:1186
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search Campaign
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert
    Common.Take the Screenshot  CID-1186


RMS - C1187
    [Documentation]    Verify the confirmation message on Delete campaign
    [Tags]   CID:1187
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Delete a Campaign
    Common.Take the Screenshot  CID-1187

RMS - C1188
    [Documentation]    Verify User can Delete a Campaign
    [Tags]   CID:1188
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Delete a Campaign   #Assert included
    RMSWebsiteKeywords2.Confirm Campaign Delete
    RMSWebsiteKeywords2.Delete Campaign From Table Assert
    Common.Take the Screenshot  CID-1188

RMS - C1190
    [Documentation]    Verify browser back functionality from Campaign Screen
    [Tags]   CID:1190
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords.Browser Back to Home Screen   #Assert Included
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-1190

####  Manage Campaign Zones  ################################################

RMS - C1169
    [Documentation]    Verify the layout of Manage Campaign Zones Screen
    [Tags]   CID:1169
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    Common.Take the Screenshot  CID-1169

RMS - C1170
    [Documentation]    Verify User is able to select a particular zone and delete button is highlighted
    [Tags]   CID:1170
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Select Any Zone  //div[2]/div[@class='row_body cursorPointer']
    RMSWebsiteKeywords2.Select Zone Assert
    Common.Take the Screenshot  CID-1170

RMS - C1191
    [Documentation]    Verify Delete button is disabled after de-selecting the zones
    [Tags]   CID:1191
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Select Any Zone  //div[2]/div[@class='row_body cursorPointer']
    RMSWebsiteKeywords2.Select Zone Assert
    RMSWebsiteKeywords2.Deselect Selected Zone
    RMSWebsiteKeywords2.Deselect Zone Assert
    Common.Take the Screenshot  CID-1191

RMS - C1174
    [Documentation]    Verify User is able to navigate to Dashboard from Manage Campaign Zones post selection
    [Tags]   CID:1174
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Select Any Zone  //div[2]/div[@class='row_body cursorPointer']
    RMSWebsiteKeywords.Enter Dashboard
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-1174

####  Manage Campaign Zones Hover  ################################################

RMS - C1165
    [Documentation]    Verify the layout of Manage Campaign Zones Hover Screen
    [Tags]   CID:1165
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Hover Mouse Pointer On Any Zone
    Common.Take the Screenshot  CID-1165

RMS - C1166
    [Documentation]    Verify User is able to click on Edit Button
    [Tags]   CID:1166
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
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
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Select Any Zone  //div[2]/div[@class='row_body cursorPointer']
    RMSWebsiteKeywords2.Select Delete Campaign Zone
    RMSWebsiteKeywords2.Delete Campaign Zone Popup Assert
    Common.Take the Screenshot  CID-1152

RMS - C1154
    [Documentation]    Verify the layout of Zone Deleted Successfully Confirmation Pop up
    [Tags]   CID:1154
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Select Any Zone  //div[2]/div[@class='row_body cursorPointer']
    RMSWebsiteKeywords2.Select Delete Campaign Zone
    RMSWebsiteKeywords2.Confirm Delete Campaign Zone
    RMSWebsiteKeywords2.Campaign Zone Deleted Confirmation Assert
    Common.Take the Screenshot  CID-1154

RMS - C1156
    [Documentation]    Verify user is able to delete multiple zone
    [Tags]   CID:1156
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Select Any Zone  //div[2]/div[@class='row_body cursorPointer']
    RMSWebsiteKeywords2.Select Any Zone  //div[3]/div[@class='row_body cursorPointer margin_right_zero']
    RMSWebsiteKeywords2.Select Delete Campaign Zone
    RMSWebsiteKeywords2.Confirm Delete Campaign Zone
    RMSWebsiteKeywords2.Campaign Zone Deleted Confirmation Assert
    Common.Take the Screenshot  CID-1156

RMS - C1158
    [Documentation]    Verify the navigation to Dashboard on Delete Campaign Zone Confirmation Pop up
    [Tags]   CID:1158
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Select Any Zone  //div[2]/div[@class='row_body cursorPointer']
    RMSWebsiteKeywords2.Select Delete Campaign Zone
    RMSWebsiteKeywords2.Background Screen Disable Assert
    Common.Take the Screenshot  CID-1158

RMS - C1163
    [Documentation]    Verify user is able to Cancel Delete operation for multiple Zones
    [Tags]   CID:1163
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Select Any Zone  id=rowclick0
    RMSWebsiteKeywords2.Select Any Zone  id=rowclick1
    RMSWebsiteKeywords2.Select Delete Campaign Zone
    RMSWebsiteKeywords2.Cancel Delete Campaign Zone Action
    RMSWebsiteKeywords2.Cancel Delete Campaign Zone Assert
    Common.Take the Screenshot  CID-1163

####  Campaign Edit Zones  ####################################################

RMS - C1401
    [Documentation]    Verify the Edit Tool Tip Layout
    [Tags]   CID:1401
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Hover Mouse Pointer On Any Zone
    RMSWebsiteKeywords2.Click on Edit Campaign Zone Button
    RMSWebsiteKeywords2.Mouse Hover on Edit Tool Tip    #Include Assert

RMS - C1402
    [Documentation]    Verify the layout of the Edit Zone Screen
    [Tags]   CID:1402
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Hover Mouse Pointer On Any Zone
    RMSWebsiteKeywords2.Click on Edit Campaign Zone Button
    RMSWebsiteKeywords2.Edit Campaign Zone Assert
    Common.Take the Screenshot  CID-1402

RMS - C1403
    [Documentation]    Verify User can edit the Zone Name
    [Tags]   CID:1403
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
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
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
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
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
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
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Click on Add New Campaign Zone
    RMSWebsiteKeywords2.Add Zone Page Assert
    Common.Take the Screenshot  CID-1430

RMS - C1435
    [Documentation]    Verify User cannot create zone by only adding Zone Name
    [Tags]   CID:1435
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Click on Add New Campaign Zone
    RMSWebsiteKeywords2.Enter Zone Name   AutoZone1
    RMSWebsiteKeywords2.Click on Zone Area
    RMSWebsiteKeywords2.Zone Name or Address Assert
   Common.Take the Screenshot  CID-1435

RMS - C1436
    [Documentation]    Verify User cannot create zone by only adding Zone Area
    [Tags]   CID:1436
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones
    RMSWebsiteKeywords2.Click on Add New Campaign Zone
    RMSWebsiteKeywords2.Enter Zone Area   Gurgaon
    RMSWebsiteKeywords2.Click on Zone Area
    RMSWebsiteKeywords2.Zone Name or Address Assert
    Common.Take the Screenshot  CID-1436

RMS - C1438
    [Documentation]    Verify Cancel operation while Adding the Zone
    [Tags]   CID:1438
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
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
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    Common.Take the Screenshot  CID-1368

RMS - C1370
    [Documentation]    Verify Campaign name allowed max 10 character
    [Tags]   CID:1370
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Check Campaign Name plus 10 Characters
    Common.Take the Screenshot  CID-1370

RMS - C1374
    [Documentation]    	Verify user can select and unselect Campaign validity
    [Tags]   CID:1374
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Click on Always
    RMSWebsiteKeywords2.Deselect Always
    Common.Take the Screenshot  CID-1374

RMS - C1376
    [Documentation]    	Verify start date and end date field disable if Campaign validity selected always
    [Tags]   CID:1376
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Click on Always
    Common.Take the Screenshot  CID-1376


RMS - C1384
    [Documentation]    	Verify user can able to select All group for new campaign
    [Tags]   CID:1384
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Click on Always
    RMSWebsiteKeywords2.Select All Groups and Zones
    Common.Take the Screenshot  CID-1384


RMS - C1385
    [Documentation]    	Verify user can able to select All Zone for new campaign
    [Tags]   CID:1385
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Click on Always
    RMSWebsiteKeywords2.Select All Groups and Zones
    Common.Take the Screenshot  CID-1385

RMS - C1386
    [Documentation]    	Verify User can save the data for new Campaign
    [Tags]   CID:1386
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Save Campaign     newcamp
    Common.Take the Screenshot  CID-1386

RMS - C1388
    [Documentation]    	Verify Group name is clickable in the Add New Campaign screen page
    [Tags]   CID:1388
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Click Group
    Common.Take the Screenshot  CID-1388

RMS - C1391
    [Documentation]    	Verify Zone name is clickable in the Add New Campaign screen page
    [Tags]   CID:1391
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Click Zone
    Common.Take the Screenshot  CID-1391

RMS - C1393
    [Documentation]    	Verify campaign detail view zone popup disapear while click ok button
    [Tags]   CID:1393
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Click Zone
    #RMSWebsiteKeywords2.Discard Zone Pop Up
    Common.Take the Screenshot  CID-1393

RMS - C1396
    [Documentation]    	Verify outside of campaign detail view zone window is clickable
    [Tags]   CID:1396
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Click Zone
    #RMSWebsiteKeywords2.Discard Zone Pop Up
    Common.Take the Screenshot  CID-1396

###### Campaign Messages ###############################

RMS - C1409
    [Documentation]    	Verify User can able to Upload messages when user in the added campaign confirmation popup
    [Tags]   CID:1409
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Save Campaign w/o     latecamp
    RMSWebsiteKeywords2.Upload Message
    Common.Take the Screenshot  CID-1409

RMS - C1411
    [Documentation]    	Verify user can see Uploaded message
    [Tags]   CID:1411
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Save Campaign w/o     latecamp1
    RMSWebsiteKeywords2.Upload Message
    Common.Take the Screenshot  CID-1411

RMS - C1412
    [Documentation]    	Verify user can able to save uploaded message
    [Tags]   CID:1412
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Save Campaign w/o     latecamp2
    RMSWebsiteKeywords2.Upload Message
    RMSWebsiteKeywords2.Save Message
    Common.Take the Screenshot  CID-1412

RMS - C1413
    [Documentation]    		Verify user can able to cancel uploaded message
    [Tags]   CID:1413
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Add Campaign
    RMSWebsiteKeywords2.Save Campaign w/o     latecamp3
    RMSWebsiteKeywords2.Upload Message
    RMSWebsiteKeywords2.Cancel Message
    Common.Take the Screenshot  CID-1413

RMS - C1414
    [Documentation]    		Verify uploaded message reflected on campaign details page
    [Tags]   CID:1414
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    latecamp2
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="latecamp2"]
    Common.Take the Screenshot  CID-1414

###### Campaign Details ##################################

RMS - C1419
    [Documentation]    		Verify the layout of Campaign details
    [Tags]   CID:1419
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    latecamp2
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="latecamp2"]
    RMSWebsiteKeywords2.Campaign Detail Page Layout Assert
    #Common.Take the Screenshot  CID-1419

RMS - C1420
    [Documentation]    		Verify User can able to edit the Campaign name
    [Tags]   CID:1420
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    latecamp2
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="latecamp2"]
    RMSWebsiteKeywords2.Edit Campaign Name
    RMSWebsiteKeywords2.Navigate to Campaign Screen
    RMSWebsiteKeywords2.Search a Campaign    editedcamp
    #Common.Take the Screenshot  CID-1420

RMS - C1425
    [Documentation]    		Verify user can upload the campaign message
    [Tags]   CID:1425
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    editedcamp
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="editedcamp"]
    RMSWebsiteKeywords2.Upload New Message
   # Common.Take the Screenshot  CID-1425

RMS - C1428
    [Documentation]    		Verify user can able Publish the Campaign Message
    [Tags]   CID:1428
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    editedcamp
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="editedcamp"]
    RMSWebsiteKeywords2.Publish or Unpublished Message   //span[text()="Unpublished"]
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    editedcamp
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="editedcamp"]
    RMSWebsiteKeywords2.Message Published Assert
    #Common.Take the Screenshot  CID-1428

RMS - C1429
    [Documentation]    		Verify user can able to Unpublish the Campaign Message
    [Tags]   CID:1429
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    editedcamp
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="editedcamp"]
    RMSWebsiteKeywords2.Publish or Unpublished Message   //span[text()="Published"]
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    editedcamp
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="editedcamp"]
    RMSWebsiteKeywords2.Message UnPublished Assert
    Common.Take the Screenshot  CID-1429

###### No Result Found ##############################################

RMS - C998
    [Documentation]  Verify "No result Found" Screen on Search Page
    [Tags]  CID:998
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     invalid vehicle
    RMSWebsiteKeywords2.Invalid Search Assert
    Common.Take the Screenshot  CID-998

RMS - C1000
    [Documentation]    		Verify "No result Found" Screen on Campaign Page
    [Tags]   CID:1000
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    invalidcam
    RMSWebsiteKeywords2.Invalid Search Assert
    Common.Take the Screenshot  CID-1000

###### User Management ##############################################

RMS - C1639
    [Documentation]    Verify the layout of "User Management" Page
    [Tags]   CID:1639
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter User Management Screen
    RMSWebsiteKeywords2.User Management Screen Assert
    Common.Take the Screenshot  CID-1639

RMS - C1643
    [Documentation]    Verify user can able to navigate Notification page
    [Tags]   CID:1643
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter User Management Screen
    RMSWebsiteKeywords2.Click on Notifications icon
    RMSWebsiteKeywords2.Notification Screen Assert
    Common.Take the Screenshot  CID-1643

RMS - C1644
    [Documentation]    Verify that user can able to sign out from user management screen
    [Tags]   CID:1644
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter User Management Screen
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert
    Common.Take the Screenshot  CID-1644

RMS - C1645
    [Documentation]    Verify that user can navigate to Settings from top left of the screen
    [Tags]   CID:1645
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter User Management Screen
    RMSWebsiteKeywords2.Enter Settings Page From User Management Top Nav
    RMSWebsiteKeywords.Settings Page Assert V0.2
    Common.Take the Screenshot  CID-1645

###### User Management-Add User ##############################################

RMS - C1621
    [Documentation]    Verify the layout of "Add User" on User Management
    [Tags]   CID:1621
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter User Management Screen
    RMSWebsiteKeywords2.Enter Add User Screen
    RMSWebsiteKeywords2.Add User Screen Assert
    RMSWebsiteKeywords2.Background Screen Disable Assert
    Common.Take the Screenshot  CID-1621

RMS - C1626
    [Documentation]    Verify user is able to input valid email address on add new user
    [Tags]   CID:1626
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter User Management Screen
    RMSWebsiteKeywords2.Enter Add User Screen
    RMSWebsiteKeywords2.Enter Valid Email Address    asdfgjhsad@gmail.com  #Includes Assert
    Common.Take the Screenshot  CID-1626

RMS - C1629
    [Documentation]    Verify invalid Email is not accepted for "Confirm Email Address' on Add New User
    [Tags]   CID:1629
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter User Management Screen
    RMSWebsiteKeywords2.Enter Add User Screen
    RMSWebsiteKeywords2.Enter Valid Email Address    test@test.com   #Includes Assert
    RMSWebsiteKeywords2.Enter Different Confirm Email Address    test1@test.com   #Includes Assert
    Common.Take the Screenshot  CID-1629

RMS - C1634
    [Documentation]    Verify "Send Invitation" functionality is working when all the mandatory parameters are set
    [Tags]   CID:1634
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter User Management Screen
    RMSWebsiteKeywords2.Enter Add User Screen
    RMSWebsiteKeywords2.Fill Data in Add User Screen
    RMSWebsiteKeywords2.Send Invitation Button Activation Assert
    Common.Take the Screenshot  CID-1634

RMS - C1637
    [Documentation]    Verify "OK" button is functioning on Invitation sent successfully page
    [Tags]   CID:1637
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter User Management Screen
    RMSWebsiteKeywords2.Enter Add User Screen
    RMSWebsiteKeywords2.Fill Data in Add User Screen
    RMSWebsiteKeywords2.Send Invitation Button Activation Assert
    RMSWebsiteKeywords2.Send User Invite
    RMSWebsiteKeywords2.Invitation sent successfully Assert
    RMSWebsiteKeywords2.Background Screen Disable Assert
    RMSWebsiteKeywords2.Confirm User Invite
    Common.Take the Screenshot  CID-1637

###### User Management-Delete User ##############################################

RMS - C1680
    [Documentation]    Verify that OK button is functioning on User deleted successfully page
    [Tags]   CID:1680
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter User Management Screen
    RMSWebsiteKeywords2.Select and Delete Invited User
    Common.Take the Screenshot  CID-1680

###### Notification #############################################################

RMS - C1682
    [Documentation]    Verify the layout of Notification screen
    [Tags]   CID:1682
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Click on Notifications icon
    RMSWebsiteKeywords2.Notification Screen Assert
    Common.Take the Screenshot  CID-1682

RMS - C1683
    [Documentation]    Verify User is able to navigate different tabs on Left Panel of the Page
    [Tags]   CID:1683
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Click on Notifications icon
    RMSWebsiteKeywords2.Notification Screen Assert
    RMSWebsiteKeywords.Enter Dashboard
    RMSWebsiteKeywords.Dashboard Page Assert
    RMSWebsiteKeywords2.Click on Notifications icon
    RMSWebsiteKeywords2.Notification Screen Assert
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Settings Page Assert V0.2
    RMSWebsiteKeywords2.Click on Notifications icon
    RMSWebsiteKeywords2.Notification Screen Assert
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Click on Notifications icon
    RMSWebsiteKeywords2.Notification Screen Assert
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    Common.Take the Screenshot  CID-1683

###### Dashboard SMB View #################################################################

RMS - C2346
    [Documentation]    Verify the functionality of the red color bar vehicle
    [Tags]   CID:2346
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Check Bar of Vehicle with renewal Date Jan 01 1970
    Common.Take the Screenshot  CID-2346

RMS - C2348
    [Documentation]    Verify the functionality of the green color bar vehicle
    [Tags]   CID:2348
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     1112
    RMSWebsiteKeywords.Searched Assert    1112     22222222222222222
    RMSWebsiteKeywords2.Check Bar of Vehicle with renewal Date Apr 18 2019
    Common.Take the Screenshot  CID-2348

RMS - C3638
    [Documentation]    Verify that User can sign out from the Application
    [Tags]   CID:3638
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert
    Common.Take the Screenshot  CID-3638

###### Dashboard SMB View Action ##########################################################

RMS - C1686
    [Documentation]    Verify that Action button is enabled when user clicks on any rPlate row
    [Tags]   CID:1686
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Dashboard Page Assert
    RMSWebsiteKeywords.Make Selection v0.2
    RMSWebsiteKeywords.Action Button Assert v0.2
    Common.Take the Screenshot  CID-1686

RMS - C1687
    [Documentation]    Verify Action button functionality
    [Tags]   CID:1687
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Dashboard Page Assert
    RMSWebsiteKeywords.Make Selection v0.2
    RMSWebsiteKeywords.Action Button Assert v0.2
    Common.Take the Screenshot  CID-1687

RMS - C1688
    [Documentation]  	Verify multiple rPlates can be selected at once
    [Tags]  CID:1688
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Make Selection v0.2
    RMSWebsiteKeywords.Make 2nd Selection v0.2
    RMSWebsiteKeywords.Action Button Assert v0.2
    Common.Take the Screenshot  CID-1688

###### Security and Password #############################################################

RMS - C1742
    [Documentation]    Verify the layout of Security and Password in the settings page
    [Tags]   CID:1742
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Click on Security and Password
    RMSWebsiteKeywords2.Check Security and Password Assert

RMS - C1743
    [Documentation]    Verify user is navigated to Security and Password page by clicking on manage button
    [Tags]   CID:1743
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Click on Security and Password
    RMSWebsiteKeywords2.Check Security and Password Assert

RMS - C1744
    [Documentation]    Verify User is able to enter valid old Password
    [Tags]   CID:1744
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Click on Security and Password
    RMSWebsiteKeywords2.Check Valid Old Password

RMS - C1745
    [Documentation]    Verify User is able to enter invalid old Password
    [Tags]   CID:1745
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Click on Security and Password
    RMSWebsiteKeywords2.Check InValid Old Password

RMS - C1748
    [Documentation]    	Verify User is able to enter New Password more than 8 characters
    [Tags]   CID:1748
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Click on Security and Password
    RMSWebsiteKeywords2.Check Valid Password GT 8
    RMSWebsiteKeywords.Login 2
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Click on Security and Password
    RMSWebsiteKeywords2.Change the Password Back

RMS - C1756
    [Documentation]    Veriy the behaviour while enter InValid Confirm Password
    [Tags]   CID:1756
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Click on Security and Password
    RMSWebsiteKeywords2.Password does not match

###### Account Preferences ####################################################

RMS - C1694
    [Documentation]   Verify user is navigated to Account Preferences page
    [Tags]   CID:1694
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Click on Account Preferences
    RMSWebsiteKeywords2.Account Preferences Assert
    Common.Take the Screenshot  CID-1694

RMS - C1695
    [Documentation]   Verify User is able to select push notification in the notification settings
    [Tags]   CID:1695
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Click on Account Preferences
    RMSWebsiteKeywords2.Select Text Message Notification    #Assert Included
    RMSWebsiteKeywords2.Select Email Notification    #Assert Included

RMS - C1698
    [Documentation]   Verify User is not able to Edit email address
    [Tags]   CID:1698
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Click on Account Preferences
    RMSWebsiteKeywords2.Edit Contact Details
    RMSWebsiteKeywords2.Background Screen Disable Assert
    RMSWebsiteKeywords2.Edit Contact Details Assert
    Common.Take the Screenshot  CID-1698

RMS - C1699
    [Documentation]   Verify user should be able to Cancel the Edit contact Details Pop Up
    [Tags]   CID:1699
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Click on Account Preferences
    RMSWebsiteKeywords2.Edit Contact Details
    RMSWebsiteKeywords2.Cancel Edit Contact Details Pop Up
    RMSWebsiteKeywords2.Account Preferences Assert
    RMSWebsiteKeywords.Enter Settings Page
    Common.Take the Screenshot  CID-1699

RMS - C1700
    [Documentation]   Verify User is able to Edit phone number with digits
    [Tags]   CID:1700
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Click on Account Preferences
    RMSWebsiteKeywords2.Edit Contact Details
    RMSWebsiteKeywords2.Edit and Save Phone Number    #Assert Included
    Common.Take the Screenshot  CID-1700

###### Forget Username, Forget Password ########################################

RMS - C1708
    [Documentation]   Verify the functionality while enter invalid User name in the Forget Password link
    [Tags]   CID:1708
    RMSWebsiteKeywords2.Click on Forgot Password
    RMSWebsiteKeywords2.Forgot Password Screen Assert
    RMSWebsiteKeywords2.Input Username To Get Password Reset link   saksun21111@gmail.com
    RMSWebsiteKeywords2.Click on Send Password Reset Link
    RMSWebsiteKeywords2.Send Password Reset Link Screen Assert
    Common.Take the Screenshot  CID-1708

RMS - C1710
    [Documentation]   Verify the Back to Signin Functionality in Forget Password
    [Tags]   CID:1710
    RMSWebsiteKeywords2.Click on Forgot Password
    RMSWebsiteKeywords2.Forgot Password Screen Assert
    RMSWebsiteKeywords2.Input Username To Get Password Reset link   TestAutomation
    RMSWebsiteKeywords2.Click on Send Password Reset Link
    RMSWebsiteKeywords2.Click on Back to Signin Button
    RMSWebsiteKeywords.Login Page Assert
    Common.Take the Screenshot  CID-1710

#RMS - C1714
    #[Documentation]   Verify the Back to Signin Functionality in Forget Username
    #[Tags]   CID:1714
    #RMSWebsiteKeywords2.Click on Forgot Username
    #RMSWebsiteKeywords2.Forgot Username Screen Assert
    #RMSWebsiteKeywords2.Input Email/Phone To Get Password Reset link   absdvdvc@aaa.com
    #RMSWebsiteKeywords2.Click on Next Button
    #RMSWebsiteKeywords2.Message With Username Sent Screen Assert
    #RMSWebsiteKeywords2.Click on Back to Signin Button
    #RMSWebsiteKeywords.Login Page Assert
    #Common.Take the Screenshot  CID-1714

#RMS - C1715
    #[Documentation]   Verify the Forget Username link confirmation message
    #[Tags]   CID:1715
    #RMSWebsiteKeywords2.Click on Forgot Username
    #RMSWebsiteKeywords2.Forgot Username Screen Assert
    #RMSWebsiteKeywords2.Input Email/Phone To Get Password Reset link   absdvdvc@aaa.com
    #RMSWebsiteKeywords2.Click on Next Button
    #RMSWebsiteKeywords2.Message With Username Sent Screen Assert
    #Common.Take the Screenshot  CID-1715

###### Dashboard SMB View Preregistere ###################################################

RMS - C2331
    [Documentation]  Verify the layout of SMB view dashboard
    [Tags]  CID:2331
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-2331

RMS - C2334
    [Documentation]    Verify User is able to navigate different tabs on Left Panel of the Page
    [Tags]   CID:2334
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Dashboard Page Assert
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Settings Page Assert V0.2
    RMSWebsiteKeywords.Enter Dashboard
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords.Enter Dashboard
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    Common.Take the Screenshot  CID-2334

RMS - C3639
    [Documentation]    Verify the layout of Notification screen
    [Tags]   CID:3639
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Click on Notifications icon
    RMSWebsiteKeywords2.Notification Screen Assert
    Common.Take the Screenshot  CID-3639

RMS - C3640
    [Documentation]    Verify that User can sign out from the Application
    [Tags]   CID:3640
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert
    Common.Take the Screenshot  CID-

RMS - C2337
    [Documentation]  Verify that search is working on the Dashboard page
    [Tags]  CID:2337
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     Sudha
    RMSWebsiteKeywords.Searched Assert    Sudha     12113131111111111
    Common.Take the Screenshot  CID-2337

RMS - C2339
    [Documentation]  Verify that current page number is highlighted
    [Tags]  CID:2339
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Current Page Number Highlighted Assert
    Common.Take the Screenshot  CID-2339

RMS - C2340
    [Documentation]  Verify that Previous is greyed out when first page is highlighted
    [Tags]  CID:2340
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Previous Greyed Out Assert
    Common.Take the Screenshot  CID-2340

RMS - C2341
    [Documentation]  Verify that Next is greyed out when user selects last page
    [Tags]  CID:2341
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Click on 2nd Page
    RMSWebsiteKeywords2.Next Greyed Out Assert
    Common.Take the Screenshot  CID-2341

###### Comments Action List ###################################################

RMS - C2323
    [Documentation]  Verify the layout of Comments Action List screen
    [Tags]  CID:2323
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    id=search     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords.Add and Save comment    This is an automated comment
    RMSWebsiteKeywords2.Click on View All
    RMSWebsiteKeywords2.View All Comments Box Assert
    Common.Take the Screenshot  CID-2323

RMS - C2325
    [Documentation]  Verify the funtionality of Edit
    [Tags]  CID:2325
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords2.Click on View All
    RMSWebsiteKeywords2.Edit and Save Comment   #Assert Included
    Common.Take the Screenshot  CID-2325

RMS - C2326
    [Documentation]  Verify the functionality of Delete
    [Tags]  CID:2326
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords2.Click on View All
    RMSWebsiteKeywords2.Delete Comment    #Assert Included
    Common.Take the Screenshot  CID-2326

###### Comment Box ############################################################

RMS - C2319
    [Documentation]  Verify the layout of Add Comment
    [Tags]  CID:2319
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords.Add and Save comment    This is a random comment
    RMSWebsiteKeywords2.Click on View All
    RMSWebsiteKeywords2.Click on Add Comment
    RMSWebsiteKeywords2.Add Comment Box Assert
    Common.Take the Screenshot  CID-2319

RMS - C2320
    [Documentation]  Verify the functionality of tick button
    [Tags]  CID:2320
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords2.Click on View All
    RMSWebsiteKeywords2.Click on Add Comment
    RMSWebsiteKeywords2.Input Comment into Add Comment Box    This is 2nd Automated Comment
    RMSWebsiteKeywords2.Save Entered Comment
    RMSWebsiteKeywords2.Saved Comment Assert
    Common.Take the Screenshot  CID-2320

RMS - C2321
    [Documentation]  	Verify that user is not allowed to click tick when no comment is provided
    [Tags]  CID:2321
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords2.Click on View All
    RMSWebsiteKeywords2.Click on Add Comment
    #RMSWebsiteKeywords2.No Tick Button Assert
    Common.Take the Screenshot  CID-2321

RMS - C2322
    [Documentation]  Verify the functionality of cross button
    [Tags]  CID:2322
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords2.Click on View All
    RMSWebsiteKeywords2.Click on Add Comment
    RMSWebsiteKeywords2.Input Comment into Add Comment Box    This is Cancelled Automated Comment
    RMSWebsiteKeywords2.Cancel Entered Comment
    RMSWebsiteKeywords2.Cancelled Comment Assert
    Common.Take the Screenshot  CID-2322

###### Assign Vehicle to rPlate ################################################

RMS - C2292
    [Documentation]  Verify the layout of Assign Vehicle to rPlate screen
    [Tags]  CID:2292
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Make Selection v0.2
    RMSWebsiteKeywords.Action Button Assert v0.2
    RMSWebsiteKeywords2.Click on Assign Vehicle
    RMSWebsiteKeywords2.Assign Vehicle Page Assert
    Common.Take the Screenshot  CID-2292

###### SMB Filter #############################################################

RMS - C1727
    [Documentation]   Verify the "Cancel" Button Functionality on Filter Layover
    [Tags]   CID:1727
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Launch and Closed Filter Layout
    Common.Take the Screenshot  CID-1727

RMS - C1728
    [Documentation]   Verify Selection while Filtering by Specific "State" Only
    [Tags]   CID:1728
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter State - CA
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords.Filter State Assert-CA

RMS - C1729
    [Documentation]   Verify Selection while Filtering by Specific "Year" Only
    [Tags]   CID:1729
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter Year - 2017
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords.Filter Year Assert-2017

RMS - C1732
    [Documentation]   Verify Selection while Filtering by "RPlate Status" - "De-Activated" Only
    [Tags]   CID:1732
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter Plate Status - DeActivated
    RMSWebsiteKeywords.Select Filter Plate Status DeActivated Assert
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords.Filter Plate Status Assert-DeActivated v0.2

RMS - C1730
    [Documentation]   	Verify Selection while Filtering by "RPlate Status" - "Activated" Only
    [Tags]   CID:1730
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter Plate Status - Activated
    RMSWebsiteKeywords.Select Filter Plate Status Activated Assert
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords.Filter Plate Status Assert-Activated

RMS - C1736
    [Documentation]   	Verify Filter functionality with combinations
    [Tags]   CID:1736
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter Plate Status - Activated
    RMSWebsiteKeywords.Select Filter Year - 2017
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords.Filter Year Assert-2017
    RMSWebsiteKeywords.Filter Plate Status Assert-Activated

RMS - C1737
    [Documentation]   Verify Filter functionality with no results
    [Tags]   CID:1737
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Launch Filter and click Reset Filters
    RMSWebsiteKeywords.Select Filter Plate Status - DeActivated
    RMSWebsiteKeywords.Select Filter Year - 2017
    RMSWebsiteKeywords.Apply Filter
    RMSWebsiteKeywords2.Invalid Filtering Assert

###### No Campaign Found #############################################################

RMS - C1724
    [Documentation]    		Verify No Results Found Screen in case no campaigns
    [Tags]   CID:1724
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    invalidcam
    RMSWebsiteKeywords2.Invalid Search Assert
    Common.Take the Screenshot  CID-1724


###### FMC Flow    ###############################################################
###### Vehicle Details - FMC  ####################################################

RMS - C1965
    [Documentation]   Verify the layout of the Vehicle Detail Page
    [Tags]   CID:1965
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Select My rPlate
     RMSWebsiteKeywords2.Open rPlate Details
     RMSWebsiteKeywords2.Check rPlate Detail Page


RMS - C1969
    [Documentation]   Verify default License plate image display if License number is not exist
    [Tags]   CID:1969
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Select My rPlate
     RMSWebsiteKeywords2.Open rPlate Details
     RMSWebsiteKeywords2.Check rPlate Default Image


RMS - C1971
    [Documentation]   Verify user is able to navigate to Settings page
    [Tags]   CID:1971
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Select My rPlate
     RMSWebsiteKeywords2.Open rPlate Details
     RMSWebsiteKeywords2.Navigate to rPlates Settings Page


###### Vehicle Details Hover  - FMC  ####################################################

RMS - C2122
    [Documentation]   Verify User is able to click on tick Button
    [Tags]   CID:2122
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Select My rPlate
     RMSWebsiteKeywords2.Open rPlate Details
     RMSWebsiteKeywords2.Save Comments


RMS - C2123
    [Documentation]   Verify User is able to click on cross button
    [Tags]   CID:2123
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Select My rPlate
     RMSWebsiteKeywords2.Open rPlate Details
     RMSWebsiteKeywords2.Cancel the Comments

###### Vehicle Details Error  - FMC  ####################################################

RMS - C1978
    [Documentation]   Verify the user can add a comment
    [Tags]   CID:1978
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Select My rPlate
     RMSWebsiteKeywords2.Open rPlate Details
     RMSWebsiteKeywords2.Save Comments

RMS - C1979
    [Documentation]   Verify user is able to View all comments
    [Tags]   CID:1979
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Select My rPlate
     RMSWebsiteKeywords2.Open rPlate Details
     RMSWebsiteKeywords2.View All Comments

RMS - C1981
    [Documentation]   Verify given comment reflected in the Activity section
    [Tags]   CID:1981
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Select My rPlate
     RMSWebsiteKeywords2.Open rPlate Details
     RMSWebsiteKeywords2.Save Comments
     RMSWebsiteKeywords2.View All Comments


###### Vehicle Details Title Error - FMC  ####################################################

RMS - C1972
    [Documentation]   Verify user can change the Vehicle Name
    [Tags]   CID:1972
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Select My rPlate
     RMSWebsiteKeywords2.Open rPlate Details
     RMSWebsiteKeywords2.Change Vehicle Name

RMS - C1976
    [Documentation]   Verify Vehicle name field does not accept special characters
    [Tags]   CID:1976
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Select My rPlate
     RMSWebsiteKeywords2.Open rPlate Details
     RMSWebsiteKeywords2.Check Special Characters in Vehicle Name

##### Settings-Campaign Group-Add New FMC ####################################################

RMS - C2072
    [Documentation]   Verify the layout of Create a New Campaign Group
    [Tags]   CID:2072
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords.Enter Campaign Groups Settings
     RMSWebsiteKeywords2.Enter FMC Company
     RMSWebsiteKeywords2.Add New Group v0.2  id=inputfield   FMCGroup   1
     Common.Take the Screenshot  CID-2072


RMS - C2075
    [Documentation]   Verify that User is not allowed to input special characters for Campaign Groups
    [Tags]   CID:2075
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords.Enter Campaign Groups Settings
     RMSWebsiteKeywords2.Enter FMC Company
     RMSWebsiteKeywords2.Add New Group with Special Characters  id=inputfield   @#$%
     Common.Take the Screenshot  CID-2075

RMS - C2084
    [Documentation]   Verify that Cancel is functioning
    [Tags]   CID:2084
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords.Enter Campaign Groups Settings
     RMSWebsiteKeywords2.Enter FMC Company
     RMSWebsiteKeywords2.Add CG Cancel  id=inputfield   CheckSave
     Common.Take the Screenshot  CID-2085

RMS - C2085
    [Documentation]   Verify that save is functioning even when no vehicle is selected
    [Tags]   CID:2085
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords.Enter Campaign Groups Settings
     RMSWebsiteKeywords2.Enter FMC Company
     RMSWebsiteKeywords2.Add New Group v0.2  id=inputfield   CheckSave   0
     Common.Take the Screenshot  CID-2085


####### Settings- FMC Add Client   ####################################################

RMS - C1994
    [Documentation]   Verify the layout of "Add New Client" on Client Management
    [Tags]   CID:1994
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on Add New Client
     Common.Take the Screenshot  CID-1994

RMS - C1995
    [Documentation]   Verify that Client company Name accepts Alphanumeric Character
    [Tags]   CID:1995
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on Add New Client
     RMSWebsiteKeywords2.Check Client Name Accepts AN Chars
     Common.Take the Screenshot  CID-1995

RMS - C1997
    [Documentation]   	Verify that Client company Name does not accept only special characters
    [Tags]   CID:1997
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on Add New Client
     RMSWebsiteKeywords2.Check Client Name Accepts SP Chars
     Common.Take the Screenshot  CID-1997

RMS - C2001
    [Documentation]   		Verify Name field does not start with space
    [Tags]   CID:2001
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on Add New Client
     RMSWebsiteKeywords2.Check Client Name Accepts Space
     Common.Take the Screenshot  CID-2001

RMS - C2003
    [Documentation]   		Verify invalid Email Address is not accepted on Add New Client
    [Tags]   CID:2003
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on Add New Client
     RMSWebsiteKeywords2.Check Client Name Invalid Email
     Common.Take the Screenshot  CID-2003

RMS - C2004
    [Documentation]   		Verify User is able to enter "Confirm Email Address" on Add New Client Page
    [Tags]   CID:2004
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on Add New Client
     RMSWebsiteKeywords2.Check Client Name Confirm Email
     Common.Take the Screenshot  CID-2004

RMS - C2010
    [Documentation]   		Verify "Send Invitation" functionality is working when all the mandatory parameters are set
    [Tags]   CID:2010
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on Add New Client
     RMSWebsiteKeywords2.Check Send Invitation
     Common.Take the Screenshot  CID-2010

###### Settings- FMC-New Invite #####################################################

RMS - C2014
    [Documentation]   		Verify the layout of "New Invite" on Client Management
    [Tags]   CID:2014
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on New Invite
     Common.Take the Screenshot  CID-2014

RMS - C2019
    [Documentation]   		Verify user is able to input valid "Email Address" on New Invite Page
    [Tags]   CID:2019
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on New Invite
     RMSWebsiteKeywords2.Check User Valid Email

RMS - C2020
    [Documentation]   		Verify invalid Email Address is not accepted on New Invite
    [Tags]   CID:2020
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on New Invite
     RMSWebsiteKeywords2.Check User Invalid Email

RMS - C2022
    [Documentation]   		Verify invalid Email is not accepted for "Confirm Email Address' on New Invite
    [Tags]   CID:2022
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on New Invite
     RMSWebsiteKeywords2.Check User Invalid Confirm Email

RMS - C2024
    [Documentation]   		Verify "Phone Number" field does not accept characters or special characters
    [Tags]   CID:2024
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on New Invite
     RMSWebsiteKeywords2.Check User Phone Number SP

RMS - C2029
    [Documentation]   		Verify "Phone Number" field does not accept characters or special characters
    [Tags]   CID:2029
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on New Invite
     RMSWebsiteKeywords2.Click on Cancel User Invite Button

###### Settings -FMC-add client confirm #####################################################

RMS - C2031
    [Documentation]   		Verify the layout of "Invitation sent successfully" window
    [Tags]   CID:2031
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on Add New Client
     RMSWebsiteKeywords2.Check Send Invitation
     Common.Take the Screenshot  CID-2031

###### Settings-FMC Client Mgmt Home  #####################################################

RMS - C1986
    [Documentation]   			Verify that Add New button is functioning
    [Tags]   CID:1986
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on Add New Client
     Common.Take the Screenshot  CID-1986

RMS - C1985
    [Documentation]   		Verify that New Invite button is functioning
    [Tags]   CID:1985
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on New Invite

RMS - C1982
    [Documentation]   		Verify the layout of FMC Client Management Home Screen
    [Tags]   CID:1982
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on New Invite

RMS - C3641
    [Documentation]   	Verify that user can click Notification
    [Tags]   CID:3641
    RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Client Management Settings
    RMSWebsiteKeywords2.Click on Notifications icon
    RMSWebsiteKeywords2.Notification Screen Assert

RMS - C1993
    [Documentation]   		Verify that User can sign out from the Application
    [Tags]   CID:1993
    RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Client Management Settings
    #RMSWebsiteKeywords2.Click on New Invite
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert

###### Dashboard FMC View  #####################################################

RMS - C2034
    [Documentation]   		Verify the layout of Dashboard FMC View
    [Tags]   CID:2034
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Check FMC Dashboard

RMS - C3633
    [Documentation]   		Verify that user can click Notification
    [Tags]   CID:3633
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Click on Notifications icon
     RMSWebsiteKeywords2.Notification Screen Assert

RMS - C3634
    [Documentation]   		Verify that User can sign out from the Application
    [Tags]   CID:3634
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Logout
     RMSWebsiteKeywords.Login Page Assert

#####  Settings Dashboard – FMC  #####################################################

RMS - C2043
    [Documentation]   Verify the layout of the settings page
    [Tags]   CID:2043
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Settings Page Assert V0.2


RMS - C2049
    [Documentation]   Verify that user is allowed to click on Security & Password
    [Tags]   CID:2049
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Click on Security and Password
    RMSWebsiteKeywords2.Check Security and Password Assert

RMS - C2045
    [Documentation]   Verify that user lands to dashboard when back button is pressed from Web Browser
    [Tags]   CID:2045
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Browser Back to Home Screen   #Assert Included
    RMSWebsiteKeywords2.Check FMC Dashboard

RMS - C3642
    [Documentation]   		Verify that user can click Notification
    [Tags]   CID:3642
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Click on Notifications icon
     RMSWebsiteKeywords2.Notification Screen Assert

#####  Settings Campaign Groups  #####################################################

RMS - C2054
    [Documentation]   Verify the layout of Campaign Groups
    [Tags]   CID:2054
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords.Manage Campaign Groups Layout Assert

RMS - C2057
    [Documentation]   	Verify that Add New button is functioning
    [Tags]   CID:2057
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords.Add New Group Assert
    Common.Take the Screenshot  CID-2057

RMS - C3644
    [Documentation]   	Verify User is able to Signout
    [Tags]   CID:3644
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert

#####  Settings Campaign Groups Hover #####################################################

RMS - C2062
    [Documentation]   Verify that Pencil icon is displayed when user hover mouse over existing Campaign Group
    [Tags]   CID:2062
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords.Manage Campaign Groups Layout Assert

#####  Settings- Campaign Zone  #####################################################

RMS - C2088
    [Documentation]  	Verify the layout of Select Campaign Zones
    [Tags]   CID:2088
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones FMC
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords2.Manage Campaign Zones FMC Assert


RMS - C2092
    [Documentation]  	Verify that Delete button is not functioning
    [Tags]   CID:2092
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones FMC
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords2.Manage Campaign Zones FMC Assert
    RMSWebsiteKeywords2.Select Any Zone  //div[2]/div[@class='row_body cursorPointer']
    RMSWebsiteKeywords2.Select Delete Campaign Zone
    RMSWebsiteKeywords2.Delete Campaign Zone Popup Assert
    Common.Take the Screenshot  CID-2091

RMS - C3635
    [Documentation]  	Verify that User can sign out from the Application
    [Tags]   CID:3635
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones FMC
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords2.Manage Campaign Zones FMC Assert
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert

#####  Settings Campaign Groups-Select   #####################################################

RMS - C2065
    [Documentation]   	Verify that user is able to select Campaign Group
    [Tags]   CID:2065
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords.Manage Campaign Groups Layout Assert

RMS - C2067
    [Documentation]   	Verify that Delete button gets Enabled when user selects Campaign Group
    [Tags]   CID:2067
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords.Select First Group
    RMSWebsiteKeywords.Click on Delete Campaign Group
    Common.Take the Screenshot  CID-2067

RMS - C2068
    [Documentation]   	Verify that Delete is functioning when single Campaign Group is selected
    [Tags]   CID:2068
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords.Select First Group
    RMSWebsiteKeywords.Click on Delete Campaign Group
    Common.Take the Screenshot  CID-2068


#####  Settings Campaign Zones- Hover   #####################################################


RMS - C2096
    [Documentation]    Verify that Pencil icon is displayed when user hover mouse over existing Campaign Zone
    [Tags]   CID:2096
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones FMC
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords2.Manage Campaign Zones FMC Assert
    RMSWebsiteKeywords2.Hover Mouse Pointer On Any Zone
    Common.Take the Screenshot  CID-2096

#####  Settings Campaign Zones- Select   #####################################################
RMS - C2099
    [Documentation]   Verify that user is able to select Campaign Zone
    [Tags]   CID:2099
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones FMC
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords2.Manage Campaign Zones FMC Assert
    RMSWebsiteKeywords2.Select Any Zone  //div[2]/div[@class='row_body cursorPointer']
    RMSWebsiteKeywords2.Select Delete Campaign Zone


RMS - C2101
    [Documentation]    Verify that Delete button gets Enabled when user selects Campaign Zone
    [Tags]   CID:2101
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones FMC
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords2.Manage Campaign Zones FMC Assert
    RMSWebsiteKeywords2.Select Any Zone  //div[2]/div[@class='row_body cursorPointer']
    RMSWebsiteKeywords2.Select Delete Campaign Zone
    RMSWebsiteKeywords2.Delete Campaign Zone Popup Assert
    Common.Take the Screenshot  CID-2101

RMS - C2103
    [Documentation]    Verify multiple Campaign Zones can be deleted
    [Tags]   CID:2103
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones FMC
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords2.Manage Campaign Zones FMC Assert
    RMSWebsiteKeywords2.Select Any Zone  //div[2]/div[@class='row_body cursorPointer']
    RMSWebsiteKeywords2.Select Any Zone  //div[3]/div[@class='row_body cursorPointer margin_right_zero']
    RMSWebsiteKeywords2.Select Delete Campaign Zone
    RMSWebsiteKeywords2.Confirm Delete Campaign Zone
    RMSWebsiteKeywords2.Campaign Zone Deleted Confirmation Assert
    Common.Take the Screenshot  CID-2103

 #####  Settings Campaign Zones- Add   #####################################################

RMS - C2106
    [Documentation]    Verify the new layout of Campaign Zones Add
    [Tags]   CID:2106
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones FMC
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords2.Manage Campaign Zones FMC Assert
    RMSWebsiteKeywords2.Click on Add New Campaign Zone
    RMSWebsiteKeywords2.Add Zone Page Assert
    Common.Take the Screenshot  CID-2106

RMS - C2110
    [Documentation]    Verify Cancel operation while Adding the Zone
    [Tags]   CID:2110
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones FMC
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords2.Manage Campaign Zones FMC Assert
    RMSWebsiteKeywords2.Click on Add New Campaign Zone
    RMSWebsiteKeywords2.Enter Zone Name   AutoZone10
    RMSWebsiteKeywords2.Enter Zone Area   Gurgaon
    RMSWebsiteKeywords2.Cancel Add Zone
    RMSWebsiteKeywords2.Cancel Add Zone Assert
    Common.Take the Screenshot  CID-2110

######  Settings Campaign Zones- Edit   #####################################################

RMS - C2111
    [Documentation]    Verify User is able to click on Edit Button
    [Tags]   CID:2111
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones FMC
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords2.Manage Campaign Zones FMC Assert
    RMSWebsiteKeywords2.Hover Mouse Pointer On Any Zone
    RMSWebsiteKeywords2.Click on Edit Campaign Zone Button
    RMSWebsiteKeywords2.Edit Campaign Zone Assert
    Common.Take the Screenshot  CID-2111

RMS - C2112
    [Documentation]    Verify User can edit the Zone Name
    [Tags]   CID:2112
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones FMC
    RMSWebsiteKeywords2.Select My rPlate
    RMSWebsiteKeywords2.Manage Campaign Zones FMC Assert
    RMSWebsiteKeywords2.Hover Mouse Pointer On Any Zone
    RMSWebsiteKeywords2.Click on Edit Campaign Zone Button
    RMSWebsiteKeywords2.Edit Campaign Zone Name    EditedZone
    RMSWebsiteKeywords2.Save Edited Zone
    RMSWebsiteKeywords2.Save Edited Zone Assert
    Common.Take the Screenshot  CID-2112

############################Vehicle Detail Geofence#################################

#RMS - C2392
    #[Documentation]  Verify the layout of Set Vehicle Geofence
    #[Tags]  CID:2392
    #RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    #RMSWebsiteKeywords.Check in Search Box
    #RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    #RMSWebsiteKeywords2.Open Sudha Vehicle Details
    #RMSWebsiteKeywords2.Open Set Geofence Screen
    #RMSWebsiteKeywords2.Set Geofence Screen Assert
    #Common.Take the Screenshot  CID-2329#

RMS - C2394
    [Documentation]    Verify User is able to navigate different tabs on Left Panel of the Page
    [Tags]   CID:2394
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    #RMSWebsiteKeywords2.Open Set Geofence Screen
    RMSWebsiteKeywords.Enter Dashboard
    RMSWebsiteKeywords.Dashboard Page Assert
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    #RMSWebsiteKeywords2.Open Set Geofence Screen
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Settings Page Assert V0.2
    RMSWebsiteKeywords.Enter Dashboard
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    #RMSWebsiteKeywords2.Open Set Geofence Screen
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords.Enter Dashboard
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    #RMSWebsiteKeywords2.Open Set Geofence Screen
    RMSWebsiteKeywords.Navigate to Telematics Screen  #Assert included
    Common.Take the Screenshot  CID-2394

RMS - C3636
    [Documentation]    Verify that User can sign out from the Application
    [Tags]   CID:3636
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    #RMSWebsiteKeywords2.Open Set Geofence Screen
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert
    Common.Take the Screenshot  CID-3636

#################################Settings - Account Preferences Change Avatar###########################

RMS - C2431
    [Documentation]   Verify that user is able to select different avatar
    [Tags]   CID:2431
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Click on Account Preferences
    RMSWebsiteKeywords2.Click on Avatar
    RMSWebsiteKeywords2.Select Different Avatars      #Assert included
    Common.Take the Screenshot  CID-2431

RMS - C2445
    [Documentation]   Verify the layout of Account Preferences Change Avatar
    [Tags]   CID:2445
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Click on Account Preferences
    RMSWebsiteKeywords2.Click on Avatar
    RMSWebsiteKeywords2.Change Avtar Popup Assert
    Common.Take the Screenshot  CID-2445

##############################Vehicle Details One Plate Setting##########################################

RMS - C2454
    [Documentation]    Verify the layout of Vehicle Details One Plate Settings
    [Tags]   CID:2454
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords2.Navigate to rPlates Settings Page
    RMSWebsiteKeywords2.rPlate Settings Assert
    Common.Take the Screenshot  CID-2454

RMS - C2455
    [Documentation]    Verify that Dashboard hyperlink is working
    [Tags]   CID:2455
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords2.Navigate to rPlates Settings Page
    RMSWebsiteKeywords2.Click on Dashboard Hyperlink
    RMSWebsiteKeywords.Dashboard Page Assert
    Common.Take the Screenshot  CID-2455

RMS - C3637
    [Documentation]    Verify that User can sign out from the Application
    [Tags]   CID:3637
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords2.Navigate to rPlates Settings Page
    RMSWebsiteKeywords.Logout
    RMSWebsiteKeywords.Login Page Assert
    Common.Take the Screenshot  CID-2458

RMS - C3643
    [Documentation]    Verify that user can click Notification
    [Tags]   CID:3643
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords2.Navigate to rPlates Settings Page
    RMSWebsiteKeywords2.Click on Notifications icon
    RMSWebsiteKeywords2.Notification Screen Assert
    Common.Take the Screenshot  CID-3643

#####  Vehicle Details STOLEN One Plate Settings   #####################################################

#RMS - C2469
#    [Documentation]  Verify the layout of the confirmation message for Report rPlate
#    [Tags]  CID:2469
#    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
#    RMSWebsiteKeywords.Check in Search Box
#    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
#    RMSWebsiteKeywords2.Open Sudha Vehicle Details
#    RMSWebsiteKeywords2.Navigate to rPlates Settings Page
#    RMSWebsiteKeywords2.Assign Stolen Confirmation

#RMS - C2471
#    [Documentation]  Verify that User is allowed to click on NO button
#    [Tags]  CID:2471
#    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
#    RMSWebsiteKeywords.Check in Search Box
#    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
#    RMSWebsiteKeywords2.Open Sudha Vehicle Details
#    RMSWebsiteKeywords2.Navigate to rPlates Settings Page
#    RMSWebsiteKeywords2.Assign Stolen Confirmation
#    RMSWebsiteKeywords2.Cancel Stolen Confirmation

#####  Vehicle Details REATTACHED One Plate   #####################################################

RMS - C2473
    [Documentation]  Verify the layout of the confirmation message for Vehicle Details REATTACHED
    [Tags]  CID:2473
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     2FZHATDC67AY53669
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords2.Navigate to rPlates Settings Page
    RMSWebsiteKeywords2.Assign REATTACHED Confirmation

RMS - C2475
    [Documentation]  	Verify that User is allowed to click on NO button
    [Tags]  CID:2475
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     2FZHATDC67AY53669
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords2.Navigate to rPlates Settings Page
    RMSWebsiteKeywords2.Assign REATTACHED Confirmation
    RMSWebsiteKeywords2.Cancel REATTACHED Confirmation

##############################Vehicle Details Plate Setting ON############################################

#RMS - C2466
#    [Documentation]    Verify that Report your rPlate as Stolen can be set to NO
#    [Tags]   CID:2466
#    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
#    RMSWebsiteKeywords.Check in Search Box
#    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
#    RMSWebsiteKeywords2.Open Sudha Vehicle Details
#    RMSWebsiteKeywords2.Navigate to rPlates Settings Page
#    RMSWebsiteKeywords2.Click on Plate Stolen and Choose Your Option    id=no
#    RMSWebsiteKeywords2.rPlate Settings Assert       #Plate not stolen Assert
#    Common.Take the Screenshot  CID-2466

#RMS - C2465
#    [Documentation]    Verify that Report your rPlate as Stolen can be set to Yes
#    [Tags]   CID:2465
#    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
#    RMSWebsiteKeywords.Check in Search Box
#    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
#    RMSWebsiteKeywords2.Open Sudha Vehicle Details
#    RMSWebsiteKeywords2.Navigate to rPlates Settings Page
#    RMSWebsiteKeywords2.Click on Plate Stolen and Choose Your Option    id=yes
#    RMSWebsiteKeywords2.rPlate Stolen Assert
#    Common.Take the Screenshot  CID-2465

############################## Refinements ############################################


RMS - C2480
    [Documentation]   		Verify if FMC Company has all assigned rPlates and Client have 0
    [Tags]   CID:2480
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Check FMC Dashboard for A rPlates and 0 Clients

RMS - C2485
    [Documentation]   		Verify if FMC Company has 0 Trips and Clients have 0 Trips
    [Tags]   CID:2485
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Navigate to Telematics Screen
     RMSWebsiteKeywords2.Check FMC Telematics for 0 trips

RMS - C2487
    [Documentation]   		Verify if FMC Company has 1 or more Campaigns and Client have 0 Campaigns
    [Tags]   CID:2487
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Navigate to FMC Campaign Screen
     RMSWebsiteKeywords2.Check 1 Campaign for FMC and 0 for Client

RMS - C2490
    [Documentation]   	Verify if FMC Company has 1 or more Campaigns and Clients have 1 or more Campaigns
    [Tags]   CID:2490
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Navigate to FMC Campaign Screen
     RMSWebsiteKeywords2.Check 1 Campaign for FMC and 1 for Client

RMS - C2494
    [Documentation]   		Verify if FMC Company has 1 or more Campaigns Groups and Clients have 1 or more Campaigns Groups
    [Tags]   CID:2494
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords.Enter Campaign Groups Settings
     RMSWebsiteKeywords2.Check 1 Campaign Group for FMC and 1 for Client

RMS - C2495
    [Documentation]   		Verify if FMC Company has 1 or more Campaigns Zones and Client have 0 Campaigns Zones
    [Tags]   CID:2495
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Manage Campaign Zones FMC
     RMSWebsiteKeywords2.Check 1 Campaign Zone for FMC and 0 for Client

RMS - C2498
    [Documentation]   		Verify if FMC Company has 1 or more Campaigns Zones and Clients have 1 or more Campaigns Zones
    [Tags]   CID:2498
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Manage Campaign Zones FMC
     RMSWebsiteKeywords2.Check 1 Campaign Zone for FMC and 1 for Client

RMS - C2499
    [Documentation]   Verify the layout changes of Settings > Client Management
    [Tags]   CID:2499
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords.Enter Settings Page
     RMSWebsiteKeywords2.Enter Client Management Settings
     RMSWebsiteKeywords2.Click on Add New Client
     Common.Take the Screenshot  CID-2499

RMS - C2500
    [Documentation]   Verify the layout changes of Settings > Account Preferences
    [Tags]   CID:2500
    RMSWebsiteKeywords.Login   ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Click on Account Preferences
    RMSWebsiteKeywords2.Account Preferences Assert
    Common.Take the Screenshot  CID-2500

RMS - C2501
    [Documentation]   Verify the No Zone Scenario in Manage Campaign Zones
    [Tags]   CID:2501
    RMSWebsiteKeywords.Login   ${USER_SMBAdmin2}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter Manage Campaign Zones FMC
    RMSWebsiteKeywords2.No Zone Scenario SMB
    Common.Take the Screenshot  CID-2501

RMS - C2502
    [Documentation]   	Verify the No Group Scenario in Manage Campaign Groups
    [Tags]   CID:2502
    RMSWebsiteKeywords.Login   ${USER_SMBAdmin2}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Enter Campaign Groups Settings
    RMSWebsiteKeywords2.No Group Scenario SMB
    Common.Take the Screenshot  CID-2502


RMS - C2503
    [Documentation]   		Verify the No Trips Scenario in SMB Telematics      #1894
    [Tags]   CID:2503
    RMSWebsiteKeywords.Login   ${USER_SMBAdmin2}
    #RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords.Navigate to Telematics Screen
    #RMSWebsiteKeywords2.0 Trips SMB Telematics
    Common.Take the Screenshot  CID-2503


RMS - C2506
    [Documentation]   		Verify delete functionality is removed from Campaign Details SMB
    [Tags]   CID:2506
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included
    RMSWebsiteKeywords2.Search a Campaign    	DontDelete
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="DontDelete"]
    RMSWebsiteKeywords2.Campaign Detail Page Layout Assert
    Common.Take the Screenshot  CID-2506

RMS - C2507
    [Documentation]   		Verify delete functionality is removed from Campaign Details SMB
    [Tags]   CID:2507
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords2.Navigate to FMC Campaign Screen
    RMSWebsiteKeywords2.Search a Campaign    DontDelete
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="DontDelete"]
    RMSWebsiteKeywords2.Campaign Detail Page Layout Assert
    Common.Take the Screenshot  CID-2507

RMS - C2508
    [Documentation]   			Verify No Campaign Message in SMB Flow
    [Tags]   CID:2508
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin2}
    RMSWebsiteKeywords2.Navigate to Campaign Screen
    RMSWebsiteKeywords2.Search a Campaign    	Dontdelete
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="Dontdelete"]
    RMSWebsiteKeywords2.Campaign Detail No Campaign Message
    Common.Take the Screenshot  CID-2508


RMS - C2509
    [Documentation]   			Verify No Campaign Message in SMB Flow
    [Tags]   CID:2509
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin2}
    RMSWebsiteKeywords2.Navigate to Campaign Screen
    RMSWebsiteKeywords2.Search a Campaign    	Dontdelete
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="Dontdelete"]
    RMSWebsiteKeywords2.Campaign Detail No Campaign Message
    Common.Take the Screenshot  CID-2509

################################## Dealer Flow ##################################################

################################## Dealer Flow ##################################################

################################## Dealer View-Vehicle Details #################################

RMS - C2620
    [Documentation]  	Verify the layout of the Vehicle Detail Page
    [Tags]   CID:2620
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     		1N4BA41E74C829102
    RMSWebsiteKeywords2.Open Naman2 Vehicle Details
    RMSWebsiteKeywords2.Dealer Naman2 Vehicle Details Assert
    Common.Take the Screenshot  CID-2620

RMS - C2623
    [Documentation]  		Verify user is able to navigate to rPlate Settings page
    [Tags]   CID:2623
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	1N4BA41E74C829102
    RMSWebsiteKeywords2.Open Naman2 Vehicle Details
    RMSWebsiteKeywords2.Navigate to rPlates Settings Page
    Common.Take the Screenshot  CID-2623


RMS - C2624
    [Documentation]  			Verify that User can sign out from the Application for Dealer
    [Tags]   CID:2624
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	1N4BA41E74C829102
    RMSWebsiteKeywords2.Open Naman2 Vehicle Details
    RMSWebsiteKeywords.Logout
    Common.Take the Screenshot  CID-2624

RMS - C2625
    [Documentation]  			Verify that user can click Notification for Dealer
    [Tags]   CID:2625
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	1N4BA41E74C829102
    RMSWebsiteKeywords2.Open Naman2 Vehicle Details
    RMSWebsiteKeywords2.Click on Notifications icon
    RMSWebsiteKeywords2.Notification Screen Assert
    Common.Take the Screenshot  CID-2625


################################## Dealer View-Vehicle Details #################################

RMS - C2652
    [Documentation]  			Verify that user can click Notification for Dealer
    [Tags]   CID:2652
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	JHLRD1764WC444228
    RMSWebsiteKeywords2.Open Naman2 Vehicle Details
    RMSWebsiteKeywords2.Click on Transfer RPlate
    RMSWebsiteKeywords2.Click on Notifications icon
    RMSWebsiteKeywords2.Notification Screen Assert
    Common.Take the Screenshot  CID-2652

RMS - C2653
    [Documentation]  				Verify Service Plan is Elite By Default
    [Tags]   CID:2653
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	JHLRD1764WC444228
    RMSWebsiteKeywords2.Open Naman2 Vehicle Details
    RMSWebsiteKeywords2.Click on Transfer RPlate   #Asset included for Elite by Default
    Common.Take the Screenshot  CID-2653


RMS - C2655
    [Documentation]  				Verify User can Cancel Ownership flow
    [Tags]   CID:2655
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	JHLRD1764WC444228
    RMSWebsiteKeywords2.Open Naman2 Vehicle Details
    RMSWebsiteKeywords2.Click on Transfer RPlate   #Asset included for Elite by Default
    RMSWebsiteKeywords2.Cancel Transfer
    Common.Take the Screenshot  CID-2655

RMS - C2657
    [Documentation]  	Verify system can validate Character limit in First Name
    [Tags]   CID:2657
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	JHLRD1764WC444228
    RMSWebsiteKeywords2.Open Naman2 Vehicle Details
    RMSWebsiteKeywords2.Click on Transfer RPlate   #Asset included for Elite by Default
    RMSWebsiteKeywords2.Check Character Limit on FirstName
    Common.Take the Screenshot  CID-2657

RMS - C2659
    [Documentation]  	Verify system can validate format of email address
    [Tags]   CID:2659
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	JHLRD1764WC444228
    RMSWebsiteKeywords2.Open Naman2 Vehicle Details
    RMSWebsiteKeywords2.Click on Transfer RPlate   #Asset included for Elite by Default
    RMSWebsiteKeywords2.Check Valid Email
    Common.Take the Screenshot  CID-2659

####################### Dealer View-rPlate Transfer Confirm  #############################

RMS - C2646
    [Documentation]  		Verify the invitation sent confirmation for rplate transfer for Elite
    [Tags]   CID:2646
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	JHLRD1764WC444228
    RMSWebsiteKeywords2.Open Vehicle Details
    RMSWebsiteKeywords2.Click on Transfer RPlate   #Asset included for Elite by Default
    RMSWebsiteKeywords2.Fill Mandatory Field and Send Invitation on RPlate Transfer Page
    RMSWebsiteKeywords2.Invitation Sent Assert
    RMSWebsiteKeywords2.Inviation Delete
    Common.Take the Screenshot  CID-2646


RMS - C2649
    [Documentation]  		Verify the functionality of OK button on invitation sent confirmation for Elite
    [Tags]   CID:2649
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	JHLRD1764WC444228
    RMSWebsiteKeywords2.Open Vehicle Details
    RMSWebsiteKeywords2.Click on Transfer RPlate   #Asset included for Elite by Default
    RMSWebsiteKeywords2.Fill Mandatory Field and Send Invitation on RPlate Transfer Page
    RMSWebsiteKeywords2.Invitation Sent Assert
    RMSWebsiteKeywords2.Inviation Delete
    Common.Take the Screenshot  CID-2649


####################### VIN Mismatch  ###########################################################

#RMS - C2641
#    [Documentation]  		Verify VIN Mismatch > Cancel for transferring RPlate if VIN is Changed and User doesnt exists
#    [Tags]   CID:2641
#    RMSWebsiteKeywords.Login  ${USER_Dealer}
#    RMSWebsiteKeywords.Check in Search Box
#    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     		JHLRD1764WC444228
#    RMSWebsiteKeywords2.Open Vehicle Details
#    RMSWebsiteKeywords2.Click on Transfer RPlate   #Asset included for Elite by Default
#    RMSWebsiteKeywords2.Fill Mandatory Field with VIN Change and Send Invitation on RPlate Transfer Page
#    RMSWebsiteKeywords2.VIN Mismatch
#    Common.Take the Screenshot  CID-2641

####################### Dealer View-Vehicle Details Resend Invite  #############################


RMS - C2626
    [Documentation]  			Verify Dealer can resend the invite for Elite Plan
    [Tags]   CID:2626
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     JHLRD1764WC444228
    RMSWebsiteKeywords2.Open Vehicle Details
    RMSWebsiteKeywords2.Click on Transfer RPlate   #Asset included for Elite by Default
    RMSWebsiteKeywords2.Fill Mandatory Field and Send Invitation on RPlate Transfer Page
    RMSWebsiteKeywords2.Invitation Sent Assert
    RMSWebsiteKeywords2.Resend Invitation to User
    RMSWebsiteKeywords2.Inviation Delete
    Common.Take the Screenshot  CID-2626

RMS - C2628
    [Documentation]  			Verify user gets the pop up on hovering the mouse on the status
    [Tags]   CID:2628
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	JHLRD1764WC444228
    RMSWebsiteKeywords2.Open Vehicle Details
    RMSWebsiteKeywords2.Click on Transfer RPlate   #Asset included for Elite by Default
    RMSWebsiteKeywords2.Fill Mandatory Field and Send Invitation on RPlate Transfer Page
    RMSWebsiteKeywords2.Invitation Sent Assert
    RMSWebsiteKeywords2.Resend Invitation to User
    RMSWebsiteKeywords2.Inviation Delete
    Common.Take the Screenshot  CID-2628

RMS - C2629
    [Documentation]  		Verify the pop up hides when user clicks on resent invite button
    [Tags]   CID:2629
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	JHLRD1764WC444228
    RMSWebsiteKeywords2.Open Vehicle Details
    RMSWebsiteKeywords2.Click on Transfer RPlate   #Asset included for Elite by Default
    RMSWebsiteKeywords2.Fill Mandatory Field and Send Invitation on RPlate Transfer Page
    RMSWebsiteKeywords2.Invitation Sent Assert
    RMSWebsiteKeywords2.Resend Invitation to User
    RMSWebsiteKeywords2.Inviation Delete
    Common.Take the Screenshot  CID-2629

####################### Dealer View-Vehicle Details Resend Invite  #############################

RMS - C2630
    [Documentation]  		Verify Dealer can delete the invite for Elite Plan
    [Tags]   CID:2630
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	JHLRD1764WC444228
    RMSWebsiteKeywords2.Open Vehicle Details
    RMSWebsiteKeywords2.Click on Transfer RPlate   #Asset included for Elite by Default
    RMSWebsiteKeywords2.Fill Mandatory Field and Send Invitation on RPlate Transfer Page
     RMSWebsiteKeywords2.Invitation Sent Assert
    RMSWebsiteKeywords2.Inviation Delete
    Common.Take the Screenshot  CID-2630


RMS - C2632
    [Documentation]  		Verify user can cancel the Delete Invite
    [Tags]   CID:2632
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	JHLRD1764WC444228
    RMSWebsiteKeywords2.Open Vehicle Details
    RMSWebsiteKeywords2.Click on Transfer RPlate   #Asset included for Elite by Default
    RMSWebsiteKeywords2.Fill Mandatory Field and Send Invitation on RPlate Transfer Page
    RMSWebsiteKeywords2.Invitation Sent Assert
    RMSWebsiteKeywords2.Invitation Delete Cancel
    RMSWebsiteKeywords2.Inviation Delete
    Common.Take the Screenshot  CID-2632

RMS - C2633
    [Documentation]  		Verify the pop up hides when user clicks on Delete invite button
    [Tags]   CID:2633
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	JHLRD1764WC444228
    RMSWebsiteKeywords2.Open Vehicle Details
    RMSWebsiteKeywords2.Click on Transfer RPlate   #Asset included for Elite by Default
    RMSWebsiteKeywords2.Fill Mandatory Field and Send Invitation on RPlate Transfer Page
    RMSWebsiteKeywords2.Invitation Sent Assert
    RMSWebsiteKeywords2.Invitation Delete Cancel
    RMSWebsiteKeywords2.Inviation Delete
    Common.Take the Screenshot  CID-2633

 ####################### Vehicle Assignment Complete  #############################

RMS - C2683
    [Documentation]  Verify the Vehicle Assignment Complete Page for SMB
    [Tags]  CID:2683
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Make Selection v0.2
    RMSWebsiteKeywords.Action Button Assert v0.2
    RMSWebsiteKeywords2.Click on Assign Vehicle
    RMSWebsiteKeywords2.Assign Vehicle Page Assert
    Common.Take the Screenshot  CID-2683

RMS - C2686
    [Documentation]  Verify the functionality of Logout button on Vehicle Assignment Complete Page for SMB
    [Tags]  CID:2686
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Make Selection v0.2
    RMSWebsiteKeywords.Action Button Assert v0.2
    RMSWebsiteKeywords2.Click on Assign Vehicle
    RMSWebsiteKeywords2.Assign Vehicle Page Assert
    RMSWebsiteKeywords.Logout
    Common.Take the Screenshot  CID-2686

RMS - C2670
    [Documentation]  Verify the Authguard on the Website
    [Tags]  CID:2670
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Logout
    Common.Check AuthGuard
    Common.Take the Screenshot  CID-2670

#############################    Consumer Dashboard  #############################

RMS - C2634
    [Documentation]  Verify the Authguard on the Website
    [Tags]  CID:2634
    RMSWebsiteKeywords.Login   ${USER_DealerConsumer}
    RMSWebsiteKeywords.Logout
    Common.Check AuthGuard
    Common.Take the Screenshot  CID-2634

RMS - C2635
    [Documentation]  Verify the layout of the Consumer Dashboard
    [Tags]  CID:2635
    RMSWebsiteKeywords.Login   ${USER_DealerConsumer}
    RMSWebsiteKeywords2.Check Consumer Dashboard
    Common.Take the Screenshot  CID-2635

RMS - C2639
    [Documentation]  	Verify the Consumer is able to login with his credentials
    [Tags]  CID:2639
    RMSWebsiteKeywords.Login   ${USER_DealerConsumer}
    RMSWebsiteKeywords.Logout

RMS - C2638
    [Documentation]  	Verify that the Consumer should not have to ability to transfer
    [Tags]  CID:2638
    RMSWebsiteKeywords.Login   ${USER_DealerConsumer}
    RMSWebsiteKeywords2.Navigate to Vehicle Detail Page

RMS - C2637
    [Documentation]  	Verify the functionality accessible to Consumer
    [Tags]  CID:2637
    RMSWebsiteKeywords.Login   ${USER_DealerConsumer}
    RMSWebsiteKeywords2.Navigate to Vehicle Detail Page   #Should not have Trasfer RPlate Button

#############################   Dealership Settings Flow  #############################

RMS - C2985
    [Documentation]  	Verify User is able to see the Dealership Setting under Settings
    [Tags]  CID:2985
    RMSWebsiteKeywords.Login   ${USER_Dealer}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Navigate to Dealer Settings

RMS - C2987
    [Documentation]  	Verify that user is rediercted to Settings page on clicking Settings breadcrum hyperlink on top of Dealership Setting page
    [Tags]  CID:2987
    RMSWebsiteKeywords.Login   ${USER_Dealer}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Navigate to Dealer Settings
    RMSWebsiteKeywords2.Navigate to Settings via breadcrumb

RMS - C3001
    [Documentation]  		Verify the Layout of Dealership Setting Page
    [Tags]  CID:3001
    RMSWebsiteKeywords.Login   ${USER_Dealer}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Navigate to Dealer Settings

RMS - C2988
    [Documentation]  	Verify that Upload New button displayed on Dealership Settings is working
    [Tags]  CID:2988
    RMSWebsiteKeywords.Login   ${USER_Dealer}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Navigate to Dealer Settings
    RMSWebsiteKeywords2.Check Upload Layout

RMS - C2990
    [Documentation]  	Verify that if user selects any other file of wrong format , say .txt file , an error message should be displayed
    [Tags]  CID:2990
    RMSWebsiteKeywords.Login   ${USER_Dealer}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Navigate to Dealer Settings
    #RMSWebsiteKeywords2.Check Upload Layout
    RMSWebsiteKeywords2.Upload Txt File



RMS - C2991
    [Documentation]  	Verify the layout of Dealership Setting Upload Screen
    [Tags]  CID:2991
    RMSWebsiteKeywords.Login   ${USER_Dealer}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Navigate to Dealer Settings
    #RMSWebsiteKeywords2.Check Upload Layout
    RMSWebsiteKeywords2.Upload JPG File

RMS - C2992
    [Documentation]  	Verify no other functionality is working except Cancel and Save button when Dealership Settings upload screen is open
    [Tags]  CID:2992
    RMSWebsiteKeywords.Login   ${USER_Dealer}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Navigate to Dealer Settings
    #RMSWebsiteKeywords2.Check Upload Layout
    RMSWebsiteKeywords2.Upload JPG File

#############################   RConnect Branding Changes  #############################

RMS - C3002
    [Documentation]   	Verify the branding changes on Login Screen
    [Tags]  CID:3002
    RMSWebsiteKeywords.Login Page Assert

RMS - C3003
    [Documentation]   			Verify the branding changes on Dashboard Screen for FMC Admin
    [Tags]   CID:3003
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Check FMC Dashboard

RMS - C3005
    [Documentation]  Verify the branding changes on Dashboard Screen for SMB Admin
    [Tags]  CID:3005
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Dashboard Page Assert


RMS - C3006
    [Documentation]  Verify the branding changes on Dashboard Screen for Dealer
    [Tags]  CID:3006
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Dashboard Page Assert

RMS - C3008
    [Documentation]   	Verify the branding changes on Vehicle Detail Screen for FMC Admin
    [Tags]   CID:3008
     RMSWebsiteKeywords.Login   ${USER_FMCAdmin}
     RMSWebsiteKeywords2.Select My rPlate
     RMSWebsiteKeywords2.Open rPlate Details
     RMSWebsiteKeywords2.Check rPlate Detail Page

RMS - C3011
    [Documentation]  		Verify the branding changes on Vehicle Detail Screen for Dealer
    [Tags]   CID:3011
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	1N4BA41E74C829102
    RMSWebsiteKeywords2.Open Naman2 Vehicle Details
    RMSWebsiteKeywords2.Dealer Naman2 Vehicle Details Assert


RMS - C3010
    [Documentation]    Verify the branding changes on Vehicle Detail Screen for SMB Admin
    [Tags]   CID:3010
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords2.Navigate to rPlates Settings Page
    RMSWebsiteKeywords2.rPlate Settings Assert


RMS - C3020
    [Documentation]   			Verify the branding changes on Campaign Screen for FMC Admin
    [Tags]   CID:3020
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords2.Navigate to FMC Campaign Screen  #Assert included


RMS - C3022
    [Documentation]   			Verify the branding changes on Campaign Screen for SMB Admin
    [Tags]   CID:3022
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included

RMS - C3023
    [Documentation]   				Verify the branding changes on Campaign Screen for Dealer
    [Tags]   CID:3023
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords2.Navigate to Campaign Screen  #Assert included

RMS - C3025
    [Documentation]    	Verify the branding changes on Settings Screen for SMB Admin
    [Tags]   CID:3025
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter User Management Screen
    RMSWebsiteKeywords2.Enter Settings Page From User Management Top Nav
    RMSWebsiteKeywords.Settings Page Assert

RMS - C3027
    [Documentation]    	Verify the branding changes on Settings Screen for FMC Admin
    [Tags]   CID:3027
    RMSWebsiteKeywords.Login  ${USER_FMCAdmin}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Enter User Management Screen
    RMSWebsiteKeywords2.Enter Settings Page From User Management Top Nav
    RMSWebsiteKeywords.Settings Page Assert FMC

RMS - C3028
    [Documentation]  	Verify the branding changes on Settings Screen for Dealer
    [Tags]  CID:3028
    RMSWebsiteKeywords.Login   ${USER_Dealer}
    RMSWebsiteKeywords.Enter Settings Page
    RMSWebsiteKeywords2.Navigate to Dealer Settings



 #############################   Plate customization #############################

RMS - C3249
    [Documentation]  	Verify the Layout of Customize Plate Screen
    [Tags]  CID:3249
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Vehicle Details
    RMSWebsiteKeywords2.Navigate to Customize plate screen
    RMSWebsiteKeywords2.Customize RPlate assert

RMS - C3253
    [Documentation]  	Verify functionality of Cancel Button on Change Logo screen
    [Tags]  CID:3253
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Vehicle Details
    RMSWebsiteKeywords2.Navigate to Customize plate screen
    RMSWebsiteKeywords2.Choose a snoopy logo
    RMSWebsiteKeywords2.Click on cancel button
    RMSWebsiteKeywords2.Navigate to Customize plate screen
    RMSWebsiteKeywords2.Page should not contain snoopy logo assert

RMS - C3254
    [Documentation]  	Verify functionality of Apply Button on Change Logo screen
    [Tags]  CID:3254
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Vehicle Details
    RMSWebsiteKeywords2.Navigate to Customize plate screen
    RMSWebsiteKeywords2.Choose a snoopy logo
    RMSWebsiteKeywords2.Click on publish button
    RMSWebsiteKeywords2.Navigate to Customize plate screen
    RMSWebsiteKeywords2.Page should contain snoopy logo assert

RMS - C3258
    [Documentation]  	Verify functionality of Cancel Button on Change Banner screen
    [Tags]  CID:3258
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Vehicle Details
    RMSWebsiteKeywords2.Navigate to Customize plate screen
    RMSWebsiteKeywords2.Choose a Hello banner
    RMSWebsiteKeywords2.Click on cancel button
    RMSWebsiteKeywords2.Navigate to Customize plate screen
    RMSWebsiteKeywords2.Page should not contain Hello banner assert

RMS - C3261
    [Documentation]  	Verify functionality of delete button of Logo screen on customize plate screen
    [Tags]  CID:3261
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Vehicle Details
    RMSWebsiteKeywords2.Navigate to Customize plate screen
    RMSWebsiteKeywords2.Delete snoopy logo
    RMSWebsiteKeywords2.Click on publish button
    RMSWebsiteKeywords2.Navigate to Customize plate screen
    RMSWebsiteKeywords2.Page should not contain snoopy logo assert

RMS - C3262
    [Documentation]  	Verify functionality of delete button of Banner screen on customize plate screen
    [Tags]  CID:3262
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Vehicle Details
    RMSWebsiteKeywords2.Navigate to Customize plate screen
    RMSWebsiteKeywords2.Choose a Hello banner
    RMSWebsiteKeywords2.Delete a Hello banner
    RMSWebsiteKeywords2.Page should not contain Hello banner assert

RMS - C3263
    [Documentation]  	Verify functionality of Cancel button on customize plate screen
    [Tags]  CID:3263
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Vehicle Details
    RMSWebsiteKeywords2.Navigate to Customize plate screen
    RMSWebsiteKeywords2.Click on cancel button
    RMSWebsiteKeywords2.Dealer Naman2 Vehicle Details Assert

RMS - C3266
    [Documentation]  	Verify functionality of Publish button on customize plate screen
    [Tags]  CID:3266
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12113131111111111
    RMSWebsiteKeywords2.Open Vehicle Details
    RMSWebsiteKeywords2.Navigate to Customize plate screen
    RMSWebsiteKeywords2.Choose a Hello banner
    RMSWebsiteKeywords2.Click on publish button
    RMSWebsiteKeywords2.Navigate to Customize plate screen
    RMSWebsiteKeywords2.Page should contain Hello banner assert

#############################  Deactivated Plate #############################

RMS - C3882
    [Documentation]  Verify user can view vehicle details page when plate is deactivated for SMB
    [Tags]  CID:3882
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin2}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12345678912345672
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords.Check Vehicle Detail Page


RMS - C3883
    [Documentation]  	Verify user can edit vehicle name when plate is deactivated for SMB
    [Tags]  CID:3883
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin2}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12345678912345672
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords.Check Vehicle Detail Page
    RMSWebsiteKeywords2.Change Vehicle Name


RMS - C3885
    [Documentation]  	Verify user can view Telematics (if available as per the plan/ service) when plate is deactivated for SMB
    [Tags]  CID:3885
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin2}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12345678912345672
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords.Check Vehicle Detail Page
    RMSWebsiteKeywords2.Navigate to Tele

RMS - C3886
    [Documentation]  	Verify user can view scheduled campaigns when plate is deactivated for SMB
    [Tags]  CID:3886
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin2}
    RMSWebsiteKeywords2.Navigate to Campaign Screen
    RMSWebsiteKeywords2.Search a Campaign    	Dontdelete
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="Dontdelete"]

RMS - C3887
    [Documentation]  Verify user cannot set Geofence when plate is deactivated for SMB for SMB
    [Tags]  CID:3887
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin2}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12345678912345672
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords.Check Vehicle Detail Page

RMS - C3889
    [Documentation]  Verify that Reattach Button is disabled on Rplate settings for SMB
    [Tags]  CID:3889
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin2}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12345678912345672
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords.Check Vehicle Detail Page
    RMSWebsiteKeywords2.Navigate to rPlates Settings Page for Deactivated Vehicle

RMS - C3890
    [Documentation]  Verify user cannot set the Real-time data vehicle tracking for SMB
    [Tags]  CID:3890
    RMSWebsiteKeywords.Login  ${USER_SMBAdmin2}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     12345678912345672
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords.Check Vehicle Detail Page
    RMSWebsiteKeywords2.Navigate to rPlates Settings Page for Deactivated Vehicle

#######

RMS - C3900
    [Documentation]  Verify user can view vehicle details page when plate is deactivated for Dealer
    [Tags]  CID:3900
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	2G2WR554461322554
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords.Check Vehicle Detail Page


RMS - C3901
    [Documentation]  	Verify user can edit vehicle name when plate is deactivated for Dealer
    [Tags]  CID:3901
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	2G2WR554461322554
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords.Check Vehicle Detail Page
    RMSWebsiteKeywords2.Change Vehicle Name


RMS - C3903
    [Documentation]  	Verify user can view Telematics (if available as per the plan/ service) when plate is deactivated for Dealer
    [Tags]  CID:3903
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     	2G2WR554461322554
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords.Check Vehicle Detail Page
    RMSWebsiteKeywords2.Navigate to Tele

RMS - C3904
    [Documentation]  	Verify user can view scheduled campaigns when plate is deactivated for Dealer
    [Tags]  CID:3904
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords2.Navigate to Campaign Screen
    RMSWebsiteKeywords2.Search a Campaign    	Dontdelete
    RMSWebsiteKeywords2.Edit Campaign    //a[text()="Dontdelete"]

RMS - C3905
    [Documentation]  Verify user cannot set Geofence when plate is deactivated for Dealer
    [Tags]  CID:3887
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     2G2WR554461322554
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords.Check Vehicle Detail Page

RMS - C3907
    [Documentation]  Verify that Reattach Button is disabled on Rplate settings for Dealer
    [Tags]  CID:3907
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     2G2WR554461322554
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords.Check Vehicle Detail Page
    RMSWebsiteKeywords2.Navigate to rPlates Settings Page for Deactivated Vehicle

RMS - C3908
    [Documentation]  Verify user cannot set the Real-time data vehicle tracking for Dealer
    [Tags]  CID:3890
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     2G2WR554461322554
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords.Check Vehicle Detail Page
    RMSWebsiteKeywords2.Navigate to rPlates Settings Page for Deactivated Vehicle

RMS - C3908
    [Documentation]  Verify user cannot set the Real-time data vehicle tracking for Dealer
    [Tags]  CID:3890
    RMSWebsiteKeywords.Login  ${USER_Dealer}
    RMSWebsiteKeywords.Check in Search Box
    RMSWebsiteKeywords.Type in Search box    //*[@id="search"]     2G2WR554461322554
    RMSWebsiteKeywords2.Open Sudha Vehicle Details
    RMSWebsiteKeywords.Check Vehicle Detail Page
    RMSWebsiteKeywords2.Navigate to rPlates Settings Page for Deactivated Vehicle