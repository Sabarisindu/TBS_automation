*** Settings ***
Resource   ../support/Misc_support.robot


*** Test Cases ***
Login in to account
	ssettings
  	${xml}=    Parse XML    ../Object repository/login.xml
	${obj_email}=    	fndbget      select objvalue from tb_autoobj where objname='uid'
	${obj_pass}=		fndbget      select objvalue from tb_autoobj where objname='pwd'
	${obj_signin}=		fndbget      select objvalue from tb_autoobj where objname='signin'
  ${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
  Open Workbook      ${wbook}
	${accEmail}=       fndbget      select Userid from tb_autodata where SiteName='UAT_MISC'
	${accPass}=       fndbget      select pwd from tb_autodata where SiteName='UAT_MISC'
	${siteURL}=       fndbget      select Siteid from tb_autodata where SiteName='UAT_MISC'

	Open Browser           ${siteURL}	 Chrome
	Maximize Browser Window
	input text			${obj_email}		${accEmail}
	input text			${obj_pass}		${accPass}
	Sleep  10s
	Click button			${obj_signin}

  Sleep  10s
Click Start New Form
  ${passed}=        Select_Form
TBS-MISC_TS-001

  ${passed}=      TBS-MISC_TS-001
TBS-MISC_TS-002
  ${passed}=      TBS-MISC_TS-002
TBS-MISC_TS-003
  ${passed}=      TBS-MISC_TS-003
TBS-MISC_TS-004
  ${passed}=      TBS-MISC_TS-004
TBS-MISC_TS-005
  ${passed}=      TBS-MISC_TS-005
TBS-MISC_TS-006
  ${passed}=      TBS-MISC_TS-006
TBS-MISC_TS-007
  ${passed}=      TBS-MISC_TS-007

createlog
  ${logid}=     Get Environment Variable     logid
  createh   ${logid}
