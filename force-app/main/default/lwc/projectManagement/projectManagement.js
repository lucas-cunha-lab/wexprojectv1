
import { LightningElement, track } from 'lwc';
import createProject from '@salesforce/apex/ProjectManagementController.createProject';
import createMilestone from '@salesforce/apex/ProjectManagementController.createMilestone';
import createTodo from '@salesforce/apex/ProjectManagementController.createTodo';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ProjectManagement extends NavigationMixin(LightningElement){
    @track projectName = '';
    @track milestoneName = '';
    @track todoName = '';
    @track projectId = null;
    @track milestoneId = null;
    @track todos = [];
    @track step = 1;

    get step1() {
        return this.step === 1;
    }

    get step2() {
        return this.step === 2;
    }

    get step3() {
        return this.step === 3;
    }

    handleProjectNameChange(event) { this.projectName = event.target.value; }
    handleMilestoneNameChange(event) { this.milestoneName = event.target.value; }
    handleTodoNameChange(event) { this.todoName = event.target.value; }

    handleNextStep() { this.step++; }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        }));
    }

    handleCreateProject() {
        createProject({ projectName: this.projectName })
            .then(result => {
                this.projectId = result;
                this.projectName = '';
                this.handleNextStep();
            })
            .catch(error => console.error('Erro ao criar projeto:', error));
    }

    handleAddMilestone() {
        if (!this.projectId) return;
        createMilestone({ milestoneName: this.milestoneName, projectId: this.projectId })
            .then(result => {
                this.showToast('Marco Criado', `Milestone "${this.milestoneName}" criado com sucesso.`, 'success');
                this.milestoneName = '';
                this.milestoneId = result;
            })
            .catch(error => console.error('Erro ao criar marco:', error));
    }

    handleCreateTodo() {
        if (!this.milestoneId) return;
        createTodo({ todoName: this.todoName, milestoneId: this.milestoneId })
            .then(result => {
                this.todos.push({ id: result, name: this.todoName });
                this.showToast('Tarefa Criada', `To-Do "${this.todoName}" criado com sucesso.`, 'success');
                this.todoName = '';
            })
            .catch(error => console.error('Erro ao criar tarefa:', error));
    }

    handleCreateAndOpenProject() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.projectId,
                objectApiName: 'Projetos__c',
                actionName: 'view'
            }
        });
    }
}