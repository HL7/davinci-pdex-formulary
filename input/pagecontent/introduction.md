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
