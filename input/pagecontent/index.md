<a name="drug-formulary"></a>
### DaVinci Payer Data Exchange US Drug Formulary
<p>
  This implementation guide defines a FHIR interface to a health insurer's drug formulary information for patients/consumers. A drug formulary is a list of brand-name and generic prescription drugs a health insurer agrees to pay for, at least partially, as part of health insurance coverage. Drug formularies are developed based on the efficacy, safety and cost of drugs. The primary <a href="use_cases_and_overview.html#use-cases">use cases</a> for this FHIR interface enable consumers/members/patients to understand the costs and alternatives for drugs that have been prescribed, and to compare their drug costs across different insurance plans.
</p>
<p>
  A key architectural issue that is beyond the scope of this implementation guide is how a user finds the FHIR endpoint for a particular formulary. This implementation guide assumes that the FHIR endpoint is known to the user.
</p>

<div class="stu-note">
<!--   <h3>Changes for the STU Update (since v1.0.1 - STU1 Technical Correction)</h3>
  <p>
    This proposed STU Update addresses several fixes, technical corrections, errata, and clarifications listed below.  They have been reviewed and voted on by the members of the <a href="https://confluence.hl7.org/display/PHAR">HL7 Pharmacy Work Group</a> which is sponsoring this errata release and reconciliation of comments.
  </p>
  <p>
    <strong>The Peer Review scope for this STU Update only includes the changes listed below.  Interested parties are free to comment on any part of the IG, but those not regarding the issues below will be considered for future versions.  Once peer reviewed and comments are processed, the version will be incremented to an STU Update version 1.1.0.</strong>
  </p>
  <p>
    <strong>To make a comment on the STU Update:</strong>
    <ol>
      <li>
        Create a new Jira tracker (New trackers can be made by clicking on the link in the page footer entitled "Propose a change" and clicking the "Create" button at the top of the Jira page)
      </li>
      <li>
        Select "US Da Vinci PDex Formulary (FHIR)" as the Specification and fill in other relevant information.
      </li>
      <li>
        Include the related Jira issue in the "Related Issues" section on the "Advanced" tab.
      </li>
    </ol>
  </p>
 -->  <p>
    <b>The following issues are addressed in this release:</b>
  </p>
  <ul>
     <li>
      <a href="https://jira.hl7.org/browse/FHIR-23127">FHIR-23127</a>:
      <p>
        The official FHIR IG template- PDex Formulary #47 has been implemented. 
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-28293">FHIR-28293</a>:
      <p>
        Changed the <a href="StructureDefinition-usdf-PlanID-extension.html">PlanID extension</a> description to from:
      </p>
      <p>
        <i>“Unique, 14-character, HIOS-generated Plan ID number (Plan IDs must be unique, even across different markets.)”</i>
      </p>
      <p>to:</p>
      <p>
        <i>“Unique, generated Plan ID number, such as HIOS ID for QHPs or Contract Number for Medicare Advantage Plans.  Plan IDs must be unique within each organization that manages their formulary data.”</i>
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-29965">FHIR-29965</a>:
      <p>
        Added guidance that <a href="StructureDefinition-usdf-MarketingURL-extension.html">CoveragePlan.MarketingURL</a>, <a href="StructureDefinition-usdf-SummaryURL-extension.html">CoveragePlan.SummaryURL</a>, and <a href="StructureDefinition-usdf-FormularyURL-extension.html">CoveragePlan.FormularyURL</a> can point to a page providing links for multiple language options.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-30412">FHIR-30412</a>:
      <p>
        Changed the type of <a href="StructureDefinition-usdf-MarketingURL-extension.html">CoveragePlan.MarketingURL</a>, <a href="StructureDefinition-usdf-SummaryURL-extension.html">CoveragePlan.SummaryURL</a>, and <a href="StructureDefinition-usdf-FormularyURL-extension.html">CoveragePlan.FormularyURL</a> extensions from a String value to a URL value.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-30924">FHIR-30924</a>:
      <p>
        Added "Not applicable" to the <a href="CodeSystem-usdf-CopayOptionCS.html">usdf-CopayOptionCS</a> code system.  Zero-deductible cost sharing is represented by a co-pay value of "Not applicable" and a co-insurance value of "No charge", consistent with updated QHP guidelines.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-30925">FHIR-30925</a>:
      <p>
        Added an optional boolean <a href="StructureDefinition-usdf-MailOrder-extension.html">MailOrder</a> extension to FormularyDrug profile.  The MailOrder value in FormularyDrug overrides the MailOrder value in the <a href="StructureDefinition-usdf-DrugTierDefinition-extension.html">DrugTierDefinition</a> extension for <a href="StructureDefinition-usdf-CoveragePlan.html">CoveragePlan</a>.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-30933">FHIR-30933</a>:
      <p>
        Changed the type of <a href="StructureDefinition-usdf-EmailPlanContact-extension.html">EmailPlanContact</a> extension from String to URL. We also added narrative to <a href="StructureDefinition-usdf-EmailPlanContact-extension.html">EmailPlanContact</a> that a FHIR URL type can be a web-url or an email address. 
      </p>
    </li>
     <li>
      <a href="https://jira.hl7.org/browse/FHIR-31031">FHIR-31031</a>:
      <p>
        Since _profile search parameter is not required for <a href="queries.html#anticipated-client-queries">anticipated client queries</a>, we removed the "_profile" search paramteter for the Medication Knowledge and List resouce examples.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-31037">FHIR-31037</a>:
      <p>
        The CoveragePlan PlanIDType extension was not defined for non-HIOS plans so we included narrative in <a href="StructureDefinition-usdf-PlanIDType-extension.html">Plan ID Type</a>, to include "For all other plans this should be: OTHER-PLAN-ID as part of the definition. 
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-31073">FHIR-31073</a>:
      <p>
        Added guidance for behavior for <a href="use_cases_and_overview.html#authenticated">authenticated member access</a>, when the member has already selected a plan or not, when they belong to a plan group or not.
      </p>
    </li>
     <li>
      <a href="https://jira.hl7.org/browse/FHIR-31591">FHIR-31591</a>:
      <p>
        Changed the code display in <a href="MedicationKnowledge-cmsip9.html">Formulary Drug cmspi9</a>, to "doxepin hydrochloride 50 MG/ML Topical Cream" to match the given code of #1000091.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-31672">FHIR-31672</a>:
      <p>
        Added guidance to enter "Not applicable" in the <a href="StructureDefinition-usdf-Network-extension.html">Network</a> extension for a CoveragePlan that has no applicable network associated with it.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-31683">FHIR-31683</a>:
      <p>
        We changed List.code to be set to the code DRUGPOL and changed the cardinality to 1..1 in the <a href="StructureDefinition-usdf-CoveragePlan.html#profile">Formulary Coverage Plan</a>. Additionally, in <a href="queries.html#find-coverageplan-by-its-planid">Anticipated Client Queries</a> the queries that reference list now reference the DRUGPOL code.
      </p>
    </li>
     <li>
      <a href="https://jira.hl7.org/browse/FHIR-31684">FHIR-31684</a>:
      <p>
        Guidance was added to <a href="use_cases_and_overview.html#searching-for-formulary-drugs">Additional Guidance</a> regarding searching for FormularyDrugs with know PlanIDs and without.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-31672">FHIR-31762</a>:
      <p>
        Updated <a href="search_parameters.html">search parameter</a> descriptions to include all of the search parameters in the <a href="CapabilityStatement-usdf-server.html">CapabilityStatement</a>.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-32178">FHIR-32178</a>:
      <p>
        Added "charge" to the <a href="CodeSystem-usdf-CopayOptionCS.html">usdf-CopayOptionCS</a> and the <a href="CodeSystem-usdf-CoinsuranceOptionCS.html">usdf-CoinsuranceOptionCS</a>code systems to handle drugs that consist of a charge, but are not subject to a deductible.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-32622">FHIR-32622</a>:
      <p>
        Guidance was added to  <a href="StructureDefinition-usdf-CoveragePlan.html">Formulary Coverage Plan</a> indicating that we are considering basing the CoveragePlan profile off of the InsurancePlan resouce in a future release instead of the List resource.
      </p>
    </li>
     <li>
      <a href="https://jira.hl7.org/browse/FHIR-32625">FHIR-32625</a>:
      <p>
        Chanegs were implemented to improve the navigation by updating the <a href="toc.html">Table of Contents</a>, the specification menu, and page design.
      </p>
    </li>
     <li>
      <a href="https://jira.hl7.org/browse/FHIR-32627">FHIR-32627</a>:
      <p>
        Guidance was added to  <a href="search_parameters.html">Search Parameters</a> indicaitng that the search parameters DrugName, DrugPlan, and DrugTier will be changed to lower-case 'drug-name', 'drug-plan', and 'drug-tier' in a future release. 
      </p>
    </li>
     <li>
      <a href="https://jira.hl7.org/browse/FHIR-32723">FHIR-32723</a>:
      <p>
        Several value sets found in <a href="artifacts.html#terminology-code-systems">Terminology: Code Systems</a> were not properly displaying the value and description correctly for "code for qualifier for coinsurance rate", "codes for qualifier of copay amount" and "codes for medicatioin drug tiers in health plans". This has been corrected. The definition column has been updated to no longer be blank and contain the proper information. 
      </p>
    </li>
  </ul>
