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
