public with sharing class Util {
    public static Boolean inSandbox() {
        Organization org = [select Id, IsSandbox, Name from Organization limit 1];
        return (org.IsSandbox);
    }

    public static Map<Id, Integer> listToMap(List<AggregateResult> aggregate){
        Map<Id, Integer> results = new Map<Id, Integer>();
        for(AggregateResult result : aggregate){
            results.put((Id) result.get('WinnerTeam__c'), (Integer) result.get('expr0'));
        }
        return results;
    }

    public static Integer getRandomInt(Integer min, Integer max) {
        return (Integer) Math.floor(Math.random() * (max - min + 1)) + min;
    }


}

