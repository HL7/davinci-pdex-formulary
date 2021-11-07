
<a name="use-cases"></a>
### Use Cases

<a name="actors"></a>
#### Actors
<ul>
  <li>
    <strong>Member</strong>: A person to whom health care coverage has been extended by the policyholder (generally their employer) or any of their covered family members. Sometimes referred to as the insured or insured person. The cost of medications for a member is a function of the drug coverage under their health insurance plan, their benefits based on their already satisfied deductibles, and the pharmacy where their prescriptions are filled.
  </li>
  <li>
    <strong>Consumer</strong>: A person who may or may not be a member, who wishes to explore the formulary content and plan-level co-insurance.
  </li>
  <li>
    <strong>Health Plan</strong>: A provider of insurance coverage that often includes a drug coverage plan which publishes formulary content and plan-level co-insurance information through the Drug Formulary FHIR API.
  </li>
</ul>



<a name="Medication-Copay-Under-Health-Plan"></a>
#### Medication Copay Under Health Plan
<p>
  This use case allows a member to determine the plan level estimated costs of each of their medications under the drug coverage of their current health plan. An application queries the formulary service for cost information about the drugs that the member has interest in and provides the plan level estimated cost for each medication under the member's current health plan.
</p>
<p>
  Note that for this use case the health plan would provide authenticated access to the formulary.
</p>
<p><img style="width: 100%; height: auto;" src="Slide1.jpg" /></p>
<p>&nbsp;</p>
<a name="Shopping for Health Plans"></a>
#### Shopping for Health Plans
<p>
  This use case allows a consumer to compare the drug coverage of several different health plans and determine which plan has the lowest plan level estimated cost based on their medications of interest. The application can retrieve the consumer's medication list from an electronic health record system where the consumer's patient data is stored (outside the scope of this implementation guide). The consumer could also independently maintain their medication list in the application or elsewhere. The application identifies the relevant formulary endpoint through means that are beyond the scope of this implementation guide (see <a href="index.html#disclaimers-and-assumptions">Disclaimers and Assumptions</a>). For each payer, the application queries the payer's formulary service to retrieve the list of health plans provided by that payer. Then, for each plan,the application queries the formulary service to retrieve the plan-level estimated costs specific to the consumer's medication list.
</p>
<p>
  Note that for this use case the health plan could provide non-authenticated or open access to the formulary. Non-authenticated access should not maintain any records that could associate an individual with the medications or plans queried.
</p>
<p>&nbsp;</p>
<p><img style="width: 100%; height: auto;" src="Slide2.jpg" /></p>
<p>&nbsp;</p>

<a name="access-methods"></a>
### Access Methods
<p>The formulary service can potentially be accessed two different ways:</p>
<ol>
  <li>
    <em data-stringify-type="italic">Authenticated API</em>: Access to the formulary service when integrated with protected health information (PHI) or personally identifiable information (PII) as part of the Patient Access API <strong>SHALL</strong> be protected through an authorized, authenticated transaction as described in the Da Vinci Health Record Exchange (HRex) FHIR Implementation Guide for the <a class="c-link" href="http://hl7.org/fhir/us/davinci-hrex/2020Sep/security.html" target="_blank" rel="noopener noreferrer" data-stringify-link="http://hl7.org/fhir/us/davinci-hrex/2020Sep/security.html" data-sk="tooltip_parent">September 2020 Ballot</a>.
  </li>
  <li>
    <em data-stringify-type="italic">Unauthenticated API</em>: When exchanging formulary data exclusively, which is public information without any PHI or PII, the formulary service <strong>MAY</strong> also be accessed through an API that does not require authentication or authorization. The formulary server <strong>SHALL NOT</strong> maintain any records through the unauthenticated API that could associate the consumer with the medications queried.
  </li>
</ol>
<a name="authenticated"></a>
#### Authenticated 
<p>
  When accessing data through an authenticated API, the response for queries on InsurancePlan depends on whether the authenticated member is currently enrolled in a plan and whether they are a member of a group. The following table indicates how the Formulary API should respond to requests when an Insurance plan is specified and when it is not.
