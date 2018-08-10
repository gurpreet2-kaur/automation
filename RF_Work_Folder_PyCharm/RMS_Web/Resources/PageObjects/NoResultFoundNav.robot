*** Settings ***
Documentation  Adding the pre-build libraries
Library           Selenium2Library
Library           Collections
Library           Screenshot

*** Variables ***

*** Keywords ***

Invalid Search Assert
    page should contain element    xpath=//font[text()="No Results Found"]
    page should contain element    xpath=//span[text()="Modify the search and try again"]

Invalid Filter Assert
    page should contain element    xpath=//font[text()="No Results Found"]