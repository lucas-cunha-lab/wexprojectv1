public class MilestoneHandler {
    public static void recalculateMilestones(Set<Id> milestoneIds) {
        List<Milestone__c> milestonesToUpdate = new List<Milestone__c>();

        for (Id milestoneId : milestoneIds) {
            List<TodoItem__c> todos = [SELECT Id, Status__c FROM TodoItem__c WHERE Milestone__c = :milestoneId];
            Integer total = todos.size();
            Integer completed = 0;

            for (TodoItem__c todo : todos) {
                if (todo.Status__c == 'Completed') {
                    completed++;
                }
            }

            Decimal percentage = total > 0 ? (Decimal.valueOf(completed) / total) * 100 : 0;

            Milestone__c m = new Milestone__c(
                Id = milestoneId,
                PercentComplete__c = percentage,
                Status__c = percentage == 0 ? 'Not Started' :
                            percentage == 100 ? 'Complete' :
                            'In Progress'
            );

            milestonesToUpdate.add(m);
        }

        if (!milestonesToUpdate.isEmpty()) {
            update milestonesToUpdate;
        }
    }
}
