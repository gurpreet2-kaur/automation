*** Settings ***
Documentation  Adding the pre-build libraries
Library           Selenium2Library
Library           Collections
Library           Screenshot

*** Variables ***
${RMS.Email_Xpath}    //*[@id="e-mail"]    # Email Xpath
${RMS.Password_Xpath}    //*[@id="password"]    # Password Xpath
${RMS.SignIn_CSSSelector}    css=body > app-root > login > div > div.parent_div > div.container.container-table > div > div > div > div.panel-body > form > button    # SignIn Button CSS Selector
${RMS.List_Icon}   css=body > app-root > vehicles > div > div > div > div.row.horizontal_div2 > div > div.col-lg-3.col-md-3.col-sm-3 > div > div > div > button:nth-child(1)
${RMS.First_Red_Vehicle_GridView}   //*[starts-with(@class, 'row_border_top changeBorderRed')]
${RMS.First_Red_Vehicle_ListView}   //*[contains(@src, 'red.svg')]
${RMS.First_Green_Vehicle_ListView}   //img[contains(@src, 'green.svg')]
${RMS.SelectedGridViewButton}     //img[contains(@src, '../assets/images/Dashboard_common/grid_view_click.svg')]
${RMS.SelectedListViewButton}     //img[contains(@src, '../assets/images/Dashboard_common/list_view_click.svg')]
${RMS.DisabledActionButton}    //button[@id="action" and @disabled=""]
${RMS.EnabledActionButton}      xpath=//*[@id="action"]
${RMS.ActionButton_DropDown1}       Change Vehicle Group
${RMS.ActionButton_DropDown1v0.2}    Assign Vehicle
${RMS.ActionButton_DropDown2}     Display Campaign Message
${RMS.ActionButton_DropDown3}     Renew Registration
${RMS.RenewRegistrationDropDownGrid}    css=body > app-root > vehicles > div > div > div > div.row.horizontal_div3 > div > div > div > div > div.col-sm-1.col-md-1.col-lg-1 > div > ul > li:nth-child(1) > a
${RMS.RenewRegistrationDropDownList}    css=body > app-root > vehicles > div > div > div > div.row.horizontal_div3 > div > div > div > div > div.col-sm-1.col-md-1.col-lg-1 > div > ul > li:nth-child(1) > a
${RMS.RenewRegTermsConditionsCheckBox}    id=cb1
${RMS.SearchText}    3SAM123
${RMS.SearchElement}    id=search
${RMS.ActiveSelection}   //*[contains(@class, 'row row_body active')]
${RMS.First Selection}   css=#example > tbody > tr:nth-child(1) > td.filterable-cell.table_column4
${RMS.First Selectionv0.2}    id=vehicleNameId0

${RMS.Second Selection}   css=#example > tbody > tr:nth-child(2) > td.filterable-cell.table_column4
${RMS.Second Selectionv0.2}   id=vehicleNameId1
${RMS.Filterbutton}   id=filter
${RMS.FilterbuttonCancel}   xpath=//button[text()="Cancel"]
${RMS.FilterbuttonApply}   xpath=//button[text()="Apply"]
${RMS.FilterWired}   css=#myModal > div > div.modal-body.container-fluid > div:nth-child(6) > div > button:nth-child(3)
${RMS.FilterNonWired}     css=#myModal > div > div.modal-body.container-fluid > div:nth-child(6) > div > button:nth-child(4)
${RMS.FilterActivated}    css=#myModal > div > div.modal-body.container-fluid > div:nth-child(7) > div > button:nth-child(3)
${RMS.ResetFilter}   xpath=//a[contains(text(),"Reset Filters")]
${RMS.FilterPlateModelrPlatePro}   xpath=//input[@value="rPlatePro"]
${RMS.FilterPlateModelrPlateProActive}   xpath=//input[@class='btn btnHeight42px btnFontSize btn-rounded btn_filter active' and @value = 'rPlatePro']

