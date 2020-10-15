global with sharing class ScheduleRetrieveGames implements  Database.AllowsCallouts, System.Schedulable{

    public Integer currentPage;
    public Integer totalPages;
    private static Integer PER_PAGE_SIZE = 100;
    private static Integer MAX_PAGES = 10;

    public BalldontlieSettings__c authSettings {
        get {
            if (authSettings == null) {
                authSettings = BalldontlieSettings__c.getInstance(Util.inSandbox() ? Balldontlie.SETTINGS_NAME_SANDBOX : Balldontlie.SETTINGS_NAME_PRODUCTION);
            }
            return authSettings;
        }
        set;
    }

    global ScheduleRetrieveGames () {
        this.totalPages = GamesService.getTotalPages();
        this.currentPage = (Integer) this.authSettings.currentPage__c;
    }

    global void execute(System.SchedulableContext SC) {
        if(currentPage <= totalPages){
            List<Game__c> gamesToInsert = new List<Game__c>();
            Integer i = currentPage;
            Integer lastPage = currentPage + MAX_PAGES;

            while(i < lastPage){
                GamesWrapper wrapper = GamesService.getGamesByPage(i, PER_PAGE_SIZE);
                gamesToInsert.addAll(GamesService.convertGamesWrapperToGames(wrapper));
                i = i + 1;
            }
            Database.upsert(gamesToInsert, false);
            authSettings.currentPage__c = lastPage;
            update authSettings;
        }
    }

}