</p>
<table border="1">
  <thead>
    <th>Situation</th>
    <th>InsurancePlan specified</th>
    <th>InsurancePlan not specified</th>
  </thead>
  <tbody>
    <tr>
      <td>No plan available</td>
      <td>Zero plans returned (200)</td>
      <td>Zero plans returned (200)</td>
    </tr>
    <tr>
      <td>No plan selected/no group</td>
      <td>Zero plans returned (200)</td>
      <td>Bundle of available individual InsurancePlans</td>
    </tr>
    <tr>
      <td>No plan selected/in group</td>
      <td>Zero plans returned (200)</td>
      <td>Bundle of available group InsurancePlans</td>
    </tr>
    <tr>
      <td>Plan selected/no group</td>
      <td>If InsurancePlan specified matches member's plan, return InsurancePlan, otherwise zero plans returned</td>
      <td>Zero plans returned (200)</td>
    </tr>
    <tr>
      <td>Plan selected/in group</td>
      <td>If InsurancePlan specified matches member's plan, return InsurancePlan, otherwise zero plans returned</td>
      <td>Bundle of available group InsurancePlans. If no plans available, zero plans returned</td>
    </tr>
  </tbody>
</table>
<a name="unauthenticated"></a>
#### Unauthenticated
<p>
  When accessing data through an unauthenticated API, the conformant payer formulary service <strong>SHALL NOT</strong> require an application to send consumer identifying information in order to query for the list of health plans provided by that payer and the medication and costs for each plan.
</p>


<a name="formulary-structure"></a>
### Formulary Structure
<p>
  Formularies in the United States are normally published by health insurers on an annual basis, with minor updates during the year. It is critical that health insurers update their published formularies following these minor updates.
</p>
<p>
  Insurers regularly administer multiple health insurance and drug coverage plans and each of those plans may have its own formulary.
</p>
<p>
  Each formulary contains a set of drugs and their limits or requirements. Drugs are placed into tiers that largely determine the cost to the consumer/patient. The number and purpose of drug tiers varies across payers. Each tier has an associated cost-sharing model that includes deductibles and/or coinsurance components for drugs in the tier when purchased through various pharmacy types.
</p>
<p>
  In addition to the drug tier, drugs may also list requirements on the patient (e.g., age or gender) or limitations on prescription (e.g., quantity limits).
</p>

<a name="resource-relationships"></a>
#### Resource Relationships
<p>
  This Implementation Guide (IG) was significantly influenced by the formulary information model of the <a href="https://github.com/CMSgov/QHP-provider-formulary-APIs">formularies for Qualified Health Plans (QHPs) on the federal health insurance marketplace for healthcare.gov</a>. Publishing formularies in the QHP format should be familiar to many payers. Drugs are specified by RxNorm semantic drug codes. The QHP data model mandates specific value sets for some data types (e.g., types of copayments), but leaves value sets for other data types at the discretion of the payer (e.g., drug tier codes, pharmacy network types). The following object model shows the relationships between the resources in this IG. The Formulary profiled resource combined with its associated <a href="StructureDefinition-usdf-FormularyItem.html">FormularyItem</a> and <a href="StructureDefinition-usdf-FormularyDrug.html">FormularyDrug</a> profiled resources represent a formulary list that includes the set of drugs covered and the requirements and limitations of that coverage.
</p>
<p>&nbsp;</p>

