*** Settings ***
Documentation  Adding the pre-build libraries
Library           Selenium2Library
Library           Collections
Library           Screenshot

*** Variables ***
${RMS.CancelButton}   id=cancel
${RMS.OkButton}   id=ok

*** Keywords ***
Assign Vehicle Page Assert
    page should contain   Assign Vehicle to Rplate
    page should contain element   xpath=//span[normalize-space()="To activate your Rplate, assign each Rplate serial number a VIN. You can optionally add a license plate number and a vehicle name to each Rplate."]
    page should contain   Rplate Serial No.
    page should contain element   //th[contains(text(),"VIN")]
    page should contain   License No.
    page should contain element   //th[contains(text(),"Vehicle Name")]
    page should contain element   //th[contains(text(),"Registration State")]
    page should contain element   id=vin
    page should contain element   id=platenum
    page should contain element   id=vhname
    page should contain button   ${RMS.CancelButton}
    page should contain button   ${RMS.OkButton}