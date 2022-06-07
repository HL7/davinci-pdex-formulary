Profile:        PayerInsurancePlan
Parent:         InsurancePlan
Id:             usdf-PayerInsurancePlan
Title:          "Payer Insurance Plan"
Description:    "The Payer InsurancePlan that defines the health insurance product, which include coverage benefits that are offered, and additional information about the offering, such as a coverage area, contact information, brochure locations, etc. The health insurance product offers one or more types of coverage, each of which may define a plan of covered benefits with the particular cost sharing structure offered to a consumer. Health insurance plans that include drug coverage reference a formulary that provides details about drugs that are covered under the plan including requirements and limitations of the coverage specific to each drug."

* meta.lastUpdated 1..1 MS // Add MS FHIR-34527

* identifier 1..* MS
* status 1..1 MS

* type 1..1 MS 
* type from $PlanNetInsuranceProductTypeVS (extensible)
* type ^short = "Product type"

* name MS
* period MS

* coverageArea only Reference(InsurancePlanLocation)
* coverageArea MS

* contact ^short = "Contact information for the Insurance Plan including URLs for brochure and formulary information"
* contact.name MS
* contact.name.text MS
* contact.telecom MS
* contact.telecom.value MS
* contact.telecom.system MS

* contact.purpose from PlanContactTypeVS (extensible)


* coverage 1..* MS
* coverage.type 1..1 MS
* coverage ^slicing.discriminator.path = "type"
* coverage ^slicing.rules = #open
* coverage ^slicing.discriminator.type = #pattern 
* coverage ^slicing.ordered = false   // can be omitted, since false is the default
* coverage ^slicing.description = "Slice based on $this pattern"

* coverage contains
    drug-coverage 1..* MS



* coverage[drug-coverage].type = http://terminology.hl7.org/CodeSystem/v3-ActCode#DRUGPOL
* coverage[drug-coverage].extension 1..* MS
* coverage[drug-coverage].extension contains
    FormularyReference named usdf-FormularyReference-extension 1..* MS

* coverage[drug-coverage].benefit.type from $HL7InsurancePlanTypeVS (extensible)

* coverage[drug-coverage].benefit ^slicing.discriminator.path = "type"
* coverage[drug-coverage].benefit ^slicing.rules = #open
* coverage[drug-coverage].benefit ^slicing.discriminator.type = #pattern 
* coverage[drug-coverage].benefit ^slicing.ordered = false   // can be omitted, since false is the default
* coverage[drug-coverage].benefit ^slicing.description = "Slice based on $this pattern"

* coverage[drug-coverage].benefit contains
    drug-plan 1..* MS

* coverage[drug-coverage].benefit[drug-plan].type = $HL7InsurancePlanTypeCS#Drug "Drug"


* plan 1..* MS
* plan.type from $HL7InsurancePlanTypeVS (extensible)

* plan ^slicing.discriminator.path = "type"
* plan ^slicing.rules = #open
* plan ^slicing.discriminator.type = #pattern 
* plan ^slicing.ordered = false   // can be omitted, since false is the default
* plan ^slicing.description = "Slice based on $this pattern"
* plan contains 
   drug-plan 1..* MS


* plan[drug-plan] ^short = "Drug plan"
* plan[drug-plan].type = $HL7InsurancePlanTypeCS#Drug "Drug"
* plan[drug-plan].network ^short = "Pharmacy benefit types that are part of the drug plan"



* plan[drug-plan].specificCost 1..* MS
* plan[drug-plan].specificCost ^short = "Pharmacy benefit type specific cost"
* plan[drug-plan].specificCost.category 1..1 MS
* plan[drug-plan].specificCost.category from PharmacyBenefitTypeVS (extensible)
* plan[drug-plan].specificCost.category ^short = "Pharmacy Benefit Type"


* plan[drug-plan].specificCost.benefit 1..* MS

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
* plan[drug-plan].specificCost.benefit.cost ^slicing.ordered = false
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

* plan[drug-plan].specificCost.benefit.cost[copay] ^short = "Copay costs"

* plan[drug-plan].specificCost.benefit.cost[coinsurance].type = BenefitCostTypeCS#coinsurance
* plan[drug-plan].specificCost.benefit.cost[coinsurance].qualifiers from CoinsuranceOptionVS (required)
* plan[drug-plan].specificCost.benefit.cost[coinsurance].value.code = #%
* plan[drug-plan].specificCost.benefit.cost[coinsurance].value.system = "http://unitsofmeasure.org"

