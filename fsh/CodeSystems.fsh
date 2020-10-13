CodeSystem: DrugTierCS
Id:             usdf-DrugTierCS
Title: "Codes for medication drug tiers in health plans"
Description: "Codes to represent the drug tier of a particular medication in a health plan.  Base set are examples.  Each plan may have its own controlled vocabulary."
* #generic                    "Generic: Commonly prescribed generic drugs that cost more than drugs in the ‘preferred generic’ tier."
* #preferred-generic          "Preferred Generic: Commonly prescribed generic drugs."
* #non-preferred-generic      "Non-preferred Generic: Generic drugs that cost more than drugs in ‘generic’ tier."
* #specialty                  "Specialty: Drugs used to treat complex conditions like cancer and multiple sclerosis. They can be generic or brand name, and are typically the most expensive drugs on the formulary."
* #brand                      "Brand: Brand name drugs that cost more than ‘preferred brand’ drugs."
* #preferred-brand           "Preferred Brand: Brand name drugs"
* #non-preferred-brand        "Non-preferred Brand: Brand name drugs that cost more than ‘brand’ drugs."
* #zero-cost-share-preventative "Zero cost-share preventative: Preventive medications and products available at no cost."
* #medical-service           "Medical Service: Drugs that must be administered by a clinician or in a facility and may be covered under a medical benefit."

CodeSystem: PharmacyTypeCS
Id:             usdf-PharmacyTypeCS
Title: "Codes for types of pharmacies"
Description: "Codes for types of Pharmacies. Each payer will have its own controlled vocabulary."
* #1-month-in-retail    "1 month in network retail: 1 Month Supply via in-network retail pharmacy."
* #1-month-out-retail   "1 month out of network retail: 1 Month Supply via out-of-network retail pharmacy."
* #1-month-in-mail    	"1 month in network mail order: 1 Month Supply via in-network mail order pharmacy."
* #1-month-out-mail   	"1 month out of network mail order: 1 Month Supply via out-of-network mail order pharmacy."
* #3-month-in-retail   	"3 month in network retail: 3 Month Supply via in-network retail pharmacy."
* #3-month-out-retail   "3 month out of network retail: 3 Month Supply via out-of-network retail pharmacy."
* #3-month-in-mail      "3 month in network mail order: 3 Month Supply via in-network mail order pharmacy."
* #3-month-out-mail     "3 month out of network mail order: 3 Month Supply via out-of-network mail order pharmacy."

CodeSystem: CopayOptionCS
Id:             usdf-CopayOptionCS
Title: "Codes for qualifier of copay amount"
Description: "Codes for qualifier of copay amount"
* #after-deductible               "After Deductible: The consumer first pays the deductible, and after the deductible is met, the consumer is responsible only for the copay (this indicates that this benefit is subject to the deductible). "
* #before-deductible              "Before Deductible: The consumer first pays the copay, and any net remaining allowed charges accrue to the deductible (this indicates that this benefit is subject to the deductible)."
* #no-charge                      "No Charge: No cost sharing is charged (this indicates that this benefit is not subject tothe deductible)."
* #no-charge-after-deductible     "No Charge After Deductible: The consumer first pays the deductible, and after the deductible is met, no copayment is charged (this indicates that this benefit is subject to the deductible)."

CodeSystem: CoInsuranceOptionCS
Id:             usdf-CoinsuranceOptionCS
Title: "Code for qualifier for coinsurance rate"
Description: "Code for qualifier for coinsurance rate"
* #after-deductible              "After Deductible: The consumer first pays the deductible, and afterthe deductible is met, the consumer pays the coinsurance portion of allowed charges (this indicates that this benefit is subject to the deductible)."
* #no-charge                     "No Charge: No cost sharing is charged (this indicates that this benefit is not subject to the deductible)."
* #no-charge-after-deductible    "No Charge After Deductible: The consumer first pays the deductible, and after thedeductible is met, no coinsurance is charged (this indicates that this benefit is subject to the deductible)"

