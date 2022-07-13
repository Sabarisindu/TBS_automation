*** Settings ***
Resource   ../support/INT_support.robot


*** Test Cases ***
Login in to account
	ssettings
 	${xml}=    Parse XML    ../Object Repository/login.xml
	${logid}=     Get Environment Variable     logid
	${obj_email}=    	fndbget    	Select Objvalue From tb_autoobj where objname='uid' 
	${obj_pass}=		fndbget         select objvalue from tb_autoobj where objname='pwd'
	${obj_signin}=		fndbget         select objvalue from tb_autoobj where objname='signin'
  ${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
  Open Workbook      ${wbook}
 	${accEmail}= 	   fndbget      select Userid from tb_autodata where SiteName='UAT_INT'
	${accPass}=        fndbget      select pwd from tb_autodata where SiteName='UAT_INT'
	${siteURL}=        fndbget      select Siteid from tb_autodata where SiteName='UAT_INT'

	Open Browser          ${siteURL}	 Chrome
	Maximize Browser Window
	sleep	5s
	input text			${obj_email}		${accEmail}
	input text			${obj_pass}		${accPass}
	${passed} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_signin}     5s
	Click button			${obj_signin}	  

	Capture Page Screenshot     ../Support/Screenshots/${logid}_TBS-LOGIN.png
	
  	Run Keyword If    ${passed}      writelog    '${logid}','TBS-LOGIN','Login','Log in should be successfull & navigated to dashboard page','Logged in successfully navigated to dashboard page','Pass','${logid}_TBS-LOGIN.png'
 	...        ELSE		writelog    '${logid}','TBS-LOGIN','Login','Log in should be successfull & navigated to dashboard page','Log in fails','Fail','${logid}_TBS-LOGIN.png'
	
	Sleep  10s
Click Form 1099-INT
  ${passed}=        Select_Form
  Sleep  5s
Test Scenario TBS-INT_TC-001
  ${passed}=        TBS-INT_TC-001
  Sleep  5s
Test Scenario TBS-INT_TC-002
  ${passed}=        TBS-INT_TC-002
  Sleep  5s
Test Scenario TBS-INT_TC-003
  ${passed}=        TBS-INT_TC-003
  Sleep  5s
Test Scenario TBS-INT_TC-004
  ${passed}=        TBS-INT_TC-004
  Sleep  5s
Test Scenario TBS-INT_TC-005
  ${passed}=        TBS-INT_TC-005
  Sleep  5s
Test Scenario TBS-INT_TC-006
  ${passed}=        TBS-INT_TC-006
  Sleep  5s
#Review and Transmit the order
  #${passed}=        Review_Transmit_form1099

createlog
  ${logid}=     Get Environment Variable     logid
  createh   ${logid}

 

 
