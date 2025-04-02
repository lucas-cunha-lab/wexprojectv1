public with sharing class milestoneController {
    @AuraEnabled
    public static String createMilestone(String milestoneName) {
        Milestone__c milestone = new Milestone__c(Name = milestoneName);
        insert milestone;
        return milestone.Id;
    }
}
