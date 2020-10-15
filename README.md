Solution proposed for CTL technical assignment:

The solution contains:
- The Game__c object
- The custom setting BalldontlieSettings for the auth data with the Balldontlie system
- Apex classes


The Game__c object contains the following fields:

CreatedById	Lookup(User)
ExternalID__c	Number(18, 0) (External ID) (Unique)
Name	Text(80)
GameDate__c	Date/Time
HomeTeam__c	Lookup(Team)
HomeTeamScore__c	Number(18, 0)
LastModifiedById	Lookup(User)
OwnerId	Lookup(User,Group)
Period__c	Number(18, 0)
PostSeason__c	Checkbox
Season__c	Number(18, 0)
Status__c	Text(50)
VisitorTeam__c	Lookup(Team)
VisitorTeamScore__c	Number(18, 0)

The BalldontlieSettings__c custom setting is a list custom setting to add the configuration data for the Balldontlie such as the URL and the current number of pages already processed.

The code is organized as follows:
- Balldontlie is the apex class that handles all the integration logic with the server
- GameService is the apex class that does all the logic related to the games retrieval, processing and storing
- BatchRetrieveGames is the an batchable and schedulable class that is scheduled to retrieve the results periodically