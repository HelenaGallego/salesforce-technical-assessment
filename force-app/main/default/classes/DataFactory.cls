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
       
        teams.add(getTeam(14,'LAC','LA','West','Pacific','LA Clippers','Clippers'));
        teams.add(getTeam(13,'RAND','PA','West','Pacific','RandName','Rand'));
        teams.add(getTeam(15,'AND','PA','East','Pacific','Test','Test'));
        teams.add(getTeam(16,'MORE','More','West','Pacific','More','More'));


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

    public static Game__c getGame(){
        return new Game__c(
            ExternalId__c = 1,
            HomeTeamScore__c = 10,
            VisitorTeamScore__c = 20,
            hometeam__r = new Team__c(External_Id__c = 1),
            visitorteam__r = new Team__c(External_Id__c = 2)
        );
    }  

    public static Game__c getDynamicGame(Integer externalId, Integer homeTeamScore, Integer visitorTeamScore, Integer homeTeamId, Integer visitorTeamId){
        return new Game__c(
            ExternalId__c = externalId,
            HomeTeamScore__c = homeTeamScore,
            VisitorTeamScore__c = visitorTeamScore,
            hometeam__r = new Team__c(External_Id__c = homeTeamId),
            visitorteam__r = new Team__c(External_Id__c = visitorTeamId)
        );
    }

    public static void createSomeGames(){
        List<Game__c> games = new List<Game__c>();
        games.add(getDynamicGame(1, 50, 10, 1, 2)); // wins 1
        games.add(getDynamicGame(2, 10, 20, 1, 2)); // wins 2
        games.add(getDynamicGame(3, 50, 10, 1, 2)); // wins 1
        games.add(getDynamicGame(4, 10, 20, 1, 2)); // wins 2
        games.add(getDynamicGame(5, 50, 10, 1, 2)); // wins 1
        games.add(getDynamicGame(6, 10, 20, 1, 2)); // wins 2
        insert games;
    }

    public static void createAlotOfGames(){
        List<Game__c> games = new List<Game__c>();
        for (Integer num = 0; num < 230; num++) {
            games.add(
                getDynamicGame(
                    num, 
                    Util.getRandomInt(1, 150),
                    Util.getRandomInt(1, 150),
                    Util.getRandomInt(1, 4),
                    Util.getRandomInt(13, 16)
                )
            );
        }
        insert games;
    }

}