* plan[drug-plan].specificCost.benefit.cost[coinsurance] ^short = "Coinsurance costs"


Profile:        Formulary
Parent:         InsurancePlan
Id:             usdf-Formulary
Title:          "Formulary"
Description:    "The Formulary provides general information about a formulary and acts as an organizing construct that associated FormularyItem resources point to. The Formulary combined with its associated FormularyItem and FormularyDrug resources represent a formulary list that includes the set of drugs covered and the requirements and limitations of the coverage."

* meta.lastUpdated 1..1 MS // Add MS FHIR-34527
* identifier 1..* MS
* status 1..1 MS

* type 1..1 MS 
* type = $HL7v3-ActCode#DRUGPOL
* type ^short = "Plan type"

* name MS
* period MS

* plan 0..1 
* plan ^short = "Optional non-cost related plan information indicating pharmacy benefit types and drug tiers available in the formulary"
* plan.type 1..1 
* plan.type = $HL7InsurancePlanTypeCS#Drug "Drug"

* plan.specificCost ^short = "Pharmacy benefit type specific cost"
* plan.specificCost.category from PharmacyBenefitTypeVS (extensible)

* plan.specificCost.benefit ^short = "Drug tier benefit"
* plan.specificCost.benefit.type from DrugTierVS (extensible)



Profile:        FormularyItem
Parent:         Basic
Id:             usdf-FormularyItem
Title:          "Formulary Item"
Description:    "A resource that describes a drug's relationship to a drug plan, including drug tier, prior authorization requirements, and more. The set of FormularyItem resources associated with a particular drug plan represents the drug plans formulary."

* meta.lastUpdated 1..1 MS // Add MS FHIR-34527

* extension contains
    FormularyReference named usdf-FormularyReference-extension 1..1 MS and
    AvailabilityStatus named usdf-AvailabilityStatus-extension 1..1 MS and
    AvailabilityPeriod named usdf-AvailabilityPeriod-extension 0..1 MS and
    PharmacyBenefitType named usdf-PharmacyBenefitType-extension 1..* MS and // Add MS FHIR-34527, make 1..* FHIR-36142	
    DrugTierID named usdf-DrugTierID-extension 1..1 MS and
    PriorAuthorization named usdf-PriorAuthorization-extension 0..1 MS and
    PriorAuthorizationNewStartsOnly named usdf-PriorAuthorizationNewStartsOnly-extension 0..1 and // Remove MS FHIR-34527
    StepTherapyLimit named usdf-StepTherapyLimit-extension 0..1 MS and
    StepTherapyLimitNewStartsOnly named usdf-StepTherapyLimitNewStartsOnly-extension 0..1 and // Remove MS FHIR-34527
    QuantityLimit named usdf-QuantityLimit-extension 0..1 MS and 
    QuantityLimitDetail named usdf-QuantityLimitDetail-extension 0..1 and // Remove MS FHIR-34527
    AdditionalCoverageInformation named usdf-AdditionalCoverageInformation-extension 0..1

* code 1..1
* code = InsuranceItemTypeCS#formulary-item
* subject 1..1 MS
* subject only Reference(FormularyDrug)



Profile:        FormularyDrug
Parent:         MedicationKnowledge
Id:             usdf-FormularyDrug
Title:          "Formulary Drug"
Description:    "Drug information which may be part of a formulary including its RxNorm code and dose form."

* meta.lastUpdated 1..1 MS // Add MS FHIR-34527
* code 1..1 MS
//* code from SemanticDrugVS (required)

* code.coding 1..* MS


* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.ordered = false
* code.coding ^slicing.description = "Slice based on code value"
* code.coding contains 
   semantic-drug 1..* MS and
   semantic-drug-form-group 0..* MS

* code.coding[semantic-drug] ^short = "Semantic clinical or brand drug or pack including strength"
* code.coding[semantic-drug].code 1..1 MS
* code.coding[semantic-drug].system 1..1 MS
* code.coding[semantic-drug] from SemanticDrugVS (required)
//* code.coding[semantic-drug].system = $RxNorm

