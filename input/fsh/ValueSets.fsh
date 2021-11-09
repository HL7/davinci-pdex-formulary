ValueSet: DrugTierVS
Title: "Drug tier of medication in health plan"
Description: "The drug tier of a particular medication in a health plan. The base set are examples. Each plan may have its own controlled vocabulary."
* codes from system DrugTierCS

ValueSet: PharmacyTypeVS
Title: "Type of pharmacies"
Description: "Types of pharmacies. Each payer will have its own controlled vocabulary."
* codes from system PharmacyTypeCS

ValueSet: BenefitCostTypeVS
Title: "Benefit type of cost"
Description: "Benefit type of cost"
* codes from system BenefitCostTypeCS

ValueSet: InsuranceItemTypeVS
Title: "Insurance item type"
Description: "Types of insurance items"
* codes from system InsuranceItemTypeCS

ValueSet: CopayOptionVS
Title: "Qualifier of copay amount"
Description: "Qualifier of copay amount"
* codes from system CopayOptionCS

ValueSet: CoinsuranceOptionVS
Title: "Qualifier for coinsurance rate"
Description: "Qualifier for coinsurance rate"
* codes from system CoInsuranceOptionCS

ValueSet: PlanTypeVS
Title: "Type of plan"
Description: "Types of plans"
* codes from system PlanTypeCS

ValueSet: PlanContactTypeVS
Title: "Type of plan contact"
Description: "Type of plan contact"
* codes from system $HL7ContactEntity-Type
* codes from system PlanContactTypeCS




ValueSet: SemanticDrugVS
Title: "Semantic Drug Codes"
Description: "Semantic Drug codes with Term Types (TTY) of Semantic Clinical Drug (SCD), Semantic Branded Drug (SBD), Generic Pack (GPCK), or Branded Pack (BPCK)"
//* codes from system $RxNorm where TTY = #SBD
//* codes from system $RxNorm where TTY = #SCD
//* codes from system $RxNorm where TTY = #GPCK
* codes from system $RxNorm where TTY = #BPCK
//* codes from system $HL7-USCore-MedicationCodes where TTY = "SBD"
/*
ValueSet: SemanticDrugFormGroupVS
Title: "Semantic Drug Form Group Codes"
Description: "Semantic Drug Form Group codes with Term Types (TTY) of Semantic Clinical Drug Form (SCDG) and Semantic Branded Drug Form Group (SBDG)"
* codes from system $RxNorm where TTY = #SCDG
* codes from system $RxNorm where TTY = #SBDG
*/

