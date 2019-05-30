<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile MedicationKnowledge
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:MedicationKnowledge</sch:title>
    <sch:rule context="f:MedicationKnowledge">
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-PriorAuthorization-extension']) &lt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-PriorAuthorization-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-StepTherapyLimit-extension']) &lt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-StepTherapyLimit-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-QuantityLimit-extension']) &lt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-QuantityLimit-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-DrugTierID-extension']) &gt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-DrugTierID-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-DrugTierID-extension']) &lt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-DrugTierID-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge</sch:title>
    <sch:rule context="f:MedicationKnowledge">
      <sch:assert test="not(parent::f:contained and f:contained)">If the resource is contained in another resource, it SHALL NOT contain nested Resources</sch:assert>
      <sch:assert test="not(exists(f:contained/*/f:meta/f:versionId)) and not(exists(f:contained/*/f:meta/f:lastUpdated))">If a resource is contained in another resource, it SHALL NOT have a meta.versionId or a meta.lastUpdated</sch:assert>
      <sch:assert test="not(exists(for $contained in f:contained return $contained[not(parent::*/descendant::f:reference/@value=concat('#', $contained/*/id/@value) or descendant::f:reference[@value='#'])]))">If the resource is contained in another resource, it SHALL be referred to from elsewhere in the resource or SHALL refer to the containing resource</sch:assert>
      <sch:assert test="exists(f:text/h:div)">A resource should have narrative for robust management</sch:assert>
      <sch:assert test="not(exists(f:contained/*/f:meta/f:security))">If a resource is contained in another resource, it SHALL NOT have a security label</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge.relatedMedicationKnowledge</sch:title>
    <sch:rule context="f:MedicationKnowledge/f:relatedMedicationKnowledge">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge.monograph</sch:title>
    <sch:rule context="f:MedicationKnowledge/f:monograph">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge.ingredient</sch:title>
    <sch:rule context="f:MedicationKnowledge/f:ingredient">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge.cost</sch:title>
    <sch:rule context="f:MedicationKnowledge/f:cost">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge.monitoringProgram</sch:title>
    <sch:rule context="f:MedicationKnowledge/f:monitoringProgram">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge.administrationGuidelines</sch:title>
    <sch:rule context="f:MedicationKnowledge/f:administrationGuidelines">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge.administrationGuidelines.dosage</sch:title>
    <sch:rule context="f:MedicationKnowledge/f:administrationGuidelines/f:dosage">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge.administrationGuidelines.patientCharacteristics</sch:title>
    <sch:rule context="f:MedicationKnowledge/f:administrationGuidelines/f:patientCharacteristics">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge.medicineClassification</sch:title>
    <sch:rule context="f:MedicationKnowledge/f:medicineClassification">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge.packaging</sch:title>
    <sch:rule context="f:MedicationKnowledge/f:packaging">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge.drugCharacteristic</sch:title>
    <sch:rule context="f:MedicationKnowledge/f:drugCharacteristic">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge.regulatory</sch:title>
    <sch:rule context="f:MedicationKnowledge/f:regulatory">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge.regulatory.substitution</sch:title>
    <sch:rule context="f:MedicationKnowledge/f:regulatory/f:substitution">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge.regulatory.schedule</sch:title>
    <sch:rule context="f:MedicationKnowledge/f:regulatory/f:schedule">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge.regulatory.maxDispense</sch:title>
    <sch:rule context="f:MedicationKnowledge/f:regulatory/f:maxDispense">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>MedicationKnowledge.kinetics</sch:title>
    <sch:rule context="f:MedicationKnowledge/f:kinetics">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
