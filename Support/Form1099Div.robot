*** Keywords ***
FillForm_1099Div

	${xml}=    Parse XML    1099Div.xml
	${wbook}=     Set Variable     1099Series.xlsx
	${obj_div}=		Get Element Text    	${xml}   	div
	${obj_divbt}=		Get Element Text    	${xml}   	divbt
	${obj_manualb}=		Get Element Text    	${xml}   	manualb
	${obj_selectpayer}=    	Get Element Text    	${xml}   	selectpayer
	${obj_psearch}=		Get Element Text	${xml}		psearch
	${obj_spayer}=		Get Element Text	${xml}		spayer
	${obj_rlookup}=    	Get Element Text    	${xml}   	rlookup
	${obj_rtype}=		Get Element Text	${xml}		rtype
	${obj_reciselect}=	Get Element Text	${xml}		reciselect
        
	${obj_b1a}=	Get Element Text    	${xml}		b1a
	${obj_b1b}=	Get Element Text    	${xml}		b1b		
	${obj_b2a}=	Get Element Text    	${xml}		b2a
	${obj_b2b}=	Get Element Text    	${xml}		b2b
	${obj_b2c}=	Get Element Text    	${xml}		b2c
	${obj_b2d}=	Get Element Text    	${xml}		b2d
	${obj_b2e}=	Get Element Text    	${xml}		b2e
	${obj_b2f}= 	Get Element Text    	${xml}		b2f
	${obj_b3}=	Get Element Text    	${xml}		b3
	${obj_b4}=	Get Element Text    	${xml}		b4
	${obj_b5}=	Get Element Text    	${xml}		b5
	${obj_b6}=	Get Element Text    	${xml}		b6
	${obj_b7}=	Get Element Text    	${xml}		b7
	${obj_b8}=	Get Element Text    	${xml}		b8
	${obj_b9}=	Get Element Text    	${xml}		b9		
	${obj_b10}=	Get Element Text    	${xml}		b10
	${obj_b11}=	Get Element Text    	${xml}		b11		
	${obj_b12}=	Get Element Text    	${xml}		b12
