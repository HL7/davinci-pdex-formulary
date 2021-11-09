// --------------------- Insurance Plan 1002 --------------------- 

Instance: PayerInsurancePlanA1002
InstanceOf: PayerInsurancePlan
Description: "Payer Insurance Plan A1002"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"
* meta.profile = Canonical(PayerInsurancePlan) 

* identifier.value = "A1002"
* status = #active

* type = $PlanNetInsuranceProductTypeCS#mediadv

* name = "Sample Medicare Advantage Plan A1002"

* period.start = "2021-01-01"
* period.end = "2021-12-31"

* coverageArea = Reference(StateOfCTLocation)

* contact[+].purpose = $HL7ContactEntity-Type#PATINF
* contact[=].telecom.system = #phone
* contact[=].telecom.value = "+1 (888) 555-1002"

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


* coverage[drug-coverage].extension[FormularyReference].valueReference = Reference(FormularyD1002)



* plan[drug-plan].type = PlanTypeCS#drug "Drug"

* plan[drug-plan].specificCost[0].category = PharmacyTypeCS#1-month-in-retail "1 month in network retail"



* plan[drug-plan].specificCost[0].benefit[0].type = DrugTierCS#brand "Brand"


* plan[drug-plan].specificCost[0].benefit[0].cost[copay].type = BenefitCostTypeCS#copay "Copay"
* plan[drug-plan].specificCost[0].benefit[0].cost[copay].value.value = 20
* plan[drug-plan].specificCost[0].benefit[0].cost[copay].value.unit = "$"
* plan[drug-plan].specificCost[0].benefit[0].cost[copay].value.system = "urn:iso:std:iso:4217"
* plan[drug-plan].specificCost[0].benefit[0].cost[copay].value.code = #USD
* plan[drug-plan].specificCost[0].benefit[0].cost[copay].qualifiers = CopayOptionCS#after-deductible "After Deductible"

* plan[drug-plan].specificCost[0].benefit[0].cost[coinsurance].type = BenefitCostTypeCS#coinsurance "Coinsurance"
* plan[drug-plan].specificCost[0].benefit[0].cost[coinsurance].value.value = 20
* plan[drug-plan].specificCost[0].benefit[0].cost[coinsurance].value.code = #%
* plan[drug-plan].specificCost[0].benefit[0].cost[coinsurance].value.system = "http://unitsofmeasure.org"
* plan[drug-plan].specificCost[0].benefit[0].cost[coinsurance].qualifiers = CoInsuranceOptionCS#after-deductible "After Deductible"


Instance: FormularyD1002
InstanceOf: Formulary
Description: "Formulary D1002"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"
* meta.profile = Canonical(Formulary) 

* identifier.value = "D1002"
* status = #active

* type = $HL7v3-ActCode#DRUGPOL

* name = "Sample Medicare Advantage Part D Formulary D1002"

* period.start = "2021-01-01"
* period.end = "2021-12-31"






