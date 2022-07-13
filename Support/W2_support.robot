*** Settings ***
Library      RPA.Browser.Selenium
Library      XML
Library      RPA.Excel.Files
Library      OperatingSystem
Library      associatelib.py
Library      String 
Library      DateTime

Resource     Home.robot
Resource     W-2/TBS-W-2_TS-001.robot
Resource     W-2/TBS-W-2_TS-002.robot
Resource     W-2/TBS-W-2_TS-003.robot
Resource     W-2/TBS-W-2_TS-004.robot
Resource     W-2/TBS-W-2_TS-005.robot
Resource     W-2/TBS-W-2_TS-006.robot
Resource     ReviewandTransmit.robot

*** Keywords ***
ssettings
  
  ${logid}=   logid
  Set Environment Variable     logid     ${logid}