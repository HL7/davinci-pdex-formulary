
<a name="use-cases"></a>
### Use Cases

<a name="actors"></a>
#### Actors
<ul>
  <li>
    <strong>Member</strong>: A person to whom health care coverage has been extended by the policyholder (generally their employer) or any of their covered family members. Sometimes referred to as the insured or insured person. The cost of medications for a member is a function of the drug coverage under their health insurance plan, their benefits based on their already satisified deductibles, and the pharmacy where their prescriptions are filled.
  </li>
  <li>
    <strong>Consumer</strong>: A person who may or may not be a member, who wishes to explore the formulary content and plan-level co-insurance.
  </li>
  <li>
    <strong>Health Plan</strong>: A provider of insurance coverage that often includes a drug coverage plan which publishes formulary content and plan-level co-insurance information through the Drug Formulary FHIR API.
  </li>
</ul>

<a name="Med Copays under Health Plan"></a>
#### Med Copays under Health Plan
<p>
  This use case allows a member to determine the plan level estimated costs of each of their medications under the drug coverage of their current health plan. The mobile application queries the formulary service for cost information about the drugs that the member takes and provides the plan level estimated cost for each medication under the member's current health plan.
</p>
<p>
  Note that for this use case the coverage plan could provide authenticated or open access to the plan formulary, and the privacy of the member's data is protected.
</p>
<p><img style="width: 100%; height: auto;" src="Slide1.jpg" /></p>
<p>&nbsp;</p>
<a name="Shopping for Health Plans"></a>
#### Shopping for Health Plans
<p>
  This use case allows a consumer to compare the drug coverage of several different health plans and determine which plan has the lowest plan level estimated cost, personalized to the consumers's set of medications. The mobile application retrieves the consumer's medication list from an electronic health record system where the consumer's patient data is stored (outside the scope of this implementation guide). The consumer could also independently maintain their medication list in the mobile application or elsewhere. The mobile application identifies the relevant formulary endpoint through means that are beyond the scope of this implementation guide (see <a href="index.html#disclaimers-and-assumptions">Disclaimers and Assumptions</a>). For each payer, the mobile application queries the payer's formulary service to retrieve the list of health plans provided by that payer. Then, for each plan,the mobile application queries the formulary service to retrieve the plan-level estimated costs specific to the consumer's medication list.
</p>
<p>
  Non-authenticated access should not maintain any records that could associate a consumer with the medications queried.
</p>
<p>&nbsp;</p>
<p><img style="width: 100%; height: auto;" src="Slide2.jpg" /></p>
<p>&nbsp;</p>

<a name="formulary-structure"></a>
### Formulary Structure
<p>
  Formularies in the United States are normally published by health insurers on an annual basis, with minor updates during the year. It is critical that health insurers update their published formularies following these minor updates.
</p>
<p>
  Insurers regularly administer multiple health insurance and drug coverage plans and each of those plans may have its own formulary.
</p>
<p>
  Each formulary contains a list of drugs. Drugs are placed into <strong>tiers</strong> that largely determine the cost to the consumer/patient. The number and purpose of drug tiers varies across payers. Each tier has an associated cost-sharing model that includes deductibles and/or coinsurance components for drugs in the tier when purchased through various pharmacy types.
</p>
<p>
  In addition to the drug tier, drugs may also list requirements on the patient (e.g., age or gender) or limitations on prescription (e.g., prior authorization).
</p>
<p>
  This Implementation Guide (IG) was signifinicantly influenced by the formulary information model of the <a href="https://github.com/CMSgov/QHP-provider-formulary-APIs">formularies for Qualified Health Plans (QHPs) on the federal health insurance marketplace for healthcare.gov</a>. Publishing formularies in the QHP format should be familiar to many payers. Drugs are specified by RxNorm codes of prescribable drugs, as constrained by the <a href="https://build.fhir.org/ig/HL7/US-Core-R4/ValueSet-us-core-medication-codes.html"> US Core Medication Codes value set</a>. The QHP data model mandates specific value sets for some data types (e.g., types of copayments), but leaves value sets for other data types at the discretion of the payer (e.g., drug tier identifiers, pharmacy types). and does not include data that is fairly standard across formularies (drug classifications, alternative drugs). The following object model shows the relationships between the resources in this IG. The areas where this Implementation Guide extends beyond the QHP formulary information model in the creation of the <a href="StructureDefinition-usdf-FormularyItem.html">Formulary Item</a>, used to define the relationship and attributes a drug has with a drug plan, and the addition of medicineClassification and relatedMedicationKnowledge alternative to the <a href="StructureDefinition-usdf-FormularyDrug.html">Formulary Drug</a>. The set of the Formulary Items that point to a specific drug plan, represent the formulary list of drugs.
