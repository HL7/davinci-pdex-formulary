Profile:        PayerInsurancePlan
Parent:         InsurancePlan
Id:             usdf-PayerInsurancePlan
Title:          "Payer Insurance Plan"
Description:    "The Payer InsurancePlan that defines the top level package of health insurance coverage benefits that are offered. A given payer’s products typically differ by network type and/or covered benefits. A plan pairs a product’s covered benefits with the particular cost sharing structure offered to a consumer. A given product may comprise multiple sub-plans including a Drug Plan

This InsurancePlan to support Formulary describes a health insurance offering comprised of, at a minimum, a single or a set of drug plans and additional information about the offering, such as who it is owned and administered by, a coverage area, contact information, etc."



* extension contains
    MemberPlanReference named usdf-MemberPlan-extension 1..* MS

* identifier 1..* MS
* status 1..1
* status = #active (exactly)

* type 1..1 MS 
* type from $PlanNetInsuranceProductTypeVS (extensible)
* type ^short = "Product type"

* name MS
//* alias MS
* period MS

//* ownedBy 1..1 MS
//* ownedBy only Reference(PlannetOrganization)
//* administeredBy 1..1 MS
//* administeredBy only Reference(PlannetOrganization)
// [TODO] We need alignment between plan net insurancePlan location and Formulary InsurancePlan location
* coverageArea only Reference(InsurancePlanLocation)
* coverageArea MS

* contact.name MS
* contact.name.text MS
* contact.telecom MS
* contact.telecom.value MS
* contact.telecom.system MS

* contact ^slicing.discriminator.path = "purpose"
* contact ^slicing.rules = #open
* contact ^slicing.discriminator.type = #pattern 
* contact ^slicing.ordered = false   // can be omitted, since false is the default
* contact ^slicing.description = "Slice based on $this pattern"
* contact contains 
   patient-plan-contact 0..* MS
* contact[patient-plan-contact].purpose = http://terminology.hl7.org/CodeSystem/contactentity-type#PATINF
* contact[patient-plan-contact].telecom 1..* MS
/*
* endpoint ^short = "Endpoint for additional information"
* endpoint only Reference(InsurancePlanEndpoint)
* endpoint MS 
*/





Profile:        InsuranceDrugPlan
Parent:         InsurancePlan
Id:             usdf-InsuranceDrugPlan
Title:          "Drug Insurance Plan"
Description:    "The Drug InsurancePlan describes a prescription drug insurance offering comprised of drug benefits including a definition of drug tiers and their associated cost-sharing models and additional information about the plan, such as networks, a coverage area, contact information, etc."


// no sub formulary plans
//* extension contains
//    MemberPlan named usdf-MemberPlan-extension 1..* MS
* identifier 1..* MS
* status 1..1
* status = #active (exactly)

* type 1..1 MS 
* type = $HL7v3-ActCode#DRUGPOL
* type ^short = "Plan type"

* name MS
//* alias MS
* period MS

//* ownedBy 1..1 MS
//* ownedBy only Reference(PlannetOrganization)
//* administeredBy 1..1 MS
//* administeredBy only Reference(PlannetOrganization)
// [TODO] We need alignment between plan net insurancePlan location and Formulary InsurancePlan location
* coverageArea only Reference(InsurancePlanLocation)
* coverageArea MS

* contact.name MS
* contact.name.text MS
* contact.telecom MS
* contact.telecom.value MS
* contact.telecom.system MS

* contact ^slicing.discriminator.path = "purpose"
* contact ^slicing.rules = #open
* contact ^slicing.discriminator.type = #pattern 
* contact ^slicing.ordered = false   // can be omitted, since false is the default
* contact ^slicing.description = "Slice based on $this pattern"
* contact contains 
   patient-drugplan-contact 0..* MS
