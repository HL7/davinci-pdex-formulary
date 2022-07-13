<a name="change_notes"></a>

### Changes and Updates for Version 2.0.0

The current official published version of Da Vinci Payer Data Exchange (PDex) US Drug Formulary for FHIR R4 (STU 2)
  <p>
    <b>The following issues are addressed in this release:</b>
  </p>
  <ul>
     <li>
      <a href="https://jira.hl7.org/browse/FHIR-33181">FHIR-33181</a>:
      <p>
        Changed CoveragePlan profile from using a List resource to two InsurancePlan profiles; one defining the higher level <a href="StructureDefinition-usdf-PayerInsurancePlan.html">Payer Insurance Plan</a> and the other defining the <a href="StructureDefinition-usdf-Formulary.html">Formulary</a> provides general information about a formulary and acts as an organizing construct to create a formulary list.
        This change also addresses:
        <ul>
          <li>
            <a href="https://jira.hl7.org/browse/FHIR-33185">FHIR-33185</a> - Creating a prescribable insurance plan <a href="StructureDefinition-usdf-PayerInsurancePlan.html">PayerInsurancePlan</a> that contains a drug coverage with a reference to a formulary and plans cost sharing information.
          </li>
          <li>
            <a href="https://jira.hl7.org/browse/FHIR-29670">FHIR-29670</a> and <a href="https://jira.hl7.org/browse/FHIR-30923">FHIR-30923</a> - Allowing a Formulary Drug to be referenced by multiple drug plans by adding <a href="StructureDefinition-usdf-Formulary.html">Formulary</a> and <a href="StructureDefinition-usdf-FormularyItem.html">FormularyItem</a> profiles.
          </li>
          <li>
            <a href="https://jira.hl7.org/browse/FHIR-31038">FHIR-31038</a> - Creating profiles <a href="StructureDefinition-usdf-PayerInsurancePlan.html">Payer Insurance Plan</a> and <a href="StructureDefinition-usdf-Formulary.html">Formulary</a> to enable querying plans by plan and type or searching for all drug plans adding search parameters <a href="SearchParameter-InsurancePlan-identifier.html">InsurancePlan-identifier</a>, <a href="SearchParameter-InsurancePlan-type.html">InsurancePLan-type</a>, and <a href="SearchParameter-InsurancePlan-formulary-coverage.html">InsurancePlan-formulary-coverage</a> (linking the PayerInsurancePlan and Formulary).
          </li>
          <li>
            <a href="https://jira.hl7.org/browse/FHIR-31572">FHIR-31572</a> - Addressing the need to require an element necessary to link resources by adding extensions <a href="StructureDefinition-usdf-PayerInsurancePlan-definitions.html#InsurancePlan.coverage:drug-coverage.extension:usdf-FormularyReference-extension">formulary reference to PayerInsurancePlan coverage</a> and <a href="StructureDefinition-usdf-FormularyItem-definitions.html#Basic.extension:usdf-FormularyReference-extension">formulary reference to FormularyItem</a>.
          </li>
          <li>
            <a href="https://jira.hl7.org/browse/FHIR-31673">FHIR-31673</a> - Move the EmailPlanContact extension, which can support an email address or url to the better fitting element <a href="StructureDefinition-usdf-PayerInsurancePlan-definitions.html#InsurancePlan.contact">InsurancePlan.contact</a>.
          </li>
          <li>
            <a href="https://jira.hl7.org/browse/FHIR-33183">FHIR-33183</a> - Created a set of <a hef="search_parameters.html">search parameters</a> and <a href="queries.html">anticipated client queries</a> for the new IG structure.
          </li>
          <li>
            <a href="https://jira.hl7.org/browse/FHIR-35600">FHIR-35600</a> and <a href="https://jira.hl7.org/browse/FHIR-35590">FHIR-35590</a> - Use http://terminology.hl7.org/CodeSystem/insurance-plan-type CodeSystem and http://terminology.hl7.org/CodeSystem/insurance-plan-type ValueSet for <a href="StructureDefinition-usdf-PayerInsurancePlan-definitions.html#InsurancePlan.plan.type">Payer InsurancePlan.plan.type</a>, <a href="StructureDefinition-usdf-PayerInsurancePlan-definitions.html#InsurancePlan.coverage:drug-coverage.benefit.type">Payer InsurancePlan.coverage.benefit.type</a>, and <a href="StructureDefinition-usdf-Formulary-definitions.html#InsurancePlan.plan.type">Formulary InsurancePlan.plan.type</a>.
          </li>
        </ul>
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-33182">FHIR-33182</a>:
      <p>
        Created a <a href="StructureDefinition-usdf-FormularyItem.html">Formulary Item profile</a> that links a drug with a drug (formulary) plan and includes the attributes that relate the two. As part of this change, several extensions moved to this profile from the <a href="StructureDefinition-usdf-FormularyDrug.html">Formulary Drug profile</a>.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-37717">FHIR-37717</a>:
      <p>
        Added <a href="use_cases_and_overview.html#specific-drug-coverage-details">Specific Drug Coverage Details</a> section that includes guidance on how to provide details for drugs with different coverages but are represented by the same RxNorm code.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-36142">FHIR-36142</a>:
      <p>
        Changed cardinality of usdf-PharmacyBenefitType-extension in <a href="StructureDefinition-usdf-FormularyItem.html">Formulary Item profile</a> (formerly usdf-MailOrder-extension in Formulary Drug profile) to 1..* and MS.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-35197">FHIR-35197</a>:
      <p>
        Created an <a href="StructureDefinition-usdf-AdditionalCoverageInformation-extension.html">extension</a> on <a href="StructureDefinition-usdf-FormularyItem.html">FormularyItem</a> profile to allow the expression of additional coverage information.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-33186">FHIR-33186</a>:
      <p>
        Created an <a href="StructureDefinition-usdf-InsurancePlanLocation.html">Insurance Plan Location profile</a> for an InsurancePlan to support geolocation.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-36143">FHIR-36143</a>:
      <p>
        Add invariant to <a href="StructureDefinition-usdf-InsurancePlanLocation.html">Insurance Plan Location profile</a> requiring at least an address or a geolocation.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-29964">FHIR-29964</a>:
      <p>
        Added <a href="StructureDefinition-usdf-PriorAuthorizationNewStartsOnly-extension.html">Prior Authorization new Starts Only Extension</a>, <a href="StructureDefinition-usdf-StepTherapyLimitNewStartsOnly-extension.html">Step Therapy New Starts Only Extension</a>, and <a href="StructureDefinition-usdf-QuantityLimitDetail-extension.html">Quantity Limit Detail Extension</a> on <a href="StructureDefinition-usdf-FormularyItem.html">FormularyItem</a> to support more details beyond the original boolean values.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-33184">FHIR-33184</a>:
      <p>
        Improve drug searching through making <a href="StructureDefinition-usdf-FormularyDrug-definitions.html#MedicationKnowledge.doseForm">MedicationKnowledge.doseform</a> Must Support on the <a href="StructureDefinition-usdf-FormularyDrug.html">FormularyDrug</a> profile and adding a <a href="SearchParameter-MedicationKnowledge-doseform.html">doseform</a> SearchParameter.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-34526">FHIR-34526</a> and <a href="https://jira.hl7.org/browse/FHIR-36264">FHIR-36264</a>:
      <p>
        Created a <a href="use_cases_and_overview.html#conformance-expectations">Conformance Expectations section</a> which inherits the HRex conformance expectations which includes the definition of Must Support.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-37478">FHIR-37478</a>:
      <p>
        Removed US Core as a dependency (since no profiles are directly derived from US Core).
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-34527">FHIR-34527</a>:
      <p>
        Changes Must Support flags on the <a href="StructureDefinition-usdf-PayerInsurancePlan.html">PayerInsurancePlan</a>, <a href="StructureDefinition-usdf-Formulary.html">Formulary</a>, <a href="StructureDefinition-usdf-FormularyItem.html">FormularyItem</a>, <a href="StructureDefinition-usdf-FormularyDrug.html">FormularyDrug</a>, and <a href="StructureDefinition-usdf-InsurancePlanLocation.html">InsurancePlanLocation</a> profiles (includes data elements included in previous version profiles on different resources).
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-36137">FHIR-36137</a>:
      <p>
        Made the capability expectation for <a href="StructureDefinition-usdf-InsurancePlanLocation.html">Insurance Plan Location profile</a> SHALL in the <a href="CapabilityStatement-usdf-server.html">CapabilityStatement</a>.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-33248">FHIR-33248</a>:
      <p>
        Remove requirement to support HTTP error response 410 for deleted resources in <a href="CapabilityStatement-usdf-server.html">server CapabilityStatement</a>
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-36169">FHIR-36169</a>:
      <p>
        Add requirement in the <a href="use_cases_and_overview.html#conformance-expectations">Conformance Expectations</a> that servers support CapabilityStatement.instantiates pointing to the included CapabilityStatement.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-34085">FHIR-34085</a>:
      <p>
        Added slicing on <a href="StructureDefinition-usdf-FormularyDrug-definitions.html#MedicationKnowledge.code.coding">FormularyDrug code.coding</a> to support granular (ingredient, strength, and form) RxNorm Code and general (ingredient and form group) to enable finding drugs with different strengths and added guidance on <a href="use_cases_and_overview.html#searching-formulary-drugs">searching formulary drugs</a>. 
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-34758">FHIR-34758</a>:
      <p>
        Combine the copay and coinsurance cost sharing options into a single <a href="CodeSystem-usdf-CostShareOptionCS-TEMPORARY-TRIAL-USE.html">Cost Sharing Option CodeSystem</a>. 
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-36302">FHIR-36302</a>:
      <p>
        Updated the <a href="CodeSystem-usdf-BenefitCostTypeCS-TEMPORARY-TRIAL-USE.html">BenefitCodeTypeCS</a>, <a href="CodeSystem-usdf-DrugTierCS-TEMPORARY-TRIAL-USE.html">DrugTierCS</a>, <a href="CodeSystem-usdf-PharmacyBenefitTypeCS-TEMPORARY-TRIAL-USE.html">PharmacyBenefitTypeCS</a>, and <a href="CodeSystem-usdf-PlanContactTypeCS-TEMPORARY-TRIAL-USE.html">PlanContactTypeCS</a> CodeSystems id to include "" in order to note to implementers that the URL is likely to change (to terminology.hl7.org defined CodeSystems) in the future. 
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-31349">FHIR-31349</a>:
      <p>
        Added deductible-waived to <a href="ValueSet-CopayOptionVS.html">Copay qualifier</a> and <a href="ValueSet-CoinsuranceOptionVS.html">Coinsurance qualifier</a> CodeSystems. 
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-33188">FHIR-33188</a> and <a href="https://jira.hl7.org/browse/FHIR-35367">FHIR-35367</a>:
      <p>
        Added guidance for <a href="use_cases_and_overview.html#bulk-data">Bulk Data Export</a>. 
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-37623">FHIR-37623</a>:
      <p>
        Remove the invalid 'eq' comparator from <a href="SearchParameter-MedicationKnowledge-drug-name.html">Drug Name Search Parameter</a>. 
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-34456">FHIR-34456</a>:
      <p>
        Updated the HRex references to point to version <a href="https://build.fhir.org/ig/HL7/davinci-ehrx/">1.0.0</a>. 
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-35196">FHIR-35196</a>:
      <p>
        Added guidance regarding <a href="use_cases_and_overview.html#presenting-drug-alternatives"> presenting drug alternative</a>. 
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-35365">FHIR-35365</a>:
      <p>
        Added more descriptive descriptions to the extensions included in the <a href="StructureDefinition-usdf-FormularyItem.html">FormularyItem profile</a>. 
      </p>
    </li>
  </ul>
  <!--
    The Following are only changes from the ballot version and final published version
      FHIR-34756 - Improve the name of value set "Type of pharmacies"
      FHIR-35366 - Simplify FormularyItem by inlining drug codes
    

  -->

