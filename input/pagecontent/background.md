

<a name="use-cases"></a>
### Use Cases

<a name="actors"></a>
#### Actors
* **Member**: A person to whom health care coverage has been extended by the policyholder (generally their employer) or any of their covered family members. Sometimes referred to as the insured or insured person. The cost of medications for a member is a function of the drug coverage under their health insurance plan, their benefits based on their already satisfied deductibles, and the pharmacy where their prescriptions are filled.
* **Consumer**: A person who may or may not be a member, who wishes to explore the formulary content and plan-level co-insurance.
* **Health Plan**: A provider of insurance coverage that often includes a drug coverage plan which publishes formulary content and plan-level co-insurance information through the Drug Formulary FHIR API.



<a name="Medication-Copay-Under-Health-Plan"></a>
#### Medication Copay Under Health Plan
This use case allows a member to determine the plan level estimated costs of each of their medications under the drug coverage of their current health plan. An application queries the formulary service for cost information about the drugs that the member has interest in and provides the plan level estimated cost for each medication under the member's current health plan.

Note that for this use case the health plan would provide authenticated access to the formulary.

<img src="Slide1.jpg" alt="Unauthenticated Access Workflow" style="width: 100%; float: none; align: middle;"/>

<a name="Shopping for Health Plans"></a>
#### Shopping for Health Plans
This use case allows a consumer to compare the drug coverage of several different health plans and determine which plan has the lowest plan level estimated cost based on their medications of interest. The application can retrieve the consumer's medication list from an electronic health record system where the consumer's patient data is stored (outside the scope of this implementation guide). The consumer could also independently maintain their medication list in the application or elsewhere. The application identifies the relevant formulary endpoint through means that are beyond the scope of this implementation guide (see [Disclaimers and Assumptions](index.html#disclaimers-and-assumptions)). For each payer, the application queries the payer's formulary service to retrieve the list of health plans provided by that payer. Then, for each plan,the application queries the formulary service to retrieve the plan-level estimated costs specific to the consumer's medication list.

Note that for this use case the health plan could provide non-authenticated or open access to the formulary. Non-authenticated access should not maintain any records that could associate an individual with the medications or plans queried.

Also note that the same InsurancePlan may be present in multiple directories and if they have the same identifier they are assumed to be the same plan.

<img src="Slide2.jpg" alt="Authenticated Access Workflow" style="width: 100%; float: none; align: middle;"/>

<a name="formulary-structure"></a>
### Formulary Structure
Formularies in the United States are normally published by health insurers on an annual basis, with minor updates during the year. It is critical that health insurers update their published formularies following these minor updates.

Insurers regularly administer multiple health insurance and drug coverage plans and each of those plans may have its own formulary.

Each formulary contains a set of drugs and their limits or requirements. Drugs are placed into tiers that largely determine the cost to the consumer/patient. The number and purpose of drug tiers varies across payers. Each tier has an associated cost-sharing model that includes deductibles and/or coinsurance components for drugs in the tier when purchased through various pharmacy benefit types.

In addition to the drug tier, drugs may also list requirements on the patient (e.g., age or gender) or limitations on prescription (e.g., quantity limits).

<a name="resource-relationships"></a>
#### Resource Relationships
This Implementation Guide (IG) was significantly influenced by the formulary information model of the [formularies for Qualified Health Plans (QHPs) on the federal health insurance marketplace for healthcare.gov](https://github.com/CMSgov/QHP-provider-formulary-APIs). Publishing formularies in the QHP format should be familiar to many payers. Drugs are specified by RxNorm semantic drug codes. The QHP data model mandates specific value sets for some data types (e.g., types of copayments), but leaves value sets for other data types at the discretion of the payer (e.g., drug tier codes, pharmacy benefit types). The following object model shows the relationships between the resources in this IG. The Formulary profiled resource combined with its associated [FormularyItem](StructureDefinition-usdf-FormularyItem.html) and [FormularyDrug](StructureDefinition-usdf-FormularyDrug.html) profiled resources represent a formulary list that includes the set of drugs covered and the requirements and limitations of that coverage.


<img style="width: 100%; height: auto;" src="DaVinci_Formulary_Structure.png" />


A FormularyDrug represents the individual prescribable drug defined with a specific RxNorm semantic drug code that includes ingredient, strength, dose form, and brand name for branded drugs. These codes are represented in RxNorm with the Term Type (TTY) of Semantic Clinical Drug (SCD), Semantic Branded Drug (SBD), Generic Pack (GPCK), or Branded Pack (BPCK). Additionally, a more general RxNorm semantic drug form group code **SHOULD** be present for searching across drugs with the same ingredient, brand, and form (regardless of strength). These codes are represented in RxNorm with the Term Type (TTY) of Semantic Clinical Drug Form (SCDG) and Semantic Branded Drug Form Group (SBDG). All drugs with RxNorm Term Type of SCD or SBD **SHALL** have a coding repetition and RxNorm Term Type of SCDG or SBDG respectively. Drug packs, represented by RxNorm codes GPCK or BPCK may not have a corresponding drug form group. The FormularyItem links a drug with a formulary and includes the attributes that drug has in relation to the formulary, including the drug tier and coverage constraints.

<a name="cost-sharing-relationship"></a>
#### Cost Sharing Relationship
Cost sharing information such as copay amounts and coinsurance rates are determined by a payer in the insurance plan. The amount of copay and percentage of coinsurance is a function of the pharmacy benefit type (e.g. in network mail order) and the drug tier (e.g. preferred generic). These specific costs are defined in the [PayerInsurancePlan](StructureDefinition-usdf-PayerInsurancePlan.html) . The pharmacy benefit types and drug tiers, without the cost information, may optionally be included in the [Formulary](StructureDefinition-usdf-Formulary.html) as a convenience for client applications to quickly identify the pharmacy benefit types and drug tiers contained on the formulary without having to retrieve the [PayerInsurancePlan](StructureDefinition-usdf-PayerInsurancePlan.html).

<img style="width: 100%; height: auto;" src="DaVinci_Formulary_CostSharing.png" />

The costs for a particular drug in a plan will be determined by the pharmacy benefit types and drug tier as indicated in the properties of the [FormularyItem](StructureDefinition-usdf-FormularyItem.html). These properties are used to link the [PayerInsurancePlan](StructureDefinition-usdf-PayerInsurancePlan.html) specificCost properties (Pharmacy Benefit Type - `InsurancePlan.plan.specificCost.category` and Drug Tier - `InsurancePlan.plan.specificCost.benefit.type`) to identify the costs for the drug under the plan.