<p><img style="width: 100%; height: auto;" src="DaVinci_Formulary_Structure.png" /></p>
<p>

  A FormularyDrug represents the individual prescribable drug defined with a specific RxNorm semantic drug code that includes ingredient, strength, dose form, and brand name for branded drugs. These codes are represented in RxNorm with the Term Type (TTY) of Semantic Clinical Drug (SCD), Semantic Branded Drug (SBD), Generic Pack (GPCK), or Branded Pack (BPCK). Additionally, a more general RxNorm semantic drug form group code <strong>SHOULD</strong> be present for searching across drugs with the same ingredient, brand, and form (regardless of strength). These codes are represented in RxNorm with the Term Type (TTY) of Semantic Clinical Drug Form (SCDG) and Semantic Branded Drug Form Group (SBDG). All drugs with RxNorm Term Type of SCD or SBD <strong>SHALL</strong> have a coding repetition and RxNorm Term Type of SCDG or SBDG respectively. Drug packs, represented by RxNorm codes GPCK or BPCK may not have a corresponding drug form group. The FormularyItem links a drug with a formulary and includes the attributes that drug has in relation to the formulary, including the drug tier and coverage constraints.
</p>

<a name="cost-sharing-relationship"></a>
#### Cost Sharing Relationship
<p>
  Cost sharing information such as copay amounts and coinsurance rates are determined by a payer in the insurance plan. The amount of copay and percentage of coinsurance is a function of the pharmacy network type (e.g. in network mail order) and the drug tier (e.g. preferred generic). These specific costs are defined in the <A href="StructureDefinition-usdf-PayerInsurancePlan.html">PayerInsurancePlan</a>. The pharmacy network types and drug tiers, without the cost information, may optionally be included in the <a href="StructureDefinition-usdf-Formulary.html">Formulary</a> as a convenience for client applications to quickly identify the pharmacy network types and drug tiers contained on the formulary without having to retrieve the <a href="StructureDefinition-usdf-PayerInsurancePlan.html">PayerInsurancePlan</a>.
</p>
<p><img style="width: 100%; height: auto;" src="DaVinci_Formulary_CostSharing.png" /></p>
<p>
  The costs for a particular drug in a plan will be determined by the pharmacy network types and drug tier as indicated in the properties of the <a href="StructureDefinition-usdf-FormularyItem.html">FormularyItem</a>. These properties are used to link the <a href="StructureDefinition-usdf-PayerInsurancePlan.html">PayerInsurancePlan</a> specificCost properties (Pharmacy Network Type - <code>InsurancePlan.plan.specificCost.category</code> and Drug Tier - <code>InsurancePlan.plan.specificCost.benefit.type</code>) to identify the costs for the drug under the plan.
</p>


<a name="additional-guidance"></a>
### Additional Guidance 

<a name="presenting-alternative-medications"></a>
#### Searching by Drug Names 
<p>
  Formulary searches may be restricted to just the drugs supported by the payer therefore it is up to the user or calling application to convert patient searching requirements for branded or equivalent drugs into one or more formulary searches.
</p>
<p>
  Only covered drugs may appear in the formulary and non-covered drugs are simply not included. For example, a payer may pay for a generic form of a drug, but does not have a brand in their formulary. To retrieve matching drugs and available alternatives, it may be necessary for a client to search using the ingredient (generic) in addition to a brand.
</p>
<p>
  The preferred way to search for drugs is to use an RxNorm code (RxCUI). The RxNorm codes and names are freely available and services to look-up codes exist. If a client application is performing a query with the intent on finding generic or brand alternatives, the client app <strong>SHOULD</strong> search using both the brand and the generic RxNorm code.
</p>
<p>
  As an alternative, this Implementation Guide provides the ability to search for FormularyDrug (MedicationKnowledge) resources by drug name through the <a href="SearchParameter-MedicationKnowledge-drug-name.html">drug-name</a> search parameter. This search parameter is based on the MedicationKnowledge.code.coding.display and provides a full (<code>exact</code>) or partial (<code>contains</code>) equals (<code>eq</code>) string match. Per the FHIR Specification, the <a href="https://www.hl7.org/fhir/rxnorm.html#4.3.2.3">Correct RxNorm Display</a> is the Full RxNorm name of either the Semantic Clinical Drug (SCD) or Semantic Brand Drug (SBD). The full drug name has several components presented in the following formats:
  <ul>
    <li>SCD = Ingredient + Strength + Dose Form</li>
    <li>SBD = Ingredient + Strength + Dose Form + [Brand Name]</li>
  </ul>
