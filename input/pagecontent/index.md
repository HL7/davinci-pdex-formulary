<a name="drug-formulary"></a>
### DaVinci Payer Data Exchange US Drug Formulary
<p>
  This implementation guide defines a FHIR interface to a health insurer's drug formulary information for patients/consumers. A drug formulary is a list of brand-name and generic prescription drugs a health insurer agrees to pay for, at least partially, as part of health insurance coverage. Drug formularies are developed based on the efficacy, safety and cost of drugs. The primary <a href="use_cases_and_overview.html#use-cases">use cases</a> for this FHIR interface enable consumers/members/patients to understand the costs and alternatives for drugs that have been prescribed, and to compare their drug costs across different insurance plans.
</p>
<p>
  A key architectural issue that is beyond the scope of this implementation guide is how a user finds the FHIR endpoint for a particular formulary. This implementation guide assumes that the FHIR endpoint is known to the user.
</p>

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



