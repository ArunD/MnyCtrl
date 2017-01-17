#http://www.bseindia.com/corporates/ShareholdingPattern.aspx?scripcd=532663&flag_qtr=1&qtrid=81.00&Flag=New
import mysql.connector
import requests
from bs4 import BeautifulSoup
from time import sleep

cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='mnyctrl')
cursor = cnx.cursor()
query = ("INSERT INTO stock_year_shares(stock_id,share_date,No_of_Shares) VALUES(6066,str_to_date(%s,'%d %b %Y'),%s)")


data_list = []
no_of_shares = 0
mon_year = ''
#file_name='sasken_history_of_shares.html'
#target = open(file_name,'w')

for i in range(87,68,-1):

	link = 'http://www.bseindia.com/corporates/ShareholdingPattern.aspx?scripcd=532663&flag_qtr=1&qtrid=' + str(i) +'.00&Flag=New'

	page = requests.get(link)

	soup_parent = BeautifulSoup(page.content,'html.parser')
	#soup_parent = BeautifulSoup(open('sasken_share_for_2_mon.html'),"lxml") #convert the html file to soup object
	tag_td = soup_parent.find_all('td',id="tdData") #first found all the table tag data as the values are present in table tag


	soup_table = BeautifulSoup(str(tag_td[0]),"lxml")
	tag_tr = soup_table.find_all('tr')
	length_tr = len(tag_tr)

	#loop to find the number of shares
	for j in range(40,length_tr):
		soup_tr = BeautifulSoup(str(tag_tr[j]),"lxml")
		tag_td = soup_tr.find_all('td')
		length = len(tag_td)
		for i in range(0,length):
			soup_data = BeautifulSoup(str(tag_td[i]),"lxml")
			data_list.append(soup_data.get_text())
		if data_list[0] == 'Total (A)+(B)+(C)':
			no_of_shares = data_list[2]
			#break
		data_list = []



	#logic to find the month and year
	tag_td = BeautifulSoup(str(tag_tr[0]),"lxml")
	data = tag_td.get_text().split(':')
	mon_year = data[4].lstrip()

	print(mon_year + ' : ' + no_of_shares)
	cursor.execute(query,(mon_year,no_of_shares))
	sleep(1)

cnx.commit()
cnx.close()






















