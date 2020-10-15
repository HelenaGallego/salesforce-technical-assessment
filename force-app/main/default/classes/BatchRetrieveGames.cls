global with sharing class BatchRetrieveGames implements Database.Batchable<Integer>, Database.AllowsCallouts, Schedulable{

    public Integer currentPage;
    public Integer totalPages;
    private static Integer PER_PAGE_SIZE = 10;
    public BalldontlieSettings__c authSettings {
        get {
            if (authSettings == null) {
                authSettings = BalldontlieSettings__c.getInstance(Util.inSandbox() ? Balldontlie.SETTINGS_NAME_SANDBOX : Balldontlie.SETTINGS_NAME_PRODUCTION);
            }
            return authSettings;
        }
        set;
    }

    global BatchRetrieveGames () {
        //this.totalPages = GamesService.getTotalGames();
        this.totalPages = 3;
        this.currentPage = (Integer) this.authSettings.currentPage__c;
    }


	global List<Integer> start(Database.BatchableContext BC){
		List<Integer> iterable = new List<Integer>();
        Integer i = this.currentPage;
		while(i < this.totalPages) {
			iterable.add(i);
			i = i + 1;
		}
		return iterable;
	}

    global void execute(Database.BatchableContext BC, List<Integer> scope) {
        List<Game__c> gamesToInsert = new List<Game__c>();
        for(Integer page: scope){
            GamesWrapper wrapper = GamesService.getGamesByPage(currentPage, PER_PAGE_SIZE);
            gamesToInsert.addAll(GamesService.convertGamesWrapperToGames(wrapper));
        }
        Database.upsert(gamesToInsert, false);
    }


    global void finish(Database.BatchableContext BC) {
        authSettings.currentPage__c = totalPages;
        update authSettings;
    }

    global void execute(SchedulableContext sc){
		ID batchprocessid = Database.executeBatch(new BatchRetrieveGames());
	}

}