<a name="drug-formulary"></a>
### DaVinci Payer Data Exchange US Drug Formulary
<p>
  This implementation guide defines a FHIR interface to a health insurer's drug formulary information for patients/consumers. A drug formulary is a list of brand-name and generic prescription drugs a health insurer agrees to pay for, at least partially, as part of health insurance coverage. Drug formularies are developed based on the efficacy, safety and cost of drugs. The primary <a href="use_cases_and_overview.html#use-cases">use cases</a> for this FHIR interface enable consumers/members/patients to understand the costs and alternatives for drugs that have been prescribed, and to compare their drug costs across different insurance plans.
</p>
<p>
  A key architectural issue that is beyond the scope of this implementation guide is how a user finds the FHIR endpoint for a particular formulary. This implementation guide assumes that the FHIR endpoint is known to the user.
</p>

<div class="stu-note">
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
            <a href="https://jira.hl7.org/browse/FHIR-29670">FHIR-29670</a> and <a href="https://jira.hl7.org/browse/FHIR-30923">FHIR-30923</a> - Allowing a Formulary Drug to be referenced by multiple drug plans.
          </li>
          <li>
            <a href="https://jira.hl7.org/browse/FHIR-31038">FHIR-31038</a> - Creating profiles to enable querying plans by plan and type or searching for all drug plans.
          </li>
          <li>
            <a href="https://jira.hl7.org/browse/FHIR-29670">FHIR-29670</a> - Allowing a Formulary Drug to be referenced by multiple drug plans.
          </li>
          <li>
            <a href="https://jira.hl7.org/browse/FHIR-31572">FHIR-31572</a> - Addressing the need to require an element necessary to link resources.
          </li>
          <li>
            <a href="https://jira.hl7.org/browse/FHIR-31673">FHIR-31673</a> - Move the EmailPlanContact extension, which can support an email addess or url to the better fitting element InsurancePlan.contact.
          </li>
        </ul>
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-33182">FHIR-33182</a>:
      <p>
        Created a <a href="StructureDefinition-usdf-FormularyItem.html">Formulary Item profile</a> that links a drug with a drug (formulary) plan and includes the attribues that relate the two. As part of this change, several extensions moved to this profile from the <a href="StructureDefinition-usdf-FormularyDrug.html">Formulary Drug profile</a>.
      </p>
    </li>
    <li>
      <a href="https://jira.hl7.org/browse/FHIR-33186">FHIR-33186</a>:
      <p>
        Created an <a href="StructureDefinition-usdf-InsurancePlanLocation.html">Insurance Plan Location profile</a> for an InsurancePlan to support geolocation.
      </p>
    </li>
  </ul>
  
</div>


<a name="introduction"></a>
### Introduction
<p>
  This implementation guide (IG) includes a number of profiles, extensions, search parameters, and value sets.
</p>
<ul>
  <li>
    <strong><a href="StructureDefinition-usdf-PayerInsurancePlan.html">PayerInsurancePlan</a></strong>: The PayerInsurancePlan profile of the FHIR R4 <a href="http://hl7.org/fhir/R4/insuranceplan.html">InsurancePlan</a> resource defines the health insurance product, which include coverage benefits that are offered, and additional information about the offering, such as a coverage area, contact information, brochure locations, etc. The health insurance product offers one or more types of coverage, each of which may define a plan of covered benefits with the particular cost sharing structure offered to a consumer. Health insurance plans that include drug coverage reference a formulary that provides details about drugs that are covered under the plan including requirements and limitations of the coverage specific to each drug.
  </li>
  <li>
    <strong><a href="StructureDefinition-usdf-Formulary.html">Formulary</a></strong>: The Formulary profile of the FHIR R4 <a href="http://hl7.org/fhir/R4/insuranceplan.html">InsurancePlan</a> provides general information about a formulary and acts as an organizing construct that associated FormularyItem resources point to. The Formulary combined with its associated <a href="StructureDefinition-usdf-FormularyItem.html">FormularyItem</a> and <a href="StructureDefinition-usdf-FormularyDrug.html">FormularyDrug</a> resources respresent a formulary list that includes the set of drugs covered and the requirements and limitations of the coverage.
  </li>
  <li>
    <strong><a href="StructureDefinition-usdf-FormularyItem.html">FormularyItem</a></strong>: The FormularyItem profile of the FHIR R4 <a href="http://hl7.org/fhir/R4/basic.html">Basic</a> describes a drug's relationship to a drug plan, including drug tier, prior authorization requirements, and more. The set of FormuaryItem resrouces associated with a particular drug plan represents the drug plans formulary.
  </li>
  <li>
    <strong><a href="StructureDefinition-usdf-FormularyDrug.html">FormularyDrug</a></strong>: The FormularyDrug profile of the FHIR R4 <a href="http://hl7.org/fhir/medicationknowledge.html">MedicationKnowledge</a> resource provides information about a prescribable drug which may be part of a formulary including its RxNorm code, synonyms, and optionally drug classification and alternatives.
  </li>
