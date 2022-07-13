*** Keywords ***
TBS-W-2_TS-006

	${xml}=    Parse XML    ../Object Repository/W-2.xml
	${logid}=     Get Environment Variable     logid
	${obj_w2form}=		fndbget      select objvalue from tb_autoobj where objname='w2form'and objpg='Form W-2'
	${obj_taxyear2021}=		fndbget      select objvalue from tb_autoobj where objname='taxyear2021'and objpg='Form W-2'
	${obj_manual}=		fndbget      select objvalue from tb_autoobj where objname='manual'and objpg='Form W-2'
	${obj_business}=		fndbget      select objvalue from tb_autoobj where objname='business'and objpg='Form W-2'
	${obj_bsearch}=		fndbget      select objvalue from tb_autoobj where objname='bsearch' and objpg='Form W-2'
	${obj_bselect}=		fndbget      select objvalue from tb_autoobj where objname='bselect'and objpg='Form W-2'
        ${obj_employee}=		fndbget      select objvalue from tb_autoobj where objname='employee'and objpg='Form W-2'
	${obj_esearch}=		fndbget      select objvalue from tb_autoobj where objname='esearch'and objpg='Form W-2'
	${obj_eselect}=		fndbget      select objvalue from tb_autoobj where objname='eselect'and objpg='Form W-2'
	${obj_onlineaccess}=		fndbget      select objvalue from tb_autoobj where objname='onlineaccess'and objpg='Form W-2'
	${obj_savecon}=		fndbget      select objvalue from tb_autoobj where objname='savecon'and objpg='Form W-2'
	${obj_saveadd}=		fndbget      select objvalue from tb_autoobj where objname='saveadd'and objpg='Form W-2'
        ${obj_address}=		fndbget      select objvalue from tb_autoobj where objname='address'and objpg='Form W-2'
	${obj_continue}=	fndbget      select objvalue from tb_autoobj where objname='continue'and objpg='Form W-2'
	${obj_clear}=		fndbget      select objvalue from tb_autoobj where objname='clear'and objpg='Form W-2'
	${obj_emailaddress}=		fndbget      select objvalue from tb_autoobj where objname='emailaddress'and objpg='Form W-2'
	${obj_ErrorPopup}=	fndbget      select objvalue from tb_autoobj where objname='errorpopup'and objpg='Form W-2'
	${obj_FixError}=	fndbget      select objvalue from tb_autoobj where objname='fixerror'and objpg='Form W-2'
	${TS_id}=       Get cell value    7    B   W-2_Scenario
	${TS_desc}=       Get cell value    7    AM   W-2_Scenario


  ${wbook}=     Set Variable     ../Test Data/Form W-2.xlsx
  Open Workbook      ${wbook}
  ${sheet}=        Read Worksheet   W-2_Scenario
  ${rows}=         Get Length  ${sheet}
  #FOR    ${i}    IN RANGE    1    ${rows}
	${EmployeeSSN}=       Get cell value    7    C   W-2_Scenario

	Execute Javascript    window.location.reload(true);
	Click Element         ${obj_employee}
	Wait Until Element Is Enabled 		${obj_esearch}			5s
	input text			${obj_esearch}		${EmployeeSSN}
	Wait Until Element Is Enabled 		${obj_eselect}  		5s
	Click Element         ${obj_eselect}

	sleep   3s
	${passed4} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_saveadd}     5s	
	Click Element       ${obj_saveadd}
	sleep   6s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_address}    5s
	Run Keyword If    ${passed}    Click Element   ${obj_address}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_continue}    5s
	Run Keyword If    ${passed}    Click Element   ${obj_continue}
	Page Should Contain Element	${obj_ErrorPopup}
	
	Page Should Contain	F04-100042	
	Page Should Contain	At least any one amount should be greater than $0.00
	Run Keyword  Capture Page Screenshot     ../Support/Screenshots/${TS_id}.png
	${passed6} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_FixError}     5s
	Click Element         ${obj_FixError}
	
  	Run Keyword If    ${passed6}      writelog    '${logid}','${TS_id}','${TS_desc}','Error message should be shown','Error message is shown','Pass','${TS_id}.png'
	...        ELSE		writelog    '${logid}','${TS_id}','${TS_desc}','Error message should be shown','Error message is shown','Fail','${TS_id}.png'