</p>
<p>&nbsp;</p>
<p><img style="width: 100%; height: auto;" src="Da Vinci - Formulary STU2 Structure Diagram.png" /></p>
<p>

  A FormularyDrug represents the individual prescribable drug defined with a specific RxNorm code and contains related medications and synonyms used to identify the drug. The FormularyItem links a drug with a drug plan and includes the attributes that drug has in relation to the drug plan, including the drug tier and prescribing constraints.
  <!-- TODO add guidance on searchng 
   If a FHIR endpoint provides data on multiple CoveragePlans, querying for FormularyDrugs by their RxNorm code would return multiple entries. Each of these FormularyDrugs could associate the drug to a distinct DrugTier in the associated CoveragePlan, with plan-specific prescribing constraints. The CoveragePlan PlanID field and the FormularyDrug PlanID extension field associate a FormularyDrug with a CoveragePlan.
   -->
</p>


<a name="access-methods"></a>
### Access Methods
<p>The formulary service can potentially be accessed two different ways:</p>
<ol>
  <li>
    <em data-stringify-type="italic">Authenticated API</em>: Access to the formulary service when integrated with protected&nbsp;health&nbsp;information (PHI) or personally identifiable information (PII) as part of the Patient Access API SHALL be protected through an authorized, authenticated transaction as described in the Da Vinci Health Record Exchange (HRex) FHIR Implementation Guide for the&nbsp;<a class="c-link" href="http://hl7.org/fhir/us/davinci-hrex/2020Sep/security.html" target="_blank" rel="noopener noreferrer" data-stringify-link="http://hl7.org/fhir/us/davinci-hrex/2020Sep/security.html" data-sk="tooltip_parent">September 2020 Ballot</a>.
  </li>
  <li>
    <em data-stringify-type="italic">Unauthenticated API</em>: When exchanging formulary data exclusively, which is public information without any PHI or PII, the formulary service MAY also be accessed through an API that does not require authentication or authorization.&nbsp;The formulary server SHALL NOT maintain any records through the unauthenticated API that could associate the consumer with the medication list that was queried.
  </li>
</ol>
<a name="authenticated"></a>
#### Authenticated 
<p>
  When accessing data through an authenticated API, the response depends on whether the member is currently enrolled in a plan and whether they are a member of a group. The following table indicates how the Formulary API should respond to requests when a plan ID is specified and when it is not.
</p>
<table border="1">
  <thead>
    <th>Situation</th>
    <th>PlanID specified</th>
    <th>PlanID not specified</th>
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
      <td>Bundle of available individual CoveragePlans</td>
    </tr>
    <tr>
      <td>No plan selected/in group</td>
      <td>Zero plans returned (200)</td>
      <td>Bundle of available group CoveragePlans</td>
    </tr>
    <tr>
      <td>Plan selected/no group</td>
      <td>If PlanID matches selected plan, return CoveragePlan, otherwise zero plans returned</td>
      <td>Zero plans returned (200)</td>
    </tr>
    <tr>
      <td>Plan selected/in group</td>
      <td>If PlanID matches selected plan, return CoveragePlan, otherwise zero plans returned</td>
      <td>Bundle of available group CoveragePlans. If no plans available, zero plans returned</td>
    </tr>
  </tbody>
</table>
<a name="unauthenticated"></a>
#### Unauthenticated
<p>
  When accessing data through an unauthenticated API, the conformant payer formulary service SHALL NOT require a formulary mobile application to send consumer identifying information in order to query for the list of health plans provided by that payer and the medication costs for each plan, specific to the consumer&rsquo;s set of medications.
</p>
<p>
  An unauthenticated API to the formulary service is needed to implement the &ldquo;Shopping for Health Plans&rdquo; use case detailed in this implementation guide.
</p>



<a name="additional-guidance"></a>
### Additional Guidance 

<a name="presenting-alternative-medications"></a>
#### Searching by Drug Names 
<!-- TODO make any necessary changes on drug name searching depeniding on dscussions from the IG Team including support on drugs not on formulary, synonyms, and support for additional RxNorm TTYs-->
<p>
  Formulary searches may be restricted to just the drugs supported by the payer therefore it is up to the user or calling application to convert patient searching requirements for branded or equivalent drugs into one or more formulary searches.
  Payers may only have certain drugs on their formulary and therefore available for searching. 
</p>
<p>
  Only covered drugs may appear in the formulary and non-covered drugs are simply not included. For example, a payer may pay for a generic form of a drug, but does not have a brand name in their formulary. To retrieve matching drugs and available alternatives, it may be necessary for a client to search using the ingredient (generic) name in addition to a brand drug name.
</p>
<p>
  The preferred way to search for drugs is to use an RxNorm code (RxCUI). The RxNorm codes and names are freely available and services to look-up codes exist.
