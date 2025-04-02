trigger MilestoneTrigger on Milestone__c (after insert, after update, after delete, after undelete) {
    Set<Id> projectIds = new Set<Id>();

    for (Milestone__c m : Trigger.isDelete ? Trigger.old : Trigger.new) {
        if (m.Projeto__c != null) {
            projectIds.add(m.Projeto__c);
        }
    }

    if (!projectIds.isEmpty()) {
        ProjectHandler.recalculateProjects(projectIds);
    }
}