${RMS.VehicleListPlateModelrPlateColumn}   xpath=//td[@class="filterable-cell table_column11 text-align-left" and text() = 'rPlate']
${RMS.VehicleListPlateModelrPlateProColumn}   xpath=//td[@class="filterable-cell table_column11 text-align-left" and text() = 'rPlatePro']
${RMS.FilterBodyTypeSUV}   xpath=//select[@id='model']/option[text() = 'SUV']
${RMS.VehicleListBodyTypeSUVColumn}   xpath=//td[@class='filterable-cell table_column8 text-align-left' and text() = 'SUV']
${!RMS.VehicleListBodyTypeSUVColumn}   xpath=//td[@class='filterable-cell table_column8 text-align-left' and not(text() = 'SUV')]
${RMS.FilterPlateStatusActivated}   xpath=//input[@value = 'Activated']
${RMS.FilterPlateStatusPreregister}  id=vstatus
${RMS.FilterPlateStatusDeActivated}   xpath=//input[@value = 'Deactivated']
${RMS.FilterPlateStatusActivatedActive}   id=vstatus
${RMS.FilterPlateStatusDeActivatedActive}   id=vstatus
${RMS.VehicleListPlateStatusActivatedColumn}   id=txt
${!RMS.VehicleListPlateStatusActivatedColumn}   xpath=//td[@class='filterable-cell table_column13 text-align-left']/span[not(text() = 'Activated')]
${RMS.VehicleListPlateStatusDeActivatedColumn}   id=txt
${!RMS.VehicleListPlateStatusDeActivatedColumn}   xpath=//td[@class='filterable-cell table_column13 text-align-left']/span[not(text() = 'Deactivated')]
${RMS.FilterStateCA}   xpath=//select[@id='state']/option[text() = 'CA']
${RMS.FilterYear2017}   xpath=//select[@id='year']/option[text()='2017']
${RMS.VehicleListStateCAColumn}   id=state
${!RMS.VehicleListStateCAColumn}   xpath=//td[@class='filterable-cell table_column6 text-align-center' and not(text() = 'CA')]
${RMS.VehicleListYear2017Column}   id=year
${!RMS.VehicleListYear2017Column}   xpath=//td[@class='filterable-cell table_column9 text-align-left' and not(text()='2017')]
${RMS.FilterApply}   xpath=//button[text() = 'Apply']
${RMS.FilterApplied}   xpath=//span[text()='Filter Applied']
${RMS.CAFilterApplied}   xpath=//span[@id='txt' and contains(text(),'CA')]/i[@class='fa fa-times-circle cross']
${RMS.SUVFilterApplied}   xpath=//span[@id='txt' and contains(text(),'SUV')]/i[@class='fa fa-times-circle cross']
${RMS.rPlateProFilterApplied}   xpath=//span[@id='txt' and contains(text(),'rPlatePro')]/i[@class='fa fa-times-circle cross']
${RMS.PreregisteredFilterApplied}   id=vstatus
${RMS.ActivatedFilterApplied}   xpath=//span[@id='txt' and contains(text(),'Activated')]/i[@class='fa fa-times-circle cross']
${RMS.ChangeVehicleGroupDropDownList}   xpath=//a[@class='popover_content cursorPointer' and text()='Change Vehicle Group']
${RMS.ChangeVehicleGroupLayoverCancel}  xpath=//button[text()="Cancel"]

${RMS.VIN_PTHHP5AYKJA002773}   xpath=//a[@class='link_generic' and text()='PTHHP5AYKJA002773']
${RMS.SettingsButton}    xpath=//div[text()="SETTINGS"]
${RMS.DashboardButton}   xpath=//div[text()="DASHBOARD"]
${RMS.TelematicsButton}   xpath=//div[text()="TELEMATICS"]
${RMS.CampaignButton}   xpath=//div[text()="CAMPAIGNS"]
${RMS.HelpButton}   xpath=//div[text()="SUPPORT"]
${RMS.SettingsPageTitle}   xpath=//span[contains(text(),'Settings - Welcome, ')]
${RMS.SettingsPageIntro}   xpath=//div/span[contains(text(),'Settings lets you view and change account preferences, security and password, user management and more.')]
${RMS.SettingsPageVehicleGroupBox}   xpath=//div[@class="custSettingDiv"]/div/h4[text()="Vehicle Groups"]
${RMS.SettingsPageCampaignGroupBox}   xpath=//h4[text()="Vehicle Groups"]
${RMS.SettingsPageCampaignZoneBox}   xpath=//h4[text()="Campaign Zones"]
${RMS.SettingsPageAccountPreferencesBox}   xpath=//h4[text()="Account Preferences"]
${RMS.SettingsPageSecurityPasswordBox}   xpath=//h4[text()="Security & Password"]
${RMS.VehicleGroupBoxIntro}   xpath=//div[contains(text(),'Manage Vehicle Groups')]
${RMS.SettingsClientManagement}   xpath=//div[contains(text(),'Client Management')]

