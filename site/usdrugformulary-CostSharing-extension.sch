<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile Extension
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Extension</sch:title>
    <sch:rule context="f:Extension">
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-PharmacyType-extension']) &gt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-PharmacyType-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-PharmacyType-extension']) &lt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-PharmacyType-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-CopayAmount-extension']) &gt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-CopayAmount-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-CopayAmount-extension']) &lt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-CopayAmount-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-CopayOption-extension']) &gt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-CopayOption-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-CopayOption-extension']) &lt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-CopayOption-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-CoInsuranceRate-extension']) &gt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-CoInsuranceRate-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-CoInsuranceRate-extension']) &lt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-CoInsuranceRate-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-CoinsuranceOption-extension']) &lt;= 1">extension with URL = 'https://api-v8-r4.hspconsortium.org/DrugFormulary1/open/StructureDefinition/usdrugformulary-CoinsuranceOption-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Extension</sch:title>
    <sch:rule context="f:Extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
