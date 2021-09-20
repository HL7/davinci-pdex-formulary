Instance: drug-plan
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #drug-plan
* name = "Drug Plan"
* description = "Accesses the Drug Plan of a FormularyItem"
* url = "http://hl7.org/fhir/us/davinci-drug-formulary/SearchParameter/drug-plan"
* base[0] = #Basic

* type = #reference

* expression = "Basic.extension.where(url='http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-DrugPlanReference-extension').value"
* target[+] = #InsurancePlan

* comparator[0] = #eq
* multipleOr = true


Instance: pharmacy-type
InstanceOf: SearchParameter
Usage: #definition

* status = #active
* code = #pharmacy-type
* name = "Pharmacy Type"
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
* name = "Drug Tier"
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
* name = "Drug Name"
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

