*** Settings ***
Resource   ../support/Div_support.robot


*** Test Cases ***
Login in to account
	ssettings
 	${obj_email}=    	fndbget      select objvalue from tb_autoobj where objname='uid'
	${obj_pass}=		fndbget      select objvalue from tb_autoobj where objname='pwd'
	${obj_signin}=		fndbget      select objvalue from tb_autoobj where objname='signin'
 	${accEmail}=		fndbget      select Userid from tb_autodata where SiteName='UAT_DIV'
	${accPass}=		fndbget      select pwd from tb_autodata where SiteName='UAT_DIV'
	${siteURL}=   		fndbget      select Siteid from tb_autodata where SiteName='UAT_DIV'
	Open Browser          ${siteURL}	 Chrome
	Maximize Browser Window
	input text			${obj_email}		${accEmail}
	input text			${obj_pass}		${accPass}
	sleep	10s
	${passed} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_signin}     5s
	Click button			${obj_signin}
	Capture Page Screenshot     ../Support/1099DIV/Screenshots/${logid}_TBS-LOGIN.png
	
  	Run Keyword If    ${passed}      writelog    '${logid}','TBS-LOGIN','Login','Log in should be successfull & navigated to dashboard page','Logged in successfully navigated to dashboard page','Pass','${logid}_TBS-LOGIN.png'
 	...        ELSE		writelog    '${logid}','TBS-LOGIN','Login','Log in should be successfull & navigated to dashboard page','Log in fails','Fail','${logid}_TBS-LOGIN.png'
	
  Sleep  7s
Click Form 1099-DIV
  ${passed}=        Select_Form
  Sleep  5s
Test Scenario TBS-DIV_TS-001
  ${passed}=        TBS-DIV_TS-001
  Sleep  15s
Test Scenario TBS-DIV_TS-002
  ${passed}=        TBS-DIV_TS-002
  Sleep  15s
Test Scenario TBS-DIV_TS-003
  ${passed}=        TBS-DIV_TS-003
  Sleep  15s
Test Scenario TBS-DIV_TS-004
  ${passed}=        TBS-DIV_TS-004
  Sleep  15s
Test Scenario TBS-DIV_TS-005
  ${passed}=        TBS-DIV_TS-005
  Sleep  15s
Test Scenario TBS-DIV_TS-006
  ${passed}=        TBS-DIV_TS-006
  Sleep  15s
Test Scenario TBS-DIV_TS-007
  ${passed}=        TBS-DIV_TS-007
  Sleep  15s
Test Scenario TBS-DIV_TS-008
  ${passed}=        TBS-DIV_TS-008
  Sleep  15s
Test Scenario TBS-DIV_TS-009
  ${passed}=        TBS-DIV_TS-009
  Sleep  15s
Test Scenario TBS-DIV_TS-010
  ${passed}=        TBS-DIV_TS-010
  Sleep  15s
createlog
  ${logid}=     Get Environment Variable     logid
  createh   ${logid}

#Submit Form 1099-DIV
  ${passed}=        FillForm_1099Div
  Sleep  15s

#Review and Transmit the order
  ${passed}=        Review_Transmit_form1099
 
