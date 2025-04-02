public class ProjectHandler {
    public static void recalculateProjects(Set<Id> projectIds) {
        List<Projetos__c> projectsToUpdate = new List<Projetos__c>();

        for (Id projectId : projectIds) {
            List<Milestone__c> milestones = [
                SELECT Id, PercentComplete__c
                FROM Milestone__c
                WHERE Projeto__c = :projectId
            ];

            Integer total = milestones.size();
            Decimal sum = 0;

            for (Milestone__c m : milestones) {
                sum += m.PercentComplete__c != null ? m.PercentComplete__c : 0;
            }

            Decimal percentage = total > 0 ? (sum / total) : 0;

            Projetos__c p = new Projetos__c(
                Id = projectId,
                PercentComplete__c = percentage,
                Status__c = percentage == 0 ? 'Not Started' :
                            percentage == 100 ? 'Complete' :
                            'In Progress'
            );

            projectsToUpdate.add(p);
        }

        if (!projectsToUpdate.isEmpty()) {
            update projectsToUpdate;
        }
    }
}