* contact[patient-drugplan-contact].purpose = http://terminology.hl7.org/CodeSystem/contactentity-type#PATINF
* contact[patient-drugplan-contact].telecom 1..* MS
/*
* endpoint ^short = "Endpoint for additional information"
* endpoint only Reference(InsurancePlanEndpoint)
* endpoint MS 
*/

* plan 1..* MS
* plan.type 1..1 MS
* plan.type from PharmacyTypeVS (extensible)
* plan.type ^short = "Phamracy network type"
* plan.network MS

* plan.specificCost 1..* MS
* plan.specificCost ^short = "Drug tier costs"
* plan.specificCost.category 1..1 MS
* plan.specificCost.category from DrugTierVS (extensible)

* plan.specificCost.benefit 1..* MS
// TODO need a codeSystem for plan.specificCost.benefit.type to represent prescription fill

* plan.specificCost.benefit.type MS
* plan.specificCost.benefit.type from BenefitTypeVS (required)
* plan.specificCost.benefit.type = BenefitTypeCS#drug

* plan.specificCost.benefit.cost 1..* MS
* plan.specificCost.benefit.cost.type from BenefitCostTypeVS (extensible)
* plan.specificCost.benefit.cost.qualifiers 1..1 MS
* plan.specificCost.benefit.cost.value MS

* plan.specificCost.benefit.cost ^slicing.discriminator.path = "type"
* plan.specificCost.benefit.cost ^slicing.rules = #open
* plan.specificCost.benefit.cost ^slicing.discriminator.type = #pattern 
* plan.specificCost.benefit.cost ^slicing.ordered = false   // can be omitted, since false is the default
* plan.specificCost.benefit.cost ^slicing.description = "Slice based on $this pattern"
* plan.specificCost.benefit.cost contains 
   copay 0..1 MS and
   coinsurance 0..1 MS

* plan.specificCost.benefit.cost[copay].type = BenefitCostTypeCS#copay
* plan.specificCost.benefit.cost[copay].qualifiers from CopayOptionVS (required)
* plan.specificCost.benefit.cost[copay].value only MoneyQuantity

* plan.specificCost.benefit.cost[coinsurance].type = BenefitCostTypeCS#coinsurance
* plan.specificCost.benefit.cost[coinsurance].qualifiers from CoinsuranceOptionVS (required)
* plan.specificCost.benefit.cost[coinsurance].value.code = #%
* plan.specificCost.benefit.cost[coinsurance].value.system = "http://unitsofmeasure.org"



Profile:        FormlaryItem
Parent:         Basic
Id:             usdf-FormularyItem
Title:          "Formulary Item"
Description:    "A resource that describes a drug's relationship to a drug plan, including drug tier, prior authorization requirements, and more. The set of FormuaryItem resrouces associated with a particular drug plan represents the drug plans formulary."

* extension contains
    DrugPlanReference named usdf-DrugPlanReference-extension 1..1 MS and
    DrugTierID named usdf-DrugTierID-extension 1..1 MS and
    PriorAuthorization named usdf-PriorAuthorization-extension 0..1 MS and
    StepTherapyLimit named usdf-StepTherapyLimit-extension 0..1 MS and
    QuantityLimit named usdf-QuantityLimit-extension 0..1 MS and
    MailOrder named usdf-MailOrder-extension 0..1

* code 1..1
* code = InsuranceItemTypeCS#formulary-item
* subject only Reference(FormularyDrug)



Profile:        FormularyDrug
Parent:         MedicationKnowledge
Id:             usdf-FormularyDrug
Title:          "Formulary Drug"
Description:    "Drug information which may be part of a formulary including its RxNorm code, synonyms, and optionally drug classification and alternatives."

* code 1..1 
* code from $HL7-USCore-MedicationCodes (required)
* doseForm MS
* synonym MS
* relatedMedicationKnowledge MS
* relatedMedicationKnowledge.type from RelatedMedicationTypeVS (extensible)
* relatedMedicationKnowledge.reference only Reference(FormularyDrug)

