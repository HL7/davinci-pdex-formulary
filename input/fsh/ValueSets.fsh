ValueSet: DrugTierVS
Title: "Drug tier of medication in health plan"
Description: "The drug tier of a particular medication in a health plan. The base set are examples. Each plan may have its own controlled vocabulary."
* codes from system DrugTierCS
* ^experimental = false

// Renamed and title/description changes per FHIR-34756
ValueSet: PharmacyBenefitTypeVS
Title: "Pharmacy benefit types"
Description: "Pharmacy benefit types. Each payer will have its own controlled vocabulary."
* codes from system PharmacyBenefitTypeCS
* ^experimental = false

ValueSet: BenefitCostTypeVS
Title: "Benefit type of cost"
Description: "Benefit type of cost"
* codes from system BenefitCostTypeCS
* ^experimental = false

ValueSet: InsuranceItemTypeVS
Title: "Insurance item type"
Description: "Types of insurance items"
* codes from system InsuranceItemTypeCS
* ^experimental = false

ValueSet: CopayOptionVS
Title: "Qualifier of copay amount"
Description: "Qualifier of copay amount"
* include CostShareOptionCS#after-deductible          
* include CostShareOptionCS#before-deductible
* include CostShareOptionCS#no-charge
* include CostShareOptionCS#no-charge-after-deductible
* include CostShareOptionCS#charge
* include CostShareOptionCS#copay-not-applicable
* include CostShareOptionCS#deductible-waived
* ^experimental = false


ValueSet: CoinsuranceOptionVS
Title: "Qualifier for coinsurance rate"
Description: "Qualifier for coinsurance rate"
* include CostShareOptionCS#after-deductible          
* include CostShareOptionCS#no-charge
* include CostShareOptionCS#no-charge-after-deductible
* include CostShareOptionCS#charge
* include CostShareOptionCS#coinsurance-not-applicable
* include CostShareOptionCS#deductible-waived
* ^experimental = false

/* FHIR-35590 - Change to different VS
ValueSet: PlanTypeVS
Title: "Type of plan"
Description: "Types of plans"
* codes from system PlanTypeCS
*/

ValueSet: PlanContactTypeVS
Title: "Type of plan contact"
Description: "Type of plan contact"
* codes from system $HL7ContactEntity-Type
* codes from system PlanContactTypeCS
* ^experimental = false

ValueSet: NonPackSemanticDrugVS
Title: "Non-Pack Semantic Drug Codes"
Description: "Semantic Drug codes with Term Types (TTY) of Semantic Clinical Drug (SCD)"
* codes from system $RxNorm where TTY = #SBD
* codes from system $RxNorm where TTY = #SCD
* ^experimental = false

ValueSet: SemanticDrugVS
Title: "Semantic Drug Codes"
Description: "Semantic Drug codes with Term Types (TTY) of Semantic Clinical Drug (SCD), Semantic Branded Drug (SBD), Generic Pack (GPCK), or Branded Pack (BPCK)"
* include codes from valueset NonPackSemanticDrugVS
// * codes from system $RxNorm where TTY = #SBD
// * codes from system $RxNorm where TTY = #SCD
* codes from system $RxNorm where TTY = #GPCK
* codes from system $RxNorm where TTY = #BPCK
// * codes from system $HL7-USCore-MedicationCodes where TTY = "SBD"
* ^experimental = false

ValueSet: SemanticDrugFormGroupVS
Title: "Semantic Drug Form Group Codes"
Description: "Semantic Drug Form Group codes with Term Types (TTY) of Semantic Clinical Drug Form (SCDG) and Semantic Branded Drug Form Group (SBDG)"
* codes from system $RxNorm where TTY = #SCDG
* codes from system $RxNorm where TTY = #SBDG
* ^experimental = false