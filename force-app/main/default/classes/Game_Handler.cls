public without sharing class Game_Handler {

    public Game_Handler(){
        
    }

    public void onBeforeInsert(List<Game__c> triggerNew){
        setWinningTeam(triggerNew);
    }
    
    public void onBeforeUpdate(List<Game__c> triggerOld , List<Game__c> triggerNew , Map<Id,Game__c> triggerOldMap , Map<Id,Game__c> triggerNewMap){
        setWinningTeam(triggerNew);
    }

    public void onBeforeDelete(List<Game__c> triggerOld , Map<Id,Game__c> triggerOldMap){
    
    }

    public void onAfterInsert(List<Game__c> triggerNew , Map<Id,Game__c> triggerNewMap){
        calculateAverage(triggerNew);
    }

    public void onAfterUpdate(List<Game__c> triggerOld , List<Game__c> triggerNew , Map<Id,Game__c> triggerOldMap , Map<Id,Game__c> triggerNewMap){
        calculateAverage(triggerNew);
    }

    public void onAfterDelete(List<Game__c> triggerOld , Map<Id,Game__c> triggerOldMap){
        
    }

    public void onAfterUndelete(List<Game__c> triggerNew){
    
    }

    private static void setWinningTeam(List<Game__c> triggerNew){
        for(Game__c game: triggerNew){
            if(game.HomeTeamScore__c > game.VisitorTeamScore__c){
                game.WinnerTeam__c = game.HomeTeam__c;
            } else {
                game.WinnerTeam__c = game.VisitorTeam__c;
            }
        }
    }

    private static void calculateAverage(List<Game__c> triggerNew){
        Set<Id> teams = new Set<Id>();
        for(Game__c game: triggerNew){
            teams.add(game.hometeam__c);
            teams.add(game.visitorteam__c);
        }
        List<AggregateResult> allWon = GamesService.getCountAllWonGames(teams);
        Map<Id,Integer> mapAllWon = Util.listToMap(allWon);
        Map<Id,Integer> mapAllPlayed = GamesService.getCountAllPlayedGames(teams);

        List<Team__c> teamsToUpdate = new List<Team__c>();
        for(Id team: teams){
            Decimal average = (Decimal) (mapAllWon.get(team) / (Decimal) mapAllPlayed.get(team)) * 100;
            teamsToUpdate.add(new Team__c(Id = team, AverageWon__c = average));
        }
        update teamsToUpdate;
    }


}