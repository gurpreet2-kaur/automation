*** Settings ***
Documentation  Adding the pre-build libraries
Library           Selenium2Library
Library           Collections
Library           Screenshot

*** Variables ***
${RMS.NotificationBell}   xpath=//img[contains(@src,'bell')]
${RMS.NotificationTopHeading}   xpath=//span[text()="Settings "]/following-sibling::span[text()=" > Notifications"]
${RMS.SettingsHyperlink}   xpath=//span/a[@href="#/settings" and text()="Settings"]
${RMS.NotificationsTopHeading}   xpath=//span[text()=" > Notifications"]

*** Keywords ***
Click on Notifications icon
    click element   ${RMS.NotificationBell}

Notification Screen Assert
    Sleep  3s
    page should contain   Notifications
    #page should contain element   ${RMS.SettingsHyperlink}
    page should contain    Notifications
