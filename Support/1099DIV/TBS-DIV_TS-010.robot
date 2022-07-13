*** Keywords ***
TBS-DIV_TS-010

 	Open Workbook      ../Test Data/1099Series.xlsx
	${logid}=     Get Environment Variable     logid
	${obj_selectpayer}=    	fndbget      select objvalue from tb_autoobj where objname='selectpayer' and objpg='1099-div'
	${obj_psearch}=		fndbget      select objvalue from tb_autoobj where objname='psearch' and objpg='1099-div'
	${obj_spayer}=		fndbget      select objvalue from tb_autoobj where objname='spayer' and objpg='1099-div'
	${obj_rlookup}=    	fndbget      select objvalue from tb_autoobj where objname='rlookup' and objpg='1099-div'
	${obj_rtype}=		fndbget      select objvalue from tb_autoobj where objname='rtype' and objpg='1099-div'
	${obj_reciselect}=	fndbget      select objvalue from tb_autoobj where objname='reciselect' and objpg='1099-div'
	${obj_b5}=		fndbget      select objvalue from tb_autoobj where objname='b5' and objpg='1099-div'
	${obj_b2b}=		fndbget      select objvalue from tb_autoobj where objname='b2b' and objpg='1099-div' 
	${obj_ErrorPopup}=	fndbget      select objvalue from tb_autoobj where objname='errorpopup' and objpg='1099nec'
	${obj_FixError}=	fndbget      select objvalue from tb_autoobj where objname='fixerror' and objpg='1099-div'
	${obj_savecont}=	fndbget      select objvalue from tb_autoobj where objname='savecont' and objpg='1099-div'
	${obj_addnew}=		fndbget      select objvalue from tb_autoobj where objname='addnew' and objpg='1099-div'
	${obj_clickdiv}=	fndbget      select objvalue from tb_autoobj where objname='clickdiv' and objpg='1099-div'
	${obj_clickfilediv}=	fndbget      select objvalue from tb_autoobj where objname='clickfilediv' and objpg='1099-div'
	${obj_clickmanual}=	fndbget      select objvalue from tb_autoobj where objname='clickmanual' and objpg='1099nec'
	${obj_saveadd}=		fndbget      select objvalue from tb_autoobj where objname='saveadd'and objpg='1099nec'
	${obj_addressent}=	fndbget      select objvalue from tb_autoobj where objname='addressent' and objpg='1099nec'
	${obj_addresscont}=	fndbget      select objvalue from tb_autoobj where objname='addresscont' and objpg='1099nec'
	${obj_reciselect1}=	fndbget      select objvalue from tb_autoobj where objname='reciselect1' and objpg='1099-div'

	${TS_id}=         Get cell value    11    B   1099_Div_Scenario
	${TS_desc}=       Get cell value    11    AQ   1099_Div_Scenario
#Write Federal details
	sleep	3s
	press keys      	${obj_b2b}        CTRL+a+BACKSPACE
	sleep	3s
	${obj_b5-1}=	 Get cell value    8    AI   1099_Div_Scenario
	Input Text 		${obj_b5}		${obj_b5-1}

	${passed1} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_saveadd}     5s		
	Click Element       ${obj_saveadd}
	
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addressent}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addressent}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addresscont} 

#Take Screenshot
	sleep	3s
	Page Should Contain Element	${obj_ErrorPopup}
	Page Should Contain	F03-10003	
	Page Should Contain	Box 5 (Section 199A dividends) amount should not be greater than Box 1a (Total ordinary dividends)
	sleep	3s
	Run Keyword 	Capture Page Screenshot    ../Support/Screenshots/${TS_id}.png
	${passed6} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_FixError}     5s
	Click Element         ${obj_FixError}	
		
#Write log

	Run Keyword If    ${passed6}      writelog    '${logid}','${TS_id}','${TS_desc}','Error message should be shown','Error message is shown','Pass','${TS_id}.png'
	...        ELSE		writelog    '${logid}','${TS_id}','${TS_desc}','Error message should be shown','Error message is not shown','Fail','${TS_id}.png'