*** Keywords ***
TBS-INT_TC-001

	${xml}=    Parse XML    ../Object Repository/1099int.xml
	${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
	${logid}=     Get Environment Variable     logid
	${obj_INTform}=			fndbget		select objvalue from tb_autoobj where objname='intform'
	${obj_taxyr}=			fndbget		select objvalue from tb_autoobj where objname='taxyr'
	${obj_manual}=			fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='manual'
	${obj_selectpayer}= 		fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='selectpayer'
	${obj_spayer}=			fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='spayer'
	${obj_rlookup}=    		fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='rlookup'
	${obj_rtype}=			fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='rtype'
	${obj_reciselect}=		fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='reciselect'
	${obj_payerrtn}=		fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='payerrtn'
	${obj_interest}=		fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='interest'
	${obj_early}=			fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='early'
	${obj_ussavings}=		fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='ussavings'
	${obj_fditw}=			fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='fditw'
	${obj_invesmentexp}=		fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='invesmentexp'
	${obj_ftaxpaid}=		fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='ftaxpaid'
	${obj_fcountry}=		fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='fcountry'
	${obj_taxexempt}=		fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='taxexempt'
	${obj_privateactivity}=		fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='privateactivity'
	${obj_marketdiscount}=		fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='marketdiscount'
	${obj_bondpremium}=		fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='bondpremium'
	${obj_bptreasury}=		fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='bptreasury'
	${obj_bptaxexempt}=	 	fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='bptaxexempt'
	${obj_cusipno}=		        fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='cusipno'
	${obj_savecont}=		fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='savecont'
	${obj_saveadd}=			fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='saveadd'
	${obj_ignore}=			fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='ignore'
	${obj_reciselect1}=		fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='reciselect1'
	${obj_usadd}=			fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='usadd'
	${obj_psearch}=			fndbget		Select Objvalue From tb_autoobj where objpg='1099INT' and objname='psearch'
	
	${TS_id}=       Get cell value    2    B   1099_INT_Scenario
	${TS_desc}=       Get cell value    2    AS   1099_INT_Scenario
	
	Open Workbook      ${wbook}
 	${sheet}=        Read Worksheet   1099_INT_Scenario

	Click Element         ${obj_INTform}
	Sleep	3s
	Click Element         ${obj_taxyr}
	Sleep	3s
	Click Element         ${obj_manual}
	sleep	10s
	${Businessdata}=       Get cell value    5    A   1099_INT_Scenario
	Click Element           	${obj_selectpayer}		
	sleep 	5s			
	Input Text			${obj_psearch}			${Businessdata}		
        sleep  5s
	Click Element        		${obj_spayer}

	${obj_rtype1}=	Get cell value    2    C   1099_INT_Scenario
	${obj_interest1}=	Get cell value    2    Y   1099_INT_Scenario
	
	Wait Until Element is Enabled	${obj_rlookup}	20s	
	Click Element           	${obj_rlookup}		
	sleep 	10s		
	Input Text			${obj_rtype}			${obj_rtype1}

	Wait Until Element is Enabled	${obj_reciselect}	20s
	Click Element			${obj_reciselect}
	
	Input Text			${obj_interest}		${obj_interest1}	
	${passed1} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_saveadd}     5s		
	Click Element       ${obj_saveadd}                            
		
	sleep	5s
	${passed} =    Run Keyword AND Return Status         Wait Until Element Is Enabled       ${obj_addressent}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addressent} 
	${passed} =    Run Keyword AND Return Status         Wait Until Element Is Enabled       ${obj_usadd}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_usadd}
	${passed} =    Run Keyword AND Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addresscont} 
	Run Keyword Unless    ${passed}       Capture Page Screenshot     ../Support/Screenshots/${logid}_TBS-INT_TS-001.png
	sleep	5s
	Run Keyword If	${passed}      writelog    '${logid}','TBS-INT_TS-001','Create Form with USPS Address','INT form should be created with USPS address','INT form is created with USPS address','pass','${logid}_TBS-INT_TS-001.png'