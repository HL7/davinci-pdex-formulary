<h4 id="anticipated-client-queries">Anticipated Client Queries</h4>
<h5 id="Find-all-CoveragePlans">Find All CoveragePlans</h5>
<pre>
  <code>
    GET [base]/List?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-CoveragePlan
  </code>
</pre>
<p>
  For each CoveragePlan, the PlanID is mapped to the List.identifier field. The value of List.identifier is the most general way to query the FormularyDrugs that are part of a specific plan.<h4 id="anticipated-client-queries">Anticipated Client Queries</h4>
<h5 id="Find-all-CoveragePlans">Find All CoveragePlans</h5>
<pre>
  <code>
    GET [base]/List?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-CoveragePlan
  </code>
</pre>
<p>
  For each CoveragePlan, the PlanID is mapped to the List.identifier field. The value of List.identifier is the most general way to query the FormularyDrugs that are part of a specific plan.
</p>
<h5 id="Find-a-CoveragePlan-by-planid">Find CoveragePlan by its PlanID</h5>
<p>To find the CoveragePlan for a plan with id 'myPlanID':</p>
<pre>
  <code>
    GET [base]/List?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-CoveragePlan&amp;identifier=myPlanID 
  </code>
</pre>
<h5 id="Find-all-FormularyDrugs-in-a-CoveragePlan">Find All FormularyDrugs in a CoveragePlan</h5>
<p>To find all FormularyDrugs in a CoveragePlan for a plan with id 'myPlanID':</p>
<pre>
  <code>
    GET [base]/MedicationKnowledge?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyDrug&amp;DrugPlan=myPlanID 
  </code>
</pre>
<p>Alternatively, these FormularyDrugs are also in the array of entries that is part of the List.</p>
<h5 id="Find-all-FormularyDrugs-in-a-CoveragePlan-DrugTier">Find All FormularyDrugs in a Specific Tier of CoveragePlan</h5>
<p>To find all FormularyDrugs in the GENERIC tier of plan myPlanID:</p>
<pre>
  <code>
    GET [base]/MedicationKnowledge?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyDrug&amp;DrugPlan=myPlanID&amp;DrugTier=GENERIC
  </code>
</pre>
<h5 id="Find-a-FormularyDrugs-by-code-in-a-CoveragePlan">Find A FormularyDrug by code in a CoveragePlan</h5>
<p>To find a FormularyDrug by its RxNorm code within a CoveragePlan:</p>
<pre>
  <code>
    GET [base]/MedicationKnowledge?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyDrug&amp;DrugPlan=myPlanID&amp;code=myCode
  </code>
</pre>
<h5 id="Find-a-FormularyDrugs-by-code-across-all-coverage-plans">Find A FormularyDrug by code across all CoveragePlans</h5>
<p>To find a FormularyDrug by its RxNorm code within all CoveragePlans:</p>
<pre>
  <code>
    GET [base]/MedicationKnowledge?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyDrug&amp;code=myCode
  </code>
</pre>

</p>
<h5 id="Find-a-CoveragePlan-by-planid">Find CoveragePlan by its PlanID</h5>
<p>To find the CoveragePlan for a plan with id 'myPlanID':</p>
<pre>
  <code>
    GET [base]/List?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-CoveragePlan&amp;identifier=myPlanID 
  </code>
</pre>
<h5 id="Find-all-FormularyDrugs-in-a-CoveragePlan">Find All FormularyDrugs in a CoveragePlan</h5>
<p>To find all FormularyDrugs in a CoveragePlan for a plan with id 'myPlanID':</p>
<pre>
  <code>
    GET [base]/MedicationKnowledge?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyDrug&amp;DrugPlan=myPlanID 
  </code>
</pre>
<p>Alternatively, these FormularyDrugs are also in the array of entries that is part of the List.</p>
<h5 id="Find-all-FormularyDrugs-in-a-CoveragePlan-DrugTier">Find All FormularyDrugs in a Specific Tier of CoveragePlan</h5>
<p>To find all FormularyDrugs in the GENERIC tier of plan myPlanID:</p>
<pre>
  <code>
    GET [base]/MedicationKnowledge?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyDrug&amp;DrugPlan=myPlanID&amp;DrugTier=GENERIC
  </code>
</pre>
<h5 id="Find-a-FormularyDrugs-by-code-in-a-CoveragePlan">Find A FormularyDrug by code in a CoveragePlan</h5>
<p>To find a FormularyDrug by its RxNorm code within a CoveragePlan:</p>
<pre>
  <code>
    GET [base]/MedicationKnowledge?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyDrug&amp;DrugPlan=myPlanID&amp;code=myCode
  </code>
</pre>
<h5 id="Find-a-FormularyDrugs-by-code-across-all-coverage-plans">Find A FormularyDrug by code across all CoveragePlans</h5>
<p>To find a FormularyDrug by its RxNorm code within all CoveragePlans:</p>
<pre>
  <code>
    GET [base]/MedicationKnowledge?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyDrug&amp;code=myCode
  </code>
</pre>
