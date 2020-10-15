@IsTest
public with sharing class DataFactory {

    public DataFactory() {

    }

    public static void createAuthSettings(){
        BalldontlieSettings__c dev = new BalldontlieSettings__c(Name = 'DEV', URL__c = 'www.dummydev.com', currentPage__c = 1);
        BalldontlieSettings__c pro = new BalldontlieSettings__c(Name = 'PRO', URL__c = 'www.dummydev.com', currentPage__c = 1);
        insert dev;
        insert pro;
    }

    public static void createSomeTeams(){
        List<Team__c> teams = new List<Team__c>();
        teams.add(getTeam(1,'ATL','Atlanta','East','Southeast','Atlanta Hawks','Hawks'));
        teams.add(getTeam(2,'BOS','Boston','East','Atlantic','Boston Celtics','Celtics'));
        teams.add(getTeam(3,'BKN','Brooklyn','East','Atlantic','Brooklyn Nets','Nets'));
        teams.add(getTeam(4,'CHA','Carlotte','East','Southeast','Charlotte Hornets','Hornets'));
        teams.add(getTeam(13,'LAC','LA','West','Pacific','LA Clippers','Clippers'));
        insert teams;
    }

    private static Team__c getTeam(Integer externalId, String abbreviation, String city, String Conference, String division, String fullName, String Name){
        Team__c team = new Team__c(
            External_Id__c = externalId,
            Abbreviation__c = abbreviation,
            City__c = city,
            Conference__c = Conference,
            Division__c = division,
            Full_Name__c = fullName,
            Name = Name
        );
        return team;
    }

}
