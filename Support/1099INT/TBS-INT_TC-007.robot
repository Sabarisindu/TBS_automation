*** Keywords ***
TBS-INT_TC-006

	${xml}=    Parse XML         ../Object Repository/1099int.xml
	${wbook}=     Set Variable      	 ../Test Data/1099Series.xlsx
	${logid}=     Get Environment Variable     logid
	${obj_INTform}=			fndbget		Select Objvalue From tb_autoobj where objname='selectpayer' and objpg='1099INT' 
	${obj_psearch}=			fndbget		Select Objvalue From tb_autoobj where objname='psearch' and objpg='1099INT'
	${obj_spayer}=			fndbget		Select Objvalue From tb_autoobj where objname='spayer' and objpg='1099INT'
	${obj_rlookup}=    		fndbget		Select Objvalue From tb_autoobj where objname='rlookup'and objpg='1099INT'
	${obj_rtype}=			fndbget		Select Objvalue From tb_autoobj where objname='rtype' and objpg='1099INT'
	${obj_reciselect}=		fndbget		Select Objvalue From tb_autoobj where objname='reciselect' and objpg='1099INT'
	${obj_payerrtn}=		fndbget		Select Objvalue From tb_autoobj where objname='payerrtn' and objpg='1099INT'
	${obj_interest}=		fndbget		Select Objvalue From tb_autoobj where objname='interest' and objpg='1099INT'
	${obj_early}=		        fndbget		Select Objvalue From tb_autoobj where objname='early' and objpg='1099INT'
	${obj_ussavings}=		fndbget		Select Objvalue From tb_autoobj where objname='ussavings' and objpg='1099INT'
	${obj_fditw}=		        fndbget		Select Objvalue From tb_autoobj where objname='fditw'and objpg='1099INT'
	${obj_invesmentexp}=		fndbget		Select Objvalue From tb_autoobj where objname='invesmentexp' and objpg='1099INT'
	${obj_ftaxpaid}=		fndbget		Select Objvalue From tb_autoobj where objname='ftaxpaid' and objpg='1099INT'
	${obj_fcountry}=		fndbget		Select Objvalue From tb_autoobj where objname='fcountry' and objpg='1099INT'
	${obj_taxexempt}=		fndbget		Select Objvalue From tb_autoobj where objname='taxexempt' and objpg='1099INT'
	${obj_privateactivity}=		fndbget		Select Objvalue From tb_autoobj where objname='privateactivity'and objpg='1099INT'
	${obj_marketdiscount}=		fndbget		Select Objvalue From tb_autoobj where objname='marketdiscount' and objpg='1099INT'
	${obj_bondpremium}=		fndbget		Select Objvalue From tb_autoobj where objname='bondpremium' and objpg='1099INT'
	${obj_bptreasury}=		fndbget		Select Objvalue From tb_autoobj where objname='bptreasury' and objpg='1099INT'
	${obj_bptaxexempt}=	 	fndbget		Select Objvalue From tb_autoobj where objname='bptaxexempt' and objpg='1099INT'
	${obj_cusipno}=		        fndbget		Select Objvalue From tb_autoobj where objname='cusipno' and objpg='1099INT'
	${obj_savecont}=		fndbget		Select Objvalue From tb_autoobj where objname='savecont' and objpg='1099INT'
	${obj_saveadd}=			fndbget		Select Objvalue From tb_autoobj where objname='saveadd' and objpg='1099INT'
	${obj_ignore}=			fndbget		Select Objvalue From tb_autoobj where objname='ignore' 	and objpg='1099INT'
	${obj_reciselect1}=		fndbget		Select Objvalue From tb_autoobj where objname='reciselect1' and objpg='1099INT'
	${obj_usadd}=			fndbget		Select Objvalue From tb_autoobj where objname='usadd' and objpg='1099INT'
	${obj_onlineacc}=		fndbget		Select Objvalue From tb_autoobj where objname='onlineacc' and objpg='1099INT'
	${obj_emailadd}=		fndbget		Select Objvalue From tb_autoobj where objname='emailadd' and objpg='1099INT'
	
	${TS_id}=       Get cell value    7    B   1099_INT_Scenario
	${TS_desc}=       Get cell value   7    AS   1099_INT_Scenario
	Open Workbook      ${wbook}
	Wait Until Element is Enabled	${obj_clear}	20s
	Click Element		${obj_clear}
	${Businessdata}=       Get cell value    5    A   1099_INT_Scenario
	Click Element           	${obj_selectpayer}		
	sleep 	10s			
	Input Text			${obj_psearch}			${Businessdata}		
	Click Element        		${obj_spayer}