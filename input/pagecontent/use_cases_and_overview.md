
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
    <strong>Health Plan</strong>: A provider of drug coverage who publishes their formulary content and plan-level co-insurance information through the Drug Formulary FHIR API.
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
  This use case allows a consumer to compare the drug coverage of several different health plans and determine which plan has the lowest plan level estimated cost, personalized to the consumers's set of medications. The mobile application retrieves the consumer's medication list from an electronic health record system where the consumer's patient data is stored. This security and privacy of a patient's access to their health information is beyond the scope of this Implementation Guide. The consumer could also independently maintain their medication list in the mobile application or elsewhere. The mobile application identifies the relevant formulary endpoint through means that are beyond the scope of this implementation guide (see <a href="index.html#disclaimers-and-assumptions">Disclaimers and Assumptions</a>). For each payer, the mobile application queries the payer's formulary service to retrieve the list of health plans provided by that payer. Then, for each plan,the mobile application queries the formulary service to retrieve the plan-level estimated costs specific to the consumer's medication list.
</p>
<p>
  Access to the formulary service should not require authentication, and the server should not maintain any records that could associate the consumer with the medication list that was queried.
</p>
<p>&nbsp;</p>
<p><img style="width: 100%; height: auto;" src="Slide2.jpg" /></p>
<p>&nbsp;</p>

<a name="formulary-structure"></a>
### Formulary Structure
<p>
  Formularies in the United States are normally published by health insurers on an annual basis, with minor updates during the year. It is critical that health insurers update their published Formularies following these minor updates.
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
  This Implementation Guide closely follows the formulary information model of the <a href="https://github.com/CMSgov/QHP-provider-formulary-APIs">formularies for Qualified Health Plans (QHPs) on the federal health insurance marketplace for healthcare.gov</a>. Publishing formularies in the QHP format should be familiar to many payers. Drugs are specified by RxNorm codes of prescribable drugs, as constrained by the <a href="https://build.fhir.org/ig/HL7/US-Core-R4/ValueSet-us-core-medication-codes.html"> US Core Medication Codes value set</a>. The QHP data model mandates specific value sets for some data types (e.g., types of copayments), but leaves value sets for other data types at the discretion of the payer (e.g., drug tier identifiers, pharmacy types). and does not include data that is fairly standard across formularies (drug classifications, alternative drugs). The following object model shows the relationships between the resources in the current IG. The only areas where this Implementation Guide extends beyond the QHP formulary information model is the addition of DrugClass and DrugAlternatives to FormularyDrug, as highlighted in the figure.
</p>
<p>&nbsp;</p>
<p><img style="width: 100%; height: auto;" src="formularyQHP.jpg" /></p>
<p>
  A FormularyDrug represents the availability of a drug with a specific RxNorm code within the tier structure and prescribing constraints of a specific CoveragePlan. If a FHIR endpoint provides data on multiple CoveragePlans, querying for FormularyDrugs by their RxNorm code would return multiple entries. Each of these FormularyDrugs could associate the drug to a distinct DrugTier in the associated CoveragePlan, with plan-specific prescribing constraints. The CoveragePlan PlanID field and the FormularyDrug PlanID extension field associate a FormularyDrug with a CoveragePlan.
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
  When accessing data through an authenticated API, the response depends on whether the member is currently enrolled in a plan and whether they are a member of a group.  The following table indicates how the Formulary API should respond to requests when a plan ID is specified and when it is not.
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
#### Presenting Drug Alternatives 
<p>
  There may be brand or generic alternatives to a particular drug in the formulary. The QHP formulary information model, does not include drug alternatives. The current Implementation Guide provides for each FormularyDrug to include an array of references to other FormularyDrugs within the same CoveragePlan. There may be better ways to represent equivalence classes among FormularyDrugs using the DrugClass.
</p>
<a name="representing-drug-tiers"></a>
#### Representing Drug Tiers
<p>
  Drug tiers are not standardized. The current Implementation Guide provides a defined, but extensible value set for tier identifiers based on the example list in the QHP formulary specification. A move towards standardization might make this data more useful for clients of the interface.
</p>
<a name="representing-drug-classifications"></a>
#### Representing Drug Classifications
<p>
  Within a consumer-facing drug formulary the primary use of drug classification is to enable hierarchical browsing of the formulary contents from a therapeutic disease area (e.g., hypertension) or pharmacologic action (e.g., beta blocker) perspective. An empirical review of web/PDF-based drug formularies found a variety of different hierarchies being used to present the formulary to consumers. The current IG suggests the utility of using the FormularyDrug.medicineClassification field to provide drug classification information, but does not specify a particular vocabulary. This might be a fruitful area for subsequent standardization.
</p>
<a name="representing-pharmacy-types"></a>
#### Representing Pharmacy Types
<p>
  Pharmacy types are not standardized. The current Implementation Guide provides a defined value set for tier identifiers based on the example list in the QHP formulary specification which mixes channels (retail and mail order) with quantity prescribed (1 month, 3 month, etc). A move towards standardization might make this data more useful for clients of the interface.
</p>
<a name="provision-of-formulary-ids"></a>
#### Provision of Formulary IDs and Availability of Directory
<p>
  There is no single, authoritative indentifier that can be associated with a formulary (e.g., like NPI numbers identify providers in the United States). How can unique formulary IDs be provisioned such that they can be implemented consistently by all payers and referenced by other entities (e.g., health plans)? The NCPDP Formulary and Benefits eRx implementation guide requires an identifier for each formulary. Perhaps that can be leveraged.
</p>
<a name="searching-formulary-drugs"></a>
#### Searching for Formulary Drugs
<p>
  As part of the Patient Access API, the client will have the PlanId and can query the MedicationKnowledge with the extension that includes PlanID.When shopping for a health plan, a client system could query for available CoveragePlan resources, then query for FormularyDrugs using the appropriate PlanIDs. Alternatively, a client could search for FormularyDrug resources without a specific PlanID using the parameter MedicationKnowledge?PlanID:missing=false (if the server supports the “:missing” modifier for that search parameter.
</p>