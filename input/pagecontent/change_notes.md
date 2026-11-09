### Changes and Updates for Version 3.0.0-ballot

The following high level changes were addressed in this release:

* Added support for Bulk Publish and updated details on Bulk Export for compatibility with Bulk Data 4.0.0-ballot (will move to the published version when available).
* Updated PDex dependency to the 2.0.0-ballot version.
* Updated formulary guidance on authenticated lookups using the Coverage resource and corrected the Availability Status extension description.
* Updated Formulary Item search parameter naming and addressed the extensible binding of PayerInsurancePlan.type.
* Added the CPT intellectual property statement to the IG's IP statements.

Specific JIRA tickets included in this update are grouped below by the JIRA **Change Impact** classification:


#### **Non-Compatible**

* [FHIR-48865](https://jira.hl7.org/browse/FHIR-48865) Add a prefix to Formulary-Item search parameters


#### **Substantive**

* [FHIR-44804](https://jira.hl7.org/browse/FHIR-44804) PayerInsurancePlan.type extensible binding may cause issues w/use of InsurancePlan.type in client queries


#### **Non-substantive**

* [FHIR-54002](https://jira.hl7.org/browse/FHIR-54002) Missing Guidance around use of Coverage resource for Formulary Authenticated lookups

* [FHIR-50879](https://jira.hl7.org/browse/FHIR-50879) Description on "Extension: Availability Status" indicates boolean, but expected value is a code
* [FHIR-53595](https://jira.hl7.org/browse/FHIR-53595) Add CPT IP statement to rest of IP statements


### Changes and Updates for Version 2.1.0

The following high level changes addressed in this release:

* Updated dependencies to reference to multiple versions of US Core per latest Da Vinci recommendations (7.0.0, 6.1.0, and 3.1.1)
* Updated dependencies to reference Da Vinci HRex version 1.1.0
* Updated IG organization and structure to match the latest Da Vinci recommendations

Specific JIRA tickets applied in this update are listed below:

* [FHIR-45633](https://jira.hl7.org/browse/FHIR-45633)	DaVinci vs. Da Vinci for IG name/title/narrative	
* [FHIR-45443](https://jira.hl7.org/browse/FHIR-45443)	Incorrect _include search format in examples	
* [FHIR-45280](https://jira.hl7.org/browse/FHIR-45280)	Change Cardinality of PayerInsurancePlan InsurancePlan.plan:drug-plan.specificCost.benefit.cost.value	
* [FHIR-44796](https://jira.hl7.org/browse/FHIR-44796)	Clients & Servers need a way to know which Payer Insurance Plan InsurancePlan.plan entries (plans) a member has access to	
* [FHIR-44720](https://jira.hl7.org/browse/FHIR-44720)	Formulary Drug Profile - Add an invariant for slices on MedicationKnowledge.code.coding 	
* [FHIR-41608](https://jira.hl7.org/browse/FHIR-41608)	Add guidance for support of Bulk data changes	
* [FHIR-40542](https://jira.hl7.org/browse/FHIR-40542)	Add "preferred" and "non-preferred" to Drug Tier Value Set	
* [FHIR-37717](https://jira.hl7.org/browse/FHIR-37717)	Add guidance for granular pharmacy benefits	
* [FHIR-37623](https://jira.hl7.org/browse/FHIR-37623)	String and Token Search Parameters for FormularyDrug (DrugName, DrugTier, and DrugPlan) incorrectly include the comparator "eq"	
* [FHIR-37587](https://jira.hl7.org/browse/FHIR-37587)	References Plan Net InsurancePlan <> Formulary Payer Insurance Plan	
* [FHIR-36330](https://jira.hl7.org/browse/FHIR-36330)	Provide more guidance for authenticated access 	


### Changes and Updates for Version 2.0.1
**The following issues are addressed in this release:**

* [FHIR-39401](https://jira.hl7.org/browse/FHIR-39401): Corrected [SearchParameter-Basic-Subject](SearchParameter-Basic-subject.html) by changing `code` from `code` to `subject`.
* [FHIR-43049](https://jira.hl7.org/browse/FHIR-43049): Changed the `InsurancePlan.coverage[drug-coverage].benefit[drug-plan].type` in [Payer Insurance Plan](StructureDefinition-usdf-PayerInsurancePlan.html) from the deprecated code `Drug` to `drug`.
* [FHIR-42930](https://jira.hl7.org/browse/FHIR-42930): Changed the binding of [Payer Insurance Plan](StructureDefinition-usdf-PayerInsurancePlan.html) `PayerInsurancePlan.plan[drug-plan].specificCost.benefit.type` [Drug Tier VS](ValueSet-DrugTierVS.html) from a required to extensible to match the [Formulary Item](StructureDefinition-usdf-FormularyItem.html) Drug Tier binding to allow the inclusion of drug tiers beyond those identified in the IG.
* [FHIR-43055](https://jira.hl7.org/browse/FHIR-43055): Specify the contexts for [all IG defined extensions](artifacts.html#4).


### Changes and Updates for Version 2.0.0
Da Vinci Payer Data Exchange (PDex) US Drug Formulary for FHIR R4 (STU 2)
**The following issues are addressed in this release:**

* [FHIR-33181](https://jira.hl7.org/browse/FHIR-33181): Changed CoveragePlan profile from using a List resource to two InsurancePlan profiles; one defining the higher level [Payer Insurance Plan](https://hl7.org/fhir/us/davinci-drug-formulary/STU2/StructureDefinition-usdf-PayerInsurancePlan.html) and the other defining the [Formulary](StructureDefinition-usdf-Formulary.html) provides general information about a formulary and acts as an organizing construct to create a formulary list.
  This change also addresses:
  * [FHIR-33185](https://jira.hl7.org/browse/FHIR-33185) - Creating a prescribable insurance plan [PayerInsurancePlan](StructureDefinition-usdf-PayerInsurancePlan.html) that contains a drug coverage with a reference to a formulary and plans cost sharing information.
  * [FHIR-29670](https://jira.hl7.org/browse/FHIR-29670) and [FHIR-30923](https://jira.hl7.org/browse/FHIR-30923) - Allowing a Formulary Drug to be referenced by multiple drug plans by adding [Formulary](StructureDefinition-usdf-Formulary.html) and [FormularyItem](https://hl7.org/fhir/us/davinci-drug-formulary/STU2/StructureDefinition-usdf-FormularyItem.html) profiles.
  * [FHIR-31038](https://jira.hl7.org/browse/FHIR-31038) - Creating profiles [Payer Insurance Plan](https://hl7.org/fhir/us/davinci-drug-formulary/STU2/StructureDefinition-usdf-PayerInsurancePlan.html) and [Formulary](StructureDefinition-usdf-Formulary.html) to enable querying plans by plan and type or searching for all drug plans adding search parameters [InsurancePlan-identifier](SearchParameter-InsurancePlan-identifier.html), [InsurancePLan-type](SearchParameter-InsurancePlan-type.html), and [InsurancePlan-formulary-coverage](SearchParameter-InsurancePlan-formulary-coverage.html) (linking the PayerInsurancePlan and Formulary).
  * [FHIR-31572](https://jira.hl7.org/browse/FHIR-31572) - Addressing the need to require an element necessary to link resources by adding extensions [formulary reference to PayerInsurancePlan coverage](https://hl7.org/fhir/us/davinci-drug-formulary/STU2/StructureDefinition-usdf-PayerInsurancePlan-definitions.html#InsurancePlan.coverage:drug-coverage.extension:usdf-FormularyReference-extension) and [formulary reference to FormularyItem](StructureDefinition-usdf-FormularyItem-definitions.html#Basic.extension:usdf-FormularyReference-extension).
  * [FHIR-31673](https://jira.hl7.org/browse/FHIR-31673) - Move the EmailPlanContact extension, which can support an email address or url to the better fitting element [InsurancePlan.contact](https://hl7.org/fhir/us/davinci-drug-formulary/STU2/StructureDefinition-usdf-PayerInsurancePlan-definitions.html#InsurancePlan.contact).
  * [FHIR-33183](https://jira.hl7.org/browse/FHIR-33183) - Created a set of [search parameters](https://hl7.org/fhir/us/davinci-drug-formulary/STU2/search_parameters.html) and [anticipated client queries](queries.html) for the new IG structure.
  * [FHIR-35600](https://jira.hl7.org/browse/FHIR-35600) and [FHIR-35590](https://jira.hl7.org/browse/FHIR-35590) - Use https://terminology.hl7.org/CodeSystem/insurance-plan-type CodeSystem and https://terminology.hl7.org/CodeSystem/insurance-plan-type ValueSet for [Payer InsurancePlan.plan.type](https://hl7.org/fhir/us/davinci-drug-formulary/STU2/StructureDefinition-usdf-PayerInsurancePlan-definitions.html#InsurancePlan.plan.type), [Payer InsurancePlan.coverage.benefit.type](https://hl7.org/fhir/us/davinci-drug-formulary/STU2/StructureDefinition-usdf-PayerInsurancePlan-definitions.html#InsurancePlan.coverage:drug-coverage.benefit.type), and [Formulary InsurancePlan.plan.type](StructureDefinition-usdf-Formulary-definitions.html#InsurancePlan.plan.type).
* [FHIR-33182](https://jira.hl7.org/browse/FHIR-33182): Created a [Formulary Item profile](https://hl7.org/fhir/us/davinci-drug-formulary/STU2/StructureDefinition-usdf-FormularyItem.html) that links a drug with a drug (formulary) plan and includes the attributes that relate the two. As part of this change, several extensions moved to this profile from the [Formulary Drug profile](StructureDefinition-usdf-FormularyDrug.html).
* [FHIR-37717](https://jira.hl7.org/browse/FHIR-37717): Added [Specific Drug Coverage Details](https://hl7.org/fhir/us/davinci-drug-formulary/STU2/specification.html#specific-drug-coverage-details) section that includes guidance on how to provide details for drugs with different coverages but are represented by the same RxNorm code.
* [FHIR-36142](https://jira.hl7.org/browse/FHIR-36142): Changed cardinality of usdf-PharmacyBenefitType-extension in [Formulary Item profile](StructureDefinition-usdf-FormularyItem.html) (formerly usdf-MailOrder-extension in Formulary Drug profile) to `1..*` and MS.
* [FHIR-35197](https://jira.hl7.org/browse/FHIR-35197): Created an [extension](StructureDefinition-usdf-AdditionalCoverageInformation-extension.html) on [FormularyItem](StructureDefinition-usdf-FormularyItem.html) profile to allow the expression of additional coverage information.
* [FHIR-33186](https://jira.hl7.org/browse/FHIR-33186): Created an [Insurance Plan Location profile](StructureDefinition-usdf-InsurancePlanLocation.html) for an InsurancePlan to support geolocation.
* [FHIR-36143](https://jira.hl7.org/browse/FHIR-36143): Add invariant to [Insurance Plan Location profile](StructureDefinition-usdf-InsurancePlanLocation.html) requiring at least an address or a geolocation.
* [FHIR-29964](https://jira.hl7.org/browse/FHIR-29964): Added [Prior Authorization new Starts Only Extension](StructureDefinition-usdf-PriorAuthorizationNewStartsOnly-extension.html), [Step Therapy New Starts Only Extension](StructureDefinition-usdf-StepTherapyLimitNewStartsOnly-extension.html), and [Quantity Limit Detail Extension](StructureDefinition-usdf-QuantityLimitDetail-extension.html) on [FormularyItem](StructureDefinition-usdf-FormularyItem.html) to support more details beyond the original boolean values.
* [FHIR-33184](https://jira.hl7.org/browse/FHIR-33184): Improve drug searching through making [MedicationKnowledge.doseform](StructureDefinition-usdf-FormularyDrug-definitions.html#MedicationKnowledge.doseForm) Must Support on the [FormularyDrug](StructureDefinition-usdf-FormularyDrug.html) profile and adding a [doseform](SearchParameter-MedicationKnowledge-doseform.html) SearchParameter.
* [FHIR-34526](https://jira.hl7.org/browse/FHIR-34526) and [FHIR-36264](https://jira.hl7.org/browse/FHIR-36264): Created a Conformance Expectations section which inherits the HRex conformance expectations which includes the definition of Must Support.
* [FHIR-37478](https://jira.hl7.org/browse/FHIR-37478): Removed US Core as a dependency (since no profiles are directly derived from US Core).
* [FHIR-34527](https://jira.hl7.org/browse/FHIR-34527): Changes Must Support flags on the [PayerInsurancePlan](StructureDefinition-usdf-PayerInsurancePlan.html), [Formulary](StructureDefinition-usdf-Formulary.html), [FormularyItem](StructureDefinition-usdf-FormularyItem.html), [FormularyDrug](StructureDefinition-usdf-FormularyDrug.html), and [InsurancePlanLocation](StructureDefinition-usdf-InsurancePlanLocation.html) profiles (includes data elements included in previous version profiles on different resources).
* [FHIR-36137](https://jira.hl7.org/browse/FHIR-36137): Made the capability expectation for [Insurance Plan Location profile](StructureDefinition-usdf-InsurancePlanLocation.html) **SHALL** in the [CapabilityStatement](CapabilityStatement-usdf-server.html).
* [FHIR-33248](https://jira.hl7.org/browse/FHIR-33248): Remove requirement to support HTTP error response 410 for deleted resources in [server CapabilityStatement](CapabilityStatement-usdf-server.html)
* [FHIR-36169](https://jira.hl7.org/browse/FHIR-36169): Add requirement in the Conformance Expectations that servers support CapabilityStatement.instantiates pointing to the included CapabilityStatement.
* [FHIR-34085](https://jira.hl7.org/browse/FHIR-34085): Added slicing on [FormularyDrug code.coding](StructureDefinition-usdf-FormularyDrug-definitions.html#MedicationKnowledge.code.coding) to support granular (ingredient, strength, and form) RxNorm Code and general (ingredient and form group) to enable finding drugs with different strengths and added guidance on [searching formulary drugs](https://hl7.org/fhir/us/davinci-drug-formulary/STU2/specification.html#searching-formulary-drugs).
* [FHIR-34758](https://jira.hl7.org/browse/FHIR-34758): Combine the copay and coinsurance cost sharing options into a single [Cost Sharing Option CodeSystem](CodeSystem-usdf-CostShareOptionCS-TEMPORARY-TRIAL-USE.html).
* [FHIR-36302](https://jira.hl7.org/browse/FHIR-36302): Updated the [BenefitCodeTypeCS](CodeSystem-usdf-BenefitCostTypeCS-TEMPORARY-TRIAL-USE.html), [DrugTierCS](CodeSystem-usdf-DrugTierCS-TEMPORARY-TRIAL-USE.html), [PharmacyBenefitTypeCS](CodeSystem-usdf-PharmacyBenefitTypeCS-TEMPORARY-TRIAL-USE.html), and [PlanContactTypeCS](CodeSystem-usdf-PlanContactTypeCS-TEMPORARY-TRIAL-USE.html) CodeSystems id to include "" in order to note to implementers that the URL is likely to change (to terminology.hl7.org defined CodeSystems) in the future.
* [FHIR-31349](https://jira.hl7.org/browse/FHIR-31349): Added deductible-waived to [Copay qualifier](ValueSet-CopayOptionVS.html) and [Coinsurance qualifier](ValueSet-CoinsuranceOptionVS.html) CodeSystems.
* [FHIR-33188](https://jira.hl7.org/browse/FHIR-33188) and [FHIR-35367](https://jira.hl7.org/browse/FHIR-35367): Added guidance for [Bulk Data Export](https://hl7.org/fhir/us/davinci-drug-formulary/STU2/specification.html#bulk-data).
* [FHIR-37623](https://jira.hl7.org/browse/FHIR-37623): Remove the invalid 'eq' comparator from [Drug Name Search Parameter](SearchParameter-MedicationKnowledge-drug-name.html).
* [FHIR-34456](https://jira.hl7.org/browse/FHIR-34456): Updated the HRex references to point to version [1.0.0](https://build.fhir.org/ig/HL7/davinci-ehrx/).
* [FHIR-35196](https://jira.hl7.org/browse/FHIR-35196): Added guidance regarding  [presenting drug alternative](https://hl7.org/fhir/us/davinci-drug-formulary/STU2/specification.html#presenting-drug-alternatives).
* [FHIR-35365](https://jira.hl7.org/browse/FHIR-35365): Added more descriptive descriptions to the extensions included in the [FormularyItem profile](StructureDefinition-usdf-FormularyItem.html).
  

> **Editorial note (previously an HTML comment):**
> The Following are only changes from the ballot version and final published version
> FHIR-34756 - Improve the name of value set "Type of pharmacies"
> FHIR-35366 - Simplify FormularyItem by inlining drug codes


  
### Changes and Updates for Version 1.2.0

* STU2 Ballot

### Changes and Updates for Version 1.1.0
Da Vinci Payer Data Exchange (PDex) US Drug Formulary for FHIR R4 (STU Update of STU 1)
**The following issues are addressed in this release:**

* [FHIR-28293](https://jira.hl7.org/browse/FHIR-28293): Changed the [PlanID extension](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-PlanID-extension.html) description to from:

  *“Unique, 14-character, HIOS-generated Plan ID number (Plan IDs must be unique, even across different markets.)”*

  to:

  *“Unique, generated Plan ID number, such as HIOS ID for QHPs or Contract Number for Medicare Advantage Plans. Plan IDs must be unique within each organization that manages their formulary data.”*
* [FHIR-29965](https://jira.hl7.org/browse/FHIR-29965): Added guidance that [CoveragePlan.MarketingURL](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-MarketingURL-extension.html), [CoveragePlan.SummaryURL](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-SummaryURL-extension.html), and [CoveragePlan.FormularyURL](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-FormularyURL-extension.html) can point to a page providing links for multiple language options.
* [FHIR-30412](https://jira.hl7.org/browse/FHIR-30412): Changed the type of [CoveragePlan.MarketingURL](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-MarketingURL-extension.html), [CoveragePlan.SummaryURL](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-SummaryURL-extension.html), and [CoveragePlan.FormularyURL](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-FormularyURL-extension.html) extensions from a String value to a URL value.
* [FHIR-30924](https://jira.hl7.org/browse/FHIR-30924): Added "Not applicable" to the [usdf-CopayOptionCS](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/CodeSystem-usdf-CopayOptionCS.html) code system. Zero-deductible cost sharing is represented by a co-pay value of "Not applicable" and a co-insurance value of "No charge", consistent with updated QHP guidelines.
* [FHIR-30925](https://jira.hl7.org/browse/FHIR-30925): Added an optional boolean [MailOrder](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-MailOrder-extension.html) extension to FormularyDrug profile. The MailOrder value in FormularyDrug overrides the MailOrder value in the [DrugTierDefinition](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-DrugTierDefinition-extension.html) extension for [CoveragePlan](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-CoveragePlan.html).
* [FHIR-30933](https://jira.hl7.org/browse/FHIR-30933): Changed the type of [EmailPlanContact](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-EmailPlanContact-extension.html) extension from String to URL. We also added narrative to [EmailPlanContact](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-EmailPlanContact-extension.html) that a FHIR URL type can be a web-url or an email address.
* [FHIR-31031](https://jira.hl7.org/browse/FHIR-31031): Since \_profile search parameter is not required for [anticipated client queries](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/queries.html#anticipated-client-queries), we removed the "\_profile" search parameter for the Medication Knowledge and List resource examples.
* [FHIR-31037](https://jira.hl7.org/browse/FHIR-31037): The CoveragePlan PlanIDType extension was not defined for non-HIOS plans so we included narrative in [Plan ID Type](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-PlanIDType-extension.html), to include "For all other plans this should be: OTHER-PLAN-ID as part of the definition.
* [FHIR-31073](https://jira.hl7.org/browse/FHIR-31073): Added guidance for behavior for [authenticated member access](https://hl7.org/fhir/us/davinci-drug-formulary/STU2/specification.html#authenticated), when the member has already selected a plan or not, when they belong to a plan group or not.
* [FHIR-31591](https://jira.hl7.org/browse/FHIR-31591): Changed the code display in [Formulary Drug cmspi9](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/MedicationKnowledge-cmsip9.html), to "doxepin hydrochloride 50 MG/ML Topical Cream" to match the given code of #1000091.
* [FHIR-31672](https://jira.hl7.org/browse/FHIR-31672): Added guidance to enter "Not applicable" in the [Network](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-Network-extension.html) extension for a CoveragePlan that has no applicable network associated with it.
* [FHIR-31683](https://jira.hl7.org/browse/FHIR-31683): We changed List.code to be set to the code `DRUGPOL` and changed the cardinality to 1..1 in the [Formulary Coverage Plan](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-CoveragePlan.html#profile). Additionally, in [Anticipated Client Queries](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/queries.html#find-coverageplan-by-its-planid) the queries that reference list now reference the `DRUGPOL` code.
* [FHIR-31684](https://jira.hl7.org/browse/FHIR-31684): Guidance was added to [Additional Guidance](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/use_cases_and_overview.html#additional-guidance) regarding searching for FormularyDrugs with know PlanIDs and without.
* [FHIR-31762](https://jira.hl7.org/browse/FHIR-31672): Updated [search parameter](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/search_parameters.html) descriptions to include all of the search parameters in the [CapabilityStatement](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/CapabilityStatement-usdf-server.html).
* [FHIR-32178](https://jira.hl7.org/browse/FHIR-32178): Added "charge" to the [usdf-CopayOptionCS](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/CodeSystem-usdf-CopayOptionCS.html) and the [usdf-CoinsuranceOptionCS](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/CodeSystem-usdf-CoinsuranceOptionCS.html)code systems to handle drugs that consist of a charge, but are not subject to a deductible.
* [FHIR-32622](https://jira.hl7.org/browse/FHIR-32622): Guidance was added to [Formulary Coverage Plan](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-CoveragePlan.html) indicating that we are considering basing the CoveragePlan profile off of the InsurancePlan resource in a future release instead of the List resource.
* [FHIR-32625](https://jira.hl7.org/browse/FHIR-32625): Changes were implemented to improve the navigation by updating the [Table of Contents](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/toc.html), the specification menu, and page design.
* [FHIR-32627](https://jira.hl7.org/browse/FHIR-32627): Guidance was added to [Search Parameters](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/search_parameters.html) indicating that the search parameters DrugName, DrugPlan, and DrugTier will be changed to more compliant names like: lower-case 'drug-name', 'drug-plan', and 'drug-tier' in a future release.
* [FHIR-32723](https://jira.hl7.org/browse/FHIR-32723): Several value sets found in [Terminology: Code Systems](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/artifacts.html#terminology-code-systems) were not properly displaying the value and description correctly for "code for qualifier for coinsurance rate", "codes for qualifier of copay amount" and "codes for medication drug tiers in health plans". This has been corrected. The definition column has been updated to no longer be blank and contain the proper information.
* [FHIR-32958](https://jira.hl7.org/browse/FHIR-32958): Added guidance for searching by [drug name](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/specification.html#searching-by-drug-names) strings.
* [FHIR-32958](https://jira.hl7.org/browse/FHIR-32958): Added guidance on [drug name searching](https://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/use_cases_and_overview.html#searching-by-drug-names) with description of RxNorm term types, formats, and drug names that might appear on a formulary.


### Changes and Updates for Version 1.0.1

* Technical correction to version 1.0.0

### Changes and Updates for Version 1.0.0

* Initial publication

### Changes and Updates for Version 0.1.0

* Initial draft implementation guide for testing