</p>
<p>
  As an alternative, this Implementation Guide provides the ability to search for FormularyDrug (MedicationKnowledge) resources by drug name through the [drug-name](SearchParameter-drug-name.html) search parameter. This search parameter is based on the MedicationKnowledge.code.coding.display and provides a full (`exact`) or partial (`contains`) equals (`eq`) string match. Per the FHIR Specification, the [Correct RxNorm Display]( https://www.hl7.org/fhir/rxnorm.html#4.3.2.3) is the Full RxNorm name of either the Semantic Clinical Drug (SCD) or Semantic Brand Drug (SBD). The full drug name has several components presented in the following formats:
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
  <b>Note:</b> RxNorm does define Term Types that include only the ingredient and dose form or dose form group, such as SCDF (Semantic Clinical Drug Form), which does have the format of Ingredient + Dose Form (e.g. “acetaminophen Oral Tablet”). These term types, however, are not specific enough to represent a prescribable medication, as they do not incorporate a strength, and therefore are not likely to appear in a formulary.
</p>

  The [drug-name SearchParameter](SearchParameter-drug-name.html) includes the `multipleAnd` capability, which allows for multiple `drug-name` search parameters within a single query. With this capability it is possible to search by drug name and form. This capability should be used sparingly, as each additional partial string search parameter increases the load on the server. 

  For Example:
  `MedicationKnowledge?drug-name:contains=acetaminophen&drug-name:contains=Tablet`

  This search will return all matching drug names with both the ingredient “acetaminophen” and dose form “Tablet”. This will also return any matching combination or pack drugs.

<p>
  Another factor clients need to consider when searching for drugs by name, is that individual drug names may be contained within combination drugs (e.g., a search on acetaminophen will return many combination drugs). Clients may need to filter search results to fit their requirements.
</p>

<a name="presenting-alternative-medications"></a>
#### Presenting Drug Alternatives 
<p>
  There may be brand or generic alternatives to a particular drug in the formulary. The QHP formulary information model, does not include drug alternatives. The current Implementation Guide provides for each FormularyDrug to include an array of references to other FormularyDrugs that are considered drug alternatives. These drug alternatives may fall under diferent therapeutic uses respresented by their respective medicineClassification. <!-- TODO need an example -->
</p>
<a name="representing-drug-tiers"></a>
#### Representing Drug Tiers
<p>
  Drug tiers are not standardized. The current Implementation Guide provides a defined, but extensible value set for tier identifiers based on the example list in the QHP formulary specification. A move towards standardization might make this data more useful for clients of the interface. <!-- TODO have we defined a possible larger and standard set of tiers? -->
</p>
<a name="representing-drug-classifications"></a>
#### Representing Drug Classifications
<p>
  Within a consumer-facing drug formulary the primary use of drug classification is to enable hierarchical browsing of the formulary contents from a therapeutic disease area (e.g., hypertension) or pharmacologic action (e.g., beta blocker) perspective. An empirical review of web/PDF-based drug formularies found a variety of different hierarchies being used to present the formulary to consumers. The current IG suggests the utility of using the FormularyDrug.medicineClassification field to provide drug classification information, but does not specify a particular vocabulary. This might be a fruitful area for subsequent standardization. <!-- TODO can we find a classification of therapuetic class of pharmacologic action -->
</p>
<a name="representing-pharmacy-types"></a>
#### Representing Pharmacy Types
<p>
  Pharmacy types are not standardized. The current Implementation Guide provides a defined value set for tier identifiers based on the example list in the QHP formulary specification which mixes channels (retail and mail order) with quantity prescribed (1 month, 3 month, etc). A move towards standardization might make this data more useful for clients of the interface.
</p>
<a name="provision-of-formulary-ids"></a>
#### Provision of Formulary IDs and Availability of Directory
<p>
  There is no single, authoritative indentifier that can be associated with a formulary (e.g., like NPI numbers identify providers in the United States). How can unique formulary IDs be provisioned such that they can be implemented consistently by all payers and referenced by other entities (e.g., health plans)? The NCPDP Formulary and Benefits eRx implementation guide requires an identifier for each formulary. Perhaps that can be leveraged. <!-- TODO is this really an issue? Need to follow up if the cited IG is useful for this -->
</p>
<!--
TODO
The following does not directly apply, but searching needs to be updated and this section may need to be revamped as opposed to removed.
<a name="searching-formulary-drugs"></a>
#### Searching for Formulary Drugs
<p>
  As part of the Patient Access API, the client will have the PlanId and can query the MedicationKnowledge with the extension that includes PlanID.When shopping for a health plan, a client system could query for available CoveragePlan resources, then query for FormularyDrugs using the appropriate PlanIDs. Alternatively, a client could search for FormularyDrug resources without a specific PlanID using the parameter MedicationKnowledge?PlanID:missing=false (if the server supports the “:missing” modifier for that search parameter.
</p>
-->