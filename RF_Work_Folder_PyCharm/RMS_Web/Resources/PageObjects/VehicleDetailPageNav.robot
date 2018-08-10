*** Settings ***
Documentation  Adding the pre-build libraries
Library           Selenium2Library
Library           Collections
Library           Screenshot

*** Variables ***

${RMS.VehicleDetailSaveCommentButton}     id=tickimage
#css=#activityModal > div > div > div.modal-body.modalBodyBgcolor > div > div:nth-child(1) > div.col-sm-12.col-md-12.col-lg-12.margin_bottom_10 > div

${RMS.VehicleDetailCancelCommentButton}   id=cancelimage
${RMS.CancelButton}   id=cancel
${RMS.VehicleDetailEditIcon}     id=pencil
${RMS.VehicleDetailEditTextBox}   id=test
${RMS.VehicleDetailCommentTextBox}   id=comment_area
${RMS.VehicleDetailGeofenceButton}   xpath=//span[text()="Geofence"]
${RMS.VehicleDetailGeofenceDisabledButton}   id=geofence

${RMS.VehicleDetailActivateServicePlanButton}   xpath=//span[text()="Activate Service Plan"]
${RMS.VehicleDetailViewAllComment}   xpath=//a[text()="View All"]
${RMS.AddCommentButton}   xpath=//button[text()="Add Comment"]
${RMS.OKButton}   id=ok
${RMS.EditDeleteButton}   id=dotBtn

${RMS.EditComment}   xpath=//div[text()="Edit"]
${RMS.DeleteComment}   xpath=//div[text()="Delete"]
${RMS.EditCommentBox}   id=editComment
${RMS.AddCommentBox}   id=addComment
${RMS.StolenButton}   id=stolen
${RMS.StolenConfirmationNO}  id=no
${RMS.ReattachButton}   id=reattach

${VehicleDetailsGeofenceButton}   xpath=//span[text()="Geofence"]
${SetGeofenceToolTip}   id=popovr
${SaveButton}   id=save
${GeofenceAddressTextBox}   id=geofenceAddress

${rPlateSettingsButton}   id=settingimg
${RMS.Stolen}   id=stolen
${RMS.Reattached}   id=reattach
${RMS.RPlateTransferButton}    id=tranfrownrship   #xpath=//button[@class="btn action_button genericPrimaryBtnColor width180 btn_margin pull-right" and text()="Transfer RPlate"]
${RMS.CheckElite}   xpath=//*[@id="servicePlanContainer"]/div/button[@title="Elite"]
${RMS.CancelTransfer}    id=cancelinvite
${RMS.firstNameTransfer}    id=firstName
${RMS.emailTransfer}    id=email
${RMS.phoneTransfer}   id=number
${RMS.VINTransfer}     css=body > app-root > app-transfer-rplate > div > div > div.col-sm-12.col-md-12.col-lg-12.padding_right_5.containerHeight > div.col-sm-12.col-md-12.col-lg-12.margin_bottom_20.remove_col_padding > form > div:nth-child(1) > div:nth-child(2) > div:nth-child(4) > input
${RMS.SendInviteTransfer}  id=create
${RMS.OKTransfer}    id=ok
${RMS.InviteButtonTransfer}  xpath=//button[@class="btn margin_top_3 floatLeft inviteSent fontWeightBold pull-right" and text()="INVITED"]
${RMS.DeleteInviteButtonTransfer}  id=delete
${RMS.SendAgainButtonTransfer}   id=resend
${RMS.DeleteInviteYesButtonTransfer}   id=yes
${RMS.DeleteInviteNoButtonTransfer}   id=no
${RMS.CancelVinMismatch}  css=#cancel
${RMS.ViewTelematics}    id=navtotele


*** Keywords ***

