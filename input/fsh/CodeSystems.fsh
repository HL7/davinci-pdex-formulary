CodeSystem: DrugTierCS
Id: usdf-DrugTierCS-TEMPORARY-TRIAL-USE
Title: "Codes for medication drug tiers in health plans"
Description: "Codes to represent the drug tier of a particular medication in a health plan.  Base set are examples.  Each plan may have its own controlled vocabulary."
* #generic                    "Generic"  "Commonly prescribed generic drugs that cost more than drugs in the 'preferred generic' tier."
* #preferred "Preferred" "Commonly prescribed drugs that are preferred by the plan."
* #non-preferred "Non-preferred" "Commonly prescribed drugs that cost more than drugs in the 'preferred' tier."
* #preferred-generic          "Preferred Generic"  "Commonly prescribed generic drugs."
* #non-preferred-generic      "Non-preferred Generic"  "Generic drugs that cost more than drugs in ‘generic’ tier."
* #specialty                  "Specialty"  "Drugs used to treat complex conditions like cancer and multiple sclerosis. They can be generic or brand name, and are typically the most expensive drugs on the formulary."
* #brand                      "Brand"  "Brand name drugs that cost more than ‘preferred brand’ drugs."
* #preferred-brand           "Preferred Brand"  "Brand name drugs"
* #non-preferred-brand        "Non-preferred Brand"  "Brand name drugs that cost more than ‘brand’ drugs."
* #zero-cost-share-preventative "Zero cost-share preventative"  "Preventive medications and products available at no cost."
* #medical-service           "Medical Service"  "Drugs that must be administered by a clinician or in a facility and may be covered under a medical benefit."
* ^caseSensitive = true
* ^experimental = false

// Renamed and title/description changes per FHIR-34756
CodeSystem: PharmacyBenefitTypeCS
Id:             usdf-PharmacyBenefitTypeCS-TEMPORARY-TRIAL-USE
Title: "Codes for pharmacy benefit types"
Description: "Codes for pharmacy benefit types. Each payer will have its own controlled vocabulary."
* #1-month-in-retail    "1 month in network retail"  "1 Month Supply via in-network retail pharmacy."
* #1-month-out-retail   "1 month out of network retail"  "1 Month Supply via out-of-network retail pharmacy."
* #1-month-in-mail    	"1 month in network mail order"  "1 Month Supply via in-network mail order pharmacy."
* #1-month-out-mail   	"1 month out of network mail order"  "1 Month Supply via out-of-network mail order pharmacy."
* #3-month-in-retail   	"3 month in network retail"  "3 Month Supply via in-network retail pharmacy."
* #3-month-out-retail   "3 month out of network retail"  "3 Month Supply via out-of-network retail pharmacy."
* #3-month-in-mail      "3 month in network mail order"  "3 Month Supply via in-network mail order pharmacy."
* #3-month-out-mail     "3 month out of network mail order"  "3 Month Supply via out-of-network mail order pharmacy."
* ^caseSensitive = true
* ^experimental = false

CodeSystem: BenefitCostTypeCS
Id:             usdf-BenefitCostTypeCS-TEMPORARY-TRIAL-USE
Title: "Codes for benefit type of cost"
Description: "Types of out of pockets costs associated with the benefit"
* #copay               "Copay"  "A flat fee the member pays to fill the prescription."
* #coinsurance         "Coinsurance"  "A percentage of the cost to fill the prescription, usually after the deductible has been met."
* ^caseSensitive = true
* ^experimental = false

CodeSystem: InsuranceItemTypeCS
Id:             usdf-InsuranceItemTypeCS
Title: "Codes for insurance item type"
Description: "Types of insurance items"
* #formulary-item      "Formulary Item"  "An entry in a formulary."
* ^caseSensitive = true
* ^experimental = false

