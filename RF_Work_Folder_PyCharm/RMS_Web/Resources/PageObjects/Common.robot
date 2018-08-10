*** Settings ***
Documentation  Adding the pre-build libraries
Library           Selenium2Library
Library           Collections
Library           Screenshot
#Library           pybot -d D:\Git_Repo\qa\RF_Work_Folder_PyCharm\RMS_WebResults -t "RMS - C44" Test_Cases\RMSv0.1_Suite.robot

*** Variables ***
${RMS.Path}         https://st-rms.revivermx.com       # Path of the RMS Platform  http://localhost:4200/
${Browser}    chrome   # Specifying the Browser
${RMS.Email_Xpath}    //*[@id="e-mail"]    # Email Xpath
${RMS.Password_Xpath}    //*[@id="password"]    # Password Xpath
${RMS.SignIn_CSSSelector}    css=body > app-root > login > div > div.parent_div > div.container.container-table > div > div > div > div.panel-body > form > button    # SignIn Button CSS Selector
${RMS.List_Icon}   css=body > app-root > vehicles > div > div > div > div.row.horizontal_div2 > div > div.col-lg-3.col-md-3.col-sm-3 > div > div > div > button:nth-child(1)
${RMS.ActionButton}    css=#action
${RMS.RenewRegistrationDropDown}    css=body > app-root > vehicles > div > div > div > div.row.horizontal_div3 > div > grid-vehicles > div.panel-heading.panel_details > div.col-sm-1.col-md-1.col-lg-1 > div > ul > li:nth-child(1) > a
${RMS.RenewRegTermsConditionsCheckBox}    id=cb1
${RMS.Favicon}   xpath=/html/head/link[1]
${INDEX}
*** Keywords ***
Call Chrome without infobars
    ${options}=	Evaluate	sys.modules['selenium.webdriver'].ChromeOptions()	sys, selenium.webdriver
    Call Method	${options}	add_argument	--disable-infobars
    Call Method	${options}	add_argument	--disable-gpu\=true
    #${options.prefs}=	Create Dictionary	credentials_enable_service	false
    #Call Method	${options}	add_experimental_option	prefs	${options.prefs}
    Create WebDriver	Chrome	chrome_options=${options}

Load Browser
    ${chrome options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    #Call Method    ${chrome options}   add_argument    headless
    Call Method    ${chrome options}   add_argument    disable-gpu
    Call Method	   ${chrome options}	add_argument	--disable-infobars
    Create WebDriver  Chrome  chrome_options=${chrome options}
    Go To   ${RMS.Path}
    #open browser    ${RMS.Path}   ${Browser}
    Sleep  1s

Close the browser
    Close Browser

Inserting Test Data
    Log  Test suit starts here

Cleanup Test Data
    Log  Test suit ends here

Take 3 while
    Sleep  3s

Take 1 while
    Sleep  1

Maximize the window
    Maximize Browser Window

Take the Screenshot
    [Arguments]   ${screenshot_name}
    # Selenium2Library.Set Screenshot Directory  C:/RF_Work_Folder_PyCharm/Project_1/Results/screenshot/
    Take Screenshot  ${screenshot_name}

Browser Back
    Go Back
    Sleep  1

Check Favicon
    Page Should Contain Element   ${RMS.Favicon}

Check Caraousel
    Wait Until Element Is Visible   //div[@class='item active left']

Check AuthGuard
    Close Browser
    ${chrome options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    #Call Method    ${chrome options}   add_argument    headless
    Call Method    ${chrome options}   add_argument    disable-gpu
    Create WebDriver  Chrome  chrome_options=${chrome options}
    Go To   https://st-rms.revivermx.com/#/vehicles/assignvehicles
    Sleep  5s
    Page Should Contain     Back to ReviverAuto Site