${RMS.CampaignGroupBoxIntro}   xpath=//div[contains(text(),'Manage Vehicle Groups')]
${RMS.SettingsLink}   xpath=//a[@href='#/settings' and text()='Settings']
${RMS.VehicleGroupTitle}   xpath=//span[text()=' > Vehicle Groups']
${RMS.ManageVehicleGroupsTitle}   xpath=//p[text()='Manage Vehicle groups']

${RMS.CampaignGroupTitle}   xpath=//span[contains(text(),'Vehicle Groups')]
${RMS.ManageCampaignGroupsTitle}   xpath=//p[text()='Manage Vehicle Groups']

${RMS.EditVehicleGroupButton}   id=editbtn0
${RMS.DisabledDeleteVehicleGroupButton}   id=deleteDisabled
${RMS.NewVehicleGroupButton}   id=addNew
${RMS.FirstVehicleGroup}   id=row0
${RMS.EnabledDeleteVehicleGroupButton}   id=deleteActive
${RMS.UserIcon}   xpath=//img[contains(@src, 'drop_arrow.svg')]
${RMS.logout}   xpath=//a[text()='Log Out']
${FirstVehicleGroupName}   id=inputfield
${FirstVehicleGroupNameEdit}    id=inputfield
${FirstEditGroupCheck}   xpath=//button[text()="Save"]
${RMS.FirstAutomatedVehicleGroupName}   xpath=//div[text()=" Automation"]
${RMS.FirstAutomatedVehicleGroupSubTitle}   xpath=//p[text()=' Vehicles in Automated_Vehicle_1']
${RMS.SearchIcon}   xpath=//img[@class="search_icon"]
${RMS.FirstRedBarVehicle}   xpath=//td[normalize-space()="Jan 01 1970"]/preceding-sibling::td/img
${RMS.FirstGreenBarVehicle}   xpath=//td[normalize-space()="Apr 18 2019"]/preceding-sibling::td/img
${RMS.AssignVehicle}   xpath=//div[text()="Assign Vehicle"]
${RMS.GetFirstGroupName}
${RMS.MyrPlateGrid}   xpath=//img[contains(@src, 'my_company.svg')]
${RMS.MyrPlateSerialNumber}   id=vdetails1
${RMS.DefaultrPlateImage}     //div[@class="widthForDefaultImage"]
${RMS.rPlateSettings}   id=settingsdiv
${RMS.rPlateCommentsBox}   id=comment_area
${RMS.rPlateCommentsBoxTick}   xpath=//*[@id="tickimage"]
${RMS.rPlateCommentsBoxCancel}  xpath=//*[@id="cancelimage"]
${RMS.ViewAllComments}   xpath=//a[@class="cursorPointer link_generic" and text()="View All"]
${RMS.ViewAllCommentsOK}   xpath=//button[@class="btn btnFontSize genericActionBtn  margin_right_15 btn_width genericPrimaryBtnColor" and text()="OK"]
${RMS.VehicleNameEdit}   id=pencil
${RMS.VehicleNameTextBox}   id=vehicleName
${RMS.VehicleNameTick}     id=check
${RMS.VehicleNameCancel}     id=cancel
${RMS.DisabledVehicleData}    xpath=//span[@class="generic_text_16 disabledClass" and text()="Real Time Vehicle Data"]

*** Keywords ***

Select List View
    Click Element  ${RMS.List_Icon}
    Sleep  1

