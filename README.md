<<<<<<< HEAD
# 🚀 Project Management App (Salesforce LWC + Apex)

This is a simple project management application built in Salesforce using **Lightning Web Components (LWC)** and **Apex Triggers**.

---

## 📌 Objective

Enable users to create projects, manage their milestones and to-do items, and automatically control **status** and **completion percentages** through a clean and intuitive interface.

---

## ⚙️ Features

- ✅ Create **Projects**
- ✅ Add multiple **Milestones** per project
- ✅ Add multiple **To-Do Items** per milestone
- ✅ Automatic calculation of:
  - Milestone completion percentage (based on its To-Do items)
  - Project completion percentage (based on its milestones)
- ✅ Automatic update of `Status__c` field based on progress:
  - `Not Started`, `In Progress`, or `Complete`
- ✅ Clean UI with custom-styled LWC interface
- ✅ Toast messages for user feedback
- ✅ Navigation to saved record

---

## 🧠 Data Structure

### 📂 Custom Objects
| Object            | Key Fields                              |
|------------------|-------------------------------------------|
| `Projetos__c`     | `PercentComplete__c`, `Status__c`         |
| `Milestone__c`    | `Projeto__c`, `PercentComplete__c`, `Status__c` |
| `TodoItem__c`     | `Milestone__c`, `Status__c`               |

---

## 🧩 Components

### 🔹 `ProjectManagement` (LWC)
- Step-by-step flow:
  1. Create a Project
  2. Add one or more Milestones
  3. Add one or more To-Do Items
- Toast messages after each creation
- Navigation to record after saving

---

## 🧠 Apex Automation

### 🔸 Triggers

- `ToDoItemTrigger` → updates **Milestone** based on To-Do changes
- `MilestoneTrigger` → updates **Project** based on milestone changes

### 🔸 Handlers

- `MilestoneHandler.cls` → calculates `PercentComplete__c` and `Status__c` based on To-Dos
- `ProjectHandler.cls` → calculates `PercentComplete__c` and `Status__c` based on milestones

---

## 🚀 Deploy and Test

1. Create a [Salesforce Developer Org](https://developer.salesforce.com/signup)
2. Clone this repo:
```bash
git clone https://github.com/your-username/project-management-salesforce.git
=======
# Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
>>>>>>> 8b923b2 (First commit with all project)
