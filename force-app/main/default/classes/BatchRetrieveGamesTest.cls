@isTest
public with sharing class BatchRetrieveGamesTest {

    @testSetup
    private static void init(){
        DataFactory.createAuthSettings();
        DataFactory.createSomeTeams();
    }

    @isTest
    private static void testGameCreation(){
        Test.startTest();
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('gamesResponse');
        mock.setStatusCode(200);
        Test.setMock(HttpCalloutMock.class, mock);
        Database.executeBatch(new BatchRetrieveGames());
        Test.stopTest();
        List<Game__c> games = [Select Id from Game__c];
        System.assertNotEquals(games.size(), null);

    }
}
