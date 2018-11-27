# Test plan

## Content
1 [Introduction](#1)</br>
2 [Test Items](#2)</br>
3 [Risk Issues](#3)</br>
4 [Features to be tested](#4)</br>
5 [Test Approach](#5)</br>
6 [Results](#6)</br>
7 [Conclusion](#7)</br>

 
# 1 <a name = "1"> Introduction </a>
This document represent the Test Plan developed for the mobile application tistic.co.</br>
The main aim of testing – verification of the functionality and suitability of the application.

# 2 <a name = "2"> Test Items </a></br>
The application tistic.co is created for simplify everyday life of human: store medical data in iPhone. It uses HealthKit fraemwork for collection meddical information and store additional information. 

#### Quality attributes (ISO 25010):</br>
<br>1. Functional Suitability</br>

- Functional completeness;
- Functional correctness;
- Functional appropriateness.

<br>2. Usability </br>

- Operability. 
- User error protection. 
- User interface aesthetics.
- Accessibility.</br>

# 3 <a name = "3"> Risk Issues </a></br>
- User didn't use Health app in iOS system;
- Storage of iPhone is almost full (not enough space to store application data);
- Unsupported version of iOS system.

# 4 <a name = "4"> Features to be tested </a>

During testing process planned to check correctness of implementation followed main functionality:

- <b>Access to medical data </b></br>
This use case should be tested on:
	1. Total decline of HealthKit authorization
	2. Partial decline of HealthKir authorization
- <b>Adding medical information </b></br>
This use case should be tested on:
	1. Adding basic medical information
	2. Adding dental information
- <b>Deleting medical information </b></br>
	This use case should be tested on:
	1. Deleting basic medical information
	2. Deleting dental information
- <b>Editing basic medical information </b></br>
	This use case should be tested on:
	1. Editing basic medical information

It is also important to check correctness of non- functional requirements:

- Usability:
	All functional elements of the user interface have names describing the action that the element does.
- Security:
	Application allow to interract with medical information after authorization in iOS system using Apple ID.
- External interfaces:
	Application screens should be convenient for use by users with poor eyesight

# 5 <a name = "5"> Test Approach </a>
This application will be tested manually.

# 6 <a name = "6"> Pass / Fail Criteria </a>
Results of testing are represented in [this document](test_results.md)
# 7 <a name = "7"> Conclusion </a>
This test plan allows to test the main functionality of the application. Successful passing of all tests does not guarantee full operability, however, it allows to believe that this software works correctly.</br>

As Edsger W. Dijkstra said: "Program testing can be used to show the presence of bugs, but never to show their absence".

