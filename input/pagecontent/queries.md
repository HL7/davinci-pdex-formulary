<a name="anticipated-client-queries"></a>
### Anticipated Client Queries

<a name="Find-all-PayerInsurancePlans"></a>
#### Find All PayerInsurancePlans
<p>
  PayerInsurancePlans may have any number of types found in the `http://hl7.org/fhir/us/davinci-pdex-plan-net/CodeSystem/InsuranceProductTypeCS` CodeSystem. Each PayerInsurancePlan conformant to this IG will have ane or more memberPlan extensions that references an InsuranceDrugPlan. From the PayerInsurancePlan memberPlan extension(s), it is possible to retrieve the InsuranceDrugPlan(s).
</p>
<pre>
  <code>
    GET [base]/InsurancePlan?type=http://hl7.org/fhir/us/davinci-pdex-plan-net/CodeSystem/InsuranceProductTypeCS|
  </code>
</pre>
<a name="Find-all-InsuranceDrugPlans"></a>
#### Find All InsuranceDrugPlans
<p>
  InsuranceDrugPlans can be search for with a type of `http://terminology.hl7.org/CodeSystem/v3-ActCode|DRUGPOL`. 
</p>
<pre>
  <code>
    GET [base]/InsurancePlan?type=http://terminology.hl7.org/CodeSystem/v3-ActCode|DRUGPOL
  </code>
</pre>
<a name="Find-a-InsuranceDrugPlan-by-Planid"></a>
#### Find an InsuranceDrugPlan by its Identifier
<p>
  To find an InsuranceDrugPlan for a plan with id 'D1002': 
</p>
<pre>
  <code>
    GET [base]/InsurancePlan?type=http://terminology.hl7.org/CodeSystem/v3-ActCode|DRUGPOL&identifier=D1002
  </code>
</pre>

<a name="Find-all-FormularyItems-and-FormularyDrugs-in-a-InsuranceDrugPlan"></a>
#### Find All FormularyItems and FormularyDrugs in an InsuranceDrugPlan
<p>To find all FormalaryItems and their respective FormularyDrugs in an InsuranceDrugPlan with the id of 'InsuranceDrugPlanD1002':</p>
<pre>
  <code>
    GET [base]/Basic?code=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-InsuranceItemTypeCS|formulary-item&drug-plan=InsurancePlan/InsuranceDrugPlanD1002&_include=Basic:subject
  </code>
</pre>
<a name="Find-all-FormularyItems-and-FormularyDrugs-in-a-InsuranceDrugPlan-by-Drug-Tier"></a>
#### Find All FormularyItems and FormularyDrugs in an InsuranceDrugPlan by Drug Tier 
<p>To find all FormalaryItems and their respective FormularyDrugs in an InsuranceDrugPlan with the id of 'InsuranceDrugPlanD1002' and a drug-tier of 'generic':</p>
<pre>
  <code>
    GET [base]/Basic?code=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-InsuranceItemTypeCS|formulary-item&drug-plan=InsurancePlan/InsuranceDrugPlanD1002&drug-tier=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-DrugTierCS|generic&_include=Basic:subject
  </code>
</pre>
<a name="Find-all-FormularyItems-and-FormularyDrugs-in-a-InsuranceDrugPlan-by-Pharmacy-Network-Type"></a>
#### Find All FormularyItems and FormularyDrugs in an InsuranceDrugPlan by Pharmacy Network Type 
<p>To find all FormalaryItems and their respective FormularyDrugs in an InsuranceDrugPlan with the id of 'InsuranceDrugPlanD1002' and a pharmacy-type of '3-month-in-mail':</p>
<pre>
  <code>
    GET [base]/Basic?code=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-InsuranceItemTypeCS|formulary-item&drug-plan=InsurancePlan/InsuranceDrugPlanD1002&pharmacy-type=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-PharmacyTypeCS|3-month-in-mail&_include=Basic:subject
  </code>
</pre>

<a name="Find-all-FormularyItems-and-FormularyDrugs-in-a-InsuranceDrugPlan-by-Drug-Name"></a>
#### Find All FormularyItems and FormularyDrugs in an InsuranceDrugPlan by Drug Name 
<p>To find all FormalaryItems and their respective FormularyDrugs in an InsuranceDrugPlan with the id of 'InsuranceDrugPlanD1002' and a drug name of 'doxepin hydrochloride':</p>
<pre>
  <code>
    GET [base]/Basic?code=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-InsuranceItemTypeCS|formulary-item&drug-plan=InsurancePlan/InsuranceDrugPlanD1002&subject:MedicationKnowledge.drug-name=doxepin%20hydrochloride&_include=Basic:subject
  </code>
</pre>

<a name="Find-all-FormularyItems-and-FormularyDrugs-in-a-InsuranceDrugPlan-by-Drug-Code"></a>
#### Find All FormularyItems and FormularyDrugs in an InsuranceDrugPlan by Drug Code 
<p>To find all FormalaryItems and their respective FormularyDrugs in an InsuranceDrugPlan with the id of 'InsuranceDrugPlanD1002' and a drug with the RxNorm code of '1000091':</p>
<pre>
  <code>
    GET [base]/Basic?code=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-InsuranceItemTypeCS|formulary-item&drug-plan=InsurancePlan/InsuranceDrugPlanD1002&subject:MedicationKnowledge.code=http://www.nlm.nih.gov/research/umls/rxnorm|1000091&_include=Basic:subject
  </code>
</pre>


<a name="Find-all-FormularyItems-and-Covering-InsuranceDrugPlans-by-Drug-Code"></a>
#### Find All FormularyItems and Covering InsuranceDrugPlanas by Drug Code 
<p>To find all FormalaryItems and the InsuranceDrugPlans that include them for the drug with the RxNorm code of '1000091':</p>
<pre>
  <code>
    GET [base]/Basic?code=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-InsuranceItemTypeCS|formulary-item&subject:MedicationKnowledge.code=http://www.nlm.nih.gov/research/umls/rxnorm|1000091&_include=Basic:drug-plan
  </code>
</pre>

<a name="Find-all-FormularyDrugs-and-the-FormularyItems-that-Include-them-by-Drug-Code"></a>
#### Find All FormularyDrugs and the FormularyItems that Include them by Drug Code 
<p>To find all FormalaryDrugs with the RxNorm code of '1000091' and the FormularyItems that include them:</p>
<pre>
  <code>
    GET [base]/Basic?code=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-InsuranceItemTypeCS|formulary-item&subject:MedicationKnowledge.code=http://www.nlm.nih.gov/research/umls/rxnorm|1000091&_include=Basic:drug-plan
  </code>
</pre>
