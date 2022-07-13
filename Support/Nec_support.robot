*** Settings ***
Library      RPA.Browser.Selenium
Library      XML
Library      RPA.Excel.Files
Library      OperatingSystem
Library      associatelib.py
Library      String 
Library      DateTime

		

Resource     Home.robot
Resource     1099NEC/TBS-NEC_TS-001.robot
Resource     1099NEC/TBS-NEC_TS-002.robot
Resource     1099NEC/TBS-NEC_TS-003.robot
Resource     1099NEC/TBS-NEC_TS-004.robot
Resource     1099NEC/TBS-NEC_TS-005.robot
Resource     1099NEC/TBS-NEC_TS-006.robot
Resource     1099NEC/TBS-NEC_TS-007.robot
Resource     1099NEC/TBS-NEC_TS-008.robot
Resource     1099NEC/TBS-NEC_TS-009.robot
#Resource    ReviewandTransmit.robot

*** Keywords ***
ssettings
  
  ${logid}=   logid
  Set Environment Variable     logid     ${logid}


  