// TODO Do we need to create a new FHIR Code System for pharmacologic class? https://www.fda.gov/regulatory-information/fdaaa-implementation-chart/usp-therapeutic-categories-model-guidelines
* medicineClassification MS



Profile:        InsurancePlanLocation
Parent:         Location
Id:             usdf-InsurancePlanLocation
Title:          "Insurance Plan Location"
Description:    "A Location describing a geographic region or are where the insurance plan coverage is available."

//* meta.lastUpdated 1..1
* extension contains
    $GeoJSONExtension named region 0..1 MS
* extension[region] ^short = "Associated Region (GeoJSON)"
* name MS
* description MS

/*
Profile:        InsurancePlanEndpoint
Parent:         Endpoint
Id:             usdf-InsurancePlanEndpoint 
Title:          "Insurance Plan Endpoint"
Description:    "The technical details of an endpoint that can be used for additional plan service or information, such as a portal, brochure, or summary of benefits."

//* meta.lastUpdated 1..1
//* extension contains 
//    EndpointUsecase named endpoint-usecase 0..* MS
//* extension[endpoint-usecase] ^short = "Endpoint Usecase"
* status 1..1 MS
* status = #active (exactly) 
* connectionType MS 
// [TODO] Need to define a connection type of http and https
//* connectionType from EndpointConnectionTypeVS (extensible)
//* connectionType ^binding.extension[0].url = $MinValueSet
//* connectionType ^binding.extension[0].valueCanonical = $MinEndpointConnectionTypeVS  
* name MS
//* managingOrganization only Reference(PlannetOrganization)
//* managingOrganization MS
//* contact MS
//* contact.value MS
//* contact.system MS
// TODO payload type in plan net is set to NA only.
//* payloadType 1..1 MS 
//* payloadType from EndpointPayloadTypeVS (extensible)
//* payloadMimeType MS
* address MS
*/

// extensions
// usdf-MemberPlan-extension

// TODO
// Add guidance on a contained or separate resource









// OLDER -------------------------------------------












Profile:        CoveragePlan
Parent:         List
Id:             usdf-CoveragePlan
Title:          "Formulary Coverage Plan"
Description:    "A health plan which contains links to administrative information, a list of formulary drugs covered under that plan, and a definition of drug tiers and their associated cost-sharing models."
* extension contains
    DrugTierDefinition named usdf-DrugTierDefinition-extension 1..* MS and
    Network  named usdf-Network-extension  1..* MS and
    SummaryURL named usdf-SummaryURL-extension 1..1 MS and
    FormularyURL named usdf-FormularyURL-extension 0..1 MS and
    EmailPlanContact named usdf-EmailPlanContact-extension 0..1 MS and
    MarketingURL named usdf-MarketingURL-extension 0..1 MS and
    PlanIDType named usdf-PlanIDType-extension 1..1 MS
* code 1..1 
* code = http://terminology.hl7.org/CodeSystem/v3-ActCode#DRUGPOL


/*
Profile:        FormularyDrug
Parent:         MedicationKnowledge
Id:             usdf-FormularyDrug
Title:          "Formulary Drug"
Description:    "Drug information which is part of a formulary including its RxNorm code, the PlanID of the formulary, information on prescribing limitations, and optionally drug classification and alternatives."
* extension contains
    DrugAlternatives named usdf-DrugAlternatives-extension 0..* and 
    PriorAuthorization named usdf-PriorAuthorization-extension 0..1 MS and
    StepTherapyLimit named usdf-StepTherapyLimit-extension 0..1 MS and
    QuantityLimit named usdf-QuantityLimit-extension 0..1 MS and
    MailOrder named usdf-MailOrder-extension 0..1 and
    PlanID named usdf-PlanID-extension 1..1 MS and
    DrugTierID named usdf-DrugTierID-extension 1..1 MS
* code 1..1 
* code from  http://hl7.org/fhir/us/core/ValueSet/us-core-medication-codes (required)
*/