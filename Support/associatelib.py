import  pyodbc
import  os
import  datetime
import  glob
import  json

def delh():
    os.remove("MyFile.txt")
    
def delimg():
    #pattern = "selenium-screenshot*"
    pattern = "*.png"
    files = glob.glob(pattern)
    for file in files:
        os.remove(file)
  

def delht():
    os.remove("My.html")  

def writeh(qry):
    qry1= qry.replace("'","")
    val=qry1.split(",")
    file1 = open("MyFile.txt","a")
    file1.write('<tr><th style="text-align: left">'+ val[1] +'</th><th style="text-align: left">'+val[2]+'</th><th>'+val[5]+'</th></tr>')
    file1.close()


    
class associatelib:

  def fndbget(self,qry):
   
    with open('C:\\Users\\STS366-SABARISINDU S\\Pictures\\TBS 2.0 Automation\\TBS 2.0\\Support\\config.json','r') as f:
        config = json.loads(f.read())

    
    
    connect=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};server= '+config['host']+';Database='+config['database']+';uid='+config['username']+';pwd='+config['password']+';Trusted_Connection=no;')
    cursor=connect.cursor()
    cursor.execute(qry)
    for row in cursor:
       return (row[0])
    cursor.close()
    connect.close()


  def writelog(self,qry):
    with open('C:\\Users\\STS366-SABARISINDU S\\Pictures\\TBS 2.0 Automation\\TBS 2.0\\Support\\config.json','r') as f:
        config = json.load(f)

    
    connect=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};server= '+config['host']+';Database='+config['database']+';uid='+config['username']+';pwd='+config['password']+';Trusted_Connection=no;')
    cursor=connect.cursor()
    cursor.execute("Insert into tb_log (logid,tsid,tsdesc,expectedresult,actualresult,runstatus,reference) values ("+qry+");")
    connect.commit()
    cursor.close()
    connect.close()
    writeh(qry)

  def logid(self):
    delimg()
    return("Log_"+"{:%Y%m%d%H%M%S}".format(datetime.datetime.now()))
    
    #all_files = os.listdir()
    #for f in all_files:
    #    print(f)
        #os.remove(f)
    #for f in glob.glob("*.png"):
    #    os.remove(f)
    
  def createh(self,logid):
    delht()
    strstatus = 'Fail'
    file3 = open("MyFile.txt","r")
    valread=file3.read()
    passc = valread.count("<th>Pass</th></tr>")
    failc = valread.count("<th>Fail</th></tr>")
    totalc = valread.count('<tr>')
    if failc==0 :
        strstatus = 'Pass'
    sumtable='<table cellspacing=”2” width=”100%” border=”1”><tr><th style="background-color:#FFA500">Log ID</th><th style="background-color:#FFA500" >Run Status</th><th style="background-color:#FFA500">Total Testcases</th><th style="background-color:#FFA500">Pass TC</th><th style="background-color:#FFA500">Fail TC</th></tr><tr><th>'+logid+'</th><th>'+strstatus+'</th><th>'+str(totalc)+'</th><th>'+str(passc)+'</th><th>'+str(failc)+'</th></tr></table>'
    valuestr='<html> <style> table, th, td {   border:1px solid black; } </style> <body>  <h1>Run Report</h1>  <h2>Run Summary</h2> '+ sumtable +'<h2>Run Details</h2> <table style="width:50%" > <tr><th style="background-color:#FA58F4" >Test Scenario ID</th><th style="background-color:#FA58F4">Test Scenario Description</th><th style="background-color:#FA58F4">Test Status</th></tr>'+ valread  +'</table> </body> </html>'
    valuestr = valuestr.replace(">Pass", ' style="color: green">Pass')
    valuestr = valuestr.replace(">'Pass'", ' style="color: green">Pass')
    valuestr = valuestr.replace(">Fail", ' style="color: red">Fail')
    valuestr = valuestr.replace(">'Fail'", ' style="color: red">Fail')
    file3.close()
    file2 = open("My.html","w")
    file2.write(valuestr)
    delh()
  
    

