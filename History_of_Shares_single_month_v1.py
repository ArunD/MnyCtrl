#http://www.bseindia.com/corporates/shpSecurities.aspx?scripcd=532663&qtrid=91.00&Flag=New
import mysql.connector
import requests
from bs4 import BeautifulSoup
from string import replace
from time import sleep


cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='mnyctrl')
cursor = cnx.cursor()


query = ("INSERT INTO stock_year_shares(stock_id,share_date,No_of_Shares) VALUES(6066,str_to_date(%s,'%d %M %Y'),%s)")

no_of_shares = 0
mon_year = ''
#file_name='sasken_history_of_shares.html'
#target = open(file_name,'w')

for i in range(91,87,-1):

	link = 'http://www.bseindia.com/corporates/shpSecurities.aspx?scripcd=532663&qtrid=' + str(i) +'.00&Flag=New'
	page = requests.get(link)


	soup_parent = BeautifulSoup(page.content,'html.parser')
	#soup_parent = BeautifulSoup(open('sasken_share_for_1_mon.html'),"lxml") #convert the html file to soup object #file object for testing purpose
	tag_div = soup_parent.find_all('div',id="tdData") #first found all the table tag data as the values are present in table tag

	soup_table = BeautifulSoup(str(tag_div[0]),"lxml")
	tag_tr = soup_table.find_all('tr')

	soup_tr = BeautifulSoup(str(tag_tr[13]),"lxml")
	tag_td = soup_tr.find_all('td')

	tag_shares = BeautifulSoup(str(tag_td[3]),"lxml")
	no_of_shares = replace(tag_shares.get_text(),',','')


	#logic to find the month and year
	tag_td = BeautifulSoup(str(tag_tr[0]),"lxml")
	data = tag_td.get_text().split(':')
	mon_year = data[2].lstrip()
	mon_year = '27 ' + data[2].lstrip()
	print(mon_year + ' : ' + no_of_shares)
	cursor.execute(query,(mon_year,no_of_shares))
	sleep(1)

cnx.commit()
cnx.close()







