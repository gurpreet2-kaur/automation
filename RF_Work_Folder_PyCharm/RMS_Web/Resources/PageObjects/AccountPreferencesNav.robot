*** Settings ***
Documentation  Adding the pre-build libraries
Library           Selenium2Library
Library           Collections
Library           Screenshot
#Library           ExtendedSelenium2Library

*** Variables ***

${RMS.EditPhoneNumber}   id=pencil
${RMS.TextMessageNotification}   id=radio2
${RMS.EmailNotification}   id=radio1
${EditContactDetails Button}   id=pencil
${RMS.DisabledEmailBox}   xpath=//input[@id="email" and @disabled=""]
${RMS.PhoneNumberBox}   id=phonenumber
${RMS.CancelButton}   id=cancel
${RMS.SaveButton}   id=save
${RMS.AvtarImage}   id=openmodal     #xpath=//img[@class="avatar_img cursorPointer"]
${RMS.GeefenceNotificationToolTip}   id=popovr

*** Keywords ***

Account Preferences Assert
    page should contain   Account Preferences
    page should contain element   //span[contains(text(),"Personal Information")]
    page should contain   Name
    page should contain   Phone Number
    page should contain   Email Address
    page should contain   Username
    page should contain   Company Name
    page should contain element   //span[contains(text(),"Notification Preference")]
    page should contain element   //span[contains(text(),"Select notification method.")]
    page should contain   Email
    page should contain   Text Message/SMS
    page should contain element   //span[contains(text(),"Your mobile phone carrier may charge for SMS Messages.")]
    page should contain element   ${RMS.EditPhoneNumber}
    #page should contain element   //div[@class="col-sm-12 col-md-12 col-lg-12 remove_col_padding margin_bottom_15 generic_text_18 text_bold" and contains(text(),"Vehicle Geofence Notification")]
    #page should contain element   //div[@class="col-sm-7 col-md-6 col-lg-7 remove_col_padding floatLeft" and contains(text(),"Vehicle Geofence Notification")]
    #page should contain element   ${RMS.GeefenceNotificationToolTip}


Select Text Message Notification
    click element   ${RMS.TextMessageNotification}

Text Message Notification Assert
    page should contain element   //span[contains(text(),"Notification Preference has been changed to Text Message/SMS.")]

Select Email Notification
    click element   ${RMS.EmailNotification}

Email Notification Assert
    page should contain element   //span[contains(text(),"Notification Preference has been changed to Email.")]

Edit Contact Details
    click element   ${EditContactDetails Button}

Edit Contact Details Assert
    page should contain   Edit Phone Number
    page should contain element   //label[contains(text(),"Phone Number")]
    page should contain element   ${RMS.PhoneNumberBox}
    page should contain element   ${RMS.CancelButton}
    page should contain element   ${RMS.SaveButton}

Cancel Edit Contact Details Pop Up
    click button   ${RMS.CancelButton}

Edit and Save Phone Number
    clear element text   ${RMS.PhoneNumberBox}
    sleep  1s
    input text  ${RMS.PhoneNumberBox}   9599355536
    sleep  1s
    click button   ${RMS.SaveButton}
    sleep  2s
    page should contain element   //span[text()="+1(959) 935-5536"]

Click on Avatar
    click element   ${RMS.AvtarImage}
    sleep  3s

Select Different Avatars
    page should contain element   id=image1     #xpath=//div[1]/img[@class="avatar_img row_body img-responsive cursorPointer"]
    sleep  1s
    click element   xpath=//div[1]/img[@alt="Event Image"]
    sleep  1s
    page should not contain element   xpath=//div[1]/img[@class="avatar_img row_body img-responsive cursorPointer"]
    sleep  1s
    page should contain element   xpath=//div[1]/img[@class="avatar_img row_body img-responsive cursorPointer active"]
    sleep  1s
    page should contain element   id=image2      #xpath=//div[2]/img[@class="avatar_img row_body img-responsive cursorPointer"]
    sleep  1s
    click element   xpath=//div[2]/img[@alt="Event Image"]
    sleep  1s
    page should not contain element   xpath=//div[2]/img[@class="avatar_img row_body img-responsive cursorPointer"]
    sleep  1s
    page should contain element   xpath=//div[2]/img[@class="avatar_img row_body img-responsive cursorPointer active"]

Change Avtar Popup Assert
    page should contain   Change Avatar
    page should contain element   ${RMS.CancelButton}
    page should contain element   ${RMS.SaveButton}
    page should contain element   xpath=//img[@class="avatar_img img-responsive row_body active"]