Vehicle Detail Assert
    Page Should Contain   Vehicle and Rplate Details
    #Page Should Contain   7ROF129
    #Page Should Contain   Fabrice Barbier
    #Page Should Contain   RMXC000428
    #Page Should Contain   RPlatePro
    #Page Should Contain   2016
    #Page Should Contain   05/2018
    Page Should Contain   Activity
    Page Should Contain Element   ${RMS.VehicleDetailGeofenceDisabledButton}
    #Page Should Contain Element   ${RMS.VehicleDetailActivateServicePlanButton}
    #Page Should Contain Element   ${RMS.VehicleDetailViewAllComment}
    #page should contain element   ${RMS.VehicleDetailCommentTextBox}


Click on Edit Vehicle Icon
    Click Element   ${RMS.VehicleDetailEditIcon}

Type new Vehicle Icon Name
    [Arguments]    ${RMS.VehicleNameEdit}
    Clear Element Text    ${RMS.VehicleDetailEditTextBox}
    Sleep  1
    Input Text   ${RMS.VehicleDetailEditTextBox}      ${RMS.VehicleNameEdit}
    Sleep  1

Click on Cancel Button on Vehicle Detail
    click element    ${RMS.CancelButton}
    Sleep  2

Add Comment
    [Arguments]    ${RMS.Comment}
    clear element text   ${RMS.VehicleDetailCommentTextBox}
    Input Text   ${RMS.VehicleDetailCommentTextBox}    ${RMS.Comment}
    Sleep  2

Save Comment
    [Arguments]    ${RMS.Comment}
    Sleep  2s
    Click element   ${RMS.VehicleDetailSaveCommentButton}
    Sleep   2s
    Page Should Contain  ${RMS.Comment}

Cancel Vehicle Name Edit Assert
    page should contain    TstVehicle

Open Sudha Vehicle Details
    click element   id=vdetails0
    Sleep  2s

Click on View All
    click element   ${RMS.VehicleDetailViewAllComment}

View All Comments Box Assert
    page should contain   Activity
    page should contain   Comments
    page should contain button   ${RMS.AddCommentButton}
    page should contain element   //span[contains(text(),"added a comment")]
    page should contain button   ${RMS.OKButton}
    page should contain button   ${RMS.EditDeleteButton}
    click button   ${RMS.EditDeleteButton}
    sleep  2s
    page should contain element   ${RMS.EditComment}
    page should contain element   ${RMS.DeleteComment}

Edit and Save Comment
    click button   ${RMS.EditDeleteButton}
    sleep  3s
    click element   ${RMS.EditComment}
    sleep  2s
    clear element text   ${RMS.EditCommentBox}
    sleep  1s
    input text   ${RMS.EditCommentBox}   This is an Edited Comment
    sleep  1s
    click element   ${RMS.VehicleDetailSaveCommentButton}
    sleep  5s
    page should contain element   xpath=//div[normalize-space()="This is an Edited Comment"]

Delete Comment
    click button   ${RMS.EditDeleteButton}
    sleep  2s
    click element   ${RMS.DeleteComment}
    sleep  3s
    click button   ${RMS.OKButton}
    sleep   4s
    page should not contain element   xpath=//div[normalize-space()="This is an Edited Comment"]

Click on Add Comment
    click button   ${RMS.AddCommentButton}
    Sleep  2s

Add Comment Box Assert
    page should contain element   ${RMS.AddCommentBox}
    page should contain element   //textarea[@id="addComment" and @placeholder="Add Comment"]
    input text   ${RMS.AddCommentBox}   Abcd
    sleep  3s
    page should contain element   ${RMS.VehicleDetailSaveCommentButton}
    page should contain element   ${RMS.VehicleDetailCancelCommentButton}

Input Comment into Add Comment Box
    [Arguments]    ${RMS.Comment}
    clear element text   ${RMS.AddCommentBox}
    input text   ${RMS.AddCommentBox}    ${RMS.Comment}

Save Entered Comment
    click element   ${RMS.VehicleDetailSaveCommentButton}

Saved Comment Assert
    page should contain element   xpath=//div[normalize-space()="This is 2nd Automated Comment"]

No Tick Button Assert
    page should not contain element   ${RMS.VehicleDetailSaveCommentButton}

Cancel Entered Comment
    click element   ${RMS.VehicleDetailCancelCommentButton}

