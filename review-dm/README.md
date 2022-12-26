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
