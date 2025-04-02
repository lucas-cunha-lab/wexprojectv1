trigger ToDoItemTrigger on TodoItem__c (after insert, after update, after delete, after undelete) {
    Set<Id> milestoneIds = new Set<Id>();

    for (TodoItem__c t : Trigger.isDelete ? Trigger.old : Trigger.new) {
        if (t.Milestone__c != null) {
            milestoneIds.add(t.Milestone__c);
        }
    }

    if (!milestoneIds.isEmpty()) {
        MilestoneHandler.recalculateMilestones(milestoneIds);
    }
}
