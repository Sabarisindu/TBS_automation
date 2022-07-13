*** Settings ***
Library      RPA.Browser.Selenium
Library      XML
Library      RPA.Tables
Library      RPA.Excel.Files
Library      OperatingSystem
Library      associatelib.py
Library      String 
Library      DateTime
Library      Screenshot

Resource     Home.robot
Resource     1099DIV/TBS-DIV_TS-001.robot
Resource     1099DIV/TBS-DIV_TS-002.robot
Resource     1099DIV/TBS-DIV_TS-003.robot
Resource     1099DIV/TBS-DIV_TS-004.robot
Resource     1099DIV/TBS-DIV_TS-005.robot
Resource     1099DIV/TBS-DIV_TS-006.robot
Resource     1099DIV/TBS-DIV_TS-007.robot
Resource     1099DIV/TBS-DIV_TS-008.robot
Resource     1099DIV/TBS-DIV_TS-009.robot
Resource     1099DIV/TBS-DIV_TS-010.robot
Resource     ReviewandTransmit.robot


*** Keywords ***
ssettings
  
  ${logid}=   logid
  Set Environment Variable     logid     ${logid}

  