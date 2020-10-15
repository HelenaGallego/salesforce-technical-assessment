public with sharing class Util {
    public static Boolean inSandbox() {
        Organization org = [select Id, IsSandbox, Name from Organization limit 1];
        return (org.IsSandbox);
    }
}