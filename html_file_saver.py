import requests


page = requests.get('http://www.moneycontrol.com/financials/saskencommunicationtechnologies/profit-lossVI/SCT01#SCT01') #link goes here
html_file = open('sasken_PL.html','w') #file name goes here
html_file.write(str(page.content)) #write the link contents

