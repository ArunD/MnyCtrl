/* stock list */
CREATE TABLE `stock_list` (
  `stock_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `stock_code` char(10) DEFAULT NULL,
  `stock_name` char(50) DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8025 DEFAULT CHARSET=latin1;

create table stock_list_complete
(
stock_id mediumint(9) NOT NULL AUTO_INCREMENT,
bse_Security_Code mediumint(9) NOT NULL ,
Security_Id varchar(10) not null,
Security_Name varchar(50) not null,
Status varchar(10) not null,
Group_tyype varchar(3) not null,
Face_Value decimal(5,2) ,
ISIN_No varchar(20) not null,
Industry varchar(50),
Instrument varchar(20),
nse_securiy_code varchar(10) null,
primary key (stock_id)
)
;

create table stock_list_bse
(
bse_stock_id mediumint(9) NOT NULL AUTO_INCREMENT,
bse_Security_Code mediumint(10) ,
Security_Id varchar(50) ,
Security_Name varchar(50) ,
Status varchar(10) ,
Group_type varchar(3) ,
Face_Value decimal(5,2) ,
ISIN_No varchar(20) ,
Industry varchar(100),
Instrument varchar(20),
primary key (bse_stock_id)
)
;

create table stock_list_nse
(
nse_stock_id mediumint(9) NOT NULL AUTO_INCREMENT,
Symbol varchar(30),
ISIN_No varchar(30) ,
Company varchar(100),
First_Listing_Date varchar(100),
Face_Value mediumint(5),
Paid_Up_Value mediumint(5),
Market_Lot mediumint(5),
Industry varchar(5),
primary key (nse_stock_id)
)
;

create table nse_daily_stock_price
(
nse_daily_stock_price_id int(20) NOT NULL AUTO_INCREMENT,
SYMBOL varchar(20),
SERIES varchar(10),
price_DATE date,
PREV_CLOSE decimal(10,2),
OPEN_PRICE decimal(10,2),
HIGH_PRICE decimal(10,2),
LOW_PRICE decimal(10,2),
LAST_PRICE decimal(10,2),
CLOSE_PRICE decimal(10,2),
AVG_PRICE decimal(10,2),
TTL_TRD_QNTY int(20),
TURNOVER_LACS decimal(10,2),
NO_OF_TRADES int(10),
DELIV_QTY int(10),
DELIV_PER decimal(10,2),
primary key(nse_daily_stock_price_id)
);

/*balance sheet*/
CREATE TABLE `balance_sheet_detail` (
  `shr_detail_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `stock_id` mediumint(9) DEFAULT NULL,
  `Mon_Year` char(10) DEFAULT NULL,
  `Equity_Share_Capital` char(30) DEFAULT NULL,
  `Total_Share_Capital` char(30) DEFAULT NULL,
  `Reserves_and_Surplus` char(30) DEFAULT NULL,
  `Total_Reserves_and_Surplus` char(30) DEFAULT NULL,
  `Money_Received_Against_Share_Warrants` char(30) DEFAULT NULL,
  `Total_Shareholders_Funds` char(30) DEFAULT NULL,
  `Equity_Share_Application_Money` char(30) DEFAULT NULL,
  `Long_Term_Provisions` char(30) DEFAULT NULL,
  `Total_NonCurrent_Liabilities` char(30) DEFAULT NULL,
  `Trade_Payables` char(30) DEFAULT NULL,
  `Other_Current_Liabilities` char(30) DEFAULT NULL,
  `Short_Term_Provisions` char(30) DEFAULT NULL,
  `Total_Current_Liabilities` char(30) DEFAULT NULL,
  `Total_Capital_And_Liabilities` char(30) DEFAULT NULL,
  `Tangible_Assets` char(30) DEFAULT NULL,
  `Intangible_Assets` char(30) DEFAULT NULL,
  `Capital_WorkInProgress` char(30) DEFAULT NULL,
  `Fixed_Assets` char(30) DEFAULT NULL,
  `NonCurrent_Investments` char(30) DEFAULT NULL,
  `Deferred_Tax_Assets_Net` char(30) DEFAULT NULL,
  `Long_Term_Loans_And_Advances` char(30) DEFAULT NULL,
  `Other_NonCurrent_Assets` char(30) DEFAULT NULL,
  `Total_NonCurrent_Assets` char(30) DEFAULT NULL,
  `Current_Investments` char(30) DEFAULT NULL,
  `Inventories` char(30) DEFAULT NULL,
  `Trade_Receivables` char(30) DEFAULT NULL,
  `Cash_And_Cash_Equivalents` char(30) DEFAULT NULL,
  `Short_Term_Loans_And_Advances` char(30) DEFAULT NULL,
  `OtherCurrentAssets` char(30) DEFAULT NULL,
  `Total_Current_Assets` char(30) DEFAULT NULL,
  `Total_Assets` char(30) DEFAULT NULL,
  `Contingent_Liabilities` char(30) DEFAULT NULL,
  `Capital_Goods` char(30) DEFAULT NULL,
  `Expenditure_In_Foreign_Currency` char(30) DEFAULT NULL,
  `Dividend_Remittance_In_Foreign_Currency` char(30) DEFAULT NULL,
  `FOB_Value_Of_Goods` char(30) DEFAULT NULL,
  `Other_Earnings` char(30) DEFAULT NULL,
  `Bonus_Equity_Share_Capital` char(30) DEFAULT NULL,
  `Non_Current_Investments_Quoted_Market_Value` char(30) DEFAULT NULL,
  `Non_Current_Investments_Unquoted_Book_Value` char(30) DEFAULT NULL,
  `Current_Investments_Quoted_Market_Value` char(30) DEFAULT NULL,
  `Current_Investments_Unquoted_Book_Value` char(30) DEFAULT NULL,
  PRIMARY KEY (`shr_detail_id`),
  KEY `stock_id` (`stock_id`),
  CONSTRAINT `balance_sheet_detail_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stock_list` (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


/*profit loss*/
CREATE TABLE `profit_loss_detail` (
  `pl_detail_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `stock_id` mediumint(9) DEFAULT NULL,
  `Mon_Year` char(10) DEFAULT NULL,
  `Revenue_From_Operations_Gross` char(30) DEFAULT NULL,
  `Revenue_From_Operations_Net` char(30) DEFAULT NULL,
  `Total_Operating_Revenues` char(30) DEFAULT NULL,
  `Other_Income` char(30) DEFAULT NULL,
  `Total_Revenue` char(30) DEFAULT NULL,
  `Changes_In_Inventories_Of_FG_WIP_And_StockIn_Trade` char(30) DEFAULT NULL,
  `Employee_Benefit_Expenses` char(30) DEFAULT NULL,
  `Depreciation_And_Amortisation_Expenses` char(30) DEFAULT NULL,
  `Other_Expenses` char(30) DEFAULT NULL,
  `Total_Expenses` char(30) DEFAULT NULL,
  `ProfitLoss_Before_Exceptional_ExtraOrdinary_Items_And_Tax` char(30) DEFAULT NULL,
  `Exceptional_Items` char(30) DEFAULT NULL,
  `ProfitLoss_Before_Tax` char(30) DEFAULT NULL,
  `Current_Tax` char(30) DEFAULT NULL,
  `Less_MAT_Credit_Entitlement` char(30) DEFAULT NULL,
  `Deferred_Tax` char(30) DEFAULT NULL,
  `Total_Tax_Expenses` char(30) DEFAULT NULL,
  `ProfitLoss_After_Tax_And_Before_ExtraOrdinary_Items` char(30) DEFAULT NULL,
  `ProfitLoss_From_Continuing_Operations` char(30) DEFAULT NULL,
  `ProfitLoss_For_The_Period` char(30) DEFAULT NULL,
  `Basic_EPS_Rs` char(30) DEFAULT NULL,
  `Diluted_EPS_Rs` char(30) DEFAULT NULL,
  `Equity_Share_Dividend` char(30) DEFAULT NULL,
  `Tax_On_Dividend` char(30) DEFAULT NULL,
  `Equity_Dividend_Rate_percent` char(30) DEFAULT NULL,
  PRIMARY KEY (`pl_detail_id`),
  KEY `stock_id` (`stock_id`),
  CONSTRAINT `profit_loss_detail_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stock_list` (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;



create view balance_sheet as
select
bscd.bs_conso_detail_id,
bscd.stock_id,
bscd.Mon_Year,
bscd.Total_Assets Assets,
round((bscd.Total_NonCurrent_Liabilities + bscd.Total_Current_Liabilities),2) Liabilities
from 
balance_sheet_conso_detail bscd
;


create view profit_loss as 
select 
plcd.pl_conso_detail_id,
plcd.stock_id,
plcd.Mon_Year,
plcd.Consolidated_Profit_Loss_After_MI_And_Associates pl_after_tax,
plcd.Equity_Share_Dividend
from
profit_loss_conso_detail plcd 
;

create view ratio_vw as 
select 
r.ratio_id,
r.stock_id,
r.mon_year,
r.Dividend__ShareRs
from ratios r
;


CREATE TABLE stock_year_shares (
  stock_yr_shrs_id mediumint(9) NOT NULL AUTO_INCREMENT,
  stock_id mediumint(9) NOT NULL,
  share_date date not NULL,
  No_of_Shares int(11) not NULL,
  PRIMARY KEY (stock_yr_shrs_id),
  FOREIGN KEY (stock_id) REFERENCES stock_list (stock_id)
) 
;




select 
stock_code,
stock_name,
current_year,
calc_next_year,
No_of_Shares,
assets,
Liabilities,
shareholders_fund,
(shareholders_fund/Assets) * 100 share_fund_prct,
equity_val,
(Equity_Val + Amt_Retain_from_EPS) Equity_Calc,
pl_after_tax,
eps,
(ROE * (Equity_Val + Amt_Retain_from_EPS)) / 100 EPS_Calc,
ROE,
dividend,
Amt_Retain_from_EPS
from
(
select 
sl.stock_code,
sl.stock_name,
bs.mon_year current_year,
cast(bs.mon_year as signed) +1 calc_next_year,
sys.No_Of_Shares ,
bs.Assets ,
bs.Liabilities ,
round((bs.Assets - bs.Liabilities),2) ShareHolders_Fund,
round((round((bs.Assets - bs.Liabilities),2) / sys.No_Of_Shares ) * 10000000,2) Equity_Val,
pl.pl_after_tax,
round((pl.pl_after_tax/sys.No_Of_Shares) * 10000000,2) EPS,
(round((pl.pl_after_tax/sys.No_Of_Shares) * 10000000,2) / round((round((bs.Assets - bs.Liabilities),2) / sys.No_Of_Shares ) * 10000000,2)) * 100 ROE,
r.Dividend__ShareRs Dividend,
(round((pl.pl_after_tax/sys.No_Of_Shares) * 10000000,2) - r.Dividend__ShareRs) Amt_Retain_from_EPS
from stock_list sl
inner join stock_year_shares sys on sys.stock_id = sl.stock_id
inner join balance_sheet bs on bs.stock_id = sl.stock_id and bs.mon_year = cast(sys.year as char)
inner join profit_loss pl on pl.stock_id = sl.stock_id and bs.mon_year = pl.mon_year 
inner join ratio_vw r on r.stock_id = sl.stock_id and r.mon_year = pl.mon_year
where
 r.mon_year in ('2012','2013','2014','2015','2016')
) tbl;




