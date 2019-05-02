---
title: 3-2 Profiles
layout: default
active: 3-2 Profiles
---

### 3-2-1 Medication Formulary

When a Health Plan provides prescription drug coverage the list of covered medications is known as a "Formulary."  

The Health Plan formulary **SHALL** be provided as a Member-accessible API using the following FHIR resources:

- [MedicationKnowledge](https://www.hl7.org/fhir/R4/medicationknowledge.html)
- [US Core Device Profile](https://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-us-core-device.html)
- [VhDir Healthcare Service](http://build.fhir.org/ig/HL7/VhDir/StructureDefinition-vhdir-healthcareservice.html)
- [US Core Medication Profile](https://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-us-core-medication.html)

#### 3-2-1-1 CapabilityStatement

The FHIR CapabilityStatement defines the resources and operations permitted on the resources exposed via the FHIR API.

The Permitted Operations for the FHIR Profiles covered in this payload section are defined as follows:

<table>
  <tr>
    <th> Resource Type </th>
    <th> Profile </th>
    <th> Read </th>
    <th> V-Read </th>
    <th> Search </th>
    <th> Update </th>
    <th> Create </th>
    <th> Updates </th>
    <th> History </th>
  </tr>
  <tr>
    <td>MedicationKnowledge</td>
    <td>https://www.hl7.org/fhir/R4/medicationknowledge.html</td>
    <td>Y</td>
    <td>Y</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td>Y</td>
  </tr> 
  <tr>
    <td>Device</td>
    <td>https://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-us-core-device.html</td>
    <td>Y</td>
    <td>Y</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td>Y</td>
  </tr>  
  <tr>
    <td>HealthcareService</td>
    <td>http://build.fhir.org/ig/HL7/VhDir/StructureDefinition-vhdir-healthcareservice.html</td>
    <td>Y</td>
    <td>Y</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td>Y</td>
  </tr>  
  <tr>
    <td>Medication</td>
    <td>https://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-us-core-medication.html</td>
    <td>Y</td>
    <td>Y</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td>Y</td>
  </tr>  
 
</table>