</p>
<p>
  In addition to these RxNorm names, drug combination packs may also appear in formularies. Drug combination packs can contain multiple drugs or strengths that are packaged and prescribed together, under a brand or generic drug name, to meet a particular set of administration requirements. The full name for drug combination packs have components presented in the following formats:
  <ul>
    <li>GPCK = {# (Ingredient + Strength + Dose Form) / # (Ingredient + Strength + Dose Form)} Pack</li>
    <li>BPCK = {# (Ingredient + Strength + Dose Form) / # (Ingredient + Strength + Dose Form)} Pack [Brand Name]</li>
  </ul>
</p>
<p>
  Given the format for the above RxNorm Term Types (SCD, SBD, GPCK, and BPCK), searches on drugs with more than the one component specified in a single drug-name search parameter instance, such as a search with Name + Form, may not yield the desired results. For example, a search for “acetaminophen Tablet”, will not return any results for the above RxNorm Term Types identified above since the format of those types has a strength in between the ingredient and the dose form (e.g. “acetaminophen 500 MG Oral Tablet”).
</p>
<p>
  Servers <strong>SHALL</strong> support a MedicationKnowledge.code.coding repetition providing the more general RxNorm code (and name) with Term Type of SCDG (Semantic Clinical Drug Form Group) or SBDG (Semantic Branded Drug Form Group) when there is a concept matching the primary code represented by the Term Type SCD or SBD respectively. This requirement includes using the respective RxNorm name in the display of the coding repetition. The full drug form group name has several components presented in the following formats:
  <ul>
    <li>SCDG = Ingredient + Dose Form Group</li>
    <li>SBDG = Ingredient + Dose Form Group + [Brand Name]</li>
  </ul>
</p>
<p>
  Searches for drugs with the above RxNorm Term Types (SCDG and SBDG) by either code or name will provide the client with a way to search for drugs without a specified strength.
</p>

The [drug-name SearchParameter](SearchParameter-MedicationKnowledge-drug-name.html) includes the `multipleAnd` capability, which allows for multiple `drug-name` search parameters within a single query. With this capability it is possible to search by drug name and form where a dose form group is not available. This capability should be used sparingly, as each additional partial string search parameter increases the load on the server. 

For Example:
  `MedicationKnowledge?drug-name:contains=acetaminophen&drug-name:contains=Tablet`

This search will return all matching drug names with both the ingredient “acetaminophen” and dose form “Tablet”. This will also return any matching combination or pack drugs.

Another factor clients need to consider when searching for drugs by name, is that individual drug names may be contained within combination drugs (e.g., a search on acetaminophen will return many combination drugs). Clients may need to filter search results to fit their requirements.

<a name="presenting-alternative-medications"></a>
#### Presenting Drug Alternatives 
<p>
  Finding appropriate alternatives of a prescribed medication is complex and often depends on additional clinical information about the patient well as the condition or set of conditions for which the medication is meant to address. The information and business rules necessary to identify possible therapeutic alternatives, and therefore the ability to search for such alternatives, lies outside of the scope of this guide.
</p>
<a name="representing-drug-tiers"></a>
#### Representing Drug Tiers
<p>
  Drug tiers are not standardized. The current Implementation Guide provides a defined, but extensible value set for tier identifiers based on the example list in the QHP formulary specification. A move towards standardization might make this data more useful for clients of the interface.
</p>
<a name="representing-pharmacy-types"></a>
#### Representing Pharmacy Types
<p>
  Pharmacy types are not standardized. The current Implementation Guide provides a defined value set for tier identifiers based on the example list in the QHP formulary specification which mixes channels (retail and mail order) with quantity prescribed (1 month, 3 month, etc). A move towards standardization might make this data more useful for clients of the interface.
</p>