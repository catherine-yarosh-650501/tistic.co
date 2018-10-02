# Requirements Document

### Table of Contents

1. [Introduction](#1) <br>
	1.1. [Purpose](#1.1) <br> 
	1.2. [Business requirements](#1.2) <br>
		1.2.1. [Initial data](#1.2.1) <br>
		1.2.2. [Business opportunities](#1.2.2) <br>
	1.3. [Analogues](#analogues) <br>
2. [User Requirements](#2) <br>
	2.1. [Software Interfaces](#2.1) <br>
  	2.2. [User Interfaces](#2.2) <br>
  	2.3. [User Characteristics](#2.3) <br>
  		2.3.1. [User Classes](#2.3.1) <br>
  		2.3.2. [Application Audience](#2.3.2)<br>
  	2.4. [Assumptions and Dependencies](#2.4) <br>
3. [System Requirements](#3.) <br>
  	3.1. [Functional Requirements](#3.1) <br>
  		3.1.1. [Basic functionality](#3.1.1) <br>
  			3.1.1.1. [User logon to the application](#3.1.1.1)<br>
  			3.1.1.2. [Access to medical data](#3.1.1.2)<br>
  			3.1.1.3. [Adding medical information](#3.1.1.3)<br>
  			3.1.1.4. [Deleting medical information](#3.1.1.4)<br>
  			3.1.1.5. [Editing basic medical information](#3.1.1.5)<br>
  		3.1.2. [Limitations and Exceptions]()<br>
  	3.2. [Non-Functional Requierements](#3.2) <br>
   		3.2.1. [Software Quality Attributes](#3.2.1) <br>
    		3.2.1.1. [Usability](#3.2.1.1) <br>
    		3.2.1.2. [Security](#3.2.1.2) <br>
    	3.2.2. [External Interfaces](#3.2.2) <br>
    	3.2.3. [Constraints](#3.2.3) <br>

## 1\. Introduction <a name = "1"></a>

### 1.1\. Purpose <a name = "1.1"></a>
This document contains functional and non-functional requirements for the mobile application "tistic.co" for iOS 12 and higher. This document is intended for a team that will implement and verify the correctness of the application.

### 1.2\. Business requirements<a name = "1.2"></a>

#### 1.2.1\. Initial data <a name = "1.2.1"></a>
Modern IT technologies are making their way into all areas of human life. Maintaining electronic medical records is especially popular, since it saves patients from excessive bureaucracy with paper-based documents. It is also convenient for doctors, who at any time can get information about the medical history of patient. But not all electronic media have information about the health of the patient's teeth and people must use paper-based documents.

#### 1.2.2\. Business opportunities <a name = "1.2.2"></a>
Many people want an application that will allow you to store your health data electronically, with minimal technical literacy. Such application will allow them to spend less time searching for necessary information about their health. This will also allow doctors to spend less time for collecting information about the patient. The designed user interface should allow the application to be used by people with minimal technical knowledge.

### 1.3\. Analogues<a name = "1.3"></a>
Main difference from analogues – storage of medical history and tooth chart in one application. <br>

- <b>Oral-b by [P&G Productions](https://us.pg.com) </b><br>
![Oral-b](analogues/1-oral-b.png)

	Oral-B App is your personal brushing assistant to help you achieve great oral health. Application provide daily control of cleaning time for teeth and represents this information in the form of charts and graphs.<br>

	- Lack of basic medical information;
	- Lack of tooth charts.  

- <b>XDENT by [CGM Italia](https://www.cgm.com/it/index.it.jsp)</b> <br>
![XDENT](analogues/2-xdent.png)

	XDENT iPhone edition allows you to manage the dental practice with iPhone. Use iPhone to manage everywhere appointments, patients and treatment plans. 
Essential for practice consultants and to optimize the time and cost of secretariat.
	- Professional software for doctors and clinics;
	- Lack of basic medical information;  
	- Lack of tooth charts.  

- <b>iDent by [Chris Balla](https://itunes.apple.com/us/developer/chris-balla/id586697061?mt=8)</b> <br>
![iDent](analogues/3-ident.png) <br>
	
	Connects laboratory chair-side with real-time consulting for a better Patient acceptance, results and maximum flexibility, Case management allows more efficient scheduling, greatly reducing clinical “down-time”.<br>
	- Lack of basic medical information;
	- Professional software for doctors and clinics.

## 2\. User Requirements <a name = "2"></a>

### 2.1\. Software Interfaces <a name="2.1"></a>
Application uses [HealthKit framework](https://developer.apple.com/healthkit/), that represent your medical data from iOS system application Health.

### 2.2\. User Interfaces <a name="2.2"></a>
Graphical user interface is represented by mockup images.

<p align = "center">
<img width = "282" height = "573" src = "https://github.com/greadvx/tistic.co/blob/master/docs/mockups/tistic-co_Icon.png?raw=true">
</p>

<p align = "center">
Figure 1. Icon Image of the application<br>
</p>

<p align = "center">
<img width = "282" height = "573" src="https://github.com/greadvx/tistic.co/blob/master/docs/mockups/tistic-co_Startup.png?raw=true">
</p>

<p align = "center">
Figure 2. Startup screen of the application<br>
</p>


<p align = "center">
<img width = "282" height = "573" src="https://github.com/greadvx/tistic.co/blob/master/docs/mockups/tistic-co_Startup_access.png?raw=true">
</p>

<p align = "center">
Figure 3. Allow access medical data<br>
</p>

<p align = "center">
<img width = "282" height = "573" src="https://github.com/greadvx/tistic.co/blob/master/docs/mockups/tistic-co_Medical_data.png?raw=true">
</p>

<p align = "center">
Figure 4. Medical data screen<br>
</p>

<p align = "center">
<img width = "282" height = "573" src="https://github.com/greadvx/tistic.co/blob/master/docs/mockups/tistic-co_Dental_data-1.png?raw=true">
</p>

<p align = "center">
Figure 5. Dental data screen<br>
</p>

<p align = "center">
<img width = "282" height = "573" src="https://github.com/greadvx/tistic.co/blob/master/docs/mockups/tistic-co_Dental_data-2.png?raw=true">
</p>

<p align = "center">
Figure 6. Dental data screen (continuation)<br>
</p>

### 2.3\. User Characteristics <a name="2.3"></a>
#### 2.3.1\. User Classes <a name="2.3.1"></a>
| User class | Description |
|:---|:---|
| Registered users | Users who are logged in iOS system using their Apple ID, have access to full functionality of the application|
| Anonymous users | Users who are not logged in iOS system. Don't have access to the functionality of the application|

#### 2.3.2\. Application Audience <a name="2.3.2"></a>
People of middle age category with a basic and higher education level, who have minimal technical literacy.
### 2.4\. Assumptions and Dependencies <a name="2.4"></a>
1. The application requires authorization in iOS system;
2. The application requires access rights to health information in the system;
3. The application will work without network conntection.

## 3\. System Requirements <a name="3"></a>
### 3.1\. Functional Requirements <a name="3.1"></a>

#### 3.1.1\. Basic functionality <a name="3.1.1"></a>

##### 3.1.1.1\. User logon to the application <a name="3.1.1.1"></a>
<b>Description: </b> The user has the opportunity to use the application without creating his / her own profile by logging into his / her account in the iOS system.

Function | Requirements
| :--- | :--- 
User logon | The application should allow the user to log in by receiving information from the iOS system

##### 3.1.1.2\. Access to medical data <a name="3.1.1.2"></a>
<b>Description: </b> The user has the opportunity to allow / deny application access for collecting medical data from iOS system.

Function | Requirements
| :--- | :---
Access to medical data | The application should allow the user to authorize / prohibit collecting medical information from the iOS system

##### 3.1.1.3\. Adding medical information <a name="3.1.1.3"></a>
<b>Description: </b> The user has the opportunity to add medical information in the application.

Function | Requirements
| :--- | :---
Adding medical information | The application should allow the user to authorize / prohibit collecting medical information from the iOS system

##### 3.1.1.4\. Deleting medical information <a name="3.1.1.4"></a>
<b>Description: </b> The user has the opportunity to delete inputed medical information in the application.

Function | Requirements
| :--- | :---
Deleting medical information | The application should allow the user to delete inputed medical information 

##### 3.1.1.5\. Editing basic medical information <a name="3.1.1.5"></a>
<b>Description: </b> The user has the opportunity to edit basic medical data in the iOS system.

Function | Requirements
| :--- | :---
Editing basic medical information | The application should allow the user to edit medical information in the iOS system

#### 3.1.2\. Limitations and Exceptions <a name="3.1.2"></a>
1. Application works without network connection;
2. Editing basic medical data is provided by opening iOS system application Health.

### 3.2\. Non-Functional Requierements <a name = "3.2"></a>
#### 3.2.1\. Software Quality Attributes <a name = "3.2.1"></a>
##### 3.2.1.1 Usability <a name = "3.2.1.1"></a>
1. All elements must be in bright colors;
2. All functional elements of the user interface have names describing the action that the element does.

##### 3.2.1.2 Security<a name = "3.2.1.2"></a>
Application allow to interrupt with medical information after authorization in iOS system using Apple ID.

#### 3.2.2\. External Interfaces <a name = "3.2.2"></a>
Application screens should be convenient for use by users with poor eyesight:

- font size not less than 12 pt;
- functional elements are contrast to the screen background.

#### 3.2.3\. Constraints<a name = "3.2.3"></a>
1. Application is created for iOS 12 system<br>


