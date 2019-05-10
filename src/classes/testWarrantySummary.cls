@isTest
private class testWarrantySummary {
	
	@isTest static void CreateCase() {
		Case testWarranty		= new Case();
		testWarranty.Product_Purchase_Date__c 		= Date.today()-10;
        testWarranty.Product_Total_Warranty_Days__c = 20;
        Decimal warrantyPercent = (testWarranty.Product_Purchase_Date__c.daysBetween(Date.today()) / testWarranty.Product_Total_Warranty_Days__c *100).setScale(2);
        testWarranty.Product_Has_Extended_Warranty__c= true;
        String warrantySum      =   'Product purchased on '+  testWarranty.Product_Purchase_Date__c.format() +
                                    ' and case created on '+ Date.today().format() +'.\n' 
                                    +'Warranty is for '+ testWarranty.Product_Total_Warranty_Days__c+' days'
                                    +' and is '+warrantyPercent+' % through its warranty period.\n'
                                    + 'Extended warranty: ' + 'true'+'\n'
                                    + 'Have a nice day!';
		// Implement test code
		
		testWarranty.Origin 						= 'Email';
		//testWarranty.Warranty_Summary__c			= warrantySum;
		insert testWarranty;
	}
	
	
	
}