Select Vehicle Due Registartion GridView
    @{texts}    Get Webelements   ${RMS.First_Red_Vehicle_GridView}
    Click Element    @{texts}[0]
    Page Should Contain Element   ${RMS.ActiveSelection}
    Sleep  1

Select Vehicle Due Registartion ListView
    Sleep  1
    @{texts}    Get Webelements   ${RMS.First_Red_Vehicle_ListView}
    Click Element    @{texts}[1]
    Sleep  1

Select Vehicle in Green
    Sleep  2
    @{texts}    Get Webelements   ${RMS.First_Green_Vehicle_ListView}
    Click Element   @{texts}[0]
    Sleep  1

Select 2nd Vehicle in Green
    Sleep  2
    @{texts}    Get Webelements   ${RMS.First_Green_Vehicle_ListView}
    Click Element   @{texts}[1]
    Sleep  1

Select Action Button
    Sleep   1
    page should not contain element   ${RMS.DisabledActionButton}
    Sleep  1s
    Page Should Contain Element  ${RMS.EnabledActionButton}
    Click Element    ${RMS.EnabledActionButton}
    Sleep  2

Select Change Vehicle Groups Dropdown List
    Click Element   ${RMS.ChangeVehicleGroupDropDownList}
    Sleep  1s
    Page Should Contain    Select New Group for vehicles below

Cancel Change Vehicle
    Click Element    ${RMS.ChangeVehicleGroupLayoverCancel}

Select RenewRegistation Dropdown List
    Click Element    ${RMS.RenewRegistrationDropDownList}
    Sleep  2s
    Page Should Contain   Terms and Conditions

Select RenewRegistation Dropdown Grid
    Click Element    ${RMS.RenewRegistrationDropDownGrid}
    Sleep  2s
    Page Should Contain   Terms and Conditions

Check Dashboard
    Sleep  4s
    Page Should Contain   DASHBOARD
    Sleep  2s
    page should contain   Rplate Serial No.
    page should contain   VIN
    page should contain   Vehicle Name
    page should contain   License No.
    page should contain   State
    page should contain   Make
    page should contain   Year
    page should contain   Renewal Date
    page should contain   Plate Status
    page should contain element   //span[contains(text(),"Previous")]
    page should contain element   //a[contains(text(),"Next")]
    page should contain element   //span[text()="1"]
    page should contain element   ${RMS.DisabledActionButton}
    page should contain element   id=search

Check First Slide
    Wait Until Page Contains Element  css=#myCarousel > div > div.item.active

Type in the Search Box
    [Arguments]    ${RMS.SearchElement}    ${RMS.SearchText}

    wait until page contains element   ${RMS.SearchElement}
    clear element text   ${RMS.SearchElement}
    Sleep  1s
    Input Text     ${RMS.SearchElement}  ${RMS.SearchText}
    sleep   1s
    click element   ${RMS.SearchIcon}

Search Results Assert
    [Arguments]    ${RMS.SearchResult1}    ${RMS.SearchResult2}
    Page Should Contain   ${RMS.SearchResult1}
    Page Should Contain   ${RMS.SearchResult2}

Check Search Box
    Page Should Contain Element  ${RMS.SearchElement}
    #Page Should Contain   Type in Serial Number, Vehicle Number etc to search

Check Action Button
    Page Should Contain  ${RMS.ActionButton_DropDown1}
    #Page Should Contain  ${RMS.ActionButton_DropDown2}
    #Page Should Contain  ${RMS.ActionButton_DropDown3}

Check Action Button v0.2
    Page Should Contain   ${RMS.ActionButton_DropDown1v0.2}
    #page should contain   Generate PDF Report
    #Page Should Contain  ${RMS.ActionButton_DropDown2}
    #Page Should Contain  ${RMS.ActionButton_DropDown3}

Check Grid View Is Selected
    Page Should Contain Element  ${RMS.SelectedGridViewButton}

Check List View Is Selected
    Page Should Contain Element  ${RMS.SelectedListViewButton}

