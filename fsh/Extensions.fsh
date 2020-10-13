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
Description: "Array of Networks within a plan."
* value[x] only string
* value[x] 1..1

Extension: SummaryURL
Id: usdf-SummaryURL-extension
Title: "Summary URL"
Description: "The URL that goes directly to the formulary brochure for the specific standard plan or plan variation."
* value[x] only string
* value[x] 1..1

Extension: FormularyURL
Id: usdf-FormularyURL-extension
Title: "Formulary URL"
Description: "The URL that goes directly to the formulary brochure for the specific standard plan or plan variation."
* value[x] only string
* value[x] 1..1

Extension: EmailPlanContact
Id: usdf-EmailPlanContact-extension
Title: "Email Plan Contact"
Description: "An email address for developers/public to report mistakes in the network and formulary data."
* value[x] only string
* value[x] 1..1

Extension: MarketingURL
Id: usdf-MarketingURL-extension
Title: "Marketing URL"
Description: "The URL that goes directly to the plan brochure for the specific standard plan or plan variation."
* value[x] only string
* value[x] 1..1

Extension: PlanIDType
Id: usdf-PlanIDType-extension
Title: "Plan ID Type"
Description: "Type of Plan ID. For all Marketplace plans this should be: HIOS-PLAN-ID"
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

Extension: StepTherapyLimit
Id: usdf-StepTherapyLimit-extension
Title: "Step Therapy Limit"
Description: "A Boolean indication of whether the coverage plan imposes a step therapy limit on this drug."
* value[x] only boolean
* value[x] 1..1

Extension: QuantityLimit
Id: usdf-QuantityLimit-extension
Title: "Quantity Limit"
Description: "A Boolean indication of whether the coverage plan imposes a quantity limit on this drug."
* value[x] 1..1
* value[x] only boolean

Extension: PlanID
Id: usdf-PlanID-extension
Title: "Plan ID"
Description: "Unique, 14-character, HIOS-generated Plan ID number. (Plan IDs must be unique, even across different markets.)"
* value[x] 1..1
* value[x] only string

Extension: DrugTierID
Id: usdf-DrugTierID-extension
Title: "Drug Tier ID"
Description: "A code that describes the coverage status of a drug in a health plan (e.g., preferred generic, specialty, etc.)"
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from DrugTierVS (extensible)

