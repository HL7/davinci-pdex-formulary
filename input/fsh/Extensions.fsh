Extension: DrugPlanReference
Id: usdf-DrugPlanReference-extension
Title: "Drug Plan Reference"
Description: "A reference to a drug plan."
* value[x] 1..1
* value[x] only Reference
* valueReference only Reference(InsuranceDrugPlan)



// TODO deprecate
Extension: DrugTierDefinition
Id: usdf-DrugTierDefinition-extension
Title: "Drug Tier Definition"
Description: "A description of the drug tiers used by the formulary and how those tiers implement copay and coinsurance amounts. Drug tiers do not have any inherent meaning that is consistent across all formularies. Rather, each tier is defined using this element."
* extension contains
	drugTierID 1..1 and
	mailOrder 1..1 and
	costSharing 0..*
* extension[drugTierID] ^short = "Drug Tier ID"
* extension[drugTierID].value[x] only CodeableConcept
* extension[drugTierID].value[x] 1..1
* extension[drugTierID].value[x] from DrugTierVS (extensible)
* extension[mailOrder] ^short = "Mail Order"
* extension[mailOrder].value[x] only boolean
* extension[mailOrder].value[x] 1..1
* extension[costSharing].extension contains
	pharmacyType 1..1 and
	copayAmount 1..1 and
	copayOption 1..1 and
	coinsuranceRate 1..1 and
	coinsuranceOption 1..1
* extension[costSharing].extension[pharmacyType] ^short = "Pharmacy Type"
* extension[costSharing].extension[pharmacyType].value[x] only CodeableConcept
* extension[costSharing].extension[pharmacyType].value[x] 1..1
* extension[costSharing].extension[pharmacyType].value[x] from PharmacyTypeVS (extensible)
* extension[costSharing].extension[copayAmount] ^short = "Copay Amount"
* extension[costSharing].extension[copayAmount].value[x] only Money
* extension[costSharing].extension[copayAmount].value[x] 1..1
* extension[costSharing].extension[copayOption] ^short = "Copay Options"
* extension[costSharing].extension[copayOption].value[x] only CodeableConcept
* extension[costSharing].extension[copayOption].value[x] 1..1
* extension[costSharing].extension[copayOption].value[x] from CopayOptionVS (required)
* extension[costSharing].extension[coinsuranceRate] ^short = "Co-Insurance Rate"
* extension[costSharing].extension[coinsuranceRate].value[x] only decimal
* extension[costSharing].extension[coinsuranceRate].value[x] 1..1
* extension[costSharing].extension[coinsuranceOption] ^short = "Co-Insurance Option"
* extension[costSharing].extension[coinsuranceOption].value[x] only CodeableConcept
* extension[costSharing].extension[coinsuranceOption].value[x] 1..1
* extension[costSharing].extension[coinsuranceOption].value[x] from CoinsuranceOptionVS (required)

Extension: Network
Id: usdf-Network-extension
Title: "Network"
Description: "Array of Networks within a plan.  If a network is not applicable for a plan, enter 'Not applicable' in the value string."
* value[x] only string
* value[x] 1..1

Extension: SummaryURL
Id: usdf-SummaryURL-extension
Title: "Summary URL"
Description: "The URL that goes directly to the formulary brochure for the specific standard plan or plan variation.  If the formulary brochure is available in multiple languages, this can also point to a page listing the links for the various different language versions of the document supported by the payer."
* value[x] only url
* value[x] 1..1

Extension: FormularyURL
Id: usdf-FormularyURL-extension
Title: "Formulary URL"
Description: "The URL that goes directly to the formulary brochure for the specific standard plan or plan variation.  If the formulary brochure is available in multiple languages, this can also point to a page listing the links for the various different language versions of the document supported by the payer."
* value[x] only url
* value[x] 1..1

Extension: EmailPlanContact
Id: usdf-EmailPlanContact-extension
Title: "Email Plan Contact"
Description: "An email address for developers/public to report mistakes in the network and formulary data. FHIR URL type can be a web-url or an e-mail address."
* value[x] only url
* value[x] 1..1

Extension: MarketingURL
Id: usdf-MarketingURL-extension
Title: "Marketing URL"
Description: "The URL that goes directly to the plan brochure for the specific standard plan or plan variation.  If the plan brochure is available in multiple languages, this can also point to a page listing the links for the various different language versions of the document supported by the payer."
* value[x] only url
* value[x] 1..1

Extension: PlanIDType
Id: usdf-PlanIDType-extension
Title: "Plan ID Type"
Description: "Type of Plan ID. For all Marketplace plans this should be: HIOS-PLAN-ID. For all other plans this should be: OTHER-PLAN-ID."
* value[x] only string
* value[x] 1..1

Extension: DrugAlternatives
Id: usdf-DrugAlternatives-extension
Title: "Drug Alternatives"
Description: "Generic or Branded Drugs included within the CoveragePlan's formulary that could be prescribed as alternatives to the current FormularyDrug."
* value[x] only Reference (FormularyDrug)
* value[x] 1..1

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
Description: "A Boolean indication of whether the coverage plan imposes a step therapy limit on this drug."
* value[x] only boolean
* value[x] 1..1


Extension: StepTherapyLimitNewStartsOnly
Id: usdf-StepTherapyLimitNewStartsOnly-extension
Title: "Step Therapy Limit New Starts Only"
Description: "A Boolean indication of whether the coverage plan imposes a step therapy limit on this drug for new starts only. (Only include if StepTherapyLimit = true)"
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
Title: "Quantity Limit"
Description: "An indication of whether and which quantity limits the coverage plan imposes on this drug. (Only include if QuantityLimit = true)"
* extension contains
	Rolling 0..1 and
	MaximumDaily 0..1 and 
	DaysSupply 0..1 
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
* extension[DaysSupply].valueTiming.repeat.duration MS
* extension[DaysSupply].valueTiming.repeat.durationUnit MS
* extension[DaysSupply].valueTiming.repeat.period 1..1
* extension[DaysSupply].valueTiming.repeat.periodUnit = #d




// [TODO] deprecate
Extension: MailOrder
Id: usdf-MailOrder-extension
Title: "Mail Order"
Description: "A Boolean indication of whether the formulary drug is available by mail order through the associated plan.  The MailOrder value in FormularyDrug overrides the MailOrder value in DrugTierDefinition within the CoveragePlan."
* value[x] 1..1
* value[x] only boolean

Extension: PharmacyType
Id: usdf-PharmacyType-extension
Title: "Pharmacy Type"
Description: "A CodeableConcept indicating the pharmacy network type the formulary drug is available through the associated plan.  This pharmacy network type is specific to the FormularyDrug and indicates which of the pharmacy network type from the InsuranceDrugPlan applies to the particular formulary drug."
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from PharmacyTypeVS (extensible)

Extension: PlanID
Id: usdf-PlanID-extension
Title: "Plan ID"
Description: "Unique, generated Plan ID number, such as HIOS ID for QHPs or Contract Number for Medicare Advantage Plans.  Plan IDs must be unique within each organization that manages their formulary data."
* value[x] 1..1
* value[x] only string

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
Description: "Availability status"
* value[x] 1..1 MS
* value[x] only code
* valueCode from publication-status (required)

Extension: AvailabilityPeriod
Id: usdf-AvailabilityPeriod-extension
Title: "Availability Period"
Description: "Period of time availability"
* value[x] 1..1 MS
* value[x] only Period