/*

// --------------------- FormularyItems --------------------- 



Instance: FormularyItem-D1002-1000091
InstanceOf: FormularyItem
Description: "Formulary Item for Formulary D1002 Drug 1000091"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"

* extension[usdf-FormularyReference-extension].valueReference = Reference(FormularyD1002)
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


Instance: FormularyItem-D1002-1049640
InstanceOf: FormularyItem
Description: "Formulary Item for Formulary D1002 Drug 1049640"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"

* extension[usdf-FormularyReference-extension].valueReference = Reference(FormularyD1002)
* extension[usdf-AvailabilityStatus-extension].valueCode = #active
* extension[usdf-AvailabilityPeriod-extension].valuePeriod.start = "2021-01-01"
* extension[usdf-AvailabilityPeriod-extension].valuePeriod.end = "2021-12-31"
* extension[usdf-PharmacyType-extension].valueCodeableConcept = PharmacyTypeCS#3-month-out-retail "3 month out of network retail"
* extension[usdf-DrugTierID-extension].valueCodeableConcept = DrugTierCS#brand "Brand"
* extension[usdf-PriorAuthorization-extension].valueBoolean = true
* extension[usdf-PriorAuthorizationNewStartsOnly-extension].valueBoolean = true
* extension[usdf-StepTherapyLimit-extension].valueBoolean = true
* extension[usdf-StepTherapyLimitNewStartsOnly-extension].valueBoolean = false
* extension[usdf-QuantityLimit-extension].valueBoolean = true
* code = InsuranceItemTypeCS#formulary-item "Formulary Item"
* subject = Reference(FormularyDrug-1049640)


/*

Instance: FormularyItem-QuantityTimingTest
InstanceOf: FormularyItem
Description: "Formulary Item for Formulary D1002 Drug QuantityTiming"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"

* extension[usdf-FormularyReference-extension].valueReference = Reference(FormularyD1002)
* extension[usdf-AvailabilityStatus-extension].valueCode = #active
* extension[usdf-AvailabilityPeriod-extension].valuePeriod.start = "2021-01-01"
* extension[usdf-AvailabilityPeriod-extension].valuePeriod.end = "2021-12-31"
* extension[usdf-PharmacyType-extension].valueCodeableConcept = PharmacyTypeCS#3-month-out-retail "3 month out of network retail"
* extension[usdf-DrugTierID-extension].valueCodeableConcept = DrugTierCS#brand "Brand"
* extension[usdf-PriorAuthorization-extension].valueBoolean = true
* extension[usdf-PriorAuthorizationNewStartsOnly-extension].valueBoolean = true
* extension[usdf-StepTherapyLimit-extension].valueBoolean = true
* extension[usdf-StepTherapyLimitNewStartsOnly-extension].valueBoolean = false
* extension[usdf-QuantityLimit-extension].valueBoolean = true
* extension[usdf-QuantityLimitDetail-extension].extension[Rolling].valueTiming.repeat.count = 480
* extension[usdf-QuantityLimitDetail-extension].extension[Rolling].valueTiming.repeat.period = 30
* extension[usdf-QuantityLimitDetail-extension].extension[Rolling].valueTiming.repeat.periodUnit = #d
* extension[usdf-QuantityLimitDetail-extension].extension[MaximumDaily].valueQuantity.value = 16
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.boundsDuration.value = 365
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.boundsDuration.system = "http://unitsofmeasure.org"
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.boundsDuration.code = #d
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.count = 2
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.period = 14
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.periodUnit = #d

* code = InsuranceItemTypeCS#formulary-item "Formulary Item"
* subject = Reference(FormularyDrug-1049640)

*/
/*
Instance: FormularyItem-D1002-209459
InstanceOf: FormularyItem
Description: "Formulary Item for Formulary D1002 Drug 209459"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"

* extension[usdf-FormularyReference-extension].valueReference = Reference(FormularyD1002)
* extension[usdf-AvailabilityStatus-extension].valueCode = #active
* extension[usdf-AvailabilityPeriod-extension].valuePeriod.start = "2021-01-01"
* extension[usdf-AvailabilityPeriod-extension].valuePeriod.end = "2021-12-31"
* extension[usdf-PharmacyType-extension].valueCodeableConcept = PharmacyTypeCS#3-month-out-retail "3 month out of network retail"
* extension[usdf-DrugTierID-extension].valueCodeableConcept = DrugTierCS#brand "Brand"
* extension[usdf-PriorAuthorization-extension].valueBoolean = true
* extension[usdf-StepTherapyLimit-extension].valueBoolean = false
* extension[usdf-QuantityLimit-extension].valueBoolean = false
* code = InsuranceItemTypeCS#formulary-item "Formulary Item"
* subject = Reference(FormularyDrug-209459)

Instance: FormularyItem-D1002-284520
InstanceOf: FormularyItem
Description: "Formulary Item for Formulary D1002 Drug 284520"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"

* extension[usdf-FormularyReference-extension].valueReference = Reference(FormularyD1002)
* extension[usdf-AvailabilityStatus-extension].valueCode = #active
* extension[usdf-AvailabilityPeriod-extension].valuePeriod.start = "2021-01-01"
* extension[usdf-AvailabilityPeriod-extension].valuePeriod.end = "2021-12-31"
* extension[usdf-PharmacyType-extension].valueCodeableConcept = PharmacyTypeCS#3-month-out-retail "3 month out of network retail"
* extension[usdf-DrugTierID-extension].valueCodeableConcept = DrugTierCS#brand "Brand"
* extension[usdf-PriorAuthorization-extension].valueBoolean = false
* extension[usdf-StepTherapyLimit-extension].valueBoolean = false
* extension[usdf-QuantityLimit-extension].valueBoolean = false

* code = InsuranceItemTypeCS#formulary-item "Formulary Item"
* subject = Reference(FormularyDrug-284520)

*/
/*
Instance: FormularyItem-D1002-993953
InstanceOf: FormularyItem
Description: "Formulary Item for Formulary D1002 Drug 993953"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"

* extension[usdf-FormularyReference-extension].valueReference = Reference(FormularyD1002)
* extension[usdf-AvailabilityStatus-extension].valueCode = #active
* extension[usdf-AvailabilityPeriod-extension].valuePeriod.start = "2021-01-01"
* extension[usdf-AvailabilityPeriod-extension].valuePeriod.end = "2021-12-31"
* extension[usdf-PharmacyType-extension].valueCodeableConcept = PharmacyTypeCS#3-month-out-retail "3 month out of network retail"
* extension[usdf-DrugTierID-extension].valueCodeableConcept = DrugTierCS#brand "Brand"
* extension[usdf-PriorAuthorization-extension].valueBoolean = true
* extension[usdf-PriorAuthorizationNewStartsOnly-extension].valueBoolean = true
* extension[usdf-StepTherapyLimit-extension].valueBoolean = true
* extension[usdf-StepTherapyLimitNewStartsOnly-extension].valueBoolean = false
// Max daily - 2, Rolling 30 day - 60, Days supply - 180 cumulative days' supply per 365 days 
* extension[usdf-QuantityLimit-extension].valueBoolean = true
* extension[usdf-QuantityLimitDetail-extension].extension[Rolling].valueTiming.repeat.count = 60
* extension[usdf-QuantityLimitDetail-extension].extension[Rolling].valueTiming.repeat.period = 30
* extension[usdf-QuantityLimitDetail-extension].extension[Rolling].valueTiming.repeat.periodUnit = #d
* extension[usdf-QuantityLimitDetail-extension].extension[MaximumDaily].valueQuantity.value = 2
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.boundsDuration.value = 365
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.boundsDuration.system = "http://unitsofmeasure.org"
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.boundsDuration.code = #d
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.count = 1
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.period = 180
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.periodUnit = #d

* code = InsuranceItemTypeCS#formulary-item "Formulary Item"
* subject = Reference(FormularyDrug-993953)
*/

