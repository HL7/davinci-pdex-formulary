Instance: InsurancePlan-lastupdated
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #_lastUpdated
* name = "USDFInsurancePlanLastUpdated"
* description = "Accesses the last updated date of an InsurancePlan"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/InsurancePlan-lastupdated"
* base[0] = #InsurancePlan

* type = #date

* expression = "InsurancePlan.meta.lastUpdated"

* multipleOr = true
* multipleAnd = true


Instance: InsurancePlan-identifier
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #identifier
* name = "USDFInsurancePlanLastUpdated"
* description = "Accesses the business identifier of an InsurancePlan"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/InsurancePlan-identifier"
* base[0] = #InsurancePlan

* type = #token

* expression = "InsurancePlan.identifier"

* multipleOr = true
* multipleAnd = true


Instance: InsurancePlan-status
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #status
* name = "USDFInsurancePlanStatus"
* description = "Accesses the status of an InsurancePlan"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/InsurancePlan-status"
* base[0] = #InsurancePlan

* type = #token

* expression = "InsurancePlan.status"

* multipleOr = true
* multipleAnd = true



Instance: InsurancePlan-period
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #period
* name = "USDFInsurancePlanPeriod"
* description = "Accesses the active period of an InsurancePlan"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/InsurancePlan-period"
* base[0] = #InsurancePlan

* type = #date

* expression = "InsurancePlan.period"

* comparator[+] = #eq
* comparator[+] = #lt
* comparator[+] = #le
* comparator[+] = #gt
* comparator[+] = #ge
* comparator[+] = #sa
* comparator[+] = #eb
* multipleOr = true
* multipleAnd = true


Instance: InsurancePlan-type
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #type
* name = "USDFInsurancePlanType"
* description = "Accesses the Type of an InsurancePlan"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/InsurancePlan-type"
* base[0] = #InsurancePlan

* type = #token

* expression = "InsurancePlan.type"

* multipleOr = true
* multipleAnd = true


Instance: InsurancePlan-name
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #name
* name = "USDFInsurancePlanName"
* description = "Accesses the name of an InsurancePlan"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/InsurancePlan-name"
* base[0] = #InsurancePlan

* type = #string

* expression = "InsurancePlan.name"

* modifier[+] = #contains
* multipleOr = true
* multipleAnd = true


Instance: InsurancePlan-coverage-type
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #coverage-type
* name = "USDFInsurancePlanCoverageType"
* description = "Accesses the coverage type of an InsurancePlan"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/InsurancePlan-coverage-type"
* base[0] = #InsurancePlan

* type = #token

* expression = "InsurancePlan.coverage.type"

* multipleOr = true
* multipleAnd = true


Instance: InsurancePlan-formulary-coverage
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #formulary-coverage
* name = "USDFInsurancePlanFormularyCoverage"
* description = "Accesses the Coverage Formulary Reference of an InsurancePlan"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/InsurancePlan-formulary-coverage"
* base[0] = #InsurancePlan

* type = #reference

* expression = "InsurancePlan.coverage.extension.where(url='http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyReference-extension').value"
* target[+] = #InsurancePlan

* multipleOr = true
* multipleAnd = true



Instance: InsurancePlan-coverage-area
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #coverage-area
* name = "USDFInsurancePlanCoverageArea"
* description = "Search InsurancePlan by coverage location."
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/InsurancePlan-coverage-area"
* base[0] = #InsurancePlan

* type = #reference

* expression = "InsurancePlan.coverageArea"
* target[+] = #Location

* multipleOr = true
* multipleAnd = true




Instance: Basic-lastupdated
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #_lastUpdated
* name = "USDFBasicLastUpdated"
* description = "Accesses the last updated date of a FormularyItem"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/Basic-lastupdated"
* base[0] = #Basic

* type = #date

* expression = "Basic.meta.lastUpdated"

* multipleOr = true
* multipleAnd = true



Instance: Basic-code
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #code
* name = "USDFBasicCode"
* description = "Accesses the Code of a Basis resource to find a FormularyItem"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/Basic-code"
* base[0] = #Basic

* type = #token

* expression = "Basic.code"

* multipleOr = true
* multipleAnd = true


