public with sharing class projectController {
    @AuraEnabled
    public static String createProject(String projectName) {
        Projetos__c	 project = new Projetos__c	(Name = projectName);
        insert project;
        return project.Id;
    }
}
