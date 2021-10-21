// TODO checnge to DrugPlan?
Profile:        PayerInsurancePlan
Parent:         InsurancePlan
Id:             usdf-PayerInsurancePlan
Title:          "Payer Insurance Plan"
Description:    "The Payer InsurancePlan that defines the health insurance product, which include coverage benefits that are offered, and additional information about the offering, such as a coverage area, contact information, brochure locations, etc. The health insurance product offers one or more types of coverage, each of which may define a plan of covered benefits with the particular cost sharing structure offered to a consumer. Health insurance plans that include drug coverage reference a formulary that provides details about drugs that are covered under the plan including requirements and limitations of the coverage specific to each drug."

* meta.lastUpdated 1..1

* identifier 1..* MS
* status 1..1 MS

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
* contact[patient-plan-contact].telecom.system 1..1
* contact[patient-plan-contact].telecom.value 1..1 
* contact[patient-plan-contact].telecom ^short = "Patient Info Contact (email/website/phone number)"


// *********TODO how do we want to deal with additional contact types (formulary vs general)


* coverage 1..* MS
* coverage.type 1..1 MS
* coverage.type = http://terminology.hl7.org/CodeSystem/v3-ActCode#DRUGPOL
* coverage.extension 1..* MS
* coverage.extension contains
    FormularyReference named usdf-FormularyReference-extension 1..* MS
// ****************** TODO need slicing, Need a drug coverage code

* coverage.benefit.type from PlanTypeVS (extensible)

* coverage.benefit ^slicing.discriminator.path = "type"
* coverage.benefit ^slicing.rules = #open
* coverage.benefit ^slicing.discriminator.type = #pattern 
* coverage.benefit ^slicing.ordered = false   // can be omitted, since false is the default
* coverage.benefit ^slicing.description = "Slice based on $this pattern"

* coverage.benefit contains
    drug-plan 1..* MS

* coverage.benefit[drug-plan].type = PlanTypeCS#drug


* plan 1..* MS
* plan.type from PlanTypeVS (extensible)

* plan ^slicing.discriminator.path = "type"
* plan ^slicing.rules = #open
* plan ^slicing.discriminator.type = #pattern 
* plan ^slicing.ordered = false   // can be omitted, since false is the default
* plan ^slicing.description = "Slice based on $this pattern"
* plan contains 
   drug-plan 1..* MS


* plan[drug-plan].type = PlanTypeCS#drug
//* plan.type from PharmacyTypeVS (extensible)
//* plan.type ^short = "Pharmacy network type"
* plan[drug-plan].network MS



* plan[drug-plan].specificCost 1..* MS
* plan[drug-plan].specificCost ^short = "Pharmacy network type specific cost"
* plan[drug-plan].specificCost.category 1..1 MS
* plan[drug-plan].specificCost.category from PharmacyTypeVS (extensible)


* plan[drug-plan].specificCost.benefit 1..* MS
// TODO need a codeSystem for plan.specificCost.benefit.type to represent prescription fill

* plan[drug-plan].specificCost.benefit ^short = "Drug tier benefit"
* plan[drug-plan].specificCost.benefit.type 1..1 MS
* plan[drug-plan].specificCost.benefit.type from DrugTierVS (required)


* plan[drug-plan].specificCost.benefit.cost 1..* MS
* plan[drug-plan].specificCost.benefit.cost.type from BenefitCostTypeVS (extensible)
* plan[drug-plan].specificCost.benefit.cost.qualifiers 1..1 MS
* plan[drug-plan].specificCost.benefit.cost.value MS

* plan[drug-plan].specificCost.benefit.cost ^slicing.discriminator.path = "type"
* plan[drug-plan].specificCost.benefit.cost ^slicing.rules = #open
* plan[drug-plan].specificCost.benefit.cost ^slicing.discriminator.type = #pattern 
* plan[drug-plan].specificCost.benefit.cost ^slicing.ordered = false   // can be omitted, since false is the default
* plan[drug-plan].specificCost.benefit.cost ^slicing.description = "Slice based on $this pattern"
* plan[drug-plan].specificCost.benefit.cost contains 
   copay 0..1 MS and
   coinsurance 0..1 MS

* plan[drug-plan].specificCost.benefit.cost[copay].type = BenefitCostTypeCS#copay
* plan[drug-plan].specificCost.benefit.cost[copay].qualifiers from CopayOptionVS (required)
* plan[drug-plan].specificCost.benefit.cost[copay].value only MoneyQuantity
* plan[drug-plan].specificCost.benefit.cost[copay].value.value 1..1 MS
* plan[drug-plan].specificCost.benefit.cost[copay].value.system = "urn:iso:std:iso:4217"
* plan[drug-plan].specificCost.benefit.cost[copay].value.code = #USD