Instance: Basic-subject
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #code
* name = "USDFBasicCode"
* description = "Accesses the subject FormularyDrug (MedicationKnowledge) reference of a FormularyItem"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/Basic-subject"
* base[0] = #Basic

* type = #reference

* expression = "Basic.subject"

* multipleOr = true
* multipleAnd = true


Instance: Basic-status
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #status
* name = "USDFBasicStatus"
* description = "Accesses the status of a FormularyItem"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/Basic-status"
* base[0] = #Basic

* type = #token

* expression = "Basic.extension.where(url='http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-AvailabilityStatus-extension').value"

* multipleOr = true
* multipleAnd = true






Instance: Basic-period
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #period
* name = "USDFBasicPeriod"
* description = "Accesses the active period of a FormularyItem"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/Basic-period"
* base[0] = #Basic

* type = #date

* expression = "Basic.extension.where(url='http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-AvailabilityPeriod-extension').value"

* comparator[+] = #eq
* comparator[+] = #lt
* comparator[+] = #le
* comparator[+] = #gt
* comparator[+] = #ge
* comparator[+] = #sa
* comparator[+] = #eb
* multipleOr = true
* multipleAnd = true



Instance: Basic-formulary
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #formulary
* name = "USDFBasicFormulary"
* description = "Accesses the formulary reference of a FormularyItem"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/Basic-formulary"
* base[0] = #Basic

* type = #reference

* expression = "Basic.extension.where(url='http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyReference-extension').value"
* target[+] = #InsurancePlan

* multipleOr = true
* multipleAnd = true




Instance: Basic-pharmacy-type
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #pharmacy-type
* name = "USDFBasicPharmacyType"
* description = "Accesses the Pharmacy Network Type of a FormularyItem"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/Basic-pharmacy-type"
* base[0] = #Basic

* type = #token

* expression = "Basic.extension.where(url='http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-PharmacyType-extension').value"

* multipleOr = true
* multipleAnd = true



Instance: Basic-drug-tier
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #drug-tier
* name = "USDFBasicDrugTier"
* description = "Accesses the Drug Tier of a FormularyItem"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/Basic-drug-tier"
* base[0] = #Basic

* type = #token

* expression = "Basic.extension.where(url='http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-DrugTierID-extension').value"

* multipleOr = true
* multipleAnd = true






Instance: MedicationKnowledge-lastupdated
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #_lastUpdated
* name = "USDFMedicationKnowledgeLastUpdated"
* description = "Accesses the last updated date of a FormularyItem"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/MedicationKnowledge-lastupdated"
* base[0] = #MedicationKnowledge

* type = #date

* expression = "MedicationKnowledge.meta.lastUpdated"

* multipleOr = true
* multipleAnd = true


Instance: MedicationKnowledge-status
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #status
* name = "USDFMedicationKnowledgeStatus"
* description = "Accesses the status of a FormularyDrug"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/MedicationKnowledge-status"
* base[0] = #MedicationKnowledge

* type = #token

* expression = "MedicationKnowledge.status"

* multipleOr = true
* multipleAnd = true


Instance: MedicationKnowledge-code
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #code
* name = "USDFMedicationKnowledgeCode"
* description = "Accesses the status of a FormularyDrug"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/MedicationKnowledge-code"
* base[0] = #MedicationKnowledge

* type = #token

* expression = "MedicationKnowledge.code"

* multipleOr = true
* multipleAnd = true



Instance: MedicationKnowledge-drug-name
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #drug-name
* name = "USDFMedicationKnowledgeDrugName"
* description = "Accesses the Drug Name of a FormularyDrug"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/MedicationKnowledge-drug-name"
* base[0] = #MedicationKnowledge

* type = #string

* expression = "MedicationKnowledge.code.coding.display | synonym"

* comparator[0] = #eq

* multipleOr = true
* multipleAnd = true

* modifier[+] = #missing
* modifier[+] = #exact
* modifier[+] = #contains



Instance: MedicationKnowledge-doseform
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #doseform
* name = "USDFMedicationKnowledgeCode"
* description = "Accesses the dose form of a FormularyDrug"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/MedicationKnowledge-doseform"
* base[0] = #MedicationKnowledge

* type = #token

* expression = "MedicationKnowledge.doseForm"

* multipleOr = true
* multipleAnd = true