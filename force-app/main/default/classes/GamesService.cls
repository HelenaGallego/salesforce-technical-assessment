public with sharing class GamesService {

    public GamesService() {

    }
    public static Integer getTotalPages(){
        HttpResponse response = new Balldontlie().request(
                Balldontlie.REST_METHOD_GET, 
                Balldontlie.GAMES_API_PATH
        );
        if (response.getStatusCode() == Balldontlie.RESPONSE_CODE_SUCCESS) {
            GamesWrapper games = (GamesWrapper) JSON.deserialize(response.getBody(), GamesWrapper.class);
            return (Integer) games.meta.total_pages;
        } else {
            throw new BalldontlieException(response.getBody());
        }
    }

    public static GamesWrapper getGamesByPage(Integer currrentPage, Integer perPage){
        HttpResponse response = new Balldontlie().request(
                Balldontlie.REST_METHOD_GET, 
                Balldontlie.GAMES_API_PATH + '?page='+currrentPage + 'per_page'+perPage
        );
        if (response.getStatusCode() == Balldontlie.RESPONSE_CODE_SUCCESS) {
            return (GamesWrapper) JSON.deserialize(response.getBody().replace('date','gamedate'), GamesWrapper.class);
        } else {
            throw new BalldontlieException(response.getBody());
        }
    }

    public static List<Game__c> convertGamesWrapperToGames(GamesWrapper wrapper){
        List<Game__c> gamesObjects = new List<Game__c>();
        List<GameEntity> gamesEntities = wrapper.data;
        for(GameEntity game: gamesEntities){
            gamesObjects.add(convertGameEntityToGame(game));
        }
        return gamesObjects;
    }
    public static Game__c convertGameEntityToGame(GameEntity game){
        Game__c gameObject = new Game__c(
            ExternalID__c = game.id,
            HomeTeamScore__c = game.home_team_score,
            Period__c = game.period,
            PostSeason__c = game.postseason,
            Season__c = game.season,
            Status__c = game.status,
            VisitorTeamScore__c = game.visitor_team_score
        );
        gameObject.gameDate__c = game.gamedate!=null ? (DateTime)Json.deserialize(game.gamedate, DateTime.class) : null;
        Team__c hometeam = new Team__c(External_Id__c = game.home_team.id);
        Team__c visitorteam = new Team__c(External_Id__c = game.visitor_team.id);
        gameObject.HomeTeam__r = hometeam;
        gameObject.VisitorTeam__r = visitorteam;
        return gameObject;
    }

    public static Map<Id, Integer> getCountAllPlayedGames(Set<Id> teamsId){
        Map<Id, Integer> allPlayedGames = new Map<Id, Integer>();
        for(Team__c team: [select id, (Select id from Games__r), (select id from Games1__r) from team__c where Id in: teamsId]){
            allPlayedGames.put(team.id, team.Games__r.size() + team.Games__r.size());
        }
        return allPlayedGames;
    }

    public static List<AggregateResult> getCountAllWonGames(Set<Id> teamsId){
        List<AggregateResult> allWons = [
            SELECT 
                COUNT(id), 
                winnerteam__c
            FROM 
                Game__c 
            WHERE 
                WinnerTeam__c 
            IN: 
                teamsId
            GROUP BY 
                winnerteam__c 
        ];
        return allWons;
    }
    
}