/* 
FHIR-34758 - Merge copay and coinsurance option CS into CostShareOption CS
CodeSystem: CopayOptionCS
Id:             usdf-CopayOptionCS
Title: "Codes for qualifier of copay amount"
Description: "Codes for qualifier of copay amount"
* #after-deductible               "After Deductible"  "The consumer first pays the deductible, and after the deductible is met, the consumer is responsible only for the copay (this indicates that this benefit is subject to the deductible)."
* #before-deductible              "Before Deductible"  "The consumer first pays the copay, and any net remaining allowed charges accrue to the deductible (this indicates that this benefit is subject to the deductible)."
* #no-charge                      "No Charge"  "No cost sharing is charged (this indicates that this benefit is not subject to the deductible)."
* #no-charge-after-deductible     "No Charge After Deductible"  "The consumer first pays the deductible, and after the deductible is met, no copayment is charged (this indicates that this benefit is subject to the deductible)."
* #charge                         "Charge"  "The consumer always pays just the copay and the issuer pays the remainder of allowed charges (this indicates that this benefit is not subject to the deductible)."
* #not-applicable                 "Not Applicable"  "Deductible is not applicable: Zero-deductible cost sharing represented by a co-pay value of 'Not applicable' and co-insurance value of 'No charge'."
* #deductible-waived              "Deductible Waived"  "The consumer pays the copay with deductible requirement waived."
* ^caseSensitive = true

CodeSystem: CoInsuranceOptionCS
Id:             usdf-CoinsuranceOptionCS
Title: "Code for qualifier for coinsurance rate codes"
Description: "Code for qualifier for coinsurance rate"
* #after-deductible              "After Deductible"  "The consumer first pays the deductible, and after the deductible is met, the consumer pays the coinsurance portion of allowed charges (this indicates that this benefit is subject to the deductible)."
* #no-charge                     "No Charge"  "No cost sharing is charged (this indicates that this benefit is not subject to the deductible)."
* #no-charge-after-deductible    "No Charge After Deductible"  "The consumer first pays the deductible, and after the deductible is met, no coinsurance is charged (this indicates that this benefit is subject to the deductible)."
* #charge                        "Charge"  "The consumer always pays just the coinsurance and the issuer pays the remainder of allowed charges (this indicates that this benefit is not subject to the deductible)."
* #not-applicable                "Not Applicable"  "The consumer pays only a copay. Note: When using Not Applicable for coinsurance, Not Applicable cannot also be used for copay (unless the drug tier type is Medical Service Drugs)."
* #deductible-waived             "Deductible Waived"  "The consumer pays the coinsurance with deductible requirement waived."
* ^caseSensitive = true
*/

CodeSystem: CostShareOptionCS
Id: usdf-CostShareOptionCS-TEMPORARY-TRIAL-USE
Title: "Codes qualifying the type of cost share amount"
Description: "Codes for qualifier of copay amount"
* #after-deductible             "After Deductible"	"The consumer first pays the deductible, and after the deductible is met, the consumer is responsible only for the cost-share amount (this indicates that this benefit is subject to the deductible)."
* #before-deductible	        "Before Deductible"  "The consumer first pays the cost share amount, and any net remaining allowed charges accrue to the deductible (this indicates that this benefit is subject to the deductible)."
* #no-charge	                "No Charge"	"No cost sharing is charged (this indicates that this benefit is not subject to the deductible)."
* #no-charge-after-deductible   "No Charge After Deductible"	"The consumer first pays the deductible, and after the deductible is met, no cost share amount is charged (this indicates that this benefit is subject to the deductible)."
* #charge	                    "Charge"	"The consumer always pays just the cost share amount and the issuer pays the remainder of allowed charges (this indicates that this benefit is not subject to the deductible)."
* #coinsurance-not-applicable	"Coinsurance Not Applicable"	"The consumer pays only a copay. Note: When using Not Applicable for coinsurance, Not Applicable cannot also be used for copay (unless the drug tier type is Medical Service Drugs)."
* #copay-not-applicable	        "Copay Not Applicable"	"Deductible is not applicable: Zero-deductible cost sharing represented by a co-pay value of 'Not applicable' and co-insurance value of 'No charge'."
* #deductible-waived	        "Deductible Waived"	"The consumer pays the cost share amount with deductible requirement waived."
* ^caseSensitive = true
* ^experimental = false

/* FHIR-35600 - Change to different CS
CodeSystem: PlanTypeCS
Id:             usdf-PlanTypeCS
Title: "Codes for type of plan"
Description: "Types of plans"
* #drug         "Drug"  "Drug plan"
* ^caseSensitive = true
*/



CodeSystem: PlanContactTypeCS
Id:             usdf-PlanContactTypeCS-TEMPORARY-TRIAL-USE
Title: "Codes for type of plan contact"
Description: "Type of plan contact"
* #MARKETING "Marketting" "Plan Marketing Information"
* #SUMMARY "Summary" "Plan Summary Information"
* #FORMULARY "Formulary" "Plan Formulary Information"
* ^caseSensitive = true
* ^experimental = false