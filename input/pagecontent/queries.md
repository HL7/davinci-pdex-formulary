<a name="anticipated-client-queries"></a>
### Anticipated Client Queries

<a name="Find-all-PayerInsurancePlans"></a>
#### Find All PayerInsurancePlans

PayerInsurancePlans may have any number of types found in the `http://hl7.org/fhir/us/davinci-pdex-plan-net/CodeSystem/InsuranceProductTypeCS` CodeSystem. Each PayerInsurancePlan conformant to this IG will have ane or more memberPlan extensions that references a Formulary. From the PayerInsurancePlan memberPlan extension(s), it is possible to retrieve the Formulary resource(s).

<pre>
  <code>
    GET [base]/InsurancePlan?type=http://hl7.org/fhir/us/davinci-pdex-plan-net/CodeSystem/InsuranceProductTypeCS|
  </code>
</pre>

<a name="Find-all-InsurancePlans-With-Drug-Coverage"></a>
#### Find All Insurance Plans with Drug Coverage

<p>
  InsurancePlan with drug coverage can be search for with a `coverage.type` of `http://terminology.hl7.org/CodeSystem/v3-ActCode|DRUGPOL`. 
</p>

<pre>
  <code>
    GET [base]/InsurancePlan?coverage-type=http://terminology.hl7.org/CodeSystem/v3-ActCode|DRUGPOL
  </code>
</pre>

<a name="Find-all-Formulary-Resources"></a>
#### Find All Formulary Resource
<p>
  Formulary can be search for with a type of `http://terminology.hl7.org/CodeSystem/v3-ActCode|DRUGPOL`. 
</p>
<pre>
  <code>
    GET [base]/InsurancePlan?type=http://terminology.hl7.org/CodeSystem/v3-ActCode|DRUGPOL
  </code>
</pre>

<a name="Find-a-Formulary-by-Id"></a>
#### Find a Formulary by its Identifier
<p>
  To find an Formulary for a with id 'D1002': 
</p>
<pre>
  <code>
    GET [base]/InsurancePlan?type=http://terminology.hl7.org/CodeSystem/v3-ActCode|DRUGPOL&identifier=D1002
  </code>
</pre>

<a name="Find-all-PayerInsurancePlans-by-a-Formulary"></a>
#### Find All PayerInsurancePlans by a Formulary
<p>To find all PayerInsurancePlans that include a coverage with a specific formulary by id 'FormularyD1002':</p>
<pre>
  <code>
    GET [base]/InsurancePlan?formulary-coverage=InsurancePlan/FormularyD1002
  </code>
</pre>

<a name="Find-all-PayerInsurancePlans-by-Coverage-Area"></a>
#### Find All PayerInsurancePlans by Coverage Area
<p>To find all PayerInsurancePlans with a coverage area Location by id 'StateOfCTLocation':</p>
<pre>
  <code>
    GET [base]/InsurancePlan?coverage-area=Location/StateOfCTLocation
  </code>
</pre>

<a name="Find-all-FormularyItems-and-FormularyDrugs-in-a-Formulary"></a>
#### Find All FormularyItems and FormularyDrugs in a Formulary
<p>To find all FormularyItems and their respective FormularyDrugs in a Formulary with the id of 'FormularyD1002':</p>
<pre>
  <code>
    GET [base]/Basic?code=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-InsuranceItemTypeCS|formulary-item&formulary=InsurancePlan/FormularyD1002&_include=Basic:subject
  </code>
</pre>

<a name="Find-all-FormularyItems-and-FormularyDrugs-in-a-Formulary-by-Drug-Tier"></a>
#### Find All FormularyItems and FormularyDrugs in an Formulary by Drug Tier 
<p>To find all FormularyItems and their respective FormularyDrugs in a Formulary with the id of 'FormularyD1002' and a drug-tier of 'generic':</p>
<pre>
  <code>
    GET [base]/Basic?code=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-InsuranceItemTypeCS|formulary-item&formulary=InsurancePlan/FormularyD1002&drug-tier=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-DrugTierCS|generic&_include=Basic:subject
  </code>
</pre>
<a name="Find-all-FormularyItems-and-FormularyDrugs-in-a-Formulary-by-Pharmacy-Network-Type"></a>
#### Find All FormularyItems and FormularyDrugs in a Formulary by Pharmacy Network Type 
<p>To find all FormularyItems and their respective FormularyDrugs in a Formulary with the id of 'FormularyD1002' and a pharmacy-type of '3-month-in-mail':</p>
<pre>
  <code>
    GET [base]/Basic?code=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-InsuranceItemTypeCS|formulary-item&formulary=InsurancePlan/FormularyD1002&pharmacy-type=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-PharmacyTypeCS|3-month-in-mail&_include=Basic:subject
  </code>
</pre>

<a name="Find-all-FormularyItems-and-FormularyDrugs-in-a-Formulary-by-Drug-Name"></a>
#### Find All FormularyItems and FormularyDrugs in a Formulary by Drug Name 
<p>To find all FormularyItems and their respective FormularyDrugs in a Formulary with the id of 'FormularyD1002' and a drug name of 'doxepin hydrochloride':</p>
<pre>
  <code>
    GET [base]/Basic?code=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-InsuranceItemTypeCS|formulary-item&formulary=InsurancePlan/FormularyD1002&subject:MedicationKnowledge.drug-name=doxepin%20hydrochloride&_include=Basic:subject
  </code>
</pre>

<a name="Find-all-FormularyItems-and-FormularyDrugs-in-a-Formulary-by-Drug-Code"></a>
#### Find All FormularyItems and FormularyDrugs in a Formulary by Drug Code 
<p>To find all FormularyItems and their respective FormularyDrugs in a Formulary with the id of 'FormularyD1002' and a drug with the RxNorm code of '1000091':</p>
<pre>
  <code>
    GET [base]/Basic?code=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-InsuranceItemTypeCS|formulary-item&formulary=InsurancePlan/FormularyD1002&subject:MedicationKnowledge.code=http://www.nlm.nih.gov/research/umls/rxnorm|1000091&_include=Basic:subject
  </code>
</pre>

<a name="Find-all-FormularyItems-and-Covering-Formulary-Resources-by-Drug-Code"></a>
#### Find All FormularyItems and Covering Formulary Resources by Drug Code 
<p>To find all FormularyItems and the Formulary resources that include them for the drug with the RxNorm code of '1000091':</p>
<pre>
  <code>
    GET [base]/Basic?code=http://hl7.org/fhir/us/davinci-drug-formulary/CodeSystem/usdf-InsuranceItemTypeCS|formulary-item&subject:MedicationKnowledge.code=http://www.nlm.nih.gov/research/umls/rxnorm|1000091&_include=Basic:formulary
  </code>
</pre>
