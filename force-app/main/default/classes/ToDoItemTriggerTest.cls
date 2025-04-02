@isTest
private class ToDoItemTriggerTest {
    @isTest
    static void testToDoTriggerRuns() {
        // Cria Projeto
        Projetos__c proj = new Projetos__c(Name = 'Trigger Project');
        insert proj;

        // Cria Milestone
        Milestone__c milestone = new Milestone__c(Name = 'Trigger Milestone', Projeto__c = proj.Id);
        insert milestone;

        // Cria Tarefa (isso aciona a trigger ToDoItemTrigger)
        TodoItem__c todo = new TodoItem__c(Name = 'Trigger Task', Milestone__c = milestone.Id, Status__c = 'Completed');
        insert todo;

        // Verifica se Milestone foi atualizado
        milestone = [SELECT PercentComplete__c, Status__c FROM Milestone__c WHERE Id = :milestone.Id];
        System.assertEquals(100, milestone.PercentComplete__c);
        System.assertEquals('Complete', milestone.Status__c);
    }
}