</ul>

<p>
  Several <a href="search_parameters.html">searchParameters</a> have also been defined in this guide to facilitate the anticipated use cases. See the <a href="queries.html">Anticipated Client Queries</a> section for a description of how to query the CoveragePlan and FormularyDrug profiles in support of the anticipated use cases.
</p>
<ul>
<li>
    <strong><a href="SearchParameter-coverage-type.html">coverage-type</a></strong>: Makes the <code>coverage.type</code> codeableConcept of each <a href="StructureDefinition-usdf-PayerInsurancePlan.html">PayerInsurancePlan</a> accessible for query to find InsurancePlan resources that have a specific coverage type, like drug coverage.
  </li>
  <li>
    <strong><a href="SearchParameter-formulary-coverage.html">formulary-coverage</a></strong>: Makes the formulary reference of each <a href="StructureDefinition-usdf-PayerInsurancePlan.html">PayerInsurancePlan</a> accessible for query to find InsurancePlan resources that have a specific formulary.
  </li>
  <li>
    <strong><a href="SearchParameter-formulary.html">formulary</a></strong>: Makes the Formulary reference of each <a href="StructureDefinition-usdf-FormularyItem.html">FormularyItem</a> accessible for query to be able to query for drugs found in a particular formulary.
  </li>
  <li>
    <strong><a href="SearchParameter-drug-tier.html">drug-tier</a></strong>: Makes the DrugTier codeableConcept of each <a href="StructureDefinition-usdf-FormularyDrug.html">FormularyItem</a> accessible for query to find drugs in a specific tier.
  </li>
  <li>
    <strong><a href="SearchParameter-pharmacy-type.html">pharmacy-type</a></strong>: Makes the PharmacyType codeableConcept of each <a href="StructureDefinition-usdf-FormularyItem.html">FormularyItem</a> accessible for query to find drugs in available through a specific pharmacy network type.
  </li>
  <li>
    <strong><a href="SearchParameter-drug-name.html">drug-name</a></strong>: Makes the RxNorm name of each<a href="StructureDefinition-usdf-FormularyDrug.html">FormularyDrug</a> accessible for query to find drugs by name, stength and form.
  </li>
</ul>

<a name="expected-users"></a>
### Expected Users 
<p>
  This Implementation Guide is intended for insurers within the United States. Currently, many insurers make their formularies available to patients using PDFs or drug search forms through their websites. Providing formularies using FHIR may allow patients to find alternatives to reduce their medication costs, easily comparison-shop between plans, and could help insurers educate consumers about the differences between various drug tiers/classes.
</p>

<a name="disclaimers-and-assumptions"></a>
### Disclaimers and Assumptions
<ul>
  <li>
    <strong>Drug Formulary includes Plan-Level Data Only</strong>: The intent of this implementation guide is to make the plan-level information regarding formulary content and cost-sharing available through a standard interface for third party applications. Most users will access this data through a third party application. That application should clearly communicate to the user that the cost-sharing information in the formulary may not tell them precisely what they will pay at the pharmacy, and might not fully reflect their drug benefit.
    <!-- TODO There is an ongoing effort by Carin/NCPDP to develop a Real Time Pharmacy Benefit Check (RTPBC) implementation guide. Future ballots of this implementation guide and the RTPBC implementation guide should be harmonized.
    -->
  </li>
  <li>
    <strong>The MedicationKnowledge Resource is immature</strong>: The HL7 Pharmacy WG felt that MedicationKnowledge was the best choice for representing a formulary drug, even with its low maturity, since it is more suitable as an artifact and already included some of fields that would be required as extensions to medication (e.g., classification). MedicationKnowledge and FormularyDrug will co-evolve moving forward).
  </li>
  <li>
    <strong>The formulary endpoint is known to the client</strong>: This IG assumes that the formulary endpoint is known to the client. There is an overarching system architecture issue that is critical to resolve -- how does the client discover the FHIR endpoint of interest. For the purposes of this IG, we consider that problem out of scope.
  </li>
</ul>



