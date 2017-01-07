#import mysql.connector
import requests
from bs4 import BeautifulSoup

data_list = []
transposed = [['year_mon'],['Mar 16'],['Mar 15'],['Mar 14'],['Mar 13'],['Mar 12']]
transposed_row = []

page = requests.get('http://www.moneycontrol.com/financials/coalindia/balance-sheetVI/CI11#CI11')
soup_parent = BeautifulSoup(page.content,'html.parser')

#soup_parent = BeautifulSoup(open('page_content.html'),"lxml") #convert the html file to soup object
tag_table = soup_parent.find_all('table') #first found all the table tag data as the values are present in table tag


soup_child1 = BeautifulSoup(str(tag_table[5]),"lxml") #since tag is a list ,it was present in the 5th element and convert it into a soup object
tag_tr = soup_child1.find_all('tr') #find the tr tags which are present in table tag
length_tag_tr = len(tag_tr)


a=[
	[1,2],
	[3,4],
	[5,6]
	]
	
print(a[1][0])

for i in range(3,length_tag_tr):
	soup_child2 = BeautifulSoup(str(tag_tr[i]),"lxml") #convert the tr tags to soup objects
	tag_td = soup_child2.find_all('td') #find the td tag present within the tr tag
	tag_td = list(filter(len,tag_td)) #filter out blank values from tag_td list to get the necessary data 
	if len(tag_td) >= 5:
		#print(soup_child2.get_text(",",strip=True)) #get the text from td objects ,strip the space and concatenate with delimiter ,
		temp = soup_child2.get_text(",",strip=True)
		temp_list = temp.split(',')
		transposed[0].append(temp_list[0])
		transposed[1].append(temp_list[1])
		transposed[2].append(temp_list[2])
		transposed[3].append(temp_list[3])
		transposed[4].append(temp_list[4])
		transposed[5].append(temp_list[5])
			

for data in transposed:
	print(data)
		
		

'''
cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='mnyctrl')
cursor = cnx.cursor()

#query = ("select vehicle_name from bike_type")
#cursor.execute(query)

#for vehicle_name in cursor:
#	print(vehicle_name)

cnx.close()
'''

