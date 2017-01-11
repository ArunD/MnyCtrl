/* stock list */
CREATE TABLE `stock_list` (
  `stock_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `stock_code` char(10) DEFAULT NULL,
  `stock_name` char(50) DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8025 DEFAULT CHARSET=latin1;

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
  Year int(11) DEFAULT NULL,
  No_of_Shares int(11) DEFAULT NULL,
  PRIMARY KEY (stock_yr_shrs_id),
  FOREIGN KEY (stock_id) REFERENCES stock_list (stock_id)
) ;

INSERT INTO stock_year_shares(stock_id,Year,No_of_Shares)
VALUES(6066,2011,25711076);
INSERT INTO stock_year_shares(stock_id,Year,No_of_Shares)
VALUES(6066,2012,24512780);
INSERT INTO stock_year_shares(stock_id,Year,No_of_Shares)
VALUES(6066,2013,21181523);
INSERT INTO stock_year_shares(stock_id,Year,No_of_Shares)
VALUES(6066,2014,21317373);
INSERT INTO stock_year_shares(stock_id,Year,No_of_Shares)
VALUES(6066,2015,17701813);
INSERT INTO stock_year_shares(stock_id,Year,No_of_Shares)
VALUES(6066,2016,17719813);
commit;


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




