Instance: PayerInsurancePlanA3001
InstanceOf: PayerInsurancePlan
Description: "Payer Insurance Plan A3001"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"
* meta.profile = Canonical(PayerInsurancePlan) 


* extension[DrugPlanReference].valueReference = Reference(InsuranceDrugPlanD3001)

* identifier.value = "A3001"
* status = #active

* type = $PlanNetInsuranceProductTypeCS#mediadv

* name = "Sample Medicare Advantage Plan A3001"
//* alias MS
* period.start = "2021-01-01"
* period.end = "2021-12-31"

* coverageArea = Reference(UnitedStatesLocation)

* contact[patient-plan-contact][+].purpose = http://terminology.hl7.org/CodeSystem/contactentity-type#PATINF
* contact[patient-plan-contact][=].telecom.system = #phone
* contact[patient-plan-contact][=].telecom.value = "+1 (888) 555-3001"

* contact[patient-plan-contact][+].purpose = http://terminology.hl7.org/CodeSystem/contactentity-type#PATINF
* contact[patient-plan-contact][=].name.text = "Sample Medicare Advantage Plan Marketing Website"
* contact[patient-plan-contact][=].telecom.system = #url
* contact[patient-plan-contact][=].telecom.value = "http://url/to/health/plan/information"


Instance: InsuranceDrugPlanD3001
InstanceOf: InsuranceDrugPlan
Description: "Insurance Drug Plan D3001"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"
* meta.profile = Canonical(InsuranceDrugPlan) 

* identifier.value = "D3001"
* status = #active

* type = $HL7v3-ActCode#DRUGPOL

* name = "Sample Medicare Advantage Part D Drug Plan D3001"
//* alias MS
* period.start = "2021-01-01"
* period.end = "2021-12-31"

* coverageArea = Reference(StateOfCTLocation)

* contact[patient-drugplan-contact][+].purpose = http://terminology.hl7.org/CodeSystem/contactentity-type#PATINF
* contact[patient-drugplan-contact][=].telecom.system = #phone
* contact[patient-drugplan-contact][=].telecom.value = "+1 (888) 555-3001"

* contact[patient-drugplan-contact][+].purpose = http://terminology.hl7.org/CodeSystem/contactentity-type#PATINF
* contact[patient-drugplan-contact][=].name.text = "Sample Medicare Advantage Drug Plan Formulary Website"
* contact[patient-drugplan-contact][=].telecom.system = #url
* contact[patient-drugplan-contact][=].telecom.value = "http://url/to/health/plan/information"

* contact[patient-drugplan-contact][+].purpose = http://terminology.hl7.org/CodeSystem/contactentity-type#PATINF
* contact[patient-drugplan-contact][=].name.text = "Sample Medicare Advantage Drug Plan Benefit Website"
* contact[patient-drugplan-contact][=].telecom.system = #url
* contact[patient-drugplan-contact][=].telecom.value = "http://url/to/health/plan/information"

* plan[+].type = PharmacyTypeCS#1-month-in-retail "1 month in network retail"

* plan[=].specificCost[0].category = DrugTierCS#generic "Generic"

// TODO need a codeSystem for plan.specificCost.benefit.type to represent prescription fill
* plan[=].specificCost[0].benefit[0].type = BenefitTypeCS#drug "DRUG"

* plan[=].specificCost[0].benefit[0].cost[copay].type = BenefitCostTypeCS#copay "Copay"
* plan[=].specificCost[0].benefit[0].cost[copay].value.value = 0
* plan[=].specificCost[0].benefit[0].cost[copay].value.unit = "$"
* plan[=].specificCost[0].benefit[0].cost[copay].value.system = "urn:iso:std:iso:4217"
* plan[=].specificCost[0].benefit[0].cost[copay].value.code = #USD
* plan[=].specificCost[0].benefit[0].cost[copay].qualifiers = CopayOptionCS#no-charge "No Charge"

* plan[=].specificCost[0].benefit[0].cost[coinsurance].type = BenefitCostTypeCS#coinsurance "Coinsurance"
* plan[=].specificCost[0].benefit[0].cost[coinsurance].value.value = 0
* plan[=].specificCost[0].benefit[0].cost[coinsurance].value.code = #%
* plan[=].specificCost[0].benefit[0].cost[coinsurance].value.system = "http://unitsofmeasure.org"
* plan[=].specificCost[0].benefit[0].cost[coinsurance].qualifiers = CoInsuranceOptionCS#after-deductible "After Deductible"


* plan[+].type = PharmacyTypeCS#1-month-out-retail "1 month out of network retail"

* plan[=].specificCost[0].category = DrugTierCS#generic "Generic"

// TODO need a codeSystem for plan.specificCost.benefit.type to represent prescription fill
* plan[=].specificCost[0].benefit[0].type = BenefitTypeCS#drug "DRUG"

* plan[=].specificCost[0].benefit[0].cost[copay].type = BenefitCostTypeCS#copay "Copay"
* plan[=].specificCost[0].benefit[0].cost[copay].value.value = 0
* plan[=].specificCost[0].benefit[0].cost[copay].value.unit = "$"
* plan[=].specificCost[0].benefit[0].cost[copay].value.system = "urn:iso:std:iso:4217"
* plan[=].specificCost[0].benefit[0].cost[copay].value.code = #USD
* plan[=].specificCost[0].benefit[0].cost[copay].qualifiers = CopayOptionCS#no-charge "No Charge"

