@isTest
private class MilestoneHandlerTest {
    @isTest
    static void testRecalculateMilestone() {
        // Cria projeto
        Projetos__c proj = new Projetos__c(Name = 'Projeto Teste');
        insert proj;

        // Cria milestone
        Milestone__c milestone = new Milestone__c(Name = 'Marco 1', Projeto__c = proj.Id);
        insert milestone;

        // Cria 2 tarefas, uma concluída
        TodoItem__c todo1 = new TodoItem__c(Name = 'Tarefa 1', Milestone__c = milestone.Id, Status__c = 'Completed');
        TodoItem__c todo2 = new TodoItem__c(Name = 'Tarefa 2', Milestone__c = milestone.Id, Status__c = 'Pending');
        insert new List<TodoItem__c>{ todo1, todo2 };

        // Atualiza uma tarefa para disparar a trigger
        todo2.Status__c = 'Completed';
        update todo2;

        // Reconsulta milestone para verificar cálculo
        milestone = [SELECT PercentComplete__c, Status__c FROM Milestone__c WHERE Id = :milestone.Id];
        System.assertEquals(100, milestone.PercentComplete__c);
        System.assertEquals('Complete', milestone.Status__c);
    }
}
