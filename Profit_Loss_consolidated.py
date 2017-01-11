import mysql.connector
import requests
from bs4 import BeautifulSoup

cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='mnyctrl')
cursor = cnx.cursor()

query = ("INSERT INTO profit_loss_conso_detail(stock_id,Mon_Year,Revenue_From_Operations_Gross,Revenue_From_Operations_Net,Total_Operating_Revenues,Other_Income,Total_Revenue,Cost_Of_Materials_Consumed,Purchase_Of_StockIn_Trade,Changes_In_Inventories_Of_FGWIP_And_StockIn_Trade,Employee_Benefit_Expenses,Finance_Costs,Depreciation_And_Amortisation_Expenses,Other_Expenses,Total_Expenses,Profit_Loss_Before_Exceptional_ExtraOrdinary_Items_And_Tax,Exceptional_Items,Profit_Loss_Before_Tax,Current_Tax,Less_MAT_Credit_Entitlement,Deferred_Tax,Total_Tax_Expenses,Profit_Loss_After_Tax_And_Before_ExtraOrdinary_Items,Profit_Loss_From_Continuing_Operations,Profit_Loss_For_The_Period,Consolidated_Profit_Loss_After_MI_And_Associates,Basic_EPS_Rs,Diluted_EPS_Rs,Equity_Share_Dividend,Tax_On_Dividend)"
	"VALUES(6066,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
	)

#file_name='coalindia_CI11_profit_loss.csv'
#target = open(file_name,'w')

transposed = [['year_mon'],['Mar 16'],['Mar 15'],['Mar 14'],['Mar 13'],['Mar 12']]
page = requests.get('http://www.moneycontrol.com/financials/saskencomm/consolidated-profit-lossVI/SCT01')
soup_parent = BeautifulSoup(page.content,'html.parser')

#soup_parent = BeautifulSoup(open('sasken_PL.html'),"lxml") #convert the html file to soup object
tag_table = soup_parent.find_all('table') #first found all the table tag data as the values are present in table tag


soup_child1 = BeautifulSoup(str(tag_table[5]),"lxml") #since tag is a list ,it was present in the 5th element and convert it into a soup object
tag_tr = soup_child1.find_all('tr') #find the tr tags which are present in table tag
length_tag_tr = len(tag_tr)



for i in range(3,length_tag_tr):
	soup_child2 = BeautifulSoup(str(tag_tr[i]),"lxml") #convert the tr tags to soup objects
	tag_td = soup_child2.find_all('td') #find the td tag present within the tr tag
	tag_td = list(filter(len,tag_td)) #filter out blank values from tag_td list to get the necessary data 
	if len(tag_td) > 5:
		#print(soup_child2.get_text(",",strip=True)) #get the text from td objects ,strip the space and concatenate with delimiter ,
		temp = soup_child2.get_text("@",strip=True)
		temp_list = temp.split('@')
		#print(temp_list)
		transposed[0].append(temp_list[0])
		transposed[1].append(temp_list[1])
		transposed[2].append(temp_list[2])
		transposed[3].append(temp_list[3])
		transposed[4].append(temp_list[4])
		transposed[5].append(temp_list[5])
'''		
for i in range(0,5):
	data = '|'.join(transposed[i]) + '\n'
	target.write(data)
'''

#print(transposed)
#print(len(transposed[0]))

for i in range(1,6):
	var0 = transposed[i][0]
	var1 = transposed[i][1]
	var2 = transposed[i][2]
	var3 = transposed[i][3]
	var4 = transposed[i][4]
	var5 = transposed[i][5]
	var6 = transposed[i][6]
	var7 = transposed[i][7]
	var8 = transposed[i][8]
	var9 = transposed[i][9]
	var10 = transposed[i][10]
	var11 = transposed[i][11]
	var12 = transposed[i][12]
	var13 = transposed[i][13]
	var14 = transposed[i][14]
	var15 = transposed[i][15]
	var16 = transposed[i][16]
	var17 = transposed[i][17]
	var18 = transposed[i][18]
	var19 = transposed[i][19]
	var20 = transposed[i][20]
	var21 = transposed[i][21]
	var22 = transposed[i][22]
	var23 = transposed[i][23]
	var24 = transposed[i][24]
	var25 = transposed[i][25]
	var26 = transposed[i][26]
	var27 = transposed[i][27]
	var28 = transposed[i][28]
	cursor.execute(query,(var0,var1,var2,var3,var4,var5,var6,var7,var8,var9,var10,var11,var12,var13,var14,var15,var16,var17,var18,var19,var20,var21,var22,var23,var24,var25,var26,var27,var28))


cnx.commit()
cnx.close()



