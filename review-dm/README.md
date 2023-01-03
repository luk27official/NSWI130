# Drug Monitoring review
Link to the repository: https://gitlab.mff.cuni.cz/duongx/architektura2022

## Reminder
### 1 System purpose
   - Automatizace správy léků v nemocnici
   - Uchování veškerých informací o léčivech v nemocnici
        - Kde se nacházejí
        - Množství
        - Stav
        - … 
   - Automatizované zásobování léků jednotlivých oddělení
   - Poloautomatické objednávání léků pro nemocniční sklad
   - Celkové zjednodušení a urychlení práce nemocničního personálu
### 2 Stakeholders
   - Vedení nemocnice 
   - Zdravotní personál
   - Skladník a zásobovací personál
   - Vývojáři a správci 
   - Interní zásobování

   ![alt text](https://github.com/luk27official/NSWI130/blob/ae69816967164d31e3e220759b168c1beff4f902/review-dm/img/structurizr-System_context.png)&nbsp;&nbsp;&nbsp;&nbsp;

## Qualitative attributes
1. **Reusability QA** (v)
   - **Stimulus**: A new hospital wants to use the Drug Monitoring System and also wants to track the maintenance of medical equipment.
   - **Source of stimulus**: External administators. (Drug Monitoring System)
   - **Artifact**: Drug Monitoring System.
   - **Environment**: New hospital's IT infrastructure.
   - **Response**: The Drug Monitoring System can be easily modified and extended to track the maintenance of medical equipment without affecting the functionality of the system's original purpose.
   - **Measure**: The amount of modification needed to be made to the system in order to add the feature of tracking the maintenance of medical equipment.
   - **Verdict**: Completed

2. **Performance QA** (m)
   - **Stimulus**: A huge number of Suppliers (1000) wants to write (supply) new drugs at the same time.
   - **Source of Stimulus**: Department Supplier.
   - **Artifact**: Security Gate.
   - **Environment**: Under busy conditions.
   - **Measure**: Number of requests processed.
   - **Response**: Paralelistic approach for proccessing requests and updating databases.
   - **Verdict**: Not completed  

   ![Deliver Requested Drug](/review-dm/img/deliver-requested-drug.svg)&nbsp;&nbsp;&nbsp;&nbsp;

3. **Modularity QA** (v)
   - **Stimulus**: A new hospital wants to use the Drug Monitoring System.
   - **Source of stimulus**: Drug Monitoring System.
   - **Artifact**: Drug Monitoring System.
   - **Environment**: New hospital's IT infrastructure.
   - **Response**: The Drug Monitoring System can be easily integrated into the new hospital's IT infrastructure without affecting the functionality of the system.
   - **Measure**: The number of modifications needed to be made to the system in order to integrate it into the new hospital's IT infrastructure.
   - **Verdict**: Completed.   

4. **Security QA** (m)
   - **Stimulus**: User sends an invalid request to "add/remove drugs" or "create activity record" to update "Drug Order List Database".
   - **Source of Stimulus**: Known - Department Supplier.
   - **Artifact**: Updating Storage Database.
   - **Environment**: Internal network.
   - **Measure**: Number of interrupted requests.
   - **Response**: Invalid request to *change storage database* is detected and access is denied with a warning message.
   - **Verdict**: Not completed   

   ![Storage Server](/review-dm/img/storage-server.svg)&nbsp;&nbsp;&nbsp;&nbsp;

5. **Modifiability QA** (v)
   - **Stimulus**: We want to change the User Activity Records database with minimal changes to other containers (and with minimal costs).
   - **Source of stimulus**: Database administrator.
   - **Artifact**: The database.
   - **Environment**: Design time/runtime.
   - **Response**: Make, test and deploy the changes.
   - **Measure**: Create database for both of the servers which will be deployed independently.
   - **Verdict**: Not completed.

   ![alt text](https://github.com/luk27official/NSWI130/blob/ffb202fa28f59e925f1358c39c3ea8c9af7f3a90/review-dm/img/structurizr-Deployment-Before.png)&nbsp;&nbsp;&nbsp;&nbsp;

    ![alt text](https://github.com/luk27official/NSWI130/blob/ffb202fa28f59e925f1358c39c3ea8c9af7f3a90/review-dm/img/structurizr-Deployment-After.png)&nbsp;&nbsp;&nbsp;&nbsp;

6. **Scalability QA** (m)
   - **Stimulus**: Too many suppliers want to access the storage server.
   - **Source of stimulus**: Supplier.
   - **Artifact**: Storage server.
   - **Environment**: Design time/runtime.
   - **Response**: Make, test and deploy the changes.
   - **Measure**: We added a load balancer and more instances of the servers to the deployment.
   - **Verdict**: Partially completed.

7. **Cohesion QA** (v)
   - **Stimulus**: A user wants to view the list of drug orders through the storage mobile application.
   - **Source of stimulus**: Storage Mobile Application.
   - **Artifact**: Drug Show Order List component.
   - **Environment**: Storage Server.
   - **Response**: The list of drug orders is displayed to the user in a timely manner and only relevant information is passed between the Storage Mobile Application and the Drug Show Order List component.
   - **Measure**: The amount of unnecessary information that is passed between the Storage Mobile Application and the Drug Show Order List component.
   - **Verdict**: Completed
   
8. **Performance QA** (m)
   - **Stimulus**: number of doctors giving drugs to patients
   - **Source of stimulus**: different doctors across hospital
   - **Artifact**: drug monitoring application
   - **Environment**: busy hour
   - **Response**: verify user credentials and change number of drugs available as fast as possible
   - **Measure**: 1 minute
   - **Result**: user was authorized and drug database access abstraction divided requests into distributed database to make it faster
   - **Verdict**: Completed   

   ![DMS](/review-dm/img/server.svg)&nbsp;&nbsp;&nbsp;&nbsp;

9. **Perfomance QA** (v)
   - **Stimulus**: User requests to view a drug's history through the mobile application.
   - **Source of stimulus**: Monitoring Mobile Application.
   - **Artifact**: Show Drug History component.
   - **Environment**: Drug Monitoring Server.
   - **Response**: The history of the drug is displayed to the user in a timely manner.
   - **Measure**: Time it takes for the history to be displayed to the user.
   - **Verdict**: Completed.

10. **Availability QA** (m)
    - **Stimulus**: failed attempt to get number of drugs from database
    - **Source of stimulus**: hospital database of drugs
    - **Artifact**: database of some department
    - **Environment**: runtime
    - **Response**: restore database 
    - **Measure**: 1 minute
    - **Result**: we dont have any backups so it might take way longer to find problem and restore it
    - **Proposal**: add backup database (at least for most frequently used drugs) and synchronization with main one
    - **Verdict**: Not completed
