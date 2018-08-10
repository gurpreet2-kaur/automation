*** Settings ***
Documentation  Adding the pre-build libraries
Library           Selenium2Library
Library           Collections
Library           Screenshot

*** Variables ***

${RMS.AddClientButton}   id=addClient
${RMS.FMCCompanyGrid1}    xpath=//img[contains(@src, 'my_company.svg')]

${RMS.FMCDashboardSearch}  id=search


*** Keywords ***

FMC Dashboard Assert
    Sleep  2s
    Page Should Contain Element   ${RMS.AddClientButton}
    Page Should Contain Element   ${RMS.FMCCompanyGrid1}
    Page Should COntain Element   ${RMS.FMCDashboardSearch}