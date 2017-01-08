import mysql.connector
import requests
import string
from bs4 import BeautifulSoup

cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='mnyctrl')
cursor = cnx.cursor()

query = ("insert into stock_list(stock_code,stock_name)"
	"values (%s, %s)"
	)

alphalist = list(string.ascii_uppercase)
alphalist.append('others')

balance_sht_link = []
stock_name_code = [[],[]]
for letter in alphalist:
	LINK = 'http://www.moneycontrol.com/india/stockpricequote/' + letter
	page_link = requests.get(LINK)
	soup_parent_link = BeautifulSoup(page_link.content,"lxml")
	tag_table_link = soup_parent_link.find_all('table')
	#print(len(tag_table_link))
	soup_child_link = BeautifulSoup(str(tag_table_link[2]),"lxml")
	tag_tr_link = soup_child_link.find_all('tr')
	length_tag_tr_link = len(tag_tr_link)

	for i in range(0,length_tag_tr_link):
		soup_child_link2 = BeautifulSoup(str(tag_tr_link[i]),"lxml")
		tag_td_link = soup_child_link2.find_all('td')
		tag_td_link = list(filter(len,tag_td_link))
		soup_child_link3 = BeautifulSoup(str(tag_td_link),"lxml")
		for link in soup_child_link3.find_all('a'):
			link_str = link.get('href')
			link_split = link_str.split('/')
			if len(link_split) >= 8:
				stock_name_code[0].append(link_split[6])
				stock_name_code[1].append(link_split[7])
				cursor.execute(query,(link_split[7],link_split[6]))
			
				#balance_sht_link.append('http://www.moneycontrol.com/financials/'+link_split[6]+'/balance-sheetVI/'+link_split[7]+'#'+link_split[7])


cnx.commit()
cnx.close()



