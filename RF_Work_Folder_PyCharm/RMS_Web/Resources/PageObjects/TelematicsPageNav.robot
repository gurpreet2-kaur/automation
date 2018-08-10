*** Settings ***
Documentation  Adding the pre-build libraries
Library             Selenium2Library
Library           Collections
Library           Screenshot

*** Variables ***

${RMS.TelematicsButton}   xpath=//div[text()="TELEMATICS"]
${RMS.TelematicsSearch}   xpath=//input[@placeholder="Search by Vehicle Name - VIN - Rplate Serial No"]
${RMS.TelematicsSearchIcon}   xpath=//img[@class="search_icon"]
${RMS.TelematicsSearchedResult}  xpath=///html/body/app-root/telematics/div/div/div/div/agm-map/div[1]/div/div/div[1]/div[4]/div[4]/div/div/div[2]/div/div/div[2]/div[2]/span[1]
${RMS.TelematicsVehicleDetail}    xpath=//a[text()="View Trips"]
${RMS.TelematicsVehicleDetailExpand}   id=headingOne    #xpath=//img[contains(@src, "max.svg")]
${RMS.TelematicsVehicleDetailMinimize}    xpath=//img[contains(@src, "min-s.svg")]
${RMS.TelematicsVehicleTripDate}    xpath=//div[@class="col-sm-4 col-md-4 col-lg-5 paddingLeftRight0"]
${RMS.TelematicsVehicleTripTime}   css=#accordion > div:nth-child(2) > div:nth-child(3) > div:nth-child(1) > div > div.col-sm-11.col-md-11.col-lg-11.paddingLeftRight0 > div:nth-child(1) > div:nth-child(1)
${RMS.TelematicsVehicleTripDuration}   css=#expand0 > h4 > a > div.col-sm-4.col-md-4.col-lg-4.paddingLeftRight0.textAlignCenter.panelBlueColor
                                                
${RMS.TelematicsVehicleTripStartAddress}   css=#accordion > div:nth-child(2) > div:nth-child(3) > div:nth-child(1) > div > div.col-sm-11.col-md-11.col-lg-11.paddingLeftRight0 > div:nth-child(1) > div.custAddress
${RMS.FMCCompanyTelematics0Trip}   xpath=//div[text()="FMC Company QA"]/parent::div/following-sibling::div/span[text()="No trips found"]
${RMS.FMCClientTelematics0Trip}    xpath=//div[text()="GurpreetKau"]/parent::div/following-sibling::div/span[text()="No trips found"]
*** Keywords ***

Telematics Left Nav Assert
    Wait Until Page Contains Element   ${RMS.TelematicsButton}

Click on Telematics
    Wait Until Page Contains Element   ${RMS.TelematicsButton}
    Click Element   ${RMS.TelematicsButton}
    Sleep  3s


Telematics Assert
    sleep  3s
    Page Should Contain Element    ${RMS.TelematicsSearch}

Enter Text in Telematics Search Field
    Input Text   ${RMS.TelematicsSearch}    	Sudha-12113131111111111-1342627425425672463
    Sleep   3s
    Click Element    ${RMS.TelematicsSearchIcon}
    Sleep   2s
    Click Element    ${RMS.TelematicsSearchIcon}
    #Wait Until Page Contains     12113131111111111
    Sleep  2s


Enter Text in Telematics Search Field - Negative
    Input Text   ${RMS.TelematicsSearch}    Invalid
    Sleep   1
    Click Element    ${RMS.TelematicsSearchIcon}
    Sleep   1
    Page Should Not Contain  Invalid

Goto Vehicle Trip Detail Page
    Sleep   6s
    click element  ${RMS.TelematicsVehicleDetail}
    #click element  ${RMS.TelematicsVehicleDetail}
    Sleep   5s
    Wait Until Page Contains    Trips for Sudha
    Wait Until Page Contains Element    //*[@id="accordion"]

List of Trips for a vehicle
    Sleep  2s
    Click Element     ${RMS.TelematicsVehicleTripDate}
    Sleep  2s
    Wait Until Page Contains Element    xpath=//div[@class="col-sm-12 col-md-12 col-lg-12 cursorPointer defaultCollapseDiv"]

Click on Minimize Icon
    Sleep   3
    Wait Until Page Contains Element      ${RMS.TelematicsVehicleDetailMinimize}
    Click Element      ${RMS.TelematicsVehicleDetailMinimize}

Check Timing Address and Date
    Sleep   2
    Page Should Contain    Apr 03 2018
    Page Should Contain Element    ${RMS.TelematicsVehicleTripTime}
    #Page Should Contain Element   ${RMS.TelematicsVehicleTripDuration}
    #Page Should Contain Element    ${RMS.TelematicsVehicleTripStartAddress}

FMC Telematics Assert for 0 trips
    Page Should Contain Element      ${RMS.FMCCompanyTelematics0Trip}
    Page Should Contain Element      ${RMS.FMCClientTelematics0Trip}

0 Trips Assert
    Page Should Contain  No Trips Found

