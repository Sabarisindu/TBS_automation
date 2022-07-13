*** Keywords ***
TBS-INT_TC-005

	${xml}=    Parse XML         ../Object Repository/1099int.xml
	${wbook}=     Set Variable      	 ../Test Data/1099Series.xlsx
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
	
	${TS_id}=       Get cell value    6    B   1099_INT_Scenario
	${TS_desc}=       Get cell value    6    AS   1099_INT_Scenario
	Open Workbook      ${wbook}
	
	${Businessdata}=       Get cell value    5    A   1099_INT_Scenario
	Click Element           	${obj_selectpayer}		
	sleep 	10s			
	Input Text			${obj_psearch}			${Businessdata}		
	Click Element        		${obj_spayer}
	${obj_rtype1}=		Get cell value    6    C   1099_INT_Scenario
	${obj_payerrtn1}=	Get cell value    6    X   1099_INT_Scenario
	${obj_interest1}=	Get cell value    6    Y   1099_INT_Scenario	
	${obj_early1}=		Get cell value    6    Z   1099_INT_Scenario     
	${obj_ussavings1}=	Get cell value    6    AA  1099_INT_Scenario	
	${obj_fditw1}=		Get cell value    6    AB  1099_INT_Scenario      
	${obj_invesmentexp1}=	Get cell value    6    AC  1099_INT_Scenario	
	${obj_ftaxpaid1}=	Get cell value    6    AD  1099_INT_Scenario	
	${obj_fcountry1}=	Get cell value    6    AE  1099_INT_Scenario	
	${obj_taxexempt1}=	Get cell value    6    AF  1099_INT_Scenario	
	${obj_privateactivity1}=	Get cell value    6    AG  1099_INT_Scenario		
	${obj_marketdiscount1}=	Get cell value    6    AH  1099_INT_Scenario
	${obj_bondpremium1}=	Get cell value    6    AI  1099_INT_Scenario	
	${obj_bptreasury1}=	Get cell value    6    AJ  1099_INT_Scenario	
	${obj_bptaxexempt1}=	Get cell value    6    AK  1099_INT_Scenario 	
	${obj_cusipno1}=	Get cell value    6    AL  1099_INT_Scenario

	Wait Until Element is Enabled	${obj_rlookup}	20s	
	Click Element           	${obj_rlookup}		
	sleep 	10s		
	Input Text			${obj_rtype}			${obj_rtype1}   
	Click Element      ${obj_reciselect}                      
		
	
	sleep	2s 
	Input Text			${obj_payerrtn}		${obj_payerrtn1}                         				
	Input Text			${obj_interest}		${obj_interest1}	
	sleep 	 2s

	Input Text			${obj_early}		${obj_early1}
	Input Text			${obj_ussavings}		${obj_ussavings1}
	sleep 	 2s

	Input Text			${obj_fditw}		${obj_fditw1}
	Input Text			${obj_invesmentexp}		${obj_invesmentexp1}
	sleep 	 2s
	
	Input Text			${obj_ftaxpaid}		${obj_ftaxpaid1}
	Input Text			${obj_fcountry}		${obj_fcountry1}
	sleep 	 2s
	
	Input Text			${obj_taxexempt}		${obj_taxexempt1}
	Input Text			${obj_privateactivity}		${obj_privateactivity1}
	sleep 	 2s
	
	Input Text			${obj_marketdiscount}		${obj_marketdiscount1}
	Input Text			${obj_bondpremium}		${obj_bondpremium1}
	sleep 	 2s
	
	Input Text			${obj_bptreasury}		${obj_bptreasury1}
	Input Text			${obj_bptaxexempt}		${obj_bptaxexempt1}
	sleep 	 2s

	${passed5} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_saveadd}     5s
	Click Element       ${obj_saveadd}
	
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addressent}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addressent}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addresscont} 
	sleep	5s
	Run Keyword	Capture Page Screenshot     ../Support/Screenshots/${TS_id}.png
	
  	Run Keyword If	${passed5}      writelog    '${logid}','${TS_id}','${TS_desc}','INT form should be created for Recipient without TIN','INT form is created for Recipient without TIN','Pass','${TS_id}.png'
	...        ELSE		writelog    '${logid}','${TS_id}','${TS_desc}','INT form should be created for Recipient without TIN','INT form is created for Recipient without TIN','Fail','${TS_id}.png'















