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
7. [Deployment Diagram](#7)<br>



# 1\. Activity Diagram <a name = "1"></a>
Activity Diagram is represented [here](Activity_diagrams/Activity.md)

# 2\. Use Case Diagram  <a name = "2"></a>

![Use](Use_case_diagram/use__tistic.co.png)
## 2.1\. Actors <br>
Actor | Description
| :-- | :--
User | Human that use this application

## 2.2\. Use Cases <br>
### 2.2.1\. User logon <a name = "2.2.1"></a>
<b>Description:</b> Use Case "User logon" allows user to log in iOS system.
<b>Preconditions:</b> User opened the application.<br>
<b>Flow of events:</b> <br>
1. Application checks logon in iOS system;<br>
2. If user is logged in, go to step 4;<br>
3. Application opens system application "Settings";<br>
4. End. <br>

### 2.2.2\. Access to medical data <a name = "2.2.2"></a>

<b>Description:</b> Use case "Access to medical data" allows user to provide access to medical data from iOS system to the application.
<b>Preconditions:</b> User opened the application for the first time.<br>
<b>Flow of events:</b> <br>
1. Application shows dialog window and asks for access;<br>
2. User press button "Don't allow", go to step 4;<br>
3. Application retrieves medical information from the system;<br>
4. End.<br>

### 2.2.3\. Add medical information <a name = "2.2.3"></a>

<b>Description:</b> Use case "Add medical information" allows user to add medical data of didseases, allergy, medicaments or teeth.<br>
<b>Flow of events:</b> <br>
1. User press button "Edit";<br>
2. User select the record's type to add;<br>
3. User input data;<br>
4. User press button "Save"; <br>
5. Application save changes; <br>
6. End.<br>
### 2.2.4\. Delete medical information <a name = "2.2.4"></a>

<b>Description:</b> Use case "Delete medical information" allows user to delete medical data of teeth.<br>
<b>Flow of events:</b> <br>
1. User press button "Edit";<br>
2. User select the record to delete;<br>
3. User press button "–" near the selected record;<br>
4. User press button "Save"; <br>
5. Application save changes; <br>
6. End.<br>

### 2.2.5\. Edit basic medical information <a name = "2.2.5"></a>
<b>Description:</b> Use case "Edit basic medical information" allows user to edit medical data of basic medical information.<br>
<b>Flow of events:</b> <br>
1. User press button "Edit";<br>
2. User select block of basic medical information;<br>
3. User press button "Edit basic information" near the selected record;<br>
5. Application opens system aplication "Health"; <br>
6. User edit basic information and comes back to the application;<br>
7. Application save changes; <br>
8. End.<br>

# 3\. Sequence Diagram <a name = "3"></a>

The sequence diagram of the main use case:
![Sequence](Sequence_diagram/Sequence_diagram.png)

# 4\. State Machine Diagram<a name = "4"></a>

# 5\. Class Diagram <a name = "5"></a>
![Class](Class_diagram/Class_diagram.png)

# 6\. Component Diagram <a name = "6"></a>

# 7\. Deployment Diagram <a name = "7"></a>