@isTest
private class HelloWorldTest {
    @isTest static void updateLead() {
        Lead myLead = new Lead();
        myLead.FirstName = 'John';
        myLead.LastName  = 'Doe';
        myLead.Company   = 'Infa';
        insert myLead;
        myLead.Company   = 'Home';
        update myLead;
    }
    
}