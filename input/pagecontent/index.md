<a name="drug-formulary"></a>
### DaVinci Payer Data Exchange (PDex) US Drug Formulary
<p>
  This implementation guide defines a FHIR interface to a health insurer's drug formulary information for patients/consumers. A drug formulary is a list of brand-name and generic prescription drugs a health insurer agrees to pay for, at least partially, as part of health insurance coverage. Drug formularies are developed based on the efficacy, safety, and cost of drugs. The primary <a href="use_cases_and_overview.html#use-cases">use cases</a> for this FHIR interface enable consumers/members/patients to understand the costs and alternatives for drugs that have been prescribed, and to compare their drug costs across different insurance plans.
</p>
<p>
  A key architectural issue that is beyond the scope of this implementation guide is how a user finds the FHIR endpoint for a particular formulary. This implementation guide assumes that the FHIR endpoint is known to the user.
</p>

<div class="stu-note">
 <p>
    <strong>The following issues are addressed in this release:</strong>
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
      <a href="https://jira.hl7.org/browse/FHIR-33186">FHIR-33186</a>:
      <p>
        Created an <a href="StructureDefinition-usdf-InsurancePlanLocation.html">Insurance Plan Location profile</a> for an InsurancePlan to support geolocation.
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
      <a href="https://jira.hl7.org/browse/FHIR-33248">FHIR-33248</a>:
      <p>
        Remove requirement to support HTTP error response 410 for deleted resources in <a href="CapabilityStatement-usdf-server.html">server CapabilityStatement</a>
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-34085">FHIR-34085</a>:
      <p>
        Added slicing on <a href="StructureDefinition-usdf-FormularyDrug-definitions.html#MedicationKnowledge.code.coding">FormularyDrug code.coding</a> to support granular (ingredient, strength, and form) RxNorm Code and general (ingredient and form group) to enable finding drugs with different strengths and added guidance on <a href="use_cases_and_overview.html#searching-formulary-drugs">searching formulary drugs</a>. 
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-31349">FHIR-31349</a>:
      <p>
        Added deductible-waived to <a href="ValueSet-CopayOptionVS.html">Copay qualifier</a> and <a href="ValueSet-CoinsuranceOptionVS.html">Coinsurance qualifier</a> CodeSystems. 
      </p>
    </li>
    <!-- Not included in STU2 scope
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-33188">FHIR-33188</a>:
      <p>
        Added guidance for <a href="use_cases_and_overview.html#bulk-data">Bulk Data Export</a>. 
      </p>
    </li>
    -->
  </ul>
</div>


<a name="introduction"></a>
### Introduction
<p>
  This Implementation Guide (IG) includes a number of profiles, extensions, search parameters, and value sets.
</p>
<ul>
  <li>
    <strong><a href="StructureDefinition-usdf-PayerInsurancePlan.html">PayerInsurancePlan</a></strong>: The PayerInsurancePlan profile of the FHIR R4 <a href="http://hl7.org/fhir/R4/insuranceplan.html">InsurancePlan</a> resource defines the health insurance product including coverage benefits that are offered and additional information about the offering, such as a coverage area, contact information, brochure locations, etc. The health insurance product can offer one or more types of coverage, each of which may define a plan of covered benefits with the particular cost sharing structure offered to a consumer. Health insurance plans that include drug coverage reference a formulary that provides details about drugs that are covered under the plan including requirements and limitations of the coverage specific to each drug.
  </li>
  <li>
    <strong><a href="StructureDefinition-usdf-Formulary.html">Formulary</a></strong>: The Formulary profile of the FHIR R4 <a href="http://hl7.org/fhir/R4/insuranceplan.html">InsurancePlan</a> resource provides general information about a formulary and acts as an organizing construct that associated FormularyItem resources point to. The Formulary combined with its associated <a href="StructureDefinition-usdf-FormularyItem.html">FormularyItem</a> and <a href="StructureDefinition-usdf-FormularyDrug.html">FormularyDrug</a> resources represent a formulary list that includes the set of drugs covered and the requirements and limitations of that coverage.
  </li>
  <li>
    <strong><a href="StructureDefinition-usdf-FormularyItem.html">FormularyItem</a></strong>: The FormularyItem profile of the FHIR R4 <a href="http://hl7.org/fhir/R4/basic.html">Basic</a> resource describes a drug's relationship to a formulary, including drug tier, prior authorization requirements, and more.
  </li>
  <li>
    <strong><a href="StructureDefinition-usdf-FormularyDrug.html">FormularyDrug</a></strong>: The FormularyDrug profile of the FHIR R4 <a href="http://hl7.org/fhir/medicationknowledge.html">MedicationKnowledge</a> resource provides information about a prescribable drug including its RxNorm code and dose form. Drugs not included in a formulary may not be represented by a FormularyDrug instance.
  </li>
