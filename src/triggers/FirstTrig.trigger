trigger FirstTrig on Account (after insert) {
    User usr = [select Id from User where Username = 'j.ananthakrishnan@gmail.com'];
    for (Account Acc: trigger.new){
        Case caseAc = new Case();
        caseAc.Subject = 'Dedupe this accout';
        caseAc.OwnerId = usr.Id; //Ananth Jayar47 or 005900000010Pjc or usr
        caseAc.AccountId = Acc.Id;
        insert caseAc;

    }
}