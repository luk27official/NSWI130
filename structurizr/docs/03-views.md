## Views

### Overview

Views are a way of visualising the software architecture model. They are used to show the structure of the software architecture model, and to show how the various elements are related to each other. Views are typically used to communicate the software architecture model to stakeholders, and to help them understand the software architecture model.

### System Context

The system context view shows the software system and the immediate environment in which it exists. It is typically used to show the relationships between the software system and other systems, people, and external systems.

The Patient Monitor Control system consists of the forementioned stakeholders. It cooperates with an external drug database and a central database of patients.

![](embed:pmc-system-context)

### Container

The container view shows the containers that make up the software system. It provides a bit more detailed view of the software system decomposition.

![](embed:pmc-system-container)

### Server components

Some of the containers are simply too complex to be understood directly as containers. In that case, we can decompose them further more into components, and show the components in a component view. 

In our case, we will show the details of the PMC server.  

![](embed:pmc-server-component)

### Dynamic diagram - request example

The dynamic diagram shows the sequence of interactions inside the software system. 

In our case, we want to show the sequence of interactions when a nurse wants to see the current state of a patient.
The whole sequence is shown in the following diagrams (one is for the container level, the second one is for the component level).

![](embed:Nurse_Get_Patient_Data_Container_Dynamic_View)

![](embed:Nurse_Get_Patient_Data_Component_Dynamic_View)

### Deployment

We also want to show the deployment of the software system.

The following diagram shows an example of a live deployment of the software system.

![](embed:pmc-live-deployment)