* plan[drug-plan].specificCost.benefit.cost[coinsurance].type = BenefitCostTypeCS#coinsurance
* plan[drug-plan].specificCost.benefit.cost[coinsurance].qualifiers from CoinsuranceOptionVS (required)
* plan[drug-plan].specificCost.benefit.cost[coinsurance].value.code = #%
* plan[drug-plan].specificCost.benefit.cost[coinsurance].value.system = "http://unitsofmeasure.org"







Profile:        Formulary
Parent:         InsurancePlan
Id:             usdf-Formulary
Title:          "Formulary"
Description:    "The Formulary provides general information about a formulary and acts as an organizing construct that associated FormularyItem resources point to. The Formulary combined with its associated FormularyItem and FormularyDrug resources respresent a formulary list that includes the set of drugs covered and the requirements and limitations of the coverage."

* meta.lastUpdated 1..1
* identifier 1..* MS
* status 1..1 MS

* type 1..1 MS 
* type = $HL7v3-ActCode#DRUGPOL
* type ^short = "Plan type"

* name MS
//* alias MS
* period MS


// .............TODO, Is the list of pharmacy etwork types and drug tiers useful? Could be useful in terntermining which type can ve searched for.
* plan 0..1 
* plan.type 1..1 
* plan.type = PlanTypeCS#drug

* plan.specificCost ^short = "Pharmacy network type specific cost"
* plan.specificCost.category from PharmacyTypeVS (extensible)

* plan.specificCost.benefit ^short = "Drug tier benefit"
* plan.specificCost.benefit.type from DrugTierVS (extensible)


// ********TODO Add guidance on the specific Costs and benefits, that they can be used to express all of the pharmacies and drug tiers available under the plan and can be used to determine what types to search for (this of course can also be under the top plan)



Profile:        FormlaryItem
Parent:         Basic
Id:             usdf-FormularyItem
Title:          "Formulary Item"
Description:    "A resource that describes a drug's relationship to a drug plan, including drug tier, prior authorization requirements, and more. The set of FormuaryItem resrouces associated with a particular drug plan represents the drug plans formulary."

* meta.lastUpdated 1..1

* extension contains
    FormularyReference named usdf-FormularyReference-extension 1..1 MS and
    AvailabilityStatus named usdf-AvailabilityStatus-extension 1..1 MS and
    AvailabilityPeriod named usdf-AvailabilityPeriod-extension 0..1 MS and
    PharmacyType named usdf-PharmacyType-extension 0..* and
    DrugTierID named usdf-DrugTierID-extension 1..1 MS and
    PriorAuthorization named usdf-PriorAuthorization-extension 0..1 MS and
    PriorAuthorizationNewStartsOnly named usdf-PriorAuthorizationNewStartsOnly-extension 0..1 MS and
    StepTherapyLimit named usdf-StepTherapyLimit-extension 0..1 MS and
    StepTherapyLimitNewStartsOnly named usdf-StepTherapyLimitNewStartsOnly-extension 0..1 MS and
    QuantityLimit named usdf-QuantityLimit-extension 0..1 MS and 
    QuantityLimitDetail named usdf-QuantityLimitDetail-extension 0..1 MS
    
//* extension[PriorAuthorizationNewStartOnly] ^short =  

* code 1..1
* code = InsuranceItemTypeCS#formulary-item
* subject 1..1 MS
* subject only Reference(FormularyDrug)



Profile:        FormularyDrug
Parent:         MedicationKnowledge
Id:             usdf-FormularyDrug
Title:          "Formulary Drug"
Description:    "Drug information which may be part of a formulary including its RxNorm code, synonyms, and optionally drug classification and alternatives."

* meta.lastUpdated 1..1
* code 1..1 
* code from $HL7-USCore-MedicationCodes (required)
* status 1..1 MS
* doseForm MS
* synonym MS
//* relatedMedicationKnowledge MS
//* relatedMedicationKnowledge.type from RelatedMedicationTypeVS (extensible)
//* relatedMedicationKnowledge.reference only Reference(FormularyDrug)

// TODO Do we need to create a new FHIR Code System for pharmacologic class? https://www.fda.gov/regulatory-information/fdaaa-implementation-chart/usp-therapeutic-categories-model-guidelines
* medicineClassification MS



Profile:        InsurancePlanLocation
Parent:         Location
Id:             usdf-InsurancePlanLocation
Title:          "Insurance Plan Location"
Description:    "A Location describing a geographic region or are where the insurance plan coverage is available."

* meta.lastUpdated 1..1
* extension contains
    $GeoJSONExtension named region 0..1 MS
* extension[region] ^short = "Associated Region (GeoJSON)"
* name MS
* description MS
* address MS

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










/*

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


/*
Invariant:  StepTherapyLimit-NewStartsOnly
Description: "StepTherapyLimitNewStartsOnly exists only if StepTherapyLimit = true"
Expression: "atient.contact.telecom.where(use = 'official')).exists()"
Severity:   #error
*/