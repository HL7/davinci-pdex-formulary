

Extension: FormularyReference
Id: usdf-FormularyReference-extension
Title: "Formulary Reference"
Description: "Reference to the formulary this item belongs to."

* value[x] 1..1
* value[x] only Reference
* valueReference only Reference(Formulary)



Extension: PriorAuthorization
Id: usdf-PriorAuthorization-extension
Title: "Prior Authorization"
Description: "A Boolean indication of whether the coverage plan imposes a prior authorization requirement on this drug."
* value[x] only boolean
* value[x] 1..1

Extension: PriorAuthorizationNewStartsOnly
Id: usdf-PriorAuthorizationNewStartsOnly-extension
Title: "Prior Authorization New Starts Only"
Description: "A Boolean indication of whether the coverage plan imposes a prior authorization requirement on this drug for new starts only. (Only include if PriorAuthorization = true)"
* value[x] only boolean
* value[x] 1..1

Extension: StepTherapyLimit
Id: usdf-StepTherapyLimit-extension
Title: "Step Therapy Limit"
Description: "A boolean indicating whether the coverage plan imposes a step therapy requirement on this drug meaning another drug may need to be tried beforehand."
* value[x] only boolean
* value[x] 1..1

Extension: StepTherapyLimitNewStartsOnly
Id: usdf-StepTherapyLimitNewStartsOnly-extension
Title: "Step Therapy Limit New Starts Only"
Description: "A boolean indicating whether the coverage plan imposes a step therapy requirement on this drug meaning another drug may need to be tried beforehand for new starts only (Not required if patient has previously met step therapy requirements).  (Only include if StepTherapyLimit = true)"
* value[x] only boolean
* value[x] 1..1

Extension: QuantityLimit
Id: usdf-QuantityLimit-extension
Title: "Quantity Limit"
Description: "A Boolean indication of whether the coverage plan imposes a quantity limit on this drug."
* value[x] 1..1
* value[x] only boolean


Extension: QuantityLimitDetail
Id: usdf-QuantityLimitDetail-extension
Title: "Quantity Limit Detail"
Description: "A detailed definition of the quantity limits the coverage plan imposes on this drug. These limit details may include (potentially including a rolling dispense limit, maximum daily, or therapy days for a period of time. (Only include if QuantityLimit = true)"
* extension 1..*
* extension contains
	Description 0..1 and
	Rolling 0..1 and
	MaximumDaily 0..1 and 
	DaysSupply 0..1 

* extension[Description] ^short = "A human readable description of quantity limits."
* extension[Description].value[x] 1..1
* extension[Description].value[x] only string


* extension[Rolling] ^short = "Indicator of dispense amount limit per time period."
* extension[Rolling].value[x] 1..1
* extension[Rolling].value[x] only Timing
* extension[Rolling].valueTiming.event 0..0
* extension[Rolling].valueTiming.repeat 1..1
* extension[Rolling].valueTiming.repeat.count 1..1
* extension[Rolling].valueTiming.repeat.period 1..1
* extension[Rolling].valueTiming.repeat.periodUnit = #d

* extension[MaximumDaily] ^short = "Indicator of maximum daily amount."
* extension[MaximumDaily].value[x] 1..1
* extension[MaximumDaily].value[x] only Quantity
* extension[MaximumDaily].valueQuantity.value 1..1

* extension[DaysSupply] ^short = "Indicator of number of therapy days over time period."
* extension[DaysSupply].value[x] 1..1
* extension[DaysSupply].value[x] only Timing
* extension[DaysSupply].valueTiming.event 0..0
* extension[DaysSupply].valueTiming.repeat 1..1
* extension[DaysSupply].valueTiming.repeat.bounds[x] 1..1
* extension[DaysSupply].valueTiming.repeat.bounds[x] only Duration
* extension[DaysSupply].valueTiming.repeat.boundsDuration.value 1..1
* extension[DaysSupply].valueTiming.repeat.boundsDuration.system = "http://unitsofmeasure.org"
* extension[DaysSupply].valueTiming.repeat.boundsDuration.code = #d
* extension[DaysSupply].valueTiming.repeat.count 1..1
* extension[DaysSupply].valueTiming.repeat.duration 
* extension[DaysSupply].valueTiming.repeat.durationUnit 
* extension[DaysSupply].valueTiming.repeat.period 1..1
* extension[DaysSupply].valueTiming.repeat.periodUnit = #d


Extension: PharmacyType
Id: usdf-PharmacyType-extension
Title: "Pharmacy Type"
Description: "A CodeableConcept indicating the pharmacy network type the formulary drug is available through the associated plan.  This pharmacy network type is specific to the FormularyDrug and indicates which of the pharmacy network type from the plan applies to the particular formulary drug."
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from PharmacyTypeVS (extensible)

Extension: DrugTierID
Id: usdf-DrugTierID-extension
Title: "Drug Tier ID"
Description: "A code that describes the coverage status of a drug in a health plan (e.g., preferred generic, specialty, etc.)"
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from DrugTierVS (extensible)


Extension: AvailabilityStatus
Id: usdf-AvailabilityStatus-extension
Title: "Availability Status"
Description: "A boolean indicating whether the formulary item is currently available under the formulary. Drugs may appear on a formulary, but not considered \"active\" for the current year. Drugs may also be removed during the course of a plan year."
* value[x] 1..1 MS
* value[x] only code
* valueCode from publication-status (required)

Extension: AvailabilityPeriod
Id: usdf-AvailabilityPeriod-extension
Title: "Availability Period"
Description: "The period for which this item is available on the formulary. Drugs may appear on a formulary, but not considered \"active\" for the current year."
* value[x] 1..1 MS
* value[x] only Period
