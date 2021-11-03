<a name="change_notes"></a>
### Changes and Updates for Version 1.1.0
The current official published version of Da Vinci Payer Data Exchange (PDex) US Drug Formulary for FHIR R4 (STU Update of STU 1)

  <p>
    This STU Update addressed several fixes, technical corrections, errata, and clarifications listed below.
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
  <p>
    <b>The following issues are to be addressed in this release:</b>
  </p>
  <ul>
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
        Guidance was added to  <a href="search_parameters.html">Search Parameters</a> indicaitng that the search parameters DrugName, DrugPlan, and DrugTier will be changed to more compliant names like: lower-case 'drug-name', 'drug-plan', and 'drug-tier' in a future release. 
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-32723">FHIR-32723</a>:
      <p>
        Several value sets found in <a href="artifacts.html#terminology-code-systems">Terminology: Code Systems</a> were not properly displaying the value and description correctly for "code for qualifier for coinsurance rate", "codes for qualifier of copay amount" and "codes for medicatioin drug tiers in health plans". This has been corrected. The definition column has been updated to no longer be blank and contain the proper information. 
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-32958">FHIR-32958</a>:
      <p>
        Added guidance for searching by <a href="use_cases_and_overview.html#searching-by-drug-names">drug name</a> strings.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-32958">FHIR-32958</a>:
      <p>
        Added guidance on <a href="use_cases_and_overview.html#searching-by-drug-names">drug name searching</a> with description of RxNorm term types, formats, and drug names that might appear on a formulary.
      </p>
    </li>
  </ul>
<p>&nbsp;</p>
