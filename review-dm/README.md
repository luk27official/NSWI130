DISCLAIMER: This folder is NOT a part of a PMC system. It contains review documentation for the Drug Monitoring system.

# Drug Monitoring review
Link to the repository: https://gitlab.mff.cuni.cz/duongx/architektura2022

1. modifiability QA
   - Stimulus: We want to change the `User Activity Records` database with minimal changes to other containers (and with minimal costs).
   - Source of stimulus: Database administrator.
   - Artifact: The database.
   - Environment: Design time/runtime.
   - Response: Make, test and deploy the changes.
   - Measure: We created two databases for both of the servers which will be deployed independently.

2. scalability QA
   - Stimulus: Too many suppliers want to access the storage server.
   - Source of stimulus: Supplier.
   - Artifact: Storage server.
   - Environment: Design time/runtime.
   - Response: Make, test and deploy the changes.
   - Measure: We added a load balancer and more instances of the servers to the deployment.

3. perfomance QA
   - Stimulus: User requests to view a drug's history through the mobile application
   - Source of stimulus: Monitoring Mobile Application
   - Artifact: Show Drug History component
   - Environment: Drug Monitoring Server
   - Response: The history of the drug is displayed to the user in a timely manner
   - Measure: Time it takes for the history to be displayed to the user

4. modularity QA
   - Stimulus: A new hospital wants to use the Drug Monitoring System.
   - Source of stimulus: Drug Monitoring System.
   - Artifact: Drug Monitoring System.
   - Environment: New hospital's IT infrastructure.
   - Response: The Drug Monitoring System can be easily integrated into the new hospital's IT infrastructure without affecting the functionality of the system.
   - Measure: The number of modifications needed to be made to the system in order to integrate it into the new hospital's IT infrastructure.
   
5. cohesion QA (TODO ověřit korektnost)
   - Stimulus: A user wants to view the list of drug orders through the storage mobile application.
   - Source of stimulus: Storage Mobile Application.
   - Artifact: Drug Show Order List component.
   - Environment: Storage Server.
   - Response: The list of drug orders is displayed to the user in a timely manner and only relevant information is passed between the Storage Mobile Application and the Drug Show Order List component.
   - Measure: The amount of unnecessary information that is passed between the Storage Mobile Application and the Drug Show Order List component.

6. reusability QA
   - Stimulus: A new hospital wants to use the Drug Monitoring System and also wants to track the maintenance of medical equipment.
   - Source of stimulus: Drug Monitoring System.
   - Artifact: Drug Monitoring System.
   - Environment: New hospital's IT infrastructure.
   - Response: The Drug Monitoring System can be easily modified and extended to track the maintenance of medical equipment without affecting the functionality of the system's original purpose.
   - Measure: The amount of modification needed to be made to the system in order to add the feature of tracking the maintenance of medical equipment.

## Notes:

- Kvalitativní atribut performance zkoumá schopnost systému nebo komponenty v systému zpracovávat požadavky za stanoveného časového nebo objemového limitu. Může se týkat rychlosti zpracování požadavků, kapacity systému zpracovat určitý počet požadavků za jednotku času, nebo schopnosti systému zpracovávat velké objemy dat bez zpomalení nebo selhání. Měřítkem pro hodnocení performance může být například průměrná doba odezvy systému nebo maximální zatížitelnost systému.
- Kvalitativní atribut scalability zkoumá schopnost systému nebo komponenty v systému zvýšit nebo snížit jeho výkon v závislosti na změně požadavků. Může se týkat schopnosti systému rozšířit kapacitu zpracování požadavků nebo objemu dat v případě nárůstu požadavků, nebo naopak snížit kapacitu v případě snížení požadavků. Scalability může být vertikální, kdy se změna kapacity dosahuje změnou výkonu jednotlivých komponent, nebo horizontální, kdy se změna kapacity dosahuje přidáním nebo odebráním komponent ze systému. Měřítkem pro hodnocení scalability může být například rychlost reakce systému na změnu požadavků nebo míra úsilí potřebná k dosáhnutí požadované kapacity.