Instance: FormularyItem-D1002-993804
InstanceOf: FormularyItem
Description: "Formulary Item for Formulary D1002 Drug 993804"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"

* extension[usdf-FormularyReference-extension].valueReference = Reference(FormularyD1002)
* extension[usdf-AvailabilityStatus-extension].valueCode = #active
* extension[usdf-AvailabilityPeriod-extension].valuePeriod.start = "2021-01-01"
* extension[usdf-AvailabilityPeriod-extension].valuePeriod.end = "2021-12-31"
* extension[usdf-PharmacyType-extension].valueCodeableConcept = PharmacyTypeCS#3-month-out-retail "3 month out of network retail"
* extension[usdf-DrugTierID-extension].valueCodeableConcept = DrugTierCS#brand "Brand"
* extension[usdf-PriorAuthorization-extension].valueBoolean = true
* extension[usdf-PriorAuthorizationNewStartsOnly-extension].valueBoolean = true
* extension[usdf-StepTherapyLimit-extension].valueBoolean = true
* extension[usdf-StepTherapyLimitNewStartsOnly-extension].valueBoolean = false
// Max daily - 2, Rolling 30 day - 60, Days supply - 180 cumulative days' supply per 365 days 
* extension[usdf-QuantityLimit-extension].valueBoolean = true
* extension[usdf-QuantityLimitDetail-extension].extension[Rolling].valueTiming.repeat.count = 60
* extension[usdf-QuantityLimitDetail-extension].extension[Rolling].valueTiming.repeat.period = 30
* extension[usdf-QuantityLimitDetail-extension].extension[Rolling].valueTiming.repeat.periodUnit = #d
* extension[usdf-QuantityLimitDetail-extension].extension[MaximumDaily].valueQuantity.value = 2
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.boundsDuration.value = 365
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.boundsDuration.system = "http://unitsofmeasure.org"
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.boundsDuration.code = #d
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.count = 1
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.period = 180
* extension[usdf-QuantityLimitDetail-extension].extension[DaysSupply].valueTiming.repeat.periodUnit = #d

* code = InsuranceItemTypeCS#formulary-item "Formulary Item"
* subject = Reference(FormularyDrug-993804)