Make First Selection
    Wait Until Page Contains Element   ${RMS.First Selection}
    Click Element   ${RMS.First Selection}
    Sleep  2

Make First Selection v0.2
    #Wait Until Page Contains Element   ${RMS.First Selectionv0.2}
    Sleep  2
    Click Element   ${RMS.First Selectionv0.2}
    Sleep  2

Make 2nd Selection
    Wait Until Page Contains Element   ${RMS.Second Selection}
    Click Element   ${RMS.Second Selection}


Make 2nd Selection v0.2
    Wait Until Page Contains Element   ${RMS.Second Selectionv0.2}
    Click Element   ${RMS.Second Selectionv0.2}

Launch Filter
    wait until page contains element  ${RMS.Filterbutton}
    Click Element   ${RMS.Filterbutton}

Cancel Filter
    Click Element   ${RMS.FilterbuttonCancel}

Apply Filter
    Click Element   ${RMS.FilterbuttonApply}

Select the filter - wired
    Click Element  ${RMS.FilterWired}

Select the filter - nonwired
    Click Element    ${RMS.FilterNonWired}

Select the filter - activated
    Click Element    ${RMS.FilterActivated}

Reset Filter
    Click Element    ${RMS.ResetFilter}

Select Filter Plate Model - rPlatePro
    Click Element    ${RMS.FilterPlateModelrPlatePro}

Select Filter Plate Model rPlatePro Assert
    Page Should Contain Element   ${RMS.FilterPlateModelrPlateProActive}

Select Filter Body Type - SUV
    Click Element    ${RMS.FilterBodyTypeSUV}

Select Filter Plate Status - Activated
    Click Element    ${RMS.FilterPlateStatusActivated}

Select Filter Plate Status - DeActivated
    Click Element    ${RMS.FilterPlateStatusDeActivated}

Select Filter Plate Status - Pre Register
    Click Element    ${RMS.FilterPlateStatusPreregister}

Select Filter Plate Status Activated Assert
    Page Should Contain Element   ${RMS.FilterPlateStatusActivatedActive}

Select Filter Plate Status DeActivated Assert
    Page Should Contain Element   ${RMS.FilterPlateStatusDeActivatedActive}

Select Filter State - CA
    Click Element    ${RMS.FilterStateCA}
    Sleep  2s

Select Filter Year - 2017
    Click Element    ${RMS.FilterYear2017}
    Sleep  2s

Click on Apply Filter
    Click Button    ${RMS.FilterApply}
    Sleep  2s

Filter Plate Model Assert-rPlatePro
    Page Should Not Contain Element   ${RMS.VehicleListPlateModelrPlateColumn}
    Page Should Contain Element   ${RMS.VehicleListPlateModelrPlateProColumn}

Filter Body Type Assert-SUV
    Page Should Contain Element   ${RMS.VehicleListBodyTypeSUVColumn}
    page Should Not Contain Element   ${!RMS.VehicleListBodyTypeSUVColumn}

Filter Plate Status Assert-Activated
    Page Should Contain Element   ${RMS.VehicleListPlateStatusActivatedColumn}
    Page Should Not Contain Element   ${!RMS.VehicleListPlateStatusActivatedColumn}

Filter Plate Status Assert-DeActivated
    Page Should Contain Element   ${RMS.VehicleListPlateStatusDeActivatedColumn}
    Page Should Not Contain Element   ${!RMS.VehicleListPlateStatusDeActivatedColumn}

Filter Plate Status Assert-DeActivated v0.2
    sleep  1s
    Page Should Contain Element   ${RMS.VehicleListPlateStatusDeActivatedColumn}
    sleep  1s
    Page Should Not Contain Element   ${!RMS.VehicleListPlateStatusDeActivatedColumn}

Filter State Assert-CA
    Sleep  1s
    Page Should Contain Element   ${RMS.VehicleListStateCAColumn}
    Page Should Not Contain Element   ${!RMS.VehicleListStateCAColumn}

Filtered Screen Layout Assert Preregistered
    Page Should Contain Element    ${RMS.PreregisteredFilterApplied}


