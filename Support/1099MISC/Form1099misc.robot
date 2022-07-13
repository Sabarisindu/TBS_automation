*** Keywords ***
Select_Form_1099MISC


	${xml}=    Parse XML    1099Misc.xml
	${obj_miscform}=		Get Element Text    	${xml}   	miscform
	${obj_taxyear2021}=		Get Element Text    	${xml}   	taxyear2021
	${obj_manual}=		Get Element Text    	${xml}   	manual
	${obj_business}=		Get Element Text    	${xml}   	business
	${obj_bsearch}=		Get Element Text    	${xml}   	bsearch
	${obj_bselect}=		Get Element Text    	${xml}   	bselect
	${obj_recipient}=		Get Element Text    	${xml}   	recipient
	${obj_rsearch}=		Get Element Text    	${xml}   	rsearch
	${obj_rselect}=		Get Element Text    	${xml}   	rselect
	${obj_line1}=		Get Element Text    	${xml}   	line1
	${obj_line2}=		Get Element Text    	${xml}   	line2
	${obj_line3}=		Get Element Text    	${xml}   	line3
	${obj_line4}=		Get Element Text    	${xml}   	line4
	${obj_line5}=		Get Element Text    	${xml}   	line5
	${obj_line6}=		Get Element Text    	${xml}   	line6
	${obj_line7}=		Get Element Text    	${xml}   	line7
	${obj_line8}=		Get Element Text    	${xml}   	line8
	${obj_line9}=		Get Element Text    	${xml}   	line9
	${obj_line10}=		Get Element Text    	${xml}   	line10
	${obj_line11}=		Get Element Text    	${xml}   	line11
	${obj_line12}=		Get Element Text    	${xml}   	line12
	${obj_line13}=		Get Element Text    	${xml}   	line13
	${obj_line14}=		Get Element Text    	${xml}   	line14
	${obj_save}=		Get Element Text    	${xml}   	save
	${obj_savecon}=		Get Element Text    	${xml}   	savecon
	${obj_continue}=	Get Element Text    	${xml}   	continue
	${obj_add}=		Get Element Text    	${xml}   	add
	${obj_misc}=		Get Element Text    	${xml}   	misc
	${obj_address}=		Get Element Text    	${xml}          address

	sleep     2s
	Click Element         ${obj_miscform}
	sleep     2s
	Click Element         ${obj_taxyear2021}
	sleep     2s
	Click Element         ${obj_manual}

  ${wbook}=     Set Variable     1099Series.xlsx
  Open Workbook      ${wbook}
  ${sheet}=        Read Worksheet   1099Misc
  ${rows}=         Get Length  ${sheet}
  #FOR    ${i}    IN RANGE    2    ${rows}+1
	${Businessdata}=       Get cell value    5    A   1099Misc
	Wait Until Element Is Enabled 		${obj_business}  		10s
	Click Element         ${obj_business}
	Wait Until Element Is Enabled 		${obj_bsearch}  		10s
	input text			${obj_bsearch}		${Businessdata}
	Wait Until Element Is Enabled 		${obj_bselect}  		10s
	Click Element         ${obj_bselect}

  FOR    ${i}    IN RANGE    2    ${rows}+1
	${RecipientTIN}=       Get cell value    ${i}    C   1099Misc
	${Rents}=       Get cell value    ${i}    D   1099Misc
	${Royalties}=       Get cell value    ${i}    E   1099Misc
	${Other}=       Get cell value    ${i}    F   1099Misc
	${Federal}=       Get cell value    ${i}    G   1099Misc
	${Fishing}=       Get cell value    ${i}    H   1099Misc
	${Medical}=       Get cell value    ${i}    I   1099Misc
	${Substitute}=       Get cell value    ${i}    K   1099Misc
	${Crop}=       Get cell value    ${i}    L   1099Misc
	${Gross}=       Get cell value    ${i}    M   1099Misc
	${Fish}=       Get cell value    ${i}    N   1099Misc
	${Section}=       Get cell value    ${i}    O   1099Misc
	${Excess}=       Get cell value    ${i}    P   1099Misc
	${Nonqualified}=       Get cell value    ${i}    Q   1099Misc
	
	
	#Wait Until Element Is Enabled 		${obj_recipient}  		10s
	sleep    7s
	Click Element         ${obj_recipient}
	Wait Until Element Is Enabled 		${obj_rsearch}			10s
	input text			${obj_rsearch}		${RecipientTIN}
	Wait Until Element Is Enabled 		${obj_rselect}  		10s
	Click Element         ${obj_rselect}
	input text			${obj_line1}		${Rents}
	input text			${obj_line2}		${Royalties}
	input text			${obj_line3}		${Other}
	input text			${obj_line4}		${Federal}
	input text			${obj_line5}		${Fishing}
	input text			${obj_line6}		${Medical}
	#Wait Until Element Is Enabled 		${obj_line7}		5s
	#Click Element         ${obj_line7}
	input text			${obj_line8}		${Substitute}
	input text			${obj_line9}		${Crop}
	input text			${obj_line10}		${Gross}
	input text			${obj_line11}		${Fish}
	input text			${obj_line12}		${Section}
	input text			${obj_line13}		${Excess}
	input text			${obj_line14}		${Nonqualified}
	#Click Element         ${obj_save}
	Run Keyword If	${i}==${rows}  Click Element       ${obj_savecon}                                 
	  ...        ELSE           Click Element       ${obj_save}
	#Click Element         ${obj_savecon}
	sleep    2s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_address}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_address}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_continue}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_continue}
	#Wait Until Element Is Enabled 		${obj_continue}			10s
	#Click Element         ${obj_continue}
	#Wait Until Element Is Enabled 		${obj_add}		10s
	#Click Element         ${obj_add}
	#sleep     2s
	#Click Element         ${obj_miscform}
	#sleep     2s
	#Click Element         ${obj_taxyear2021}
	#sleep     3s
	#Click Element         ${obj_misc}
	#sleep     2s
	#Run Keyword If	${i}==${rows}        
	#Wait Until Element Is Enabled 		${obj_add}			10s
	#Click Element         ${obj_add}
	#sleep     2s
	#Click Element         ${obj_miscform}
	#sleep     2s
	#Click Element         ${obj_taxyear2021}
	#sleep     3s
	#Click Element         ${obj_misc} 
	  #...        ELSE           Click Element         ${obj_reviewcon}
  END
	

	
