# Patient monitor control (PMC)

To see more details about the architecture, please run Structurizr and see the documentation.

## Purpose

The purpose of PMC (patient monitor control) module is to keep information about every patient which is present in the hospital, to get an effective view of the patient's current health state from all the machines, prescribed medication (including dosages) and a camera capturing the patient to be sure that he is doing okay, to efficiently use medical personal where it´s needed and to quickly react when emergency happens.

## Stakeholders
In this module we have the following stakeholders:
  - **Patients**
To be taken care of, bigger trust in doctor´s work (medication won´t mix up, someone is always watching if emergency occurs).
  - **Doctors** 
To prescribe medication for patients, to monitor changes in patient state and possibly discover underlying problems.
  - **Management**
To make sure everyone does their work, creating safer environment to maintain patients and good name.
  - **Medical staff**
To take care of patients and potentially react to critical state of patients, to avoid constant running from one room to another pointlessly, better vision of patient´s history to avoid unnecessary/dangerous combinations of treatment.
  - **Technical staff**
To take care of all devices.
  - **IT developers**
To create an architecture and to make sure everything works properly. They also secure integration with other hospital systems.

There is some technical stuff to be dealt with as well:
  - all of the electronical devices monitoring the state (ECG, ...)
  - medication + dosages
  - current room status
  - camera pointed to the patient's bed