#State Details
	${obj_b13}=	Get Element Text    	${xml}		b13
	${obj_selectstate}=	 Get Element Text    	${xml} 		selectstate
	${obj_savecont}=	 Get Element Text    	${xml} 		savecont
	${obj_addnew}=		Get Element Text    	${xml}   	addnew
	${obj_clickdiv}=	 Get Element Text    	${xml} 		clickdiv	
	${obj_clickfilediv}=	Get Element Text   	${xml} 		clickfilediv
	${obj_clickmanual}=	 Get Element Text    	${xml} 		clickmanual
	${obj_saveadd}=		Get Element Text    	${xml}		saveadd
	${obj_addressent}=	Get Element Text    	${xml} 		addressent
	${obj_addresscont}=	Get Element Text    	${xml}		addresscont
	${obj_reciselect1}=	Get Element Text	${xml}		reciselect1
       	Open Workbook      ${wbook}
 	${sheet}=        Read Worksheet   1099Div
  	${rows}=         Get Length  ${sheet}
	#FOR    ${i}    IN RANGE    2  ${rows}+1

  #Selecting Manual form 
	Wait Until Element is Enabled	${obj_div}	5s
	Click Element         ${obj_div}
	Sleep	3s
	Click Element         ${obj_divbt}
	Sleep	3s
	Click Element         ${obj_manualb}
	sleep	10s
  #Select the business from popup	
        ${Businessdata}=       Get cell value    5    A   1099Div

	Click Element           	${obj_selectpayer}		
	sleep 	10s			
	Input Text			${obj_psearch}			${Businessdata}	
        sleep   3s	
	Click Element        		${obj_spayer} 
        sleep   3s
 	 
  #select the recipient from lookup
  FOR    ${i}    IN RANGE    2    ${rows} + 1    	     	
      	
	${obj_rtype1}=	Get cell value    ${i}    C   1099Div
	${obj_b1a-1}=	Get cell value    ${i}    Y   1099Div
	${obj_b1b-1}=	Get cell value    ${i}    Z   1099Div 
	${obj_b2a-1}=	Get cell value    ${i}    AA  1099Div
      	${obj_b2b-1}=	Get cell value    ${i}    AB  1099Div
	${obj_b2c-1}=	Get cell value    ${i}    AC   1099Div
	${obj_b2d-1}=	Get cell value    ${i}    AD   1099Div
	${obj_b2e-1}=	Get cell value    ${i}    AE   1099Div
	${obj_b2f-1}=	Get cell value    ${i}    AF   1099Div
	${obj_b3-1}=	Get cell value    ${i}    AG   1099Div
	${obj_b4-1}=	Get cell value    ${i}    AH   1099Div
	${obj_b5-1}=	Get cell value    ${i}    AI   1099Div
	${obj_b6-1}=	Get cell value    ${i}    AJ   1099Div
	${obj_b7-1}=	Get cell value    ${i}    AK  1099Div
	${obj_b8-1}=	Get cell value    ${i}    AL   1099Div
	${obj_b9-1}=	Get cell value    ${i}    AM   1099Div
	${obj_b10-1}=	Get cell value    ${i}    AN   1099Div
	${obj_b11-1}=	Get cell value    ${i}    AO   1099Div
	${obj_b12-1}=	Get cell value    ${i}    AP   1099Div

	

	Wait Until Element is Enabled	${obj_rlookup}	20s	
	Click Element           	${obj_rlookup}		
	sleep 	10s		
	Input Text			${obj_rtype}		${obj_rtype1}
	sleep   15s
	Run Keyword If	${i}== 2  Click Element      ${obj_reciselect}  
	
	...        ELSE   Click Element       ${obj_reciselect1}	
					
	Input Text			${obj_b1a}		${obj_b1a-1}
	sleep   1s
	Input Text			${obj_b1b}		${obj_b1b-1}
	sleep   1s
	Input Text			${obj_b2a}		${obj_b2a-1}
	sleep   1s
	Input Text			${obj_b2b}		${obj_b2b-1}
	sleep   1s
	Input Text			${obj_b2c}		${obj_b2c-1}
	sleep   1s
	Input Text			${obj_b2d}		${obj_b2d-1}
	sleep   1s
	Input Text			${obj_b2e}		${obj_b2e-1}
	sleep   1s
	Input Text			${obj_b2f}		${obj_b2f-1}
	sleep   1s
	Input Text			${obj_b3}		${obj_b3-1}
	sleep   1s
	Input Text			${obj_b4}		${obj_b4-1}
	sleep   1s
	Input Text			${obj_b5}		${obj_b5-1}
	sleep   1s
	Input Text			${obj_b6}		${obj_b6-1}
	sleep   1s
	Input Text			${obj_b7}		${obj_b7-1}
	sleep   1s
	Input Text			${obj_b8}		${obj_b8-1}
	sleep   1s
	Input Text			${obj_b9}		${obj_b9-1}
	sleep   1s
	Input Text			${obj_b10}		${obj_b10-1}
	sleep   1s
	Input Text			${obj_b11}		${obj_b11-1}
	sleep   1s
	Input Text			${obj_b12}		${obj_b12-1}
        Sleep	3s	
	
       #Wait Until Element Is Enabled       ${obj_b13}   10s
	#Click Element         ${obj_b13}
	#Sleep	3s		
	#Wait Until Element Is Enabled       ${obj_selectstate}    10s
	#Click Element         ${obj_selectstate}
	#Sleep	3s	

	Run Keyword If	${i}==11    Click Element       ${obj_savecont}  
		                             
	...         ELSE       	Click Element       ${obj_saveadd}

	sleep	5s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addressent}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addressent}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addresscont} 
				  
	
		
  END	 