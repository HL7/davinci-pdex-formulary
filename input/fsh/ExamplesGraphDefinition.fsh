Instance:        PayerInsurancePlanGraphDefinition
InstanceOf:      PayerInsurancePlanBulkDataGraphDefinition
Description:     "A GraphDefinition of PayerInsurancePlan."
Usage: #example
/*
* extension[+].url = $WG
* extension[=].valueCode = #phx
* version = "2.1.0"
* status = #active

* publisher = "HL7 International / Pharmacy"
* contact[+].name = "HL7 International / Pharmacy"
* contact[=].telecom[+].system = #url
* contact[=].telecom[=].value = "http://www.hl7.org/Special/committees/medication"
* contact[=].telecom[+].system = #email
* contact[=].telecom[=].value = "pharmacy@lists.HL7.org"
* jurisdiction[+].coding.system = "urn:iso:std:iso:3166"
* jurisdiction[=].coding.code = #US
*/

* start = #InsurancePlan
* profile = Canonical(PayerInsurancePlan)


* link[location].path = "InsurancePlan.coverageArea"
* link[location].target.type = #Location
* link[location].target.profile = Canonical(InsurancePlanLocation)


* link[formulary].path = "InsurancePlan.coverage.extension.where(url=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyReference-extension).valueReference"
* link[formulary].target.type = #InsurancePlan
* link[formulary].target.profile = Canonical(Formulary)

* link[formulary].target.link.target.type = #Basic
* link[formulary].target.link.target.profile = Canonical(FormularyItem)
* link[formulary].target.link.target.params = "formulary={ref}"

* link[formulary].target.link.target.link.path = "Basic.subject"
* link[formulary].target.link.target.link.target.type = #MedicationKnowledge
* link[formulary].target.link.target.link.target.profile = Canonical(FormularyDrug)

Instance:        FormularyGraphDefinition
InstanceOf:      FormularyBulkDataGraphDefinition
Description:     "A GraphDefinition of Formulary."
Usage: #example

/*
* extension[+].url = $WG
* extension[=].valueCode = #phx
* version = "2.1.0"
* status = #active

* publisher = "HL7 International / Pharmacy"
* contact[+].name = "HL7 International / Pharmacy"
* contact[=].telecom[+].system = #url
* contact[=].telecom[=].value = "http://www.hl7.org/Special/committees/medication"
* contact[=].telecom[+].system = #email
* contact[=].telecom[=].value = "pharmacy@lists.HL7.org"
* jurisdiction[+].coding.system = "urn:iso:std:iso:3166"
* jurisdiction[=].coding.code = #US
*/
* start = #InsurancePlan
* profile = Canonical(Formulary)

* link.target.type = #Basic
* link.target.profile = Canonical(FormularyItem)
* link.target.params = "formulary={ref}"

* link.target.link.path = "Basic.subject"
* link.target.link.target.type = #MedicationKnowledge
* link.target.link.target.profile = Canonical(FormularyDrug)
