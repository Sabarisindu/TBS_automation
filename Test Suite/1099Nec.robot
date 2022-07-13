*** Settings ***
Resource   ../Support/Nec_support.robot


*** Test Cases ***
Login in to account
	ssettings
 	${xml}=    Parse XML    ../Object Repository/login.xml
	${logid}=     Get Environment Variable     logid
	${obj_email}=    	fndbget      select objvalue from tb_autoobj where objname='uid'
	${obj_pass}=		fndbget      select objvalue from tb_autoobj where objname='pwd'
	${obj_signin}=		fndbget      select objvalue from tb_autoobj where objname='signin'
  ${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
  Open Workbook      ${wbook}
	${accEmail}=       fndbget      select Userid from tb_autodata where SiteName='UAT_NEC'
	${accPass}=       fndbget      select pwd from tb_autodata where SiteName='UAT_NEC'
	${siteURL}=       fndbget      select Siteid from tb_autodata where SiteName='UAT_NEC'
	Open Browser          ${siteURL}	 Chrome
	Maximize Browser Window
	input text			${obj_email}		${accEmail}
	input text			${obj_pass}		${accPass}
	${passed} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_signin}     5s
	Click button			${obj_signin}
	Capture Page Screenshot     ../Support/Screenshots/${logid}_TBS-LOGIN.png
	
  	Run Keyword If    ${passed}      writelog    '${logid}','TBS-LOGIN','Login','Log in should be successfull & navigated to dashboard page','Logged in successfully navigated to dashboard page','Pass','${logid}_TBS-LOGIN.png'
 	...        ELSE		writelog    '${logid}','TBS-LOGIN','Login','Log in should be successfull & navigated to dashboard page','Log in fails','Fail','${logid}_TBS-LOGIN.png'
	
  	Sleep  20s
Click Form 1099-NEC
	${passed}=        Select_Form
  	Sleep  5s
	
Test Scenario TBS-NEC_TS-001
  	${passed}=        TBS-NEC_TS-001
  	Sleep  15s
Test Scenario TBS-NEC_TS-002
  	${passed}=        TBS-NEC_TS-002
  	Sleep	 15s
Test Scenario TBS-NEC_TS-003
  	${passed}=        TBS-NEC_TS-003
  	Sleep	 15s
Test Scenario TBS-NEC_TS-004
  	${passed}=        TBS-NEC_TS-004
  	Sleep	 15s	
Test Scenario TBS-NEC_TS-005
  	${passed}=        TBS-NEC_TS-005
  	Sleep	 15s
Test Scenario TBS-NEC_TS-006
  	${passed}=        TBS-NEC_TS-006
  	Sleep	 15s
Test Scenario TBS-NEC_TS-007
  	${passed}=        TBS-NEC_TS-007
  	Sleep	 15s
Test Scenario TBS-NEC_TS-008
  	${passed}=        TBS-NEC_TS-008
  	Sleep	 15s
#Test Scenario TBS-NEC_TS-009
  #${passed}=        TBS-NEC_TS-009

createlog
  ${logid}=     Get Environment Variable     logid
  createh   ${logid}

 