### Changes and Updates for Version 1.1.0
The current official published version of Da Vinci Payer Data Exchange (PDex) US Drug Formulary for FHIR R4 (STU Update of STU 1)
  <p>
    <b>The following issues are addressed in this release:</b>
  </p>
  <ul>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-28293">FHIR-28293</a>:
      <p>
        Changed the <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-PlanID-extension.html">PlanID extension</a> description to from:
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
        Added guidance that <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-MarketingURL-extension.html">CoveragePlan.MarketingURL</a>, <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-SummaryURL-extension.html">CoveragePlan.SummaryURL</a>, and <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-FormularyURL-extension.html">CoveragePlan.FormularyURL</a> can point to a page providing links for multiple language options.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-30412">FHIR-30412</a>:
      <p>
        Changed the type of <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-MarketingURL-extension.html">CoveragePlan.MarketingURL</a>, <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-SummaryURL-extension.html">CoveragePlan.SummaryURL</a>, and <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-FormularyURL-extension.html">CoveragePlan.FormularyURL</a> extensions from a String value to a URL value.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-30924">FHIR-30924</a>:
      <p>
        Added "Not applicable" to the <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/CodeSystem-usdf-CopayOptionCS.html">usdf-CopayOptionCS</a> code system.  Zero-deductible cost sharing is represented by a co-pay value of "Not applicable" and a co-insurance value of "No charge", consistent with updated QHP guidelines.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-30925">FHIR-30925</a>:
      <p>
        Added an optional boolean <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-MailOrder-extension.html">MailOrder</a> extension to FormularyDrug profile.  The MailOrder value in FormularyDrug overrides the MailOrder value in the <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-DrugTierDefinition-extension.html">DrugTierDefinition</a> extension for <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-CoveragePlan.html">CoveragePlan</a>.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-30933">FHIR-30933</a>:
      <p>
        Changed the type of <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-EmailPlanContact-extension.html">EmailPlanContact</a> extension from String to URL. We also added narrative to <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-EmailPlanContact-extension.html">EmailPlanContact</a> that a FHIR URL type can be a web-url or an email address. 
      </p>
    </li>
     <li>
      <a href="https://jira.hl7.org/browse/FHIR-31031">FHIR-31031</a>:
      <p>
        Since _profile search parameter is not required for <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/queries.html#anticipated-client-queries">anticipated client queries</a>, we removed the "_profile" search parameter for the Medication Knowledge and List resource examples.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-31037">FHIR-31037</a>:
      <p>
        The CoveragePlan PlanIDType extension was not defined for non-HIOS plans so we included narrative in <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-PlanIDType-extension.html">Plan ID Type</a>, to include "For all other plans this should be: OTHER-PLAN-ID as part of the definition. 
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-31073">FHIR-31073</a>:
      <p>
        Added guidance for behavior for <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/use_cases_and_overview.html#authenticated">authenticated member access</a>, when the member has already selected a plan or not, when they belong to a plan group or not.
      </p>
    </li>
     <li>
      <a href="https://jira.hl7.org/browse/FHIR-31591">FHIR-31591</a>:
      <p>
        Changed the code display in <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/MedicationKnowledge-cmsip9.html">Formulary Drug cmspi9</a>, to "doxepin hydrochloride 50 MG/ML Topical Cream" to match the given code of #1000091.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-31672">FHIR-31672</a>:
      <p>
        Added guidance to enter "Not applicable" in the <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-Network-extension.html">Network</a> extension for a CoveragePlan that has no applicable network associated with it.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-31683">FHIR-31683</a>:
      <p>
        We changed List.code to be set to the code DRUGPOL and changed the cardinality to 1..1 in the <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-CoveragePlan.html#profile">Formulary Coverage Plan</a>. Additionally, in <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/queries.html#find-coverageplan-by-its-planid">Anticipated Client Queries</a> the queries that reference list now reference the DRUGPOL code.
      </p>
    </li>
     <li>
      <a href="https://jira.hl7.org/browse/FHIR-31684">FHIR-31684</a>:
      <p>
        Guidance was added to <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/use_cases_and_overview.html#searching-for-formulary-drugs">Additional Guidance</a> regarding searching for FormularyDrugs with know PlanIDs and without.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-31672">FHIR-31762</a>:
      <p>
        Updated <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/search_parameters.html">search parameter</a> descriptions to include all of the search parameters in the <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/CapabilityStatement-usdf-server.html">CapabilityStatement</a>.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-32178">FHIR-32178</a>:
      <p>
        Added "charge" to the <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/CodeSystem-usdf-CopayOptionCS.html">usdf-CopayOptionCS</a> and the <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/CodeSystem-usdf-CoinsuranceOptionCS.html">usdf-CoinsuranceOptionCS</a>code systems to handle drugs that consist of a charge, but are not subject to a deductible.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-32622">FHIR-32622</a>:
      <p>
        Guidance was added to  <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/StructureDefinition-usdf-CoveragePlan.html">Formulary Coverage Plan</a> indicating that we are considering basing the CoveragePlan profile off of the InsurancePlan resouce in a future release instead of the List resource.
      </p>
    </li>
     <li>
      <a href="https://jira.hl7.org/browse/FHIR-32625">FHIR-32625</a>:
      <p>
        Changes were implemented to improve the navigation by updating the <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/toc.html">Table of Contents</a>, the specification menu, and page design.
      </p>
    </li>
     <li>
      <a href="https://jira.hl7.org/browse/FHIR-32627">FHIR-32627</a>:
      <p>
        Guidance was added to  <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/search_parameters.html">Search Parameters</a> indicating that the search parameters DrugName, DrugPlan, and DrugTier will be changed to more compliant names like: lower-case 'drug-name', 'drug-plan', and 'drug-tier' in a future release. 
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-32723">FHIR-32723</a>:
      <p>
        Several value sets found in <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/artifacts.html#terminology-code-systems">Terminology: Code Systems</a> were not properly displaying the value and description correctly for "code for qualifier for coinsurance rate", "codes for qualifier of copay amount" and "codes for medication drug tiers in health plans". This has been corrected. The definition column has been updated to no longer be blank and contain the proper information. 
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-32958">FHIR-32958</a>:
      <p>
        Added guidance for searching by <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/use_cases_and_overview.html#searching-by-drug-names">drug name</a> strings.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-32958">FHIR-32958</a>:
      <p>
        Added guidance on <a href="http://hl7.org/fhir/us/davinci-drug-formulary/STU1.1/use_cases_and_overview.html#searching-by-drug-names">drug name searching</a> with description of RxNorm term types, formats, and drug names that might appear on a formulary.
      </p>
    </li>
  </ul>
<p>&nbsp;</p>
