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
			<td>InsurancePlan (PayerInsurancePlan & InsuranceDrugPlan)</td>
			<td><a href="http://hl7.org/fhir/R4/search.html">_id</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?_id=[id]</code></td>
		</tr>
  		<tr>
			<td>InsurancePlan (PayerInsurancePlan & InsuranceDrugPlan)</td>
			<td>identifier</td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?identifier=[system]|[code]</code></td>
		</tr>
		<tr>
			<td>InsurancePlan (PayerInsurancePlan & InsuranceDrugPlan)</td>
			<td>status</td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?status=[code]</code></td>
		</tr>
		<tr>
			<td>InsurancePlan (PayerInsurancePlan & InsuranceDrugPlan)</td>
			<td>type</td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?type=[system]|[code]</code></td>
		</tr>	
		<tr>
			<td>InsurancePlan (PayerInsurancePlan & InsuranceDrugPlan)</td>
			<td>name</td>
			<td><a href="https://www.hl7.org/fhir/search.html#string">string</a></td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?name=[string]</code></td>
		</tr>
		<tr>
			<td>Location (InsurancePlanLocation)</td>
			<td>address</td>
			<td><a href="https://www.hl7.org/fhir/search.html#string">string</a></td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?address=[string]</code></td>
		</tr>
		<tr>
			<td>Location (InsurancePlanLocation)</td>
			<td>address-postalcode</td>
			<td><a href="https://www.hl7.org/fhir/search.html#string">string</a></td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?address-postalcode=[string]</code></td>
		</tr>
		<tr>
			<td>Location (InsurancePlanLocation)</td>
			<td>address-state</td>
			<td><a href="https://www.hl7.org/fhir/search.html#string">string</a></td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?address-state=[string]</code></td>
		</tr>
		<tr>
			<td>Basic (FormularyItem)</td>
			<td><a href="http://hl7.org/fhir/R4/search.html">_id</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><code class="highlighter-rouge">GET [base]/Basic?_id=[id]</code></td>
		</tr>
		<tr>
			<td>Basic (FormularyItem)</td>
			<td>subject (FormularyDrug)</td>
			<td><a href="https://www.hl7.org/fhir/search.html#string">reference</a></td>
			<td><code class="highlighter-rouge">GET [base]/subject?=[reference]</code></td>
		</tr>
		<tr>
			<td>Basic (FormularyItem)</td>
			<td><a href="SearchParameter-drug-plan.html">drug-plan</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#reference">reference</a></td>
			<td><code class="highlighter-rouge">GET [base]/Basic?drug-plan=[reference]</code></td>
		</tr>
		<tr>
			<td>Basic (FormularyItem)</td>
			<td><a href="SearchParameter-drug-tier.html">drug-tier</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#string">token</a></td>
			<td><code class="highlighter-rouge">GET [base]/Basic?drug-tier=[system]|[code]</code></td>
		</tr>
		<tr>
			<td>Basic (FormularyItem)</td>
			<td><a href="SearchParameter-pharmacy-type.html">pharmacy-type</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#string">token</a></td>
			<td><code class="highlighter-rouge">GET [base]/pharmacy-type?=[system]|[code]</code></td>
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
			<td><a href="SearchParameter-drug-name.html">drug-name</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#string">string</a></td>
			<td><code class="highlighter-rouge">GET [base]/MedicationKnowledge?drug-name=[string]</code></td>
		</tr>
		<tr>
			<td>MedicationKnowledge (FormularyDrug)</td>
			<td>doseform</td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><code class="highlighter-rouge">GET [base]/MedicationKnowledge?doseform=[system|code]</code></td>
		</tr>
		<tr>
			<td>MedicationKnowledge (FormularyDrug)</td>
			<td>classification</td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><code class="highlighter-rouge">GET [base]/MedicationKnowledge?classification=[system]|[code]</code></td>
		</tr>
	</tbody>
</table>
<p>
<ul>
  <li>
    Search parameters for a particular resource can be used in any combination.
  </li>
</ul>	
</p>
