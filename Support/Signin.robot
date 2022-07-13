*** Keywords ***
Login _Functionality

	${xml}=    Parse XML    login.xml
	${obj_email}=    	Get Element Text    	${xml}   	email 
	${obj_pass}=		Get Element Text    	${xml}   	password
	${obj_signin}=		Get Element Text    	${xml}   	login
	${wbook}=     Set Variable     1099Series.xlsx
	Open Workbook      ${wbook}
 	${accEmail}=	Get cell value    2    A   1099Nec
	${accPassword}=	Get cell value    2    B   1099Nec
	${siteURL}=	Get cell value    8    A   1099Nec

	Open Browser          ${siteURL}	 Chrome
	Maximize Browser Window
	input text			${obj_email}		${accEmail}
	input text			${obj_pass}		${accPassword}
	Click button			${obj_signin}






