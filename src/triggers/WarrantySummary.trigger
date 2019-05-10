trigger WarrantySummary on Case (before insert) {
    For (Case myCase : Trigger.new) {
        String purchaseDate     = myCase.Product_Purchase_Date__c.format();
        String createdDate      = DateTime.now().format();
        Integer warrantyDays    = myCase.Product_Total_Warranty_Days__c.intValue() ;
        Decimal warrantyPercent = (myCase.Product_Purchase_Date__c.daysBetween(Date.today()) / myCase.Product_Total_Warranty_Days__c*100).setScale(2);
        Boolean xtendedWarranty = myCase.Product_Has_Extended_Warranty__c;
        String warrantySum      =   'Product purchased on '+ purchaseDate +
                                    ' and case created on '+ createdDate +'.\n' 
                                    +'Warranty is for '+ warrantyDays+' days'
                                    +' and is '+warrantyPercent+' % through its warranty period.\n'
                                    + 'Extended warranty: ' + xtendedWarranty+'\n'
                                    + 'Have a nice day!';
        myCase.Warranty_Summary__c  = warrantySum;
        
    }

}