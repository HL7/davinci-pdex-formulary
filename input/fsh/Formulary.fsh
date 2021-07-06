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

Profile:        FormularyDrug
Parent:         MedicationKnowledge
Id:             usdf-FormularyDrug
Title:          "Formulary Drug"
Description:    "Drug information which is part of a formulary."
* extension contains
    DrugAlternatives named usdf-DrugAlternatives-extension 0..* and 
    PriorAuthorization named usdf-PriorAuthorization-extension 0..1 MS and
    StepTherapyLimit named usdf-StepTherapyLimit-extension 0..1 MS and
    QuantityLimit named usdf-QuantityLimit-extension 0..1 MS and
    PlanID named usdf-PlanID-extension 1..1 MS and
    DrugTierID named usdf-DrugTierID-extension 1..1 MS
* code 1..1 
* code from  http://hl7.org/fhir/us/core/ValueSet/us-core-medication-codes (required)
