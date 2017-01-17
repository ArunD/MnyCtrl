import mysql.connector
import string
import csv



cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='mnyctrl')
cursor = cnx.cursor()

query = ("INSERT INTO nse_daily_stock_price(SYMBOL,SERIES,price_DATE,PREV_CLOSE,OPEN_PRICE,HIGH_PRICE,LOW_PRICE,LAST_PRICE,CLOSE_PRICE,AVG_PRICE,TTL_TRD_QNTY,TURNOVER_LACS,NO_OF_TRADES,DELIV_QTY,DELIV_PER)VALUES(%s,%s,str_to_date(%s,'%d-%b-%Y'),%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);")

fname = 'nse_sec_bhavdata_full.csv'

#f = open(filename,'r')

with open(fname) as f:
    next(f)
    for data in f:
	data = string.replace(data,' -','0')
	data = string.replace(data,' ','')
	csv_data = data.split(',')
	#print(csv_data)
	cursor.execute(query,(csv_data))
	cnx.commit()

#list_csv_data = list(csv.reader(f))

#length = len(list_csv_data)

#for i in range(1,length):
	#print(list_csv_data[i])
#	cursor.execute(query,(list_csv_data[i]))


cnx.close()






