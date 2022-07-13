*** Settings ***
Resource   ../support/W2_support.robot


*** Test Cases ***
Login in to account
	ssettings
  	${xml}=    Parse XML    ../Object Repository/login.xml
	${logid}=     Get Environment Variable     logid
	${obj_email}=    	fndbget      select objvalue from tb_autoobj where objname='uid'
	${obj_pass}=		fndbget      select objvalue from tb_autoobj where objname='pwd'
	${obj_signin}=		fndbget      select objvalue from tb_autoobj where objname='signin'	
  ${wbook}=     Set Variable     ../Test Data/Form W-2.xlsx
  Open Workbook      ${wbook}
	${accEmail}=       fndbget      select Userid from tb_autodata where SiteName='UAT_W-2'
	${accPass}=       fndbget      select pwd from tb_autodata where SiteName='UAT_W-2'
	${siteURL}=       fndbget      select Siteid from tb_autodata where SiteName='UAT_W-2'

	Open Browser           ${siteURL}	 Edge
	Maximize Browser Window
	input text			${obj_email}		${accEmail}
	input text			${obj_pass}		${accPass}
	${passed} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_signin}     5s
	Click button			${obj_signin}
	Capture Page Screenshot     ../Support/Screenshots/${logid}_TBS-LOGIN.png
	
  	Run Keyword If    ${passed}      writelog    '${logid}','TBS-LOGIN','Login','Log in should be successfull & navigated to dashboard page','Logged in successfully navigated to dashboard page','Pass','${logid}_TBS-LOGIN.png'
 	...        ELSE		writelog    '${logid}','TBS-LOGIN','Login','Log in should be successfull & navigated to dashboard page','Log in fails','Fail','${logid}_TBS-LOGIN.png'

   Sleep  10s
Click Start New Form
   ${passed}=        Select_Form
   Sleep  5s
Test Scenario TBS-W-2_TS-001
  ${passed}=        TBS-W-2_TS-001
Test Scenario TBS-W-2_TS-002
  ${passed}=        TBS-W-2_TS-002
Test Scenario TBS-W-2_TS-003
  ${passed}=        TBS-W-2_TS-003
Test Scenario TBS-W-2_TS-004
  ${passed}=        TBS-W-2_TS-004
Test Scenario TBS-W-2_TS-005
  ${passed}=        TBS-W-2_TS-005
Test Scenario TBS-W-2_TS-006
  ${passed}=        TBS-W-2_TS-006
   #Sleep  5s
	#${xml}=    Parse XML    ../Object Repository/login.xml
	#${obj_bulkaction}=		fndbget      select objvalue from tb_autoobj where objname='bulkaction'
	#${obj_bulkdelete}=		fndbget      select objvalue from tb_autoobj where objname='bulkdelete'
	#${obj_delpermanent}=		fndbget      select objvalue from tb_autoobj where objname='delpermanent'
   #Sleep  10s
	#Click Element		${obj_bulkaction}
	#sleep 	6s 
	#Click Element		${obj_bulkdelete}
	#sleep 	5s 
	#Click Element		${obj_delpermanent}

createlog
  ${logid}=     Get Environment Variable     logid
  createh   ${logid}
