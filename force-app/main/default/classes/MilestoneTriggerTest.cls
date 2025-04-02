@isTest
private class MilestoneTriggerTest {
    @isTest
    static void testMilestoneTriggerRuns() {
        // Cria Projeto
        Projetos__c proj = new Projetos__c(Name = 'Milestone Trigger Project');
        insert proj;

        // Cria 2 milestones
        Milestone__c m1 = new Milestone__c(Name = 'M1', Projeto__c = proj.Id, PercentComplete__c = 100);
        Milestone__c m2 = new Milestone__c(Name = 'M2', Projeto__c = proj.Id, PercentComplete__c = 0);
        insert new List<Milestone__c>{ m1, m2 };

        // Atualiza m2 (isso aciona a trigger MilestoneTrigger)
        m2.PercentComplete__c = 50;
        update m2;

        // Verifica status e % no projeto
        proj = [SELECT PercentComplete__c, Status__c FROM Projetos__c WHERE Id = :proj.Id];
        System.assertEquals(75, proj.PercentComplete__c);
        System.assertEquals('In Progress', proj.Status__c);
    }
}
