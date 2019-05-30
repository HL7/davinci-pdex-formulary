<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile List
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:List</sch:title>
    <sch:rule context="f:List">
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-PlanID-extension']) &gt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-PlanID-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-PlanID-extension']) &lt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-PlanID-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-DrugTierDefinition-extension']) &gt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-DrugTierDefinition-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-Network-extension']) &gt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-Network-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-FormularyURL-extension']) &lt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-FormularyURL-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-EmailPlanContact-extension']) &lt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-EmailPlanContact-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-MarketingURL-extension']) &lt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-MarketingURL-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-PlanIDType-extension']) &gt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-PlanIDType-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-PlanIDType-extension']) &lt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-PlanIDType-extension': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>List</sch:title>
    <sch:rule context="f:List">
      <sch:assert test="not(parent::f:contained and f:contained)">If the resource is contained in another resource, it SHALL NOT contain nested Resources</sch:assert>
      <sch:assert test="not(exists(f:contained/*/f:meta/f:versionId)) and not(exists(f:contained/*/f:meta/f:lastUpdated))">If a resource is contained in another resource, it SHALL NOT have a meta.versionId or a meta.lastUpdated</sch:assert>
      <sch:assert test="not(exists(for $contained in f:contained return $contained[not(parent::*/descendant::f:reference/@value=concat('#', $contained/*/id/@value) or descendant::f:reference[@value='#'])]))">If the resource is contained in another resource, it SHALL be referred to from elsewhere in the resource or SHALL refer to the containing resource</sch:assert>
      <sch:assert test="exists(f:text/h:div)">A resource should have narrative for robust management</sch:assert>
      <sch:assert test="not(exists(f:contained/*/f:meta/f:security))">If a resource is contained in another resource, it SHALL NOT have a security label</sch:assert>
      <sch:assert test="(f:mode/@value = 'working') or not(exists(f:entry/f:date))">An entry date can only be used if the mode of the list is &quot;working&quot;</sch:assert>
      <sch:assert test="(f:mode/@value = 'changes') or not(exists(f:entry/f:deleted))">The deleted flag can only be used if the mode of the list is &quot;changes&quot;</sch:assert>
      <sch:assert test="not(exists(f:emptyReason) and exists(f:entry))">A list can only have an emptyReason if it is empty</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>List.entry</sch:title>
    <sch:rule context="f:List/f:entry">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