Cancelled Comment Assert
    page should not contain element   xpath=//div[normalize-space()="This is Cancelled Automated Comment"]

Open Set Geofence Screen
    click element   ${VehicleDetailsGeofenceButton}

Set Geofence Screen Assert
    sleep  2s
    page should contain   Set
    page should contain   Vehicle Geofence
    page should contain element   ${SetGeofenceToolTip}
    page should contain element   ${RMS.CancelButton}
    page should contain element   ${SaveButton}
    page should contain element   ${GeofenceAddressTextBox}
    page should contain element   xpath=//input[@id="geofenceAddress" and @placeholder="Enter Geofence Address"]

Click on Plate Stolen and Choose Your Option
    [Arguments]    ${RMS.StolenStatus}
    click element   ${RMS.Stolen}
    click element   ${RMS.StolenStatus}

rPlate Settings Assert
    sleep   5s
    page should contain   Images on Rplate
    page should contain   Details
    page should contain   Software Version
    page should contain   Software ID
    page should contain   Rplate Temperature
    page should contain   Last Server Connection
    sleep   2s
    page should contain   Campaigns Settings
    page should contain   Display Campaign Messages
    page should contain   Vehicle Data
    page should contain   Real Time Vehicle Data
    page should contain   Reattach Rplate
    page should contain   Report your Rplate as
    #page should contain element    ${RMS.Stolen}
    #page should contain element    ${RMS.Reattached}

Click on Dashboard Hyperlink
    click element   id=navtodb    #xpath=//span[text()="Dashboard "]

rPlate Stolen Assert
    page should contain   RPlate is reported STOLEN
    page should contain element   xpath=//div[normalize-space()="All the hardware & software executing functionalities are blocked."]

Navigate to Stolen Assert
    Click Element  ${RMS.StolenButton}
    Sleep  2s
    Page Should Contain  Are you sure you want to report your RPlate as Stolen?
    Page Should Contain  On confirming, a "STOLEN" plate image will be published on your RPlate.

Navigate back to rPlate Settings
    Click Element  ${RMS.StolenConfirmationNO}
    Sleep  2s
    Page Should Contain  Images on Rplate
    Page Should Contain   Campaigns Settings
    Page Should Contain   Rplate Temperature

Navigate to REATTACHED Assert
    Click Element  ${RMS.ReattachButton}
    Sleep  2s
    Page Should Contain  Report Rplate
    Page Should Contain  Have you reattached your Rplate to your vehicle?
    Page Should Contain Element   id=no
    Page Should Contain Element   id=yes

Open Naman2 Vehicle Details
    click element   xpath=//span[text()="APRO1727005000030"]
    Sleep  4s

Open Vehicle Details
    click element   id=serialNumberId0
    Sleep  4s

Dealer Naman2 Vehicle Details Assert
    sleep   2s
    page should contain   Vehicle and Rplate Details
    page should contain   Details
    page should contain   Rplate Serial Number
    page should contain   VIN
    page should contain   Registered Owner
    page should contain   License No
    page should contain   Service Plan
    page should contain   Year
    page should contain   Body Type
    page should contain   Make
    page should contain   Vehicle Registration
    page should contain   Renewal Due
    page should contain   Rplate Type
    page should contain   Activity
    page should contain   Vehicle Group
    page should contain element   //textarea[@id="comment_area" and @placeholder="Add Comment"]
    page should contain element   ${RMS.VehicleDetailViewAllComment}
    page should contain element   ${rPlateSettingsButton}
    page should contain element   id=pencil       #//span[text()="JS1SH42AXW2101679"]/following-sibling::span[@id="pencil"]

Navigate to RPlate Transfer Page
    Click Element  ${RMS.RPlateTransferButton}
    Sleep  2s


RPlate Transfer Page Assert
    Page Should Contain    Transfer RPlate Ownership
    Page Should Contain    RPlate Details
    Page Should Contain    New Owner Details
    Page Should Contain Element     ${RMS.CheckElite}