</ul>
<p>
  A detailed description of the relationship between the profiles in this guide can be found in the <a href="use_cases_and_overview.html#formulary-structure">Formulary Structure section</a>.
</p>


<p>
  Several <a href="search_parameters.html">searchParameters</a> have been defined in this guide to facilitate the anticipated use cases. See the <a href="queries.html">Anticipated Client Queries</a> section for a description of how to query for resources in support of the anticipated use cases. Below are some of the search parameters defined in this guide.
</p>
<ul>
  <li>
    <strong><a href="SearchParameter-InsurancePlan-coverage-type.html">coverage-type</a></strong>: Makes the <code>coverage.type</code> CodeableConcept of each <a href="StructureDefinition-usdf-PayerInsurancePlan.html">PayerInsurancePlan</a> accessible for query to find InsurancePlan resources that have a specific coverage type, like drug coverage.
  </li>
  <li>
    <strong><a href="SearchParameter-InsurancePlan-formulary-coverage.html">formulary-coverage</a></strong>: Makes the coverage extension formulary reference of each <a href="StructureDefinition-usdf-PayerInsurancePlan.html">PayerInsurancePlan</a> accessible for query to find InsurancePlan resources that reference specific formulary.
  </li>
  <li>
    <strong><a href="SearchParameter-InsurancePlan-coverage-area.html">coverage-area</a></strong>: Makes the coverageArea reference of each <a href="StructureDefinition-usdf-PayerInsurancePlan.html">PayerInsurancePlan</a> accessible for query to find an InsurancePlan by coverage location.
  </li>
  <li>
    <strong><a href="SearchParameter-Basic-formulary.html">formulary</a></strong>: Makes the extension Formulary reference of each <a href="StructureDefinition-usdf-FormularyItem.html">FormularyItem</a> accessible for query to find drugs included in a particular formulary.
  </li>
  <li>
    <strong><a href="SearchParameter-Basic-drug-tier.html">drug-tier</a></strong>: Makes the extension DrugTier codeableConcept of each <a href="StructureDefinition-usdf-FormularyItem.html">FormularyItem</a> accessible for query to find drugs in a specific tier.
  </li>
  <li>
    <strong><a href="SearchParameter-Basic-pharmacy-type.html">pharmacy-type</a></strong>: Makes the extension PharmacyType codeableConcept of each <a href="StructureDefinition-usdf-FormularyItem.html">FormularyItem</a> accessible for query to find drugs in available through a specific pharmacy network type.
  </li>
  <li>
    <strong><a href="SearchParameter-MedicationKnowledge-drug-name.html">drug-name</a></strong>: Makes the RxNorm name of each<a href="StructureDefinition-usdf-FormularyDrug.html">FormularyDrug</a> accessible for query to find drugs by name, strength and form.
  </li>
</ul>

<p>
  Information about searching for formulary drugs can be found in the <a href="use_cases_and_overview.html#searching-formulary-drugs">Searching for Formulary Drugs section</a>.
</p>


<a name="expected-users"></a>
### Expected Users 
<p>
  This Implementation Guide is intended for insurers within the United States. Currently, many insurers make their formularies available to patients using PDFs or drug search forms through their websites. Providing formularies using FHIR may allow patients to find alternatives to reduce their medication costs, easily comparison-shop between plans, and could help insurers educate consumers about the differences between various drug tiers and pharmacy network types.
</p>

<a name="disclaimers-and-assumptions"></a>
### Disclaimers and Assumptions
<ul>
  <li>
    <strong>Drug Formulary Data Use</strong>: The intent of this implementation guide is to make the plan-level information regarding formulary content and cost-sharing available through a standard interface to enable consumers to have an informed discussion with their practitioner about their medication options. Most consumers will access this data through a third party application. These applications <strong>SHOULD</strong> clearly communicate to the user that the cost-sharing information in the formulary may not tell them precisely what they will pay at the pharmacy, and might not fully reflect their drug benefit. Situational inclusions, exclusions, and requirements may apply. The presence or lack of presence of a particular drug in a query response should not be construed as a guarantee of coverage or lack thereof. An insurer may only support searching for drugs that are part of the formulary or formularies in the context of the query. Insurers <strong>SHOULD</strong> provide appropriate information and disclaimers regarding the interpretation and expected use of the data made available through this guide, including how the presence or lack of presence of a drug should be interpreted.
  </li>
  <li>
    <strong>The FHIR MedicationKnowledge Resource is immature</strong>: The HL7 Pharmacy WG felt that MedicationKnowledge was the best choice for representing a formulary drug, even with its low maturity, since it is more suitable as an artifact and already included some of fields that would be required as extensions to the Medication resource. The MedicationKnowledge resource and FormularyDrug profile will co-evolve moving forward.
  </li>
  <li>
    <strong>The formulary endpoint is known to the client</strong>: This guide assumes that the formulary endpoint is known to the client. The mechanism for FHIR endpoint discovery is important, but considered out of scope for this guide.
  </li>
</ul>