* plan[=].specificCost[0].benefit[0].cost[coinsurance].type = BenefitCostTypeCS#coinsurance "Coinsurance"
* plan[=].specificCost[0].benefit[0].cost[coinsurance].value.value = 0
* plan[=].specificCost[0].benefit[0].cost[coinsurance].value.code = #%
* plan[=].specificCost[0].benefit[0].cost[coinsurance].value.system = "http://unitsofmeasure.org"
* plan[=].specificCost[0].benefit[0].cost[coinsurance].qualifiers = CoInsuranceOptionCS#after-deductible "After Deductible"


* plan[+].type = PharmacyTypeCS#3-month-in-retail "3 month in network retail"

* plan[=].specificCost[0].category = DrugTierCS#generic "Generic"

// TODO need a codeSystem for plan.specificCost.benefit.type to represent prescription fill
* plan[=].specificCost[0].benefit[0].type = BenefitTypeCS#drug "DRUG"

* plan[=].specificCost[0].benefit[0].cost[copay].type = BenefitCostTypeCS#copay "Copay"
* plan[=].specificCost[0].benefit[0].cost[copay].value.value = 0
* plan[=].specificCost[0].benefit[0].cost[copay].value.unit = "$"
* plan[=].specificCost[0].benefit[0].cost[copay].value.system = "urn:iso:std:iso:4217"
* plan[=].specificCost[0].benefit[0].cost[copay].value.code = #USD
* plan[=].specificCost[0].benefit[0].cost[copay].qualifiers = CopayOptionCS#no-charge "No Charge"

* plan[=].specificCost[0].benefit[0].cost[coinsurance].type = BenefitCostTypeCS#coinsurance "Coinsurance"
* plan[=].specificCost[0].benefit[0].cost[coinsurance].value.value = 0
* plan[=].specificCost[0].benefit[0].cost[coinsurance].value.code = #%
* plan[=].specificCost[0].benefit[0].cost[coinsurance].value.system = "http://unitsofmeasure.org"
* plan[=].specificCost[0].benefit[0].cost[coinsurance].qualifiers = CoInsuranceOptionCS#after-deductible "After Deductible"



* plan[+].type = PharmacyTypeCS#3-month-out-retail "3 month out of network retail"

* plan[=].specificCost[0].category = DrugTierCS#generic "Generic"

// TODO need a codeSystem for plan.specificCost.benefit.type to represent prescription fill
* plan[=].specificCost[0].benefit[0].type = BenefitTypeCS#drug "DRUG"

* plan[=].specificCost[0].benefit[0].cost[copay].type = BenefitCostTypeCS#copay "Copay"
* plan[=].specificCost[0].benefit[0].cost[copay].value.value = 0
* plan[=].specificCost[0].benefit[0].cost[copay].value.unit = "$"
* plan[=].specificCost[0].benefit[0].cost[copay].value.system = "urn:iso:std:iso:4217"
* plan[=].specificCost[0].benefit[0].cost[copay].value.code = #USD
* plan[=].specificCost[0].benefit[0].cost[copay].qualifiers = CopayOptionCS#no-charge "No Charge"

* plan[=].specificCost[0].benefit[0].cost[coinsurance].type = BenefitCostTypeCS#coinsurance "Coinsurance"
* plan[=].specificCost[0].benefit[0].cost[coinsurance].value.value = 0
* plan[=].specificCost[0].benefit[0].cost[coinsurance].value.code = #%
* plan[=].specificCost[0].benefit[0].cost[coinsurance].value.system = "http://unitsofmeasure.org"
* plan[=].specificCost[0].benefit[0].cost[coinsurance].qualifiers = CoInsuranceOptionCS#after-deductible "After Deductible"




Instance: FormularyItem-D3001-1000091
InstanceOf: FormlaryItem
Description: "Formulary Item for Insurance Drug Plan D3001 Drug 1000091"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"

* extension[usdf-DrugPlanReference-extension].valueReference = Reference(InsuranceDrugPlanD1002)
* extension[usdf-AvailabilityStatus-extension].valueCode = #active
* extension[usdf-AvailabilityPeriod-extension].valuePeriod.start = "2021-01-01"
* extension[usdf-AvailabilityPeriod-extension].valuePeriod.end = "2021-12-31"
* extension[usdf-PharmacyType-extension][+].valueCodeableConcept = PharmacyTypeCS#1-month-in-mail "1 month in network mail order"
* extension[usdf-PharmacyType-extension][+].valueCodeableConcept = PharmacyTypeCS#3-month-in-mail "3 month in network mail order"
* extension[usdf-DrugTierID-extension].valueCodeableConcept = DrugTierCS#generic "Generic"
* extension[usdf-PriorAuthorization-extension].valueBoolean = false
* extension[usdf-StepTherapyLimit-extension].valueBoolean = true
* extension[usdf-StepTherapyLimitNewStartsOnly-extension].valueBoolean = true
* extension[usdf-QuantityLimit-extension].valueBoolean = true

* code = InsuranceItemTypeCS#formulary-item "Formulary Item"
* subject = Reference(FormularyDrug-1000091)