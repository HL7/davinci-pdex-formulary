
<a name="conformance-expectations"></a>

### Conformance Expectations
* This guide inherits all conformance expectations identified in the Health Record Exchange (Hrex) [Conformance Expectations]({{site.data.fhir.ver.hl7_fhir_us_davinci_hrex}}/conformance.html) section. All systems claiming conformance to this guide **SHALL** conform to the requirements listed in that section.

* Server systems claiming conformance to this guide **SHALL** meet the capability statement expectation requirements identified in the [US Drug Formulary Server Capability Statement](CapabilityStatement-usdf-server.html) and **SHALL** have a CapabilityStatement that has a CapabilityStatement.instantiates with a URL of http://hl7.org/fhir/us/davinci-drug-formulary/CapabilityStatement/usdf-server or a URL to the appropriate version of the CapabilityStatement.

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

<img src="Slide2.jpg" alt="Authenticated Access Workflow" style="width: 100%; float: none; align: middle;"/>


<a name="access-methods"></a>
### Access Methods
The formulary service can potentially be accessed two different ways:
1. __Authenticated API__: Access to the formulary service when integrated with protected health information (PHI) or personally identifiable information (PII) as part of the Patient Access API **SHALL** be protected through an authorized, authenticated transaction as described in the Da Vinci Health Record Exchange (HRex) FHIR Implementation Guide [Security and Privacy Section]({{site.data.fhir.ver.hl7_fhir_us_davinci_hrex}}security.html).
2. __Unauthenticated API__: When exchanging formulary data exclusively, which is public information without any PHI or PII, the formulary service **MAY** also be accessed through an API that does not require authentication or authorization. The formulary server **SHALL NOT** maintain any records through the unauthenticated API that could associate the consumer with the medications queried.


<a name="authenticated"></a>
#### Authenticated 
When accessing data through an authenticated API, the response for queries on InsurancePlan depends on whether the authenticated member has access to the plan in relation to their membership.  

