<a name="anticipated-client-queries"></a>
### Anticipated Client Queries

<a name="Find-all-CoveragePlans"></a>
#### Find All CoveragePlans
<pre>
  <code>
    GET [base]/List?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-CoveragePlan
  </code>
</pre>
<p>
  For each CoveragePlan, the PlanID is mapped to the List.identifier field. The value of List.identifier is the most general way to query the FormularyDrugs that are part of a specific plan.
</p>
<a name="Find-a-CoveragePlan-by-planid"></a>
#### Find CoveragePlan by its PlanID
<p>To find the CoveragePlan for a plan with id 'myPlanID':</p>
<pre>
  <code>
    GET [base]/List?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-CoveragePlan&amp;identifier=myPlanID 
  </code>
</pre>
<a name="Find-all-FormularyDrugs-in-a-CoveragePlan"></a>
#### Find All FormularyDrugs in a CoveragePlan
<p>To find all FormularyDrugs in a CoveragePlan for a plan with id 'myPlanID':</p>
<pre>
  <code>
    GET [base]/MedicationKnowledge?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyDrug&amp;DrugPlan=myPlanID 
  </code>
</pre>
<p>Alternatively, these FormularyDrugs are also in the array of entries that is part of the List.</p>
<a name="Find-all-FormularyDrugs-in-a-CoveragePlan-DrugTier"></a>
#### Find all FormularyDrugs in a Specific Tier of CoveragePlan
<p>To find all FormularyDrugs in the GENERIC tier of plan myPlanID:</p>
<pre>
  <code>
    GET [base]/MedicationKnowledge?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyDrug&amp;DrugPlan=myPlanID&amp;DrugTier=GENERIC
  </code>
</pre>
<a name="Find-a-FormularyDrugs-by-code-in-a-CoveragePlan"></a>
#### Find A FormularyDrug by code in a CoveragePlan
<p>To find a FormularyDrug by its RxNorm code within a CoveragePlan:</p>
<pre>
  <code>
    GET [base]/MedicationKnowledge?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyDrug&amp;DrugPlan=myPlanID&amp;code=myCode
  </code>
</pre>
<a name="Find-a-FormularyDrugs-by-code-across-all-coverage-plans"></a>
#### Find A FormularyDrug by code across all CoveragePlans
<p>To find a FormularyDrug by its RxNorm code within all CoveragePlans:</p>
<pre>
  <code>
    GET [base]/MedicationKnowledge?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyDrug&amp;code=myCode
  </code>
</pre>

</p>
<a name="Find-a-CoveragePlan-by-planid"></a>
#### Find CoveragePlan by its PlanID
<p>To find the CoveragePlan for a plan with id 'myPlanID':</p>
<pre>
  <code>
    GET [base]/List?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-CoveragePlan&amp;identifier=myPlanID 
  </code>
</pre>
<a name="Find-all-FormularyDrugs-in-a-CoveragePlan"></a>
#### Find All FormularyDrugs in a CoveragePlan
<p>To find all FormularyDrugs in a CoveragePlan for a plan with id 'myPlanID':</p>
<pre>
  <code>
    GET [base]/MedicationKnowledge?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyDrug&amp;DrugPlan=myPlanID 
  </code>
</pre>
<p>Alternatively, these FormularyDrugs are also in the array of entries that is part of the List.</p>
<a name="Find-all-FormularyDrugs-in-a-CoveragePlan-DrugTier"></a>
#### Find All FormularyDrugs in a Specific Tier of CoveragePlan
<p>To find all FormularyDrugs in the GENERIC tier of plan myPlanID:</p>
<pre>
  <code>
    GET [base]/MedicationKnowledge?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyDrug&amp;DrugPlan=myPlanID&amp;DrugTier=GENERIC
  </code>
</pre>
<a name="Find-a-FormularyDrugs-by-code-in-a-CoveragePlan"></a>
#### Find A FormularyDrug by code in a CoveragePlan
<p>To find a FormularyDrug by its RxNorm code within a CoveragePlan:</p>
<pre>
  <code>
    GET [base]/MedicationKnowledge?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyDrug&amp;DrugPlan=myPlanID&amp;code=myCode
  </code>
</pre>
<a name="Find-a-FormularyDrugs-by-code-across-all-coverage-plans"></a>
#### Find A FormularyDrug by code across all CoveragePlans
<p>To find a FormularyDrug by its RxNorm code within all CoveragePlans:</p>
<pre>
  <code>
    GET [base]/MedicationKnowledge?_profile=http://hl7.org/fhir/us/davinci-drug-formulary/StructureDefinition/usdf-FormularyDrug&amp;code=myCode
  </code>
</pre>