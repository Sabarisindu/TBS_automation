*** Keywords ***
FillForm_1099Int

	${xml}=    Parse XML    1099int.xml
	${wbook}=     Set Variable     1099Series.xlsx
	${obj_INTform}=		Get Element Text    	${xml}   	INTform
	${obj_taxyr}=		Get Element Text    	${xml}   	taxyr
	${obj_manual}=		Get Element Text    	${xml}   	manual
	${obj_selectpayer}=    		Get Element Text    	${xml}   	selectpayer
	${obj_psearch}=			Get Element Text	${xml}		psearch
	${obj_spayer}=			Get Element Text	${xml}		spayer
	${obj_rlookup}=    		Get Element Text    	${xml}   	rlookup
	${obj_rtype}=			Get Element Text	${xml}		rtype
	${obj_reciselect}=			Get Element Text	${xml}		reciselect
	${obj_payerrtn}=		Get Element Text		${xml}		payerrtn
	${obj_interest}=		Get Element Text		${xml}		interest
	${obj_early}=		Get Element Text		${xml}		early
	${obj_ussavings}=		Get Element Text		${xml}		ussavings
	${obj_fditw}=		Get Element Text		${xml}		fditw
	${obj_invesmentexp}=		Get Element Text		${xml}		invesmentexp
	${obj_ftaxpaid}=		Get Element Text		${xml}		ftaxpaid
	${obj_fcountry}=		Get Element Text		${xml}		fcountry
	${obj_taxexempt}=		Get Element Text		${xml}		taxexempt
	${obj_privateactivity}=		Get Element Text		${xml}		privateactivity
	${obj_marketdiscount}=		Get Element Text		${xml}		marketdiscount
	${obj_bondpremium}=		Get Element Text		${xml}		bondpremium
	${obj_bptreasury}=		Get Element Text		${xml}		bptreasury
	${obj_bptaxexempt}=		Get Element Text		${xml}		bptaxexempt
	${obj_cusipno}=		Get Element Text		${xml}		cusipno
	${obj_savecont}=			Get Element Text    	${xml} 		savecont
	${obj_saveadd}=			Get Element Text    	${xml}   	saveadd
	${obj_ignore}=			Get Element Text		${xml}		ignore
	${obj_reciselect1}=			Get Element Text	${xml}		reciselect1
	${obj_usadd}=			Get Element Text		${xml}		usadd
	
	Open Workbook      ${wbook}
 	${sheet}=        Read Worksheet   1099Int
  	${rows}=         Get Length  ${sheet}	
	#FOR    ${i}    IN RANGE    2  ${rows}+1

	Click Element         ${obj_INTform}
	Sleep	3s
	Click Element         ${obj_taxyr}
	Sleep	3s
	Click Element         ${obj_manual}
	sleep	10s
	${Businessdata}=       Get cell value    5    A   1099Int
	Click Element           	${obj_selectpayer}		
	sleep 	10s			
	Input Text			${obj_psearch}			${Businessdata}		
    sleep  5s
	Click Element        		${obj_spayer}
    
     FOR    ${i}    IN RANGE    2    ${rows}+1
	 
	${obj_rtype1}=	Get cell value    ${i}    C   1099Int
	${obj_payerrtn1}=	Get cell value    ${i}    D   1099Int
	${obj_interest1}=	Get cell value    ${i}    E   1099Int
	${obj_early1}=	Get cell value    ${i}    F   1099Int
	${obj_ussavings1}=	Get cell value    ${i}    G   1099Int 
	${obj_fditw1}=	Get cell value    ${i}    H   1099Int 
	${obj_invesmentexp1}=	Get cell value    ${i}    I   1099Int 
	${obj_ftaxpaid1}=	Get cell value    ${i}    J   1099Int  
	${obj_fcountry1}=	Get cell value    ${i}    K   1099Int 
	${obj_taxexempt1}=	Get cell value    ${i}    L   1099Int 
	${obj_privateactivity1}=	Get cell value    ${i}    M   1099Int 
	${obj_marketdiscount1}=	Get cell value    ${i}    N   1099Int
	${obj_bondpremium1}=	Get cell value    ${i}    O   1099Int
	${obj_bptreasury1}=	Get cell value    ${i}    P   1099Int
	${obj_bptaxexempt1}=	Get cell value    ${i}    Q   1099Int
	${obj_cusipno1}=	Get cell value    ${i}    R   1099Int
	
	Wait Until Element is Enabled	${obj_rlookup}	20s	
	Click Element           	${obj_rlookup}		
	sleep 	10s		
	Input Text			${obj_rtype}			${obj_rtype1}
	
	 Run Keyword If	${i}==2  Click Element      ${obj_reciselect}  
	                             
	...        ELSE        	Click Element       ${obj_reciselect1}
	
	Sleep	 1s
	Input Text		${obj_payerrtn}		${obj_payerrtn1}
	Input Text		${obj_interest}		${obj_interest1}
	Sleep	 1s
	Input Text		${obj_early}		${obj_early1}
	Input Text		${obj_ussavings}		${obj_ussavings1}
	Sleep	 1s
	Input Text		${obj_fditw}		${obj_fditw1}
	Input Text		${obj_invesmentexp}		${obj_invesmentexp1}
	Sleep	 1s
	Input Text		${obj_ftaxpaid}		${obj_ftaxpaid1}
	Input Text		${obj_fcountry}		${obj_fcountry1}
	Sleep	 1s
	Input Text		${obj_taxexempt}		${obj_taxexempt1}
	Input Text		${obj_privateactivity}		${obj_privateactivity1}
	Sleep	 1s
	Input Text		${obj_marketdiscount}		${obj_marketdiscount1}
	Input Text		${obj_bondpremium}		${obj_bondpremium1}
	Sleep	 1s
	Input Text		${obj_bptreasury}		${obj_bptreasury1}
	Input Text		${obj_bptaxexempt}		${obj_bptaxexempt1}
	Wait Until Element Is Enabled	${obj_cusipno}	5s
	Input Text		${obj_cusipno}		${obj_cusipno1}
	Sleep	1s
	
	Run Keyword If	${i}==${rows}	Click Element	${obj_savecont} 
	                             
	...        ELSE        	Click Element       ${obj_saveadd}
	
	sleep	5s
	${passed} =    Run Keyword AND Return Status         Wait Until Element Is Enabled       ${obj_addressent}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addressent} 
	${passed} =    Run Keyword AND Return Status         Wait Until Element Is Enabled       ${obj_usadd}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_usadd}
	${passed} =    Run Keyword AND Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addresscont} 
     
	 
     END
   
	
	