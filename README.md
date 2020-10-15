Solution proposed for CTL technical assignment:

The solution contains:
- The Game__c object
- The custom setting BalldontlieSettings for the auth data with the Balldontlie system
- Apex classes


The Game__c object contains the following custom fields:


Field  | Type
------------- | -------------
ExternalID__c  | Number(18, 0) (External ID) (Unique)
GameDate__c  | Date/Time
HomeTeam__c | Lookup(Team)
HomeTeamScore__c | Number(18, 0)
Period__c | Number(18, 0)
PostSeason__c | Checkbox
Season__c | Number(18, 0)
Status__c | Text(50)
VisitorTeam__c |	Lookup(Team)
VisitorTeamScore__c	| Number(18, 0)


The BalldontlieSettings__c custom setting is a list custom setting to add the configuration data for the Balldontlie such as the URL and the current number of pages already processed.

The code is organized as follows:
- Balldontlie is the apex class that handles all the integration logic with the server
- GameService is the apex class that does all the logic related to the games retrieval, processing and storing
- SchedulableRetrieveGames is the class that is scheduled to retrieve the results periodically. It can be scheduled every 5-15 minuts. The API info says that each 15 there is new data populated every 15 minuts so probably it should be the best frecuency. The class retrieves max 10 pages with 100 records as there is a max of 60 requests per minut.
- Util class - only contains one method but  can be extended for further util methods
- ScheduleRetrieveGamesTest class that tests the functionality in the schedulable. The other classes at the moment didn't really need an explicit test class.


