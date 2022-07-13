*** Keywords ***
TBS-NEC_TS-008

	
	${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
	${logid}=     Get Environment Variable     logid
	${obj_selectpayer}=    	fndbget      select objvalue from tb_autoobj where objname='selectpayer'
	${obj_psearch}=	        fndbget      select objvalue from tb_autoobj where objname='psearch'
	${obj_spayer}=		fndbget      select objvalue from tb_autoobj where objname='spayer'
	${obj_reciselect}=	fndbget      select objvalue from tb_autoobj where objname='reciselect'				
	${obj_savecont}=	fndbget      select objvalue from tb_autoobj where objname='savecont'
	${obj_saveadd}=		fndbget      select objvalue from tb_autoobj where objname='saveadd'
	${obj_addressent}=	fndbget      select objvalue from tb_autoobj where objname='addressent'
	${obj_addresscont}=	fndbget      select objvalue from tb_autoobj where objname='addresscont'
	${obj_reciselect1}=	fndbget      select objvalue from tb_autoobj where objname='reciselect1'
	${obj_rname}=		fndbget      select objvalue from tb_autoobj where objname='rname' and objpg = '1099nec'
	${obj_raddress}=	fndbget      select objvalue from tb_autoobj where objname='raddress' and objpg = '1099nec'
	${obj_rcity}=		fndbget      select objvalue from tb_autoobj where objname='rcity' and objpg = '1099nec'
	${obj_rzipcode}=	fndbget      select objvalue from tb_autoobj where objname='rzip' and objpg = '1099nec'
	${obj_rstate}=		fndbget      select objvalue from tb_autoobj where objname='rstate'and objpg = '1099nec'
	${obj_alstate}=		fndbget      select objvalue from tb_autoobj where objname='alstate' and objpg = '1099nec'
	${obj_nonemp}=		fndbget      select objvalue from tb_autoobj where objname='b1nonemp'
	${obj_fdwh}=		fndbget      select objvalue from tb_autoobj where objname='b4fdwh'
	${obj_tinerror}=	fndbget      select objvalue from tb_autoobj where objname='tinerror'
	${TS_id}=       Get cell value    9    B   1099_Nec_Scenario
	${TS_desc}=       Get cell value   9   Z   1099_Nec_Scenario	
	Open Workbook      ${wbook}
	
	${obj_rname1}=	Get cell value    9    C   1099_Nec_Scenario
	${obj_raddress1}=	Get cell value    9    G   1099_Nec_Scenario
	${obj_rcity1}=	Get cell value    9    I   1099_Nec_Scenario
	${obj_rzipcode1}=	Get cell value    9    K   1099_Nec_Scenario
	${obj_nonemp1}=	Get cell value    9    W   1099_Nec_Scenario
	${obj_fdwh1}=	Get cell value    9    Y   1099_Nec_Scenario
	
	Execute Javascript    window.location.reload(true);
	sleep	10s
	Input Text	${obj_rname}		${obj_rname1}
	Input Text	${obj_raddress}		${obj_raddress1}
	Input Text	${obj_rcity}		${obj_rcity1}
	Input Text	${obj_rzipcode}		${obj_rzipcode1}
	sleep	5s 
	Execute Javascript  document.evaluate('${obj_rstate}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
  	
	Wait Until Element Is Enabled		//div[contains (text(), "Alabama (AL)")]	3s
	Click Element		//div[contains (text(), "Alabama (AL)")]

	Input Text			${obj_nonemp}		${obj_nonemp1}	
	Input Text			${obj_fdwh}		${obj_fdwh1}                              
	Click Element       ${obj_saveadd}
	sleep	5s
	#${id_value}=   RPA.Browser.Selenium.Get Element Attribute  xpath= //div[@class="v-messages__message" and contains(text(),"Recipient's SSN required")]   id
	#Execute Javascript  document.getElementById('${id_value}').scrollIntoView({behavior: 'smooth'});
	#Execute Javascript	document.evaluate('${obj_tinerror}', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
	#Run Keyword And Ignore Error    Scroll Element Into View	${obj_tinerror}
	${passed8} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${obj_tinerror}     10s
	Page Should Contain 	Recipient's SSN required
	Run Keyword  Capture Page Screenshot     ../Support/Screenshots/${TS_id}.png
  	Run Keyword If	${passed8}      writelog    '${logid}','${TS_id}','${TS_desc}','Error message should be shown','Error message is shown','Pass','${TS_id}.png'
	...        ELSE		writelog    '${logid}','${TS_id}','${TS_desc}','Error message should be shown','Error message is shown','Fail','${TS_id}.png'
	