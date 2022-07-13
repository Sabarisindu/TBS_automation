*** Keywords ***
TBS-W-2_TS-005

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
	${obj_line1}=		fndbget      select objvalue from tb_autoobj where objname='line1'and objpg='Form W-2'
	${obj_line2}=		fndbget      select objvalue from tb_autoobj where objname='line2'and objpg='Form W-2'
	${obj_line3}=		fndbget      select objvalue from tb_autoobj where objname='line3'and objpg='Form W-2'
	${obj_line4}=		fndbget      select objvalue from tb_autoobj where objname='line4'and objpg='Form W-2'
	${obj_line5}=		fndbget      select objvalue from tb_autoobj where objname='line5'and objpg='Form W-2'
	${obj_line6}=		fndbget      select objvalue from tb_autoobj where objname='line6'and objpg='Form W-2'
	${obj_line7}=		fndbget      select objvalue from tb_autoobj where objname='line7'and objpg='Form W-2'
	${obj_line8}=		fndbget      select objvalue from tb_autoobj where objname='line8'and objpg='Form W-2'
	${obj_line10}=		fndbget      select objvalue from tb_autoobj where objname='line10'and objpg='Form W-2'
	${obj_line11}=		fndbget      select objvalue from tb_autoobj where objname='line11'and objpg='Form W-2'

	${obj_statutoryemp}=		fndbget      select objvalue from tb_autoobj where objname='statutoryemp'and objpg='Form W-2'
	${obj_retirementplan}=		fndbget      select objvalue from tb_autoobj where objname='retirementplan'and objpg='Form W-2'
	${obj_thirdparty}=		fndbget      select objvalue from tb_autoobj where objname='thirdparty'and objpg='Form W-2'
	${obj_line14}=		fndbget      select objvalue from tb_autoobj where objname='line14'and objpg='Form W-2'
	${obj_savecon}=		fndbget      select objvalue from tb_autoobj where objname='savecon'and objpg='Form W-2'
	${obj_saveadd}=		fndbget      select objvalue from tb_autoobj where objname='saveadd'and objpg='Form W-2'
        ${obj_address}=		fndbget      select objvalue from tb_autoobj where objname='address'and objpg='Form W-2'
	${obj_continue}=	fndbget      select objvalue from tb_autoobj where objname='continue'and objpg='Form W-2'
	${obj_clear}=		fndbget      select objvalue from tb_autoobj where objname='clear'and objpg='Form W-2'
	${obj_ErrorPopup}=	fndbget      select objvalue from tb_autoobj where objname='errorpopup'and objpg='Form W-2'
	${obj_FixError}=	fndbget      select objvalue from tb_autoobj where objname='fixerror'and objpg='Form W-2'
	${obj_errorheader}=	fndbget      select objvalue from tb_autoobj where objname='errorheader'and objpg='Form W-2'
	${TS_id}=       Get cell value    6    B   W-2_Scenario
	${TS_desc}=       Get cell value    6    AM   W-2_Scenario

  ${wbook}=     Set Variable     ../Test Data/Form W-2.xlsx
  Open Workbook      ${wbook}
  ${sheet}=        Read Worksheet   W-2_Scenario
  ${rows}=         Get Length  ${sheet}
  #FOR    ${i}    IN RANGE    1    ${rows}
	#Wait Until Element is Enabled	${obj_clear}	5s
	#Click Element		${obj_clear}
	#${Businessdata}=       Get cell value    5    A   W-2_Scenario
	#Wait Until Element Is Enabled 		${obj_business}  		5s
	#Click Element         ${obj_business}
	#Wait Until Element Is Enabled 		${obj_bsearch}  		5s
	#input text			${obj_bsearch}		${Businessdata}
	#Wait Until Element Is Enabled 		${obj_bselect}  		5s
	#Click Element         ${obj_bselect}
	${EmployeeSSN}=       Get cell value    6    C   W-2_Scenario
	${Wages}=       Get cell value    6    D   W-2_Scenario
	${FederalWH}=       Get cell value    6    E   W-2_Scenario

	sleep    5s
	Click Element         ${obj_employee}
	Wait Until Element Is Enabled 		${obj_esearch}			5s
	input text			${obj_esearch}		${EmployeeSSN}
	Wait Until Element Is Enabled 		${obj_eselect}  		5s
	Click Element         ${obj_eselect}
	sleep    2s
	Click Element         ${obj_onlineaccess}
	input text			${obj_line1}		${Wages}
	input text			${obj_line2}		${FederalWH}

	sleep   3s
	Click Element       ${obj_saveadd}
	sleep    10s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_address}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_address}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_continue}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_continue}
	Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_ErrorPopup}    10s
	Page Should Contain	${obj_ErrorPopup}
	Page Should Contain	F04-100079		
	Page Should Contain	Federal Income Tax Withheld [Box 2] should not be greater than Wages, Tips and Other Compensation [Box 1]
	sleep    10s
	Capture Page Screenshot     ../Support/Screenshots/${TS_id}.png
	sleep    3s
	${passed6} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_FixError}     5s
	Click Element         ${obj_FixError}

	#Capture Page Screenshot 	../Support/Screenshots/${TS_id}.png
	#Page Should Contain	F04-100079
	#Page Should Contain	Federal Income Tax Withheld [Box 2] should not be greater than Wages, Tips and Other Compensation [Box 1]
	#Click Element         ${obj_FixError}
	
  	Run Keyword If    ${passed6}      writelog    '${logid}','${TS_id}','${TS_desc}','Error message should be shown','Error message is shown','Pass','${TS_id}.png'
	...        ELSE		writelog    '${logid}','${TS_id}','${TS_desc}','Error message should be shown','Error message is shown','Fail','${TS_id}.png'