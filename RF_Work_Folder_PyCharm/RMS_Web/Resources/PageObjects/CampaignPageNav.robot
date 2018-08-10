*** Settings ***
Documentation  Adding the pre-build libraries
Library           Selenium2Library
Library           Collections
Library           Screenshot

*** Variables ***
${RMS.CampaignButton1}    xpath=//div[@class="navBarText" and text()="CAMPAIGNS"]
${RMS.CampaignTable}    xpath=//tbody[@class="tbody_scroll"]
${RMS.CampaignSearchTextBox}   id=search
${RMS.CampaignSearchIcon}    xpath=//img[@class="search_icon"]
${RMS.AddCampaignButton}        id=add
${RMS.SearchedCampaign}      xpath=//td[@class="filterable-cell table_column2 fontSize15"]/a[text()="TstCamp"]
${RMS.CampaignDelete}      xpath=//img[contains(@src, 'deleteRed.svg')]

${RMS.FirstCampaignNameAddress}   xpath=//table/tbody/tr[1]/td[2]/a
${RMS.CampaignDeleteYes}    xpath=//button[text()="Yes"]
${RMS.CampaignDeleteCancel}  xpath=//button[@class="btn btnFontSize genericSecondaryBtn" and text()="Cancel"]
${RMS.CampaignNameTextBox}   id=zonetitle
${RMS.CampaignSaveButton}     xpath=//button[text()="Save"]
${RMS.CampaignValidityCheckBoxUnchecked}   id=cb1
${RMS.CampaignValidityCheckBoxChecked}   id=cb1
${RMS.CampaignStartDateDisabled}   xpath=//div[@class="col-sm-12 col-md-12 col-lg-12 remove_col_padding margin_bottom_5 generic_text_15 disableDate"]
${RMS.CampaignStartDateEnabled}   xpath=//span[@class="form-control alignDate uneditable-input input_box"]
${RMS.CampaignSelectAllGroup}    id=allvehicle
${RMS.CampaignSelectAllZone}    id=allzone
${RMS.CampaignSelectAllGroupHyperlink}  xpath=//span[text()="All Vehicles"]
${RMS.CampaignSelectAllZoneHyperlink}   xpath=//span[text()="Everywhere"]
${RMS.CampaignAllGroupOkButton}    xpath=//button[text()="OK"]

${RMS.CampaignClickOutsideModal}    xpath=/html/body/app-root/app-campaign-add/campaign-detail-view-zone/div
${RMS.CampaignUploadMessage}    xpath=//*[@id="imageinput"]    #xpath=//*[@id="addCampaignMessageModal"]/div/div/div/div/div/div[3]/label/input
${RMS.CampaignUploadMessageSave}   xpath=//button[@class="btn width120 buttonPrimaryGeneric genericPrimaryBtnColor margin_right_15" and @id="saveupload"]
${RMS.CampaignUploadedImage}   xpath=//img[contains(@src, 'data:image')]
${RMS.CampaignUploadMessageCancel}   id=cancelupload
${RMS.EditCampaignTopHeading}   xpath=//span[text()="Campaign "]/following-sibling::span[contains(text(),"Campaign Details")]
${RMS.CampaignValidityTitle}   xpath=//span[contains(text(),"Campaign Validity")]
${RMS.VehicleGroupsBoxTitle}   xpath=//div[contains(text(),"Vehicle Group(s)")]
${RMS.ZoneBoxTitle}   xpath=//div[contains(text(),"Zone(s)")]
${RMS.CampaignMessageTitle}   xpath=//div[contains(text(), "Campaign Images")]
${RMS.DeleteCampaignButton}   xpath=//button[text()=" Delete Campaign"]
${RMS.UploadNewButton}   id=fileupload
${RMS.CampaignNameEditButton}   id=pencil
${RMS.CampaignNameEditBox}   id=campaignName
${RMS.ConfirmEditedCampName}   id=check
${RMS.MessagePublished}   xpath=//span[text()="Published"]
${RMS.MessageUnPublished}   xpath=//span[text()="Unpublished"]
${RMS.ConfirmDeleteCampaign}   xpath=//button[text()="Yes"]

${RMS.UploadNewImage}   xpath=//input[@accept="image/*" and @name="file" and @type="file"]
${RMS.FMCCampaign1Trip}   xpath=//div[text()="FMC Company QA"]/parent::div/following-sibling::div/span[text()="No trips found"]
${RMS.FMCClientCampaign1Trip}  xpath=//div[text()="Sudhanshu Client Company 5"]/parent::div/following-sibling::div/a[text()="Invited"]
${RMS.FMCClientCampaign0Trip}   xpath=//div[text()="GurpreetKau"]/parent::div/following-sibling::div/a[text()="Add Campaign"]

${RMS.FMCCompanyCampaignGrid}    xpath=//img[contains(@src, 'my_company.svg')]

*** Keywords ***

Click on Campaign
    Wait Until Page Contains Element  ${RMS.CampaignButton1}
    Click Element   ${RMS.CampaignButton1}
    Sleep  3s


Campaign Assert
    Page Should Contain Element   ${RMS.CampaignTable}
    Page Should Contain Element   ${RMS.CampaignSearchTextBox}
    Page Should Contain Element   ${RMS.AddCampaignButton}
    Page Should Contain   Campaigns
    Sleep  3

Clear Campaign Search Text Box
    Clear Element Text   ${RMS.CampaignSearchTextBox}

Fill Campaign Search Text Box and Search
    Input Text   ${RMS.CampaignSearchTextBox}   TstCamp
    Click Element  ${RMS.CampaignSearchIcon}
    Sleep   2
    Page Should Contain Element   ${RMS.SearchedCampaign}


Click on the first Campaign and then Delete
    sleep  1s
    ${RMS.DeleteCampaignName}   get text   ${RMS.FirstCampaignNameAddress}
    set global variable   ${RMS.FirstCampaignName}   ${RMS.DeleteCampaignName}
    click element   xpath=id("example")/tbody[1]/tr[1]/td[3]/span[1]
    sleep  2s
    Click Element  ${RMS.CampaignDelete}
    sleep  2s
    Page Should Contain    Are you sure you want to delete the following campaign(s) ?
    Page Should Contain   Delete Campaign

Confirm Campaign Delete
    Sleep  2s
    Click Button    ${RMS.CampaignDeleteYes}

Delete Campaign From Table Assert
    page should not contain   ${RMS.FirstCampaignName}

Click on Add Campaign
    Click Element  ${RMS.AddCampaignButton}
    Page Should Contain Element    ${RMS.CampaignNameTextBox}
    Sleep  2s


Check Campaign Name with more than 10 characters
    Input Text   ${RMS.CampaignNameTextBox}    abcdefghij
    sleep  2s
    ${RMS.EnteredCampaignName}   Get Value   ${RMS.CampaignNameTextBox}
    should be equal as strings   ${RMS.EnteredCampaignName}   abcdefghij

Check Selection
     Click Element   ${RMS.CampaignValidityCheckBoxUnchecked}
     #Wait Until Page Contains Element   ${RMS.CampaignStartDateDisabled}

Uncheck Selection
    Click Element   ${RMS.CampaignValidityCheckBoxChecked}
    #Wait Until Page Contains Element   ${RMS.CampaignStartDateEnabled}

Select all group
    Sleep  2s
    Page Should Contain Element    ${RMS.CampaignSelectAllGroup}
    Click Element   ${RMS.CampaignSelectAllGroup}

Select all zone
    Sleep  2s
    Page Should Contain Element   ${RMS.CampaignSelectAllZone}
    Click Element   ${RMS.CampaignSelectAllZone}

Set Campaign Name
    [Arguments]    ${RMS.CampaignNameNew}
    Input Text   ${RMS.CampaignNameTextBox}   ${RMS.CampaignNameNew}


Save Campaign
    sleep  2s
    Click Element    ${RMS.CampaignSaveButton}
    Sleep  2s
    Page Should Contain    Your campaign has been created!

Create Campign Assert
    Page Should Not Contain    Your campaign has been created!

Navigate to Group
    Click Element   ${RMS.CampaignSelectAllGroupHyperlink}
    Page Should Contain    All Vehicles
    #Page Should Contain Element    ${RMS.CampaignAllGroupOkButton}

Navigate to Zone
    Click Element   ${RMS.CampaignSelectAllZoneHyperlink}
    Page Should Contain    Everywhere
    #Page Should Contain Element    ${RMS.CampaignAllGroupOkButton}
    Sleep  2s

Click on Ok button
    Click Button   ${RMS.CampaignAllGroupOkButton}
    Sleep  2s
    Wait Until Page Contains Element     ${RMS.CampaignNameTextBox}

Click anywhere except popup
    Click Element   ${RMS.CampaignClickOutsideModal}
    Page Should Contain Element    ${RMS.CampaignAllGroupOkButton}

Select an Image
    choose file  ${RMS.CampaignUploadMessage}     /var/lib/jenkins/workspace/rms-web-staging-robot-qa-workspace/prerequisitescript/Dealer.jpg
    sleep  3s
    Choose Ok On Next Confirmation
    sleep  3s

Image Assert
    sleep   3s
    Page Should Contain Element  xpath=//img[@class="aspectRatio thumbnail img-responsive"]

Save the image
    Click Button   ${RMS.CampaignUploadMessageSave}
    Sleep  3

Cancel the image
    Click Element   ${RMS.CampaignUploadMessageCancel}
    sleep  2s

Search for a Campaign
    [Arguments]    ${RMS.CampaignNameSearch}
    Clear Element Text  ${RMS.CampaignSearchTextbox}
    Sleep  1s
    Input Text   ${RMS.CampaignSearchTextbox}   ${RMS.CampaignNameSearch}
    Sleep  3s

Open Specified Campaign
    [Arguments]    ${RMS.CampaignNameSpecified}
    click element   ${RMS.CampaignNameSpecified}

Campaign Detail Page Layout Assert
    #page should contain element   ${RMS.EditCampaignTopHeading}
    page should contain element   ${RMS.CampaignValidityTitle}
    page should contain element   ${RMS.VehicleGroupsBoxTitle}
    page should contain element   ${RMS.ZoneBoxTitle}
    page should contain element   ${RMS.CampaignMessageTitle}
    page should contain element   ${RMS.UploadNewButton}
    Page Should Not Contain     Delete

Edit Campaign Name
    click element   ${RMS.CampaignNameEditButton}
    sleep  2s
    clear element text   ${RMS.CampaignNameEditBox}
    sleep  2s
    input text   ${RMS.CampaignNameEditBox}    editedcamp
    sleep  2s
    click element   ${RMS.ConfirmEditedCampName}

Upload New Message
    choose file  ${RMS.UploadNewImage}    /var/lib/jenkins/workspace/rms-web-staging-robot-qa-workspace/prerequisitescript/Dealer.jpg
    sleep  3s
    Choose Ok On Next Confirmation
    sleep  6s

Publish or Unpublished Message
    [Arguments]    ${RMS.PublishUnpublishMessage}
    click element   ${RMS.PublishUnpublishMessage}

Message Published Assert
    page should contain element   ${RMS.MessagePublished}

Message UnPublished Assert
    page should contain element   ${RMS.MessageUnPublished}
    page should not contain element   ${RMS.MessagePublished}

Delete Campaign From Campaign Detail
    click button   ${RMS.DeleteCampaignButton}
    sleep   1s
    click button   ${RMS.ConfirmDeleteCampaign}
    sleep   2s

Delete Campaign Assert
    page should not contain element   //a[text()="editedcamp"]

FMC Campaign Assert for 1-0 combination
    Page Should Not Contain Element     ${RMS.FMCCampaign1Trip}
    input text   id=search     GurpreetKau
    Page Should Contain Element      ${RMS.FMCClientCampaign0Trip}


FMC Campaign Assert for 1-1 combination
    Page Should Not Contain Element     ${RMS.FMCCampaign1Trip}

    Page Should Not Contain Element   ${RMS.FMCClientCampaign1Trip}


Select FMC QA Company
    Click Element   ${RMS.FMCCompanyCampaignGrid}
    Sleep  3s
    Page Should Contain Element   ${RMS.CampaignTable}
    Page Should Contain Element   ${RMS.CampaignSearchTextBox}
    Page Should Contain Element   ${RMS.AddCampaignButton}
    Page Should Contain   Campaigns
    Sleep  3

No Campaign Message Layout Assert
    Page Should Contain   No Campaign Images Found
    Page Should Contain   Upload JPG or PNG file of maximum resolution 2400 x 1034 px.