*** Settings ***
Documentation  Adding the pre-build libraries
Library           Selenium2Library
Library           Collections
Library           Screenshot


*** Variables ***
${RMS.CustomizeButton}    id=navtocust
${RMS.Cancelcustomizebutton}    id=cancel
${RMS.Publishcustomizebutton}   id=publish
${RMS.Choosesnoopylogo}   xpath=//img[@name="snoopy"]
${RMS.ChooseHellobanner}   xpath=//*[@id="divmain"]/div[1]/div[2]/div/div/ul/li[5]/a/span[1]
${RMS.Clickdropdown}    xpath=//*[@id="divmain"]/div[1]/div[2]/div/button
${RMS.Deletelogo}    id=dlt_logo
${RMS.Deletebanner}    id=dlt_banner
${RMS.Okbutton}   id=ok

*** Keywords ***

Click Customize button
     sleep   3s
     Click Element   ${RMS.CustomizeButton}

customize RPlate assert
     sleep   3s
     Page Should Contain   Customize RPlate
     Page Should Contain   Customize your RPlate with pre-approved messages and images.
     Page Should Contain   Messages
     Page Should Contain   Images
     Page Should Contain Element    ${RMS.Cancelcustomizebutton}
     Page Should Contain Element    ${RMS.Publishcustomizebutton}
     sleep  2s

choose a snoopy logo
      sleep   10s
      Click Element   ${RMS.Choosesnoopylogo}
      sleep   4s

click on cancel button
        Click Element   ${RMS.Cancelcustomizebutton}
        sleep   2s

page should not contain snoopy logo assert
        sleep   2s
        Page Should Not Contain   snoopy
        Page Should Not Contain   alexander
        sleep   2s

click on publish button
        Click Element   ${RMS.Publishcustomizebutton}
        sleep   2s
        Click Element   ${RMS.Okbutton}
        sleep   2s

page should contain snoopy logo assert
        sleep   2s
        Page Should Contain   snoopy
        Page Should Contain   alexander
        sleep   2s

choose a Hello banner
      sleep   10s
      Click Element   ${RMS.Clickdropdown}
      sleep  2s
      Click Element   ${RMS.ChooseHellobanner}
      sleep   4s

Page should not contain Hello banner assert
        sleep   2s
        Page Should Not Contain Element    xpath=//div[text()="Hello"]
        Page Should Not Contain   Sports banner
        Page Should Contain    defaultCa
        Page Should Contain    dmv.ca.gov
        sleep   2s

delete snoopy logo
     sleep   2s
     Click Element   ${RMS.Deletelogo}
     sleep   2s

Delete a Hello banner
     sleep   2s
     Click Element   ${RMS.Deletebanner}
     sleep   2s

Page should contain Hello banner assert
        sleep   2s
        Page Should Contain    Hello
        Page Should Contain   Sports banner
        sleep   2s