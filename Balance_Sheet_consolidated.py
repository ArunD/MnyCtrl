import mysql.connector
import requests
from bs4 import BeautifulSoup


cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='mnyctrl')
cursor = cnx.cursor()

query = ("INSERT INTO balance_sheet_conso_detail(stock_id,Mon_Year,Equity_Share_Capital,Total_Share_Capital,Reserves_and_Surplus,Total_Reserves_and_Surplus,Money_Received_Against_Share_Warrants,Total_Shareholders_Funds,Equity_Share_Application_Money,Long_Term_Borrowings,Long_Term_Provisions,Total_NonCurrent_Liabilities,Trade_Payables,Other_Current_Liabilities,Short_Term_Provisions,Total_Current_Liabilities,Total_Capital_And_Liabilities,Tangible_Assets,Intangible_Assets,Capital_WorkInProgress,Fixed_Assets,NonCurrent_Investments,Deferred_Tax_Assets_Net,Long_Term_Loans_And_Advances,Other_NonCurrent_Assets,Total_NonCurrent_Assets,Current_Investments,Inventories,Trade_Receivables,Cash_And_Cash_Equivalents,Short_Term_Loans_And_Advances,OtherCurrentAssets,Total_Current_Assets,Total_Assets,Bonus_Equity_Share_Capital,Non_Current_Investments_Quoted_Market_Value,Non_Current_Investments_Unquoted_Book_Value,Current_Investments_Quoted_Market_Value,Current_Investments_Unquoted_Book_Value)"
	"VALUES(6066,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);"
	)

#file_name='coalindia_CI11_balance_sheet.csv'
#target = open(file_name,'w')

transposed = [['year_mon'],['Mar 16'],['Mar 15'],['Mar 14'],['Mar 13'],['Mar 12']]
page = requests.get('http://www.moneycontrol.com/financials/saskencomm/consolidated-balance-sheetVI/SCT01')
soup_parent = BeautifulSoup(page.content,'html.parser')

#soup_parent = BeautifulSoup(open('sasken_balance_sheet.html'),"lxml") #convert the html file to soup object
tag_table = soup_parent.find_all('table') #first found all the table tag data as the values are present in table tag


soup_child1 = BeautifulSoup(str(tag_table[5]),"lxml") #since tag is a list ,it was present in the 5th element and convert it into a soup object
tag_tr = soup_child1.find_all('tr') #find the tr tags which are present in table tag
length_tag_tr = len(tag_tr)

for i in range(3,length_tag_tr):
	soup_child2 = BeautifulSoup(str(tag_tr[i]),"lxml") #convert the tr tags to soup objects
	tag_td = soup_child2.find_all('td') #find the td tag present within the tr tag
	tag_td = list(filter(len,tag_td)) #filter out blank values from tag_td list to get the necessary data 
	if len(tag_td) >= 5:
		#print(soup_child2.get_text("@",strip=True)) #get the text from td objects ,strip the space and concatenate with delimiter ,
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
for i in range(0,6):
	data = '|'.join(transposed[i]) + '\n'
	target.write(data)
'''


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
	var29 = transposed[i][29]
	var30 = transposed[i][30]
	var31 = transposed[i][31]
	var32 = transposed[i][32]
	var33 = transposed[i][33]
	var34 = transposed[i][34]
	var35 = transposed[i][35]
	var36 = transposed[i][36]
	var37 = transposed[i][37]
	cursor.execute(query,(var0,var1,var2,var3,var4,var5,var6,var7,var8,var9,var10,var11,var12,var13,var14,var15,var16,var17,var18,var19,var20,var21,var22,var23,var24,var25,var26,var27,var28,var29,var30,var31,var32,var33,var34,var35,var36,var37))

cnx.commit()
cnx.close()

