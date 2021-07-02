<h3 id="drug-formulary">DaVinci Payer Data Exchange US Drug Formulary</h3>
<p>
  This implementation guide defines a FHIR interface to a health insurer's drug formulary information for patients/consumers. A drug formulary is a list of brand-name and generic prescription drugs a health insurer agrees to pay for, at least partially, as part of health insurance coverage. Drug formularies are developed based on the efficacy, safety and cost of drugs. The primary <a href="#use-cases">use cases</a> for this FHIR interface enable consumers/members/patients to understand the costs and alternatives for drugs that have been prescribed, and to compare their drug costs across different insurance plans.
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
      <a href="https://jira.hl7.org/browse/FHIR-29965">FHIR-28293</a>:
      <p>
        Changed the <a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/StructureDefinition-usdf-PlanID-extension.html">PlanID extension</a> description to from:
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
        Added guidance that <a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/StructureDefinition-usdf-MarketingURL-extension.html">CoveragePlan.MarketingURL</a>, <a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/StructureDefinition-usdf-SummaryURL-extension.html">CoveragePlan.SummaryURL</a>, and <a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/StructureDefinition-usdf-FormularyURL-extension.html">CoveragePlan.FormularyURL</a> can point to a page providing links for multiple language options.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-30412">FHIR-30412</a>:
      <p>
        Changed the type of <a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/StructureDefinition-usdf-MarketingURL-extension.html">CoveragePlan.MarketingURL</a>, <a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/StructureDefinition-usdf-SummaryURL-extension.html">CoveragePlan.SummaryURL</a>, and <a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/StructureDefinition-usdf-FormularyURL-extension.html">CoveragePlan.FormularyURL</a> extensions from a String value to a URL value.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-30924">FHIR-30924</a>:
      <p>
        Added "Not applicable" to the <a href="http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-CopayOptionCS">usdf-CopayOptionCS</a> code system.  Zero-deductible cost sharing is represented by a co-pay value of "Not applicable" and a co-insurance value of "No charge", consistent with updated QHP guidelines.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-30925">FHIR-30925</a>:
      <p>
        Added an optional boolean <a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/StructureDefinition-usdf-MailOrder-extension.html">MailOrder</a> extension to FormularyDrug profile.  The MailOrder value in FormularyDrug overrides the MailOrder value in the <a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/StructureDefinition-usdf-DrugTierDefinition-extension.html">DrugTierDefinition</a> extension for <a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/StructureDefinition-usdf-CoveragePlan.html">CoveragePlan</a>.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-30933">FHIR-30933</a>:
      <p>
        Changed the type of <a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/StructureDefinition-usdf-EmailPlanContact-extension.html">EmailPlanContact</a> extension from String to URL.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-31073">FHIR-31073</a>:
      <p>
        Added guidance for behavior for <a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/index.html#authenticated">authenticated member access</a>, when the member has already selected a plan or not, when they belong to a plan group or not.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-31672">FHIR-31672</a>:
      <p>
        Added guidance to enter "Not applicable" in the <a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/StructureDefinition-usdf-Network-extension.html">Network</a> extension for a CoveragePlan that has no applicable network associated with it.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-31672">FHIR-31765</a>:
      <p>
        Updated <a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/search-parameters">search parameter</a> descriptions to include all of the search parameters in the <a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/CapabilityStatement-usdf-server.html">CapabilityStatement</a>.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-32178">FHIR-32178</a>:
      <p>
        Added "Charge" to the <a href="http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-CopayOptionCS">usdf-CopayOptionCS</a> and the <a href="http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-CoinsuranceOptionCS">usdf-CoinsuranceOptionCS</a>code systems to handle drugs that consist of a charge, but are not subject to a deductible.
      </p>
    </li>
  </ul>
</div>

<h4 id="table-of-contents">Table Of Contents</h4>
<ul>
  <li><a href="#introduction">Introduction</a></li>
  <li><a href="#disclaimers-assumptions">Disclaimers and Assumptions</a></li>
  <li><a href="#formulary-structure">Formulary Structure</a></li>
  <li><a href="#expected-users">Expected Users</a></li>
  <li><a href="#use-cases">Use Cases</a></li>
  <li><a href="#privacy-considerations">Privacy Considerations</a></li>
  <li><a href="#anticipated-client-queries">Anticipated Client Queries</a></li>
  <li><a href="#open-issues">Additional Background and Open Issues</a></li>
  <li><a href="#credits">Credits</a></li>
  <li><a href="#authors">Authors</a></li>
</ul>