For the [Payer Insurance Plan](StructureDefinition-usdf-PayerInsurancePlan.html), this is the overall plan or plans that the individual is a member of.
For [Formulary](StructureDefinition-usdf-Formulary.html), this means all Formularies that are generally available to the member. If the member is in a group, all group associated formularies are returned. If not in a group, all generally available formularies (that is, those that are not restricted to only one or more groups) are returned.
Clients can determine the Formulary InsurancePlan(s) that the member is subscribed by first retrieving the Payer Insurance Plan(s) and identifying the Formulary(s) through the [Payer Insurance Plan InsurancePlan.coverage](StructureDefinition-usdf-PayerInsurancePlan-definitions.html#InsurancePlan.coverage:drug-coverage).

The following table indicates how the Formulary API should respond to requests when a Formulary Insurance plan (by resource reference) is specified and when it is not.
<table border="1">
  <thead>
    <th>InsurancePlan specified – GET by resource ID</th>
    <th>InsurancePlan reference not specified - Search</th>
  </thead>
  <tbody>
    <tr>
      <td>Return plan if covered by insurer and included in group if member is part of a group<br />If not, return 400</td>
      <td> Return all plans if covered by insurer and included in group if member is part of a group<br />If none, return 200 </td>
    </tr>
  </tbody>
</table>

Access to other profiled resources in this IG ([FormularyItem](StructureDefinition-usdf-FormularyItem.html) & [FormularyDrug]( StructureDefinition-usdf-FormularyDrug.html)) is not constrained by this IG.

Server implementers **SHALL** make other profiled resources in this IG ([FormularyItem](StructureDefinition-usdf-FormularyItem.html), [FormularyDrug]( StructureDefinition-usdf-FormularyDrug.html)) associated to a member’s available plans available through authenticated access. This IG does not define restrictions on authenticated access to resources not associated with a member’s available plan or the [Plan Location]( StructureDefinition-usdf-InsurancePlanLocation.html) resource.


<!-- 
https://jira.hl7.org/browse/FHIR-33188
https://jira.hl7.org/browse/FHIR-35367
 -->
<a name="unauthenticated"></a>
#### Unauthenticated
When accessing data through an unauthenticated API, the conformant payer formulary service **SHALL NOT** require an application to send consumer identifying information in order to query for the list of health plans provided by that payer and the medication and costs for each plan.



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


<a name="bulk-data"></a>
### Bulk Data
<div class="stu-note">

<b><i>Bulk data guidance in this version of the IG is draft only. It has not appeared in ballot and has not been fully tested.</i></b>
</div>
A server **MAY** support [Bulk Data IG](http://hl7.org/fhir/uv/bulkdata/index.html) for the retrieval of formulary data not related to an individual. The Bulk Data IG may be used because the data set for formularies could be large as a server may manage multiple formularies, each of which may contain thousands of drugs. If and how authorization is supported is not defined by this specification, however, the Bulk IG does provide guidance on SMART Backend Service Authorization. 

If a Formulary server supports bulk data export:
* **All InsurancePlan:** The server **SHOULD** support the export operation on the InsurancePlan resource `[base]/InsurancePlan/$export` to export all plan & formulary information.
  * The server **SHOULD** support providing all `InsurancePlan`, `Basic`, `MedicationKnowledge`, and `Location` resource types containing formulary related data associated with all formulary related plans.
  * The server **SHOULD** support the graph structure [Payer Insurance Plan Bulk Data Graph Definition](StructureDefinition-usdf-PayerInsurancePlanBulkDataGraphDefinition.html) in returned results.
  * The server **MAY** support a graph parameter using (e.g. `[base]/InsurancePlan/$export?graph=usdf-PayerInsurancePlanBulkDataGraphDefinition`) to request returning results starting at the [PayerInsurancePlan](StructureDefinition-usdf-PayerInsurancePlan.html).
  * The server **MAY** support a graph parameter using (e.g. `[base]/InsurancePlan/$export?graph=usdf-FormularyBulkDataGraphDefinition`) to request returning results starting at the [Formulary](StructureDefinition-usdf-Formulary.html). This request would not return [PayerInsurancePlan](StructureDefinition-usdf-PayerInsurancePlan.html) resources.


* **Specific InsurancePlan:** The server **SHOULD** support the export operation on the InsurancePlan resource `[base]/InsurancePlan/[id]/$export` to export plan specific plan & formulary information.
  * The server **SHOULD** support providing all `InsurancePlan`, `Basic`, `MedicationKnowledge`, and `Location` resource types containing formulary related data associated with the specific plan.
  * The server **SHOULD** support the graph structure [Payer Insurance Plan Bulk Data Graph Definition](StructureDefinition-usdf-PayerInsurancePlanBulkDataGraphDefinition.html) in returned results when the specific plan [id] is a [PayerInsurancePlan](StructureDefinition-usdf-PayerInsurancePlan.html) profiled resource.
  * The server **SHOULD** support the graph structure [Formulary Bulk Data Graph Definition](StructureDefinition-usdf-FormularyBulkDataGraphDefinition.html) in returned results when the specific plan [id] is a [Formulary](StructureDefinition-usdf-Formulary.html) profiled resource.
  <!-- The below may not be relevant as the id specifies the type (either PayerInsurancePlan or Formulary -->
  <!-- The server **MAY** support a graph parameter using (e.g. `[base]/InsurancePlan/[id]/$export?graph=usdf-PayerInsurancePlanBulkDataGraphDefinition`). -->
  <!-- The server **MAY** support a graph parameter using (e.g. `[base]/InsurancePlan/[id]/$export?graph=usdf-FormularyBulkDataGraphDefinition`). -->

  
* The server **SHOULD** return only formulary related resources conformant to this guide.
* The server **SHOULD** support the Bulk Data Kick-off Request.
* The server **SHOULD** support the Bulk Data File Request.
* The server **MAY** support the Bulk Data Status Request.
* The server **MAY** support the Bulk Data Delete Request.




<a name="searching-formulary-drugs"></a>
### Searching Formulary Drugs
This guide provides a mechanism for rudimentary drug searching and filtering based on drug codes, names, and forms, by requiring server systems to support this data. This capability is not robust and client systems are encouraged to augment their drug searching capabilities using outside services or data sources to better meet the needs of their users.

Searching for formulary drugs can be done by RxNorm code, RxNorm drug name, and dose form. In a formulary API, payers are likely to only include the specific drugs, specific down to form and strength, that are included in the coverage. If a search does not return the anticipated or desireable results, it is recommended that the client broaden the search (e.g. include both generic and brand RxNorm codes, search on name without strength, or search on an RxNorm code that does not include strength - see more guidance about supported RxNorm code term types below). Additionally, drugs that have special coverage rules may or may not be included in an API. These rules are often expressed in additional formulary documentation, referenced by the [InsurancePlan.contact](StructureDefinition-usdf-PayerInsurancePlan-definitions.html#InsurancePlan.contact), which **SHOULD** be presented to the user of the client application.

Formulary searches may be restricted to just the drugs supported by the payer therefore it is up to the user or calling application to convert patient searching requirements for branded or equivalent drugs into one or more formulary searches.

Covered drugs may appear in the formulary and non-covered drugs are simply not included. For example, a payer may pay for a generic form of a drug, but does not have a brand in their formulary. To retrieve matching drugs and available alternatives, it may be necessary for a client to search using the ingredient (generic) in addition to a brand.

<a name="searching-by-drug-code"></a>
#### Searching By Drug Code

The preferred way to search for drugs is to use an RxNorm code (RxCUI). The RxNorm codes and names are freely available and services to look-up codes exist. If a client application is performing a query with the intent on finding generic or brand alternatives, the client application **SHOULD** search using both the brand and the generic RxNorm code.

Servers **SHALL** support a MedicationKnowledge.code.coding repetition including the detailed drug, strength, and form, including RxNorm Term Types (TTY) of `SCD` (Semantic Clinical Drug), `SBD` Semantic Branded Drug), `GPCK` (Generic Pack), or `BPCK` (Branded Pack). Additionally, servers **SHALL** support a MedicationKnowledge.code.coding repetition including the general RxNorm code (and name) with Term Type of` SCDG` (Semantic Clinical Drug Form Group) or `SBDG` (Semantic Branded Drug Form Group) when there is a concept matching the primary code represented by the Term Type `SCD` or `SBD` respectively. This requirement includes using the respective RxNorm name in the display of the coding repetition. 

Searches for drugs with the above RxNorm Term Types (SCDG and SBDG) by either code will provide the client with a way to search for drugs without a specified strength.

<a name="searching-by-drug-name"></a>
#### Searching By Drug Name

This Implementation Guide provides the ability to search for FormularyDrug (MedicationKnowledge) resources by drug name through the [drug-name](SearchParameter-MedicationKnowledge-drug-name.html) search parameter. This search parameter is based on the MedicationKnowledge.code.coding.display and provides a full (`exact`) or partial (`contains`) equals (`eq`) string match. Per the FHIR Specification, the [Correct RxNorm Display](https://www.hl7.org/fhir/rxnorm.html#4.3.2.3) is the Full RxNorm name of either the Semantic Clinical Drug (SCD) or Semantic Brand Drug (SBD). The full drug name has several components presented in the following formats:

* SCD = Ingredient + Strength + Dose Form
* SBD = Ingredient + Strength + Dose Form + [Brand Name]

In addition to these RxNorm names, drug combination packs may also appear in formularies. Drug combination packs can contain multiple drugs or strengths that are packaged and prescribed together, under a brand or generic drug name, to meet a particular set of administration requirements. The full name for drug combination packs have components presented in the following formats:

* GPCK = {# (Ingredient + Strength + Dose Form) / # (Ingredient + Strength + Dose Form)} Pack
* BPCK = {# (Ingredient + Strength + Dose Form) / # (Ingredient + Strength + Dose Form)} Pack [Brand Name]
  
Servers are required to support the more general drug form group code and name where one exists. This display name will be included in any drug name search for which the general drug form group code exists. The RxNorm name of these codes has several components presented in the following formats:
* SCDG = Ingredient + Dose Form Group
* SBDG = Ingredient + Dose Form Group + [Brand Name]

The [drug-name SearchParameter](SearchParameter-MedicationKnowledge-drug-name.html) includes the `multipleAnd` capability, which allows for multiple `drug-name` search parameters within a single query. With this capability it is possible to search by drug name and form where a dose form group is not available. This capability should be used sparingly, as each additional partial string search parameter increases the load on the server. 

For Example:
  `MedicationKnowledge?drug-name:contains=acetaminophen&drug-name:contains=Tablet`

This search will return all matching drug names with both the ingredient “acetaminophen” and dose form “Tablet”. This will also return any matching combination or pack drugs. 

Another factor clients need to consider when searching for drugs by name, is that individual drug names may be contained within combination drugs (e.g., a search on acetaminophen will return many combination drugs). Clients may need to filter search results to fit their requirements.

<a name="additional-guidance"></a>
### Additional Guidance 


<a name="specific-drug-coverage-details"></a>
#### Specific Drug Coverage Details

RxNorm codes and descriptions were chosen as the mechanism for searching and describing covered drugs for consumer use because that is what consumers will generally have access to given the requirements laid out in US regulation. RxNorm is also the code system used for many outpatient pharmacy prescribing transactions.

RxNorm provides a consumer accessible categorization for prescribable drugs. This categorization may not be specific enough for payers that have very detailed coverage constraints they feel are necessary to express to their members.

This IG Provides the following ways to express various levels of coverage (coverage status, requirements, or costs) for multiple drugs represented under one RxNorm code.

* Specific drugs identified by unique [FormularyDrug]( StructureDefinition-usdf-FormularyDrug.html) resource instances that are  associated to a Formulary with specific coverage conditions, requirements, and costs through a [FormularyItem](StructureDefinition-usdf-FormularyItem.html).
    - A specific drug code using NDC or other code system is included as a [FormularyDrug]( StructureDefinition-usdf-FormularyDrug.html) MedicationKnowledge.code.coding that includes the specific name in the display to enable searching.
  
* Drugs identified by a general RxNorm code in a single [FormularyDrug]( StructureDefinition-usdf-FormularyDrug.html) MedicationKnowledge resource with specific coverage conditions and requirements communicated in the referenced [FormularyItem](StructureDefinition-usdf-FormularyItem.html).
  - Specific details including drugs covered or not covered, coverage conditions, or requirements are specified in the [FormularyItem](StructureDefinition-usdf-FormularyItem.html) Basic.extensions.


<a name="presenting-alternative-medications"></a>
#### Presenting Drug Alternatives 
Finding appropriate alternatives of a prescribed medication is complex and often depends on additional clinical information about the patient well as the condition or set of conditions for which the medication is meant to address. The means to identify therapeutic alternatives to drugs does exist in the industry, but such capability is complex, requires clinical information about the patient that is not within in scope of this guide, and a clinical understanding of the intended therapeutic use of the medication which is not generally within the competency of most members.  The information and business rules necessary to identify possible therapeutic alternatives, and therefore the ability to search for such alternatives, currently lies outside of the scope of this guide.

<a name="representing-drug-tiers"></a>
#### Representing Drug Tiers
Drug tiers are not standardized. The current Implementation Guide provides a defined, but extensible value set for tier identifiers based on the example list in the QHP formulary specification. A move towards standardization might make this data more useful for clients of the interface.

<a name="representing-pharmacy-benefit-types"></a>
#### Representing Pharmacy Benefit Types
Pharmacy benefit types are not standardized. The current Implementation Guide provides a defined value set for tier identifiers based on the example list in the QHP formulary specification which mixes channels (retail and mail order) with quantity prescribed (1 month, 3 month, etc). A move towards standardization might make this data more useful for clients of the interface.
