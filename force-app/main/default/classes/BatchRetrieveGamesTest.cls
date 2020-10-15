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
    
    @isTest
   private static void testSchedulable(){
        Test.startTest();
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('gamesResponse');
        mock.setStatusCode(200);
        Test.setMock(HttpCalloutMock.class, mock);
        BatchRetrieveGames batch = new BatchRetrieveGames();   
        String chron = '0 0 23 * * ?';        
        System.schedule('Test Sched', chron, batch);
        Test.stopTest();
    }
}