</div>


<a name="introduction"></a>
### Introduction
<p>
  This implementation guide (IG) introduces two FHIR profiles, along with associated extensions, search parameters, and value sets.
</p>
<ul>
  <li>
    <strong><a href="StructureDefinition-usdf-CoveragePlan.html">CoveragePlan</a></strong>: The CoveragePlan profile of the FHIR R4 <a href="http://hl7.org/fhir/R4/list.html">List</a> resource provides links to information about the plan and formulary, contact information, a description of the drugTiers and associated cost sharing models of the plan, and a list of FormularyDrugs.
  </li>
  <li>
    <strong><a href="StructureDefinition-usdf-FormularyDrug.html">FormularyDrug</a></strong>: The FormularyDrug profile of the FHIR R4 <a href="http://hl7.org/fhir/medicationknowledge.html">MedicationKnowledge</a> resource provides plan-specific information about a prescribable drug identified by an RxNORM identifier. Cost sharing for the drug are described by reference to a drug tier defined as part of the coverage plan. Extensions to the MedicationKnowledge resource support important search use cases. Due to the immaturity of the MedicationKnowledge resource, it is expected that it will undergo changes, and those changes may require evolution of the FormularyDrug profile.
  </li>
</ul>
<p>
  Two searchParameters have also been defined to facilitate the anticipated use cases. See the <a href="queries.html">Anticipated Client Queries</a> section for a description of how to query the CoveragePlan and FormularyDrug profiles in support of the anticipated use cases.
