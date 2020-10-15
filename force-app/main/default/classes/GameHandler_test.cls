
@istest
public with sharing class GameHandler_test {
    
    @testSetup
    private static void init(){
        DataFactory.createSomeTeams();
    }

    @isTest
    private static void checkAverageCalculation(){
        DataFactory.createSomeGames();
        System.assertNotEquals([Select AverageWon__c from Team__c LIMIT 1].averagewon__c, null);
    }

    @isTest
    private static void checkWinnerTeamSetup(){
        insert DataFactory.getGame();
        System.assertNotEquals([Select WinnerTeam__c from Game__c].WinnerTeam__c, null);
        System.assertEquals([Select WinnerTeam__r.External_Id__c from Game__c LIMIT 1].WinnerTeam__r.External_Id__c, 2);

        List<Game__c> games = [Select id, hometeamscore__c from Game__c LIMIT 1];
        games.get(0).hometeamscore__c = 50;
        update games;
        System.assertEquals([Select WinnerTeam__r.External_Id__c from Game__c LIMIT 1].WinnerTeam__r.External_Id__c, 1);

    }

    @isTest
    private static void bulkTest(){
        DataFactory.createAlotOfGames();
        List<Game__c> games = [Select id, WinnerTeam__c from Game__c where WinnerTeam__c != null];
        List<Team__c> teams = [Select id, AverageWon__c from Team__c where AverageWon__c != null];
        System.assertEquals(games.size(), 230);
        System.assert(teams.size() > 0);

    }

}
