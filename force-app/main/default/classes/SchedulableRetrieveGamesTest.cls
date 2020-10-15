@isTest
public with sharing class SchedulableRetrieveGamesTest {

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
        ScheduleRetrieveGames controller = new ScheduleRetrieveGames();
        controller.execute(null);
        Test.stopTest();
        List<Game__c> games = [Select Id from Game__c];
        System.assertNotEquals(games.size(), null);

    }
}

