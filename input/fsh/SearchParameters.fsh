Instance: coverage-type
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #coverage-type
* name = "USDFCoverageType"
* description = "Accesses the Coverage Type of a PayerInsurancePlan"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/coverage-type"
* base[0] = #InsurancePlan

* type = #token

* expression = "InsurancePlan.coverage.type"
* target[+] = #InsurancePlan

* comparator[0] = #eq
* multipleOr = true



Instance: formulary
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #formulary
* name = "USDFFormulary"
* description = "Accesses the Formulary of a FormularyItem"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/formulary"
* base[0] = #Basic

* type = #reference

* expression = "Basic.extension.where(url='http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyReference-extension').value"
* target[+] = #InsurancePlan

* comparator[0] = #eq
* multipleOr = true


Instance: formulary-coverage
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #formulary-coverage
* name = "USDFFormularyCoverage"
* description = "Accesses the Coverage Formulary Reference of a PayerInsurancePlan"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/formulary-coverage"
* base[0] = #InsurancePlan

* type = #reference

* expression = "InsuancePlan.coverage.extension.where(url='http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyReference-extension').extension.where(url='FormularyReference').value"
* target[+] = #InsurancePlan

* comparator[0] = #eq
* multipleOr = true


Instance: pharmacy-type
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #pharmacy-type
* name = "USDFPharmacyType"
* description = "Accesses the Pharmacy Network Type of a FormularyItem"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/pharmacy-type"
* base[0] = #Basic

* type = #token

* expression = "Basic.extension.where(url='http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-PharmacyType-extension').value"

* comparator[0] = #eq
* multipleOr = true


Instance: drug-tier
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #drug-tier
* name = "USDFDrugTier"
* description = "Accesses the Drug Tier of a FormularyItem"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/drug-tier"
* base[0] = #Basic

* type = #token

* expression = "Basic.extension.where(url='http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-DrugTierID-extension').value"

* comparator[0] = #eq
* multipleOr = true


Instance: drug-name
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #drug-name
* name = "USDFDrugName"
* description = "Accesses the Drug Name of a FormularyDrug"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/drug-name"
* base[0] = #MedicationKnowledge

* type = #string

* expression = "MedicationKnowledge.code.coding.display | synonym"

* comparator[0] = #eq

* multipleOr = true
* multipleAnd = true

* modifier[+] = #missing
* modifier[+] = #exact
* modifier[+] = #contains

