*** Keywords ***
Select_Form

	${xml}=    Parse XML    ../Object Repository/login.xml
	#${logid}=     Get Environment Variable     logid
	${obj_start}=    	fndbget      select objvalue from tb_autoobj where objname='start'
	${obj_newform}=		fndbget      select objvalue from tb_autoobj where objname='form'
	
	Click Element            ${obj_start}
	Sleep  	3s
	#Wait Until Element Is Enabled		${obj_newform}		10s	
	Click Element        ${obj_newform} 
	
	