</p>
<ul>
  <li>
    <strong><a href="SearchParameter-DrugPlan.html">DrugPlan</a></strong>: Makes the DrugPlan identifier of each FormularyDrug accessible for query
  </li>
  <li>
    <strong><a href="SearchParameter-DrugTier.html">DrugTier</a></strong>: Makes the DrugTier identifier of each FormularyDrug accessible for query
  </li>
</ul>

<a name="expected-users"></a>
### Expected Users 
<p>
  This Implementation Guide is intended for insurers within the United States. Currently, many insurers make their formularies available to patients using PDFs or drug search forms through their websites. Providing formularies using FHIR may allow patients to more easily comparison-shop between plans and could help insurers educate consumers about the differences between various drug tiers/classes.
</p>

<a name="disclaimers-and-assumptions"></a>
### Disclaimers and Assumptions
<ul>
  <li>
    <strong>Drug Formulary includes Plan-Level Data Only</strong>: The intent of this implementation guide is to make the plan-level information regarding formulary content and cost-sharing available through a standard interface for third party applications. Most users will access this data through a third party application. That application should clearly communicate to the user that the cost-sharing information in the formulary may not tell them precisely what they will pay at the pharmacy, and might not reflect their drug benefit. There is an ongoing effort by Carin/NCPDP to develop a Real Time Pharmacy Benefit Check (RTPBC) implementation guide. Future ballots of this implementation guide and the RTPBC implementation guide should be harmonized.
  </li>
  <li>
    <strong>The MedicationKnowledge Resource is immature</strong>: When designing this IG, we initially planned to profile Medication.&nbsp; Based on a strong recommendation from the PharmaWG we shifted to profiling Medicationknowledge.&nbsp; &nbsp;The PharmaWG felt that MedicationKnowledge was a better choice, even with its low maturity, since it is more suitable as an artifact and already included some of fields that would be required as extensions to medication (e.g., classification). MedicationKnowledge and FormularyDrug will co-evolve moving forward.
  </li>
  <li>
    <strong>The formulary endpoint is known to the client</strong>: This IG assumes that the formulary endpoint is known to the client.&nbsp; There is an overarching system architecture issue that is critical to resolve -- how does the client discover the FHIR endpoint of interest.&nbsp;&nbsp;&nbsp;For the purposes of this IG, we consider that problem out of scope.
  </li>
</ul>



