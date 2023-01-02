DISCLAIMER: This folder is NOT a part of a PMC system. It contains review documentation for the Drug Monitoring system.

# Drug Monitoring review
Link to the repository: https://gitlab.mff.cuni.cz/duongx/architektura2022

Verdict levels:
   - Completed
   - Partially completed
   - Not completed

1. modifiability QA
   - Stimulus: We want to change the `User Activity Records` database with minimal changes to other containers (and with minimal costs).
   - Source of stimulus: Database administrator.
   - Artifact: The database.
   - Environment: Design time/runtime.
   - Response: Make, test and deploy the changes.
   - Measure: We created two databases for both of the servers which will be deployed independently.
   - Verdict:

2. scalability QA
   - Stimulus: Too many suppliers want to access the storage server.
   - Source of stimulus: Supplier.
   - Artifact: Storage server.
   - Environment: Design time/runtime.
   - Response: Make, test and deploy the changes.
   - Measure: We added a load balancer and more instances of the servers to the deployment.
   - Verdict:

3. perfomance QA
   - Stimulus: User requests to view a drug's history through the mobile application
   - Source of stimulus: Monitoring Mobile Application
   - Artifact: Show Drug History component
   - Environment: Drug Monitoring Server
   - Response: The history of the drug is displayed to the user in a timely manner
   - Measure: Time it takes for the history to be displayed to the user
   - Verdict:

4. modularity QA
   - Stimulus: A new hospital wants to use the Drug Monitoring System.
   - Source of stimulus: Drug Monitoring System.
   - Artifact: Drug Monitoring System.
   - Environment: New hospital's IT infrastructure.
   - Response: The Drug Monitoring System can be easily integrated into the new hospital's IT infrastructure without affecting the functionality of the system.
   - Measure: The number of modifications needed to be made to the system in order to integrate it into the new hospital's IT infrastructure.
   - Verdict:

5. cohesion QA (TODO ověřit korektnost)
   - Stimulus: A user wants to view the list of drug orders through the storage mobile application.
   - Source of stimulus: Storage Mobile Application.
   - Artifact: Drug Show Order List component.
   - Environment: Storage Server.
   - Response: The list of drug orders is displayed to the user in a timely manner and only relevant information is passed between the Storage Mobile Application and the Drug Show Order List component.
   - Measure: The amount of unnecessary information that is passed between the Storage Mobile Application and the Drug Show Order List component.
   - Verdict:

6. reusability QA
   - Stimulus: A new hospital wants to use the Drug Monitoring System and also wants to track the maintenance of medical equipment.
   - Source of stimulus: Drug Monitoring System.
   - Artifact: Drug Monitoring System.
   - Environment: New hospital's IT infrastructure.
   - Response: The Drug Monitoring System can be easily modified and extended to track the maintenance of medical equipment without affecting the functionality of the system's original purpose.
   - Measure: The amount of modification needed to be made to the system in order to add the feature of tracking the maintenance of medical equipment.
   - Verdict:
   
7. Performance QA
   - Stimulus: number of doctors giving drugs to patients
   - Source of stimulus: different doctors across hospital
   - Artifact: drug monitoring application
   - Environment : busy hour
   - Response: verify user credentials and change number of drugs available as fast as possible
   - Measure: 1 minute
   - Result : user was authorized and drug database access abstraction divided requests into distributed database to make it faster
   
8. Security QA
   - Stimulus: failed attempt to get number of drugs from database
   - Source of stimulus: hospital database of drugs
   - Artifact: database of some department
   - Environment: runtime
   - Response: restore database 
   - Measure: 1 minute
   - result : we dont have any backups so it might take way longer to find problem and restore it
   - proposal : add backup database (at least for most frequently used drugs) and synchronization with main one

9. Performance QA
   - Stimulus: A huge number of Suppliers (1000) wants to write (supply) new drugs at the same time.
   - Source of Stimulus: Department Supplier.
   - Artifact: Security Gate.
   - Environment: Under busy conditions.
   - Measure: Number of requests processed.
   - Response: Paralelistic approach for proccessing requests and updating databases.
   - Verdict: Not completed
   
10. Security QA
   - Stimulus: User sends an invalid request to "add/remove drugs" or "create activity record" to update "Drug Order List Database".
   - Source of Stimulus: Known - Department Supplier.
   - Artifact: Updating Storage Database.
   - Environment: Internal network.
   - Measure: Number of interrupted requests.
   - Response: Invalid request to *change storage database* is detected and access is denied with a warning message.
   - Verdict: Not completed

## Notes:

- Kvalitativní atribut performance zkoumá schopnost systému nebo komponenty v systému zpracovávat požadavky za stanoveného časového nebo objemového limitu. Může se týkat rychlosti zpracování požadavků, kapacity systému zpracovat určitý počet požadavků za jednotku času, nebo schopnosti systému zpracovávat velké objemy dat bez zpomalení nebo selhání. Měřítkem pro hodnocení performance může být například průměrná doba odezvy systému nebo maximální zatížitelnost systému.
- Kvalitativní atribut scalability zkoumá schopnost systému nebo komponenty v systému zvýšit nebo snížit jeho výkon v závislosti na změně požadavků. Může se týkat schopnosti systému rozšířit kapacitu zpracování požadavků nebo objemu dat v případě nárůstu požadavků, nebo naopak snížit kapacitu v případě snížení požadavků. Scalability může být vertikální, kdy se změna kapacity dosahuje změnou výkonu jednotlivých komponent, nebo horizontální, kdy se změna kapacity dosahuje přidáním nebo odebráním komponent ze systému. Měřítkem pro hodnocení scalability může být například rychlost reakce systému na změnu požadavků nebo míra úsilí potřebná k dosáhnutí požadované kapacity.