* code.coding[semantic-drug-form-group] ^short = "Semantic clinical or brand drug without strength"
* code.coding[semantic-drug-form-group].code 1..1 MS
* code.coding[semantic-drug-form-group].system 1..1 MS
* code.coding[semantic-drug-form-group] from SemanticDrugFormGroupVS (required)
//* code.coding[semantic-drug-form-group].system = $RxNorm


* status 1..1 MS
* doseForm MS



Profile:        InsurancePlanLocation
Parent:         Location
Id:             usdf-InsurancePlanLocation
Title:          "Insurance Plan Location"
Description:    "A Location describing a geographic region or are where the insurance plan coverage is available."

* meta.lastUpdated 1..1
* obeys Location-address-or-geolocation
* extension contains
    $GeoJSONExtension named region 0..1 MS
* extension[region] ^short = "Associated Region (GeoJSON) [MustSupport for this element is optional if there is support for address]" // Add conditional MS FHIR-34527
* name  // Remove MS FHIR-34527
* description  // Add MS FHIR-34527
* address MS 
* address ^short = "Physical location [MustSupport for this element is optional if there is support for Extension:location-boundary-geojson]" // Add conditional MS FHIR-34527




Profile:        PayerInsurancePlanBulkDataGraphDefinition
Parent:         GraphDefinition
Id:             usdf-PayerInsurancePlanBulkDataGraphDefinition
Title:          "Payer Insurance Plan Bulk Data Graph Definition"
Description:    "A GraphDefinition defining a graph of resources to return in a query for a Formulary related Payer Insurance Plan Bulk Data request."

* ^extension[2].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[2].valueCode = #draft

//* url = "http://hl7.org/fhir/us/davinci-drug-formulary/GraphDefinition/usdf-PayerInsurancePlanBulkDataGraphDefinition"
* name = "PayerInsurancePlanGraphDefinition"
* status = #active
* start = #InsurancePlan
* profile = Canonical(PayerInsurancePlan)


* link ^slicing.discriminator.path = "path"
* link ^slicing.rules = #open
* link ^slicing.discriminator.type = #pattern 
* link ^slicing.ordered = false   // can be omitted, since false is the default
* link ^slicing.description = "Slice based on path pattern"

* link contains
    location 0..* and
    formulary 0..*



* link[location].path = "InsurancePlan.coverageArea"
* link[location].target.type = #Location
* link[location].target.profile = Canonical(InsurancePlanLocation)


* link[formulary].path = "InsurancePlan.coverage.extension.where(url=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyReference-extension).valueReference"
* link[formulary].target.type = #InsurancePlan
* link[formulary].target.profile = Canonical(Formulary)

* link[formulary].target.link.target.type = #Basic
* link[formulary].target.link.target.profile = Canonical(FormularyItem)
* link[formulary].target.link.target.params = "formulary={ref}"

* link[formulary].target.link.target.link.path = "Basic.subject"
* link[formulary].target.link.target.link.target.type = #MedicationKnowledge
* link[formulary].target.link.target.link.target.profile = Canonical(FormularyDrug)



Profile:        FormularyBulkDataGraphDefinition
Parent:         GraphDefinition
Id:             usdf-FormularyBulkDataGraphDefinition
Title:          "Formulary Bulk Data Graph Definition"
Description:    "A GraphDefinition defining a graph of resources to return in a query for a Formulary related Bulk Data request."

* ^extension[2].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[2].valueCode = #draft

//* url = "http://hl7.org/fhir/us/davinci-drug-formulary/GraphDefinition/usdf-PayerInsurancePlanBulkDataGraphDefinition"
* name = "FormularyGraphDefinition"
* status = #active
* start = #InsurancePlan
* profile = Canonical(Formulary)

* link.target.type = #Basic
* link.target.profile = Canonical(FormularyItem)
* link.target.params = "formulary={ref}"

* link.target.link.path = "Basic.subject"
* link.target.link.target.type = #MedicationKnowledge
* link.target.link.target.profile = Canonical(FormularyDrug)



Invariant: Location-address-or-geolocation
Description: "Location contains an address, geolocation, or both"
Expression: "address.exists() or extension.where(url='http://hl7.org/fhir/StructureDefinition/location-boundary-geojson')"
Severity: #error