Filtered Screen Layout Assert
    Page Should Contain Element   ${RMS.FilterApplied}
    Page Should Contain Element   ${RMS.CAFilterApplied}
    Page Should Contain Element   ${RMS.SUVFilterApplied}
    Page Should Contain Element   ${RMS.rPlateProFilterApplied}
    Page Should Contain Element   ${RMS.ActivatedFilterApplied}
    Page Should Not Contain Element   ${!RMS.VehicleListStateCAColumn}
    page Should Not Contain Element   ${!RMS.VehicleListBodyTypeSUVColumn}
    Page Should Not Contain Element   ${RMS.VehicleListPlateModelrPlateColumn}
    Page Should Not Contain Element   ${!RMS.VehicleListPlateStatusActivatedColumn}

Filter Year Assert-2017
    Page Should Contain Element   ${RMS.VehicleListYear2017Column}
    Page Should Not Contain Element   ${!RMS.VehicleListYear2017Column}

Open Vehicle Details
    Click Element   ${RMS.VIN_PTHHP5AYKJA002773}
    @{texts}    Get Webelements   ${RMS.VIN_PTHHP5AYKJA002773}
    Click Element    @{texts}[0]
    Sleep  2

Enter Settings Page
    wait until page contains element   ${RMS.SettingsButton}
    click element   ${RMS.SettingsButton}
    Sleep  2s

Settings Page Assert
    Page Should Contain Element   ${RMS.DashboardButton}
    Page Should Contain Element   ${RMS.TelematicsButton}
    Page Should Contain Element   ${RMS.CampaignButton}
    Page Should Contain Element   ${RMS.SettingsButton}
    Page Should Contain Element   ${RMS.HelpButton}
    Page Should Contain Element   ${RMS.SettingsPageTitle}
    Page Should Contain Element   ${RMS.SettingsPageIntro}
    Page Should Contain Element   ${RMS.SettingsPageVehicleGroupBox}
    page should contain element   ${RMS.SettingsPageCampaignZoneBox}
    page should contain element   ${RMS.SettingsPageAccountPreferencesBox}
    page should contain element   ${RMS.SettingsPageSecurityPasswordBox}
    Page Should Contain Element   ${RMS.VehicleGroupBoxIntro}



Settings Page Assert V0.2
    Page Should Contain Element   ${RMS.DashboardButton}
    Page Should Contain Element   ${RMS.TelematicsButton}
    Page Should Contain Element   ${RMS.CampaignButton}
    Page Should Contain Element   ${RMS.SettingsButton}
    Page Should Contain Element   ${RMS.HelpButton}
    Page Should Contain Element   ${RMS.SettingsPageTitle}
    Page Should Contain Element   ${RMS.SettingsPageIntro}
    sleep  2s
    Page Should Contain Element   ${RMS.SettingsPageCampaignGroupBox}
    page should contain element   ${RMS.SettingsPageCampaignZoneBox}
    page should contain element   ${RMS.SettingsPageAccountPreferencesBox}
    page should contain element   ${RMS.SettingsPageSecurityPasswordBox}
    Page Should Contain Element   ${RMS.CampaignGroupBoxIntro}

Settings Page Assert FMC
    Page Should Contain Element   ${RMS.DashboardButton}
    Page Should Contain Element   ${RMS.TelematicsButton}
    Page Should Contain Element   ${RMS.CampaignButton}
    Page Should Contain Element   ${RMS.SettingsButton}
    Page Should Contain Element   ${RMS.HelpButton}
    Page Should Contain Element   ${RMS.SettingsPageTitle}
    Page Should Contain Element   ${RMS.SettingsPageIntro}
    sleep  2s
    Page Should Contain Element   ${RMS.SettingsPageCampaignGroupBox}
    page should contain element   ${RMS.SettingsPageCampaignZoneBox}
    page should contain element   ${RMS.SettingsPageAccountPreferencesBox}
    page should contain element   ${RMS.SettingsPageSecurityPasswordBox}
    Page Should Contain Element   ${RMS.CampaignGroupBoxIntro}
    page should contain element     ${RMS.SettingsClientManagement}

Enter Dashboard
    sleep  7
    #wait until page contains element  ${RMS.DashboardButton}
    click element   ${RMS.DashboardButton}
    Sleep  1

Enter Vehicle Groups Settings
    Sleep   1
    click element   ${RMS.SettingsPageVehicleGroupBox}
    Sleep   2

Enter Campaign Groups Settings
    Sleep   1
    click element   ${RMS.SettingsPageCampaignGroupBox}
    Sleep   2s


Manage Campaign Groups Assert
    Page Should Contain Element   ${RMS.SettingsLink}
    Page Should Contain Element   ${RMS.CampaignGroupTitle}
    Page Should Contain Element   ${RMS.ManageCampaignGroupsTitle}

Manage Vehicle Groups Assert
    Page Should Contain Element   ${RMS.SettingsLink}
    Page Should Contain Element   ${RMS.VehicleGroupTitle}
    Page Should Contain Element   ${RMS.ManageVehicleGroupsTitle}
    Page Should Contain Element   ${RMS.EditVehicleGroupButton}

Manage Vehicle Groups Layout Assert
    Page Should Contain Element       ${RMS.SettingsLink}
    Page Should Contain Element       ${RMS.VehicleGroupTitle}
    Page Should Contain Element       ${RMS.ManageVehicleGroupsTitle}
    Page Should Contain Element       ${RMS.DisabledDeleteVehicleGroupButton}
    Page Should Contain Element       ${RMS.NewVehicleGroupButton}
    Page Should Contain Element       ${RMS.EditVehicleGroupButton}
    click element                     ${RMS.FirstVehicleGroup}
    sleep  2s
    Page Should Contain Element       ${RMS.EnabledDeleteVehicleGroupButton}
    Page Should Not Contain Element   ${RMS.DisabledDeleteVehicleGroupButton}

Manage Campaign Groups Layout Assert Indepth
    Page Should Contain Element   ${RMS.SettingsLink}
    Page Should Contain Element   ${RMS.CampaignGroupTitle}
    Page Should Contain Element   ${RMS.ManageCampaignGroupsTitle}
    #mouse over   ${RMS.FirstVehicleGroup}
    #Page Should Contain Element   ${RMS.EditVehicleGroupButton}
    Page Should Contain Element       ${RMS.DisabledDeleteVehicleGroupButton}
    Page Should Contain Element       ${RMS.NewVehicleGroupButton}
    #click element                     ${RMS.FirstVehicleGroup}
    sleep  2s


Click Button this
    Click Button   ${RMS.NewVehicleGroupButton}
Logout
    click element   ${RMS.UserIcon}
    click element   ${RMS.logout}

Click Edit Group Button
    mouse over  ${RMS.FirstVehicleGroup}
    click element   ${RMS.EditVehicleGroupButton}

Clear And Enter New Group Name
    Clear Element Text   ${FirstVehicleGroupName}
    Sleep   1
    Input Text      ${FirstVehicleGroupNameEdit}      Automation
    Sleep  2s
    Input Text    css=#addVehicleGroupContainer > div > div.modal-body.modalBodyBgcolor.height468 > p > div > div > div > input     don
    Sleep  2s
    Click Element   xpath=//span[text()='don']
    Sleep  1s
    click element   xpath=//button[@data-id="vehicleGroups"]
    Sleep  2s

Click on Check
    click element   ${FirstEditGroupCheck}

Edit Group Name Assert
    Page Should Contain Element       ${RMS.FirstAutomatedVehicleGroupName}
    Sleep  2s
    #Page Should Contain Element       ${RMS.FirstAutomatedVehicleGroupSubTitle}

Get First group Name
    ${RMS.GroupName}   get text   ${FirstVehicleGroupName}
    Set Global Variable   ${RMS.GetFirstGroupName}   ${RMS.GroupName}

Edit Group Logout Assert
    ${RMS.CurrentGroupName}   get text   ${FirstVehicleGroupName}
    Should Be Equal As Strings   ${RMS.CurrentGroupName}   ${RMS.GetFirstGroupName}

