*** Settings ***
Documentation  Adding the pre-build libraries
Library           Selenium2Library
Library           Collections
Library           Screenshot

*** Variables ***
${RMS.Email_Xpath}    xpath=//*[@id="e-mail"]    # Email Xpath
${RMS.Password_Xpath}    xpath=//*[@id="password"]    # Password Xpath
${RMS.ChangeVehicleGroupLayoverCancel}  xpath=//button[text()="Cancel"]
${RMS.ChangeVehicleGroupLayoverSave}   xpath=//button[text()="Save"]
*** Keywords ***
Change Vehicle Assert
    Page Should Contain    Select New Group for vehicles below
    Page Should Contain Element   ${RMS.ChangeVehicleGroupLayoverCancel}
    Page Should Contain Element   ${RMS.ChangeVehicleGroupLayoverSave}