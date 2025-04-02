public with sharing class ProjectManagementController {
    @AuraEnabled
    public static Id createProject(String projectName) {
        Projetos__c project = new Projetos__c(Name = projectName);
        insert project;
        return project.Id;
    }
    
    @AuraEnabled
    public static Id createMilestone(String milestoneName, Id projectId) {
        Milestone__c milestone = new Milestone__c(Name = milestoneName, Projeto__c = projectId);
        insert milestone;
        return milestone.Id;
    }
    
    @AuraEnabled
    public static Id createTodo(String todoName, Id milestoneId) {
        TodoItem__c todo = new TodoItem__c(Name = todoName, Milestone__c = milestoneId);
        insert todo;
        return todo.Id;
    }
}