Check Bar of Vehicle with renewal Date Jan 01 1970
    sleep  2s
    ${RMS.BarColor}   get element attribute   ${RMS.FirstRedBarVehicle}@src
    sleep  1s
    should contain   ${RMS.BarColor}   /assets/images/homescreen/red.svg

Check Bar of Vehicle with renewal Date Apr 18 2019
    sleep  2s
    ${RMS.BarColor}   get element attribute   ${RMS.FirstGreenBarVehicle}@src
    sleep  1s
    should contain    ${RMS.BarColor}   /assets/images/homescreen/green.svg

Current Page Number Highlighted Assert
    page should contain element   //span[text()="You're on page "]/following-sibling::span[text()="1"]

Previous Greyed Out Assert
    page should contain element   //li[@class="pagination-previous disabled"]/span[contains(text(),"Previous")]

Click on 2nd Page
    click element  //span[text()="2"]

Next Greyed Out Assert
    page should contain element   //li[@class="pagination-next disabled"]/span[contains(text(),"Next")]

Click on Assign Vehicle
    click element   ${RMS.AssignVehicle}

Navigate to My rPlate
    Sleep  2s
    Click Element   ${RMS.MyrPlateGrid}
    Sleep  2

Navigate to rPlate Details
    Click Element   ${RMS.MyrPlateSerialNumber}
    Sleep  4s

rPlate Detail Assert
    Page Should Contain   Vehicle and Rplate Details
    Page Should Contain  Details
    Page Should Contain   Vehicle Registration
    Page Should Contain   Activity
    Page Should Contain   Rplate Type
    #Page Should Contain   Plate Status

rPlate Default Image
    Page Should Contain Element   ${RMS.DefaultrPlateImage}


Click on rplate Settings
    Sleep  2s
    Click Element   ${RMS.rPlateSettings}
    Sleep  3s
    Page Should Contain   Images on Rplate
    Page Should Contain   Reattach Rplate
    Page Should Contain   Rplate Temperature

Click on rplate Settings for deactivated Vehicle
    Sleep  2s
    Click Element   ${RMS.rPlateSettings}
    Sleep  3s
    Page Should Contain Element   ${RMS.DisabledVehicleData}
    Page Should Contain Element    xpath=//*[@id="reattach"]


Save a Comment
    Click Element     ${RMS.rPlateCommentsBox}
    Input Text   ${RMS.rPlateCommentsBox}   This is a comment
    Sleep  2s
    Click Element   ${RMS.rPlateCommentsBoxTick}
    Sleep  2s
    Page Should Contain   This is a comment

Cancel a Comment
    Click Element     ${RMS.rPlateCommentsBox}
    Input Text   ${RMS.rPlateCommentsBox}   This is a new comment
    Sleep  2s
    Click Element   ${RMS.rPlateCommentsBoxCancel}
    Sleep  2s
    Page Should Not Contain   This is a new comment


Navigate to View All Comments
    Click Element   ${RMS.ViewAllComments}
    Sleep  3s
    Page Should Contain   This is a comment

Modify vehicle Name
    mouse over   id=vehicleName
    Click Element  ${RMS.VehicleNameEdit}
    Sleep  1s
    Clear Element Text    ${RMS.VehicleNameTextBox}
    Sleep  1s
    Input Text   ${RMS.VehicleNameTextBox}     Automate
    Sleep  1s
    Click Element   ${RMS.VehicleNameTick}
    Sleep  2s
    ${value}  Get Value  ${RMS.VehicleNameTextBox}
    should be equal as strings  ${value}   Automate


Check Special Characters in Vehicle Name Error
    Click Element  ${RMS.VehicleNameEdit}
    Sleep  1s
    Clear Element Text    ${RMS.VehicleNameTextBox}
    Sleep  1s
    Input Text   ${RMS.VehicleNameTextBox}     @#$%
    Sleep  1s
    Page Should Contain   Special characters are not allowed



FMC Dashboard Assert for A rPlates and 0 Clients
    #Page Should Not Contain    No RPlates. Contact to ReviverAuto.
    Page Should Contain Element   //div[text()="GurpreetKau"]/parent::div/following-sibling::div/a[text()="Allocate Rplates"]
