*** Settings ***
Library      SeleniumLibrary
Library      XML
Library      RPA.Excel.Files
Library      OperatingSystem
Library      associatelib.py
Library      String 
Library      DateTime
Resource     Home.robot
Resource     1099MISC/TBS-MISC_TS-001.robot
Resource     1099MISC/TBS-MISC_TS-002.robot
Resource     1099MISC/TBS-MISC_TS-003.robot
Resource     1099MISC/TBS-MISC_TS-004.robot
Resource     1099MISC/TBS-MISC_TS-005.robot
Resource     1099MISC/TBS-MISC_TS-006.robot
Resource     1099MISC/TBS-MISC_TS-007.robot

*** Keywords ***
ssettings
  
  ${logid}=   logid
  Set Environment Variable     logid     ${logid}
  