Cancel the Trasnfer Process
    Click Element  ${RMS.CancelTransfer}
    Sleep  1s
    Page Should Contain    Vehicle and RPlate Details

Character Restriction on First Name
    clear element text   ${RMS.firstNameTransfer}
    input text   ${RMS.firstNameTransfer}     SudhanshuWadhwa
    Sleep  1s
    Textfield Value Should Be    ${RMS.firstNameTransfer}   SudhanshuW


Check Email validation
    clear element text   ${RMS.emailTransfer}
    input text   ${RMS.emailTransfer}      sajh.com
    Sleep  1s
    page should contain  Please enter a valid email address
    Sleep  1s
    clear element text   ${RMS.emailTransfer}
    input text   ${RMS.emailTransfer}      saksun2003@gmail
    Sleep  1s
    page should contain  Please enter a valid email address
    Sleep  1s
    clear element text   ${RMS.emailTransfer}
    input text   ${RMS.emailTransfer}      saksun2003@gmail.com.
    Sleep  1s
    page should contain  Please enter a valid email address
    Sleep  1s
    clear element text   ${RMS.emailTransfer}
    input text   ${RMS.emailTransfer}      saksun2003@gmail.com
    Sleep  1s
    page should not contain  Please enter a valid email address

Fill Mandatory Field on RPlate Transfer Page
    input text   ${RMS.firstNameTransfer}    Sudhanshu
    Sleep   1s
    input text   ${RMS.emailTransfer}     rplatetransfer@gmail.com
    Sleep   1s
    input text   ${RMS.phoneTransfer}       9899878073
    sleep   1s
    Click Element    ${RMS.SendInviteTransfer}
    Sleep  3s

Fill Mandatory Field on RPlate Transfer Page VIN Change
     input text   ${RMS.emailTransfer}     rplatetransfer@gmail.com
    input text   ${RMS.firstNameTransfer}    Sudhanshu
    input text   ${RMS.phoneTransfer}       9899878073
    Sleep  1s
    input text   ${RMS.VINTransfer}      3VWPF71K06M621604
    sleep   1s
    Click Element    ${RMS.SendInviteTransfer}

Check Invitation Sent Assert
    Page Should Contain  Invitation Sent Successfully!
    #Page Should Contain  We’ve sent an invite to join Reviver Auto to the following email address. You will be notified when the invitee has created their account.
    Page Should Contain Element  ${RMS.OKTransfer}
    Sleep  1s
    Click Element   ${RMS.OKTransfer}
    Sleep  2s
    Page Should Contain    Vehicle and Rplate Details
    Sleep  1s

Delete Invite
    Click Element   ${RMS.InviteButtonTransfer}
    Sleep  2s
    Click Element   ${RMS.DeleteInviteButtonTransfer}
    Sleep   2s
    Click Element   ${RMS.DeleteInviteYesButtonTransfer}
    Sleep   2s

Delete Invitation Cancel
    Click Element   ${RMS.InviteButtonTransfer}
    Sleep  2s
    Click Element   ${RMS.DeleteInviteButtonTransfer}
    Sleep   2s
    Click Element   ${RMS.DeleteInviteNoButtonTransfer}
    Sleep   2s


Resend Invitation
    Click Element   ${RMS.InviteButtonTransfer}
    Sleep  2s
    Click Element    ${RMS.SendAgainButtonTransfer}
    Sleep  2s
    Click Element  xpath=/html/body/app-root/app-vehicles-details/div/div[1]/div/div[2]/div[1]/span



Check VIN Mismatch
    Page Should Contain    VIN Mismatch
    Sleep  1s
    Click Button  ${RMS.CancelVinMismatch}
    Sleep  1s

Check Transfer button on Vehicle Details
    Click Element  xpath=//*[contains(text(), '1FVHCYDJ85HV14123')]
    Sleep  3s
    Page Should Not Contain   Transfer Rplate


Click on View telematics
    Sleep  3s
    Click Element  ${RMS.ViewTelematics}
    Sleep  4s
    Page Should Contain   Search by Vehicle Name - VIN - Rplate Serial No
