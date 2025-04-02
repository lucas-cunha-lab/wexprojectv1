public with sharing class todoController {
    @AuraEnabled
    public static String createTodo(String todoName) {
        TodoItem__c todo = new TodoItem__c(Name = todoName);
        insert todo;
        return todo.Id;
    }
}
