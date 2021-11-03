Instance: PayerInsurancePlanA3002
InstanceOf: PayerInsurancePlan
Description: "Payer Insurance Plan A3002"
Usage: #example

* meta.lastUpdated = "2021-05-22T18:36:03.000+00:00"
* meta.profile = Canonical(PayerInsurancePlan) 


* identifier.value = "A3002"
* status = #active

* type = $PlanNetInsuranceProductTypeCS#mediadv

* name = "Sample Medicare Advantage Plan A3002"
//* alias MS
* period.start = "2021-01-01"
* period.end = "2021-12-31"

* coverageArea = Reference(UnitedStatesLocation)

* contact[+].purpose = $HL7ContactEntity-Type#PATINF
* contact[=].telecom.system = #phone
* contact[=].telecom.value = "+1 (888) 555-3002"

* contact[+].purpose = PlanContactTypeCS#MARKETING
* contact[=].name.text = "Sample Medicare Advantage Plan Marketing Website"
* contact[=].telecom.system = #url
* contact[=].telecom.value = "http://url/to/health/plan/information"

* contact[+].purpose = PlanContactTypeCS#SUMMARY
* contact[=].name.text = "Sample Medicare Advantage Drug Plan Benefit Website"
* contact[=].telecom.system = #url
* contact[=].telecom.value = "http://url/to/health/plan/information"

* contact[+].purpose = PlanContactTypeCS#FORMULARY
* contact[=].name.text = "Sample Medicare Advantage Drug Plan Formulary Website"
* contact[=].telecom.system = #url
* contact[=].telecom.value = "http://url/to/health/plan/information"



* coverage.extension[FormularyReference].valueReference = Reference(FormularyD3002)


* plan[drug-plan].type = PlanTypeCS#drug "Drug"




* plan[drug-plan].specificCost[+].category = PharmacyTypeCS#1-month-in-retail "1 month in network retail"

* plan[drug-plan].specificCost[=].benefit[0].type = DrugTierCS#generic "Generic"




* plan[drug-plan].specificCost[=].benefit[0].cost[copay].type = BenefitCostTypeCS#copay "Copay"
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].value.value = 10
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].value.unit = "$"
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].value.system = "urn:iso:std:iso:4217"
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].value.code = #USD
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].qualifiers = CopayOptionCS#before-deductible "Before Deductible"

* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].type = BenefitCostTypeCS#coinsurance "Coinsurance"
* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].value.value = 1
* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].value.code = #%
* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].value.system = "http://unitsofmeasure.org"
* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].qualifiers = CoInsuranceOptionCS#after-deductible "After Deductible"


* plan[drug-plan].specificCost[+].category = PharmacyTypeCS#1-month-out-retail "1 month out of network retail"

* plan[drug-plan].specificCost[=].benefit[0].type = DrugTierCS#generic "Generic"




* plan[drug-plan].specificCost[=].benefit[0].cost[copay].type = BenefitCostTypeCS#copay "Copay"
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].value.value = 0
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].value.unit = "$"
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].value.system = "urn:iso:std:iso:4217"
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].value.code = #USD
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].qualifiers = CopayOptionCS#no-charge "No Charge"

* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].type = BenefitCostTypeCS#coinsurance "Coinsurance"
* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].value.value = 0
* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].value.code = #%
* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].value.system = "http://unitsofmeasure.org"
* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].qualifiers = CoInsuranceOptionCS#after-deductible "After Deductible"


* plan[drug-plan].specificCost[+].category = PharmacyTypeCS#3-month-in-retail "3 month in network retail"

* plan[drug-plan].specificCost[=].benefit[0].type = DrugTierCS#generic "Generic"




* plan[drug-plan].specificCost[=].benefit[0].cost[copay].type = BenefitCostTypeCS#copay "Copay"
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].value.value = 0
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].value.unit = "$"
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].value.system = "urn:iso:std:iso:4217"
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].value.code = #USD
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].qualifiers = CopayOptionCS#no-charge "No Charge"

* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].type = BenefitCostTypeCS#coinsurance "Coinsurance"
* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].value.value = 0
* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].value.code = #%
* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].value.system = "http://unitsofmeasure.org"
* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].qualifiers = CoInsuranceOptionCS#after-deductible "After Deductible"



* plan[drug-plan].specificCost[+].category = PharmacyTypeCS#3-month-out-retail "3 month out of network retail"

* plan[drug-plan].specificCost[=].benefit[0].type = DrugTierCS#generic "Generic"




* plan[drug-plan].specificCost[=].benefit[0].cost[copay].type = BenefitCostTypeCS#copay "Copay"
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].value.value = 0
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].value.unit = "$"
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].value.system = "urn:iso:std:iso:4217"
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].value.code = #USD
* plan[drug-plan].specificCost[=].benefit[0].cost[copay].qualifiers = CopayOptionCS#no-charge "No Charge"

* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].type = BenefitCostTypeCS#coinsurance "Coinsurance"
* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].value.value = 0
* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].value.code = #%
* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].value.system = "http://unitsofmeasure.org"
* plan[drug-plan].specificCost[=].benefit[0].cost[coinsurance].qualifiers = CoInsuranceOptionCS#after-deductible "After Deductible"




Instance: FormularyD3002
InstanceOf: Formulary
Description: "Formulary D3002"
Usage: #example

* meta.lastUpdated = "2021-05-22T18:36:03.000+00:00"
* meta.profile = Canonical(Formulary) 

* identifier.value = "D3002"
* status = #active

* type = $HL7v3-ActCode#DRUGPOL

* name = "Sample Medicare Advantage Part D Formulary D3002"
//* alias MS
* period.start = "2021-01-01"
* period.end = "2021-12-31"








Instance: FormularyItem-D3002-1000091
InstanceOf: FormlaryItem
Description: "Formulary Item for Insurance Formulary D3002 Drug 1000091"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"

* extension[usdf-FormularyReference-extension].valueReference = Reference(FormularyD3002)
* extension[usdf-AvailabilityStatus-extension].valueCode = #active
* extension[usdf-AvailabilityPeriod-extension].valuePeriod.start = "2021-01-01"
* extension[usdf-AvailabilityPeriod-extension].valuePeriod.end = "2021-12-31"
* extension[usdf-PharmacyType-extension][+].valueCodeableConcept = PharmacyTypeCS#1-month-in-retail "1 month in network retail"
* extension[usdf-PharmacyType-extension][+].valueCodeableConcept = PharmacyTypeCS#1-month-in-mail "1 month in network mail order"
* extension[usdf-PharmacyType-extension][+].valueCodeableConcept = PharmacyTypeCS#3-month-in-retail "3 month in network retail"
* extension[usdf-PharmacyType-extension][+].valueCodeableConcept = PharmacyTypeCS#3-month-in-mail "3 month in network mail order"
* extension[usdf-DrugTierID-extension].valueCodeableConcept = DrugTierCS#generic "Generic"
* extension[usdf-PriorAuthorization-extension].valueBoolean = false
* extension[usdf-StepTherapyLimit-extension].valueBoolean = true
* extension[usdf-StepTherapyLimitNewStartsOnly-extension].valueBoolean = true
* extension[usdf-QuantityLimit-extension].valueBoolean = true

* code = InsuranceItemTypeCS#formulary-item "Formulary Item"
* subject = Reference(FormularyDrug-1000091)