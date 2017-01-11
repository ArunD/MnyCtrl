import mysql.connector
import requests
import string
from bs4 import BeautifulSoup


cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='mnyctrl')
cursor = cnx.cursor()

query = ("INSERT INTO stock_year_shares(stock_id,Mar_16,Mar_15,Mar_14,Mar_13,Mar_12,Mar_11) VALUES(6066,%s,%s,%s,%s,%s,%s)")

page = requests.get('http://www.moneycontrol.com/company-facts/saskencommunicationtechnologies/shareholding-pattern/SCT01#SCT01')
#html_file = open('sasken_shares.html','w')
#html_file.write(str(page.content))
#soup_parent = BeautifulSoup(page.content,'html.parser')

soup_parent = BeautifulSoup(open('sasken_shares.html'),"lxml") #convert the html file to soup object
tag_table = soup_parent.find_all('table') #first found all the table tag data as the values are present in table tag

soup_child1 = BeautifulSoup(str(tag_table[3]),"lxml") #since tag is a list ,it was present in the 5th element and convert it into a soup object
tag_tr = soup_child1.find_all('tr') #find the tr tags which are present in table tag
length_tag_tr = len(tag_tr)
print(length_tag_tr)
soup_child2 = BeautifulSoup(str(tag_tr[44]),"lxml") #convert the tr tags to soup objects
tag_td = soup_child2.find_all('td') #find the td tag present within the tr tag
tag_td = list(filter(len,tag_td)) #filter out blank values from tag_td list to get the necessary data 
soup_no_of_shares = BeautifulSoup(str(tag_td[2]),"lxml")
no_of_shares = int(string.replace(soup_no_of_shares.get_text(),',',''))

cursor.execute(query,(no_of_shares,no_of_shares,no_of_shares,no_of_shares,no_of_shares,no_of_shares))

cnx.commit()
cnx.close()
