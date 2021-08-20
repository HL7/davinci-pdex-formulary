<a name="Search Parameters Required By This Implementation Guide"></a>
### Search Parameters Required by This Implementation Guide
<table class="grid">
	<thead>
		<tr>
			<th>Resource</th>
			<th>Parameter</th>
			<th>Type</th>
			<th>Example</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>List (CoveragePlan)</td>
			<td><a href="http://hl7.org/fhir/R4/search.html">_id</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><code class="highlighter-rouge">GET [base]/List?_id=[id]</code></td>
		</tr>
  	<tr>
			<td>List (CoveragePlan)</td>
			<td>identifier</td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><code class="highlighter-rouge">GET [base]/List?identifier=[system]|[code]</code></td>
		</tr>
		<tr>
			<td>List (CoveragePlan)</td>
			<td>item</td>
			<td><a href="https://www.hl7.org/fhir/search.html#reference">reference</a></td>
			<td><code class="highlighter-rouge">GET [base]/List?item=[item-reference]</code></td>
		</tr>
		<tr>
			<td>List (CoveragePlan)</td>
			<td>status</td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><code class="highlighter-rouge">GET [base]/List?status=[status]</code></td>
		</tr>
		<tr>
			<td>MedicationKnowledge (FormularyDrug)</td>
			<td><a href="http://hl7.org/fhir/R4/search.html">_id</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><code class="highlighter-rouge">GET [base]/MedicationKnowledge?_id=[id]</code></td>
		</tr>
		<tr>
			<td>MedicationKnowledge (FormularyDrug)</td>
			<td>code</td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><code class="highlighter-rouge">GET [base]/MedicationKnowledge?code=[system]|[code]</code></td>
		</tr>
		<tr>
			<td>MedicationKnowledge (FormularyDrug)</td>
			<td><a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/SearchParameter-DrugName.html">DrugName</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#string">string</a></td>
			<td><code class="highlighter-rouge">GET [base]/MedicationKnowledge?DrugName=[name]</code></td>
		</tr>
		<tr>
			<td>MedicationKnowledge (FormularyDrug)</td>
			<td><a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/SearchParameter-DrugPlan.html">DrugPlan</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#string">string</a></td>
			<td><code class="highlighter-rouge">GET [base]/MedicationKnowledge?DrugPlan=[plan]</code></td>
		</tr>
		<tr>
			<td>MedicationKnowledge (FormularyDrug)</td>
			<td><a href="http://build.fhir.org/ig/HL7/davinci-pdex-formulary/SearchParameter-DrugTier.html">DrugTier</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><code class="highlighter-rouge">GET [base]/MedicationKnowledge?DrugTier=[system]|[code]</code></td>
		</tr>
	</tbody>
</table>
<a name="Additional Search Parameter Guidance"></a>
### Additional Search Parameter Guidance 
<p>
Formulary searches may be restricted to just the drugs supported by the payer therefore it is up to the user or calling application to convert patient searching requirements for branded or equivalent drugs into one or more formulary searches. Payers may only have certain drugs on their formulary and therefore available for searching.
</p>
<p>
Only covered drugs may appear in the formulary and non-covered drugs are simply not included. For example, a payer may pay for a generic form of a drug, but does not have a brand name in their formulary. To retrieve matching drugs and available alternatives, it may be necessary for a client to search using the ingredient (generic) name in addition to a brand drug name.
</p>
<p>
The preferred way to search for drugs is to use an RxNorm code (RxCUI). The RxNorm codes and names are freely available and services to look-up codes exist.
</p>
<p>
As an alternative, this Implementation Guide provides the ability to search for FormularyDrug (MedicationKnowledge) resources by drug name through the <a href="SearchParameter-DrugName.html"> DrugName Search Parameter</a>. This search parameter is based on the MedicationKnowledge.code.coding.display and provides a full (`exact`) or partial (`contains`) equals (`eq`) string match. Per the FHIR Specification, the <a href= "https://www.hl7.org/fhir/rxnorm.html#4.3.2.3"> Correct RxNorm Display</a> is the Full RxNorm name of either the Semantic Clinical Drug (SCD) or Semantic Brand Drug (SBD). The full drug name has several components presented in the following formats:
</p>
<ul>
  <li>
	<strong>SCD</strong> = Ingredient + Strength + Dose Form
   </li>
   <li>
	<strong>SBD</strong> = Ingredient + Strength + Dose Form + [Brand Name]
</li>
</ul>
<p>
In addition to these RxNorm names, drug combination packs may also appear in formularies. Drug combination packs can contain multiple drugs or strengths that are packaged and prescribed together, under a brand or generic drug name, to meet a particular set of administration requirements. The full name for drug combination packs have components presented in the following formats:
</p>
<ul>
  <li>
	<strong>GPCK</strong> = {# (Ingredient + Strength + Dose Form) / # (Ingredient + Strength + Dose Form)} Pack
  </li>
  <li>
	<strong>BPCK</strong> = {# (Ingredient + Strength + Dose Form) / # (Ingredient + Strength + Dose Form)} Pack [Brand Name]
 </li>
 </ul>
<p>
Given the format for the above RxNorm Term Types (SCD, SBD, GPCK, and BPCK), searches on drugs with more than the one component specified in a single DrugName search parameter instance, such as a search with Name + Form, may not yield the desired results. For example, a search for “acetaminophen Tablet”, will not return any results for the above RxNorm Term Types identified above since the format of those types has a strength in between the ingredient and the dose form (e.g. “acetaminophen 500 MG Oral Tablet”).
</p>
<p>
The [DrugName] (SearchParameter) includes the `multipleAnd` capability, which allows for multiple `DrugName` search parameters within a single query. With this capability it is possible to search by drug name and form. This capability should be used sparingly, as each additional partial string search parameter increases the load on the server.
</p>
<ul>
   <li>
	<strong>For Example:</strong> MedicationKnowledge?DrugName:contains=acetaminophen&DrugName:contains=Tablet
	</li>
</ul>
<p>
This search will return all matching drug names with both the ingredient “acetaminophen” and dose form “Tablet”. This will also return any matching combination or pack drugs.
</p>
<p>
Another factor clients need to consider when searching for drugs by name, is that individual drug names may be contained within combination drugs (e.g., a search on acetaminophen will return many combination drugs). Clients may need to filter search results to fit their requirements.
</p>

<a name="Future Considerations"></a>
### Future Considerations

<ul>
  <li>
    Search parameters for a particular resource can be used in any combination.
  </li>
  <li>
    DrugName, DrugPlan, and DrugTier will be changed to lower-case 'drug-name', 'drug-plan', and 'drug-tier' in a future release.  This issue will be addressed more comprehensively for a future release under a separate ticket. We will need provide guidance that this will change in a future release such that only the lower-case parameters will be allowed.  This will probably be an STU2 ballot change, which will happen some time in 2022.
  </li>
</ul>	
