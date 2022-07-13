*** Settings ***
Library      RPA.Browser.Selenium
Library      XML
Library      RPA.Excel.Files
Library      OperatingSystem
Library      associatelib.py
Library      String 
Library      DateTime


Resource     Home.robot
Resource     1099INT/TBS-INT_TC-001.robot
Resource     1099INT/TBS-INT_TC-002.robot
Resource     1099INT/TBS-INT_TC-003.robot
Resource     1099INT/TBS-INT_TC-004.robot
Resource     1099INT/TBS-INT_TC-005.robot
Resource     1099INT/TBS-INT_TC-006.robot

#Resource     ReviewandTransmit.robot


*** Keywords ***
ssettings
  
  ${logid}=   logid
  Set Environment Variable     logid     ${logid}