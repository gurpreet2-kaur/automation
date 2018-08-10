*** Settings ***
Documentation  Adding the pre-build libraries
Library           Selenium2Library
Library           Collections
Library           Screenshot

*** Variables ***
${RMS.CampaignZoneEditToolTip}   id=popovr
${RMS.ToolTipPopover}   xpath=//div[@role="popover" and @style="display: block; top: 27px; left: 14.1406px;"]
${RMS.EditToolTipMessage}   xpath=//span[normalize-space()="Enter in a new starting address on the map, and adjust zone reach and width by dragging the circle. Make sure to save your edited zone by clicking save below."]
${RMS.EditZoneTextbox}   id=edit_zone
${RMS.EditZoneAddress}   id=edit_zone_address
${RMS.SaveEditedZone}   xpath=//button[text()="Save"]
${RMS.EditedZone}   xpath=//div[text()=" EditedZone"]
${RMS.ZoneCancelButton}   xpath=//button[text()="Cancel"]
${RMS.AddCampaignZoneTopHeading}   xpath=//span[contains(text(),"Add Zone")]
${RMS.AddZoneNameTextBox}   id=zonetitle
${RMS.AddZoneAddressTextBox}   xpath=//input[@placeholder="Enter Zone Address"]
${RMS.DisabledAddZoneCreateButton}   xpath=//button[@disabled='' and text()="Create"]
${RMS.EnabledAddZoneCreateButton}   xpath=//button[text()="Create"]

*** Keywords ***
Mouse Hover on Edit Tool Tip
    mouse over   ${RMS.CampaignZoneEditToolTip}

Edit Tool Tip Popover Assert
    #page should contain element   ${RMS.ToolTipPopover}
    page should contain element   ${RMS.EditToolTipMessage}

Edit Campaign Zone Name
    [Arguments]    ${RMS.SelectCampaignZone}
    clear element text   ${RMS.EditZoneTextbox}
    input text   ${RMS.EditZoneTextbox}   ${RMS.SelectCampaignZone}

Save Edited Zone
    click button   ${RMS.SaveEditedZone}

Save Edited Zone Assert
    page should contain element   ${RMS.EditedZone}

Hover Mouse Pointer On Edited Zone
    mouse over   ${RMS.EditedZone}

Cancel Edited Zone
    click button   ${RMS.ZoneCancelButton}

Cancel Edited Zone Assert
    page should contain element   ${RMS.EditedZone}
    page should not contain element   //div[text()=" Edited"]

Add Zone Page Assert
    page should contain element   ${RMS.AddCampaignZoneTopHeading}
    page should contain element   ${RMS.AddZoneNameTextBox}
    page should contain element   ${RMS.AddZoneAddressTextBox}
    page should contain element   ${RMS.ZoneCancelButton}
    page should contain element   ${RMS.DisabledAddZoneCreateButton}

Enter Zone Name
    [Arguments]    ${RMS.ZoneName}
    #clear element text   ${RMS.AddZoneAddressTextBox}
    mouse down   ${RMS.AddZoneAddressTextBox}
    mouse out   ${RMS.AddZoneAddressTextBox}
    clear element text   ${RMS.AddZoneNameTextBox}
    input text   ${RMS.AddZoneNameTextBox}    ${RMS.ZoneName}

Enter Zone Area
    [Arguments]    ${RMS.ZoneAddress}
    clear element text   ${RMS.AddZoneAddressTextBox}
    input text   ${RMS.AddZoneAddressTextBox}   ${RMS.ZoneAddress}
    press key    ${RMS.AddZoneAddressTextBox}   	\\13   #Enter Key

Just Click on Zone Area
    #clear element text   ${RMS.AddZoneAddressTextBox}
    Click Element  ${RMS.AddZoneAddressTextBox}

Zone Name or Address Assert
    page should contain element   ${RMS.DisabledAddZoneCreateButton}

Cancel Add Zone
    click button   ${RMS.ZoneCancelButton}

Cancel Add Zone Assert
    page should not contain element   //p[text()=" AutoZone2"]