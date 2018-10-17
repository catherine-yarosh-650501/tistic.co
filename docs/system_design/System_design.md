# System design (UML)

#### [Glossary](Glossary.md)

1. [Activity Diagram](#1)<br>
2. [Use Case Diagram](#2)<br>
2.1. [Actors](#2.1)<br>
2.2. [Use Cases](#2.2)<br>
2.2.1. [User logon](#2.2.1)<br>
2.2.2. [Access to medical data](#2.2.2)<br>
2.2.3. [Add medical information](#2.2.3)<br>
2.2.4. [Delete medical information](#2.2.4)<br>
2.2.5. [Edit basic medical information](#2.2.5)<br>
3. [Sequence Diagram](#3)<br>
4. [State Machine Diagram](#4)<br>
5. [Class Diagram](#5)<br>
6. [Component Diagram](#6)<br>


# 1\. Activity Diagram <a name = "1"></a>
Activity Diagram is represented [here](Activity_diagrams/Activity.md)

# 2\. Use Case Diagram  <a name = "2"></a>

![Use](Use_case_diagram/use__tistic.co.png)
## 2.1\. Actors  <a name = "2.1"></a><br>
Actor | Description
| :-- | :--
User | A human that use this application

## 2.2\. Use Cases  <a name = "2.2"></a><br>
### 2.2.1\. User logon <a name = "2.2.1"></a>
<b>Description:</b> Use Case "User logon" allows a user to log in iOS system.
<b>Preconditions:</b> A user opened the application.<br>
<b>Flow of events:</b> <br>
1. Application checks logon in iOS system;<br>
2. If a user is logged in, go to step 4;<br>
3. The application opens system application "Settings";<br>
4. End. <br>

### 2.2.2\. Access to medical data <a name = "2.2.2"></a>

<b>Description:</b> Use case "Access to medical data" allows a user to provide access to medical data from iOS system to the application.
<b>Preconditions:</b> A user opened the application for the first time.<br>
<b>Flow of events:</b> <br>
1. Application shows dialog window and asks for access;<br>
2. A user press button "Don't allow", go to step 4;<br>
3. The application retrieves medical information from the system;<br>
4. End.<br>

### 2.2.3\. Add medical information <a name = "2.2.3"></a>

<b>Description:</b> Use case "Add medical information" allows a user to add medical data of didseases, allergy, medicaments or teeth.<br>
<b>Flow of events:</b> <br>
1. A user press button "Edit";<br>
2. A user select the record's type to add;<br>
3. A user input data;<br>
4. A user press button "Save"; <br>
5. The application save changes; <br>
6. End.<br>
### 2.2.4\. Delete medical information <a name = "2.2.4"></a>

<b>Description:</b> Use case "Delete medical information" allows a user to delete medical data of teeth.<br>
<b>Flow of events:</b> <br>
1. A user press button "Edit";<br>
2. A user select the record to delete;<br>
3. A user press button "–" near the selected record;<br>
4. A user press button "Save"; <br>
5. The application save changes; <br>
6. End.<br>

### 2.2.5\. Edit basic medical information <a name = "2.2.5"></a>
<b>Description:</b> Use case "Edit basic medical information" allows user to edit medical data of basic medical information.<br>
<b>Flow of events:</b> <br>
1. A user press button "Edit";<br>
2. A user select block of basic medical information;<br>
3. A user press button "Edit basic information" near the selected record;<br>
5. The application opens system aplication "Health"; <br>
6. A user edit basic information and comes back to the application;<br>
7. The application save changes; <br>
8. End.<br>

# 3\. Sequence Diagram <a name = "3"></a>

The sequence diagram of the main use case:
![Sequence](Sequence_diagram/Sequence_diagram.png)

# 4\. State Machine Diagram<a name = "4"></a>
![State](State_maschine_diagram/State_maschine_diagram.png)

# 5\. Class Diagram <a name = "5"></a>
![Class](Class_diagram/Class_diagram.png)

# 6\. Component and Deployment Diagram <a name = "6"></a>
![Component_deployment](Component_and_Deployment_diagrams/Component_and_Deployment_diagram.png)
