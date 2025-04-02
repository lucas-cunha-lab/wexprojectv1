@isTest
private class ProjectHandlerTest {
    @isTest
    static void testRecalculateProject() {
        // Cria projeto
        Projetos__c proj = new Projetos__c(Name = 'Projeto Testado');
        insert proj;

        // Cria dois milestones com porcentagens diferentes
        Milestone__c m1 = new Milestone__c(Name = 'Marco A', Projeto__c = proj.Id, PercentComplete__c = 100);
        Milestone__c m2 = new Milestone__c(Name = 'Marco B', Projeto__c = proj.Id, PercentComplete__c = 0);
        insert new List<Milestone__c>{ m1, m2 };

        // Atualiza um milestone para disparar trigger
        m2.PercentComplete__c = 50;
        update m2;

        // Reconsulta projeto
        proj = [SELECT PercentComplete__c, Status__c FROM Projetos__c WHERE Id = :proj.Id];
        System.assertEquals(75, proj.PercentComplete__c);
        System.assertEquals('In Progress', proj.Status__c);
    }
}
