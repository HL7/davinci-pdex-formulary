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
<p>
<ul>
  <li>
    Search parameters for a particular resource can be used in any combination.
  </li>
  <li>
    DrugName, DrugPlan, and DrugTier will be changed to lower-case 'drug-name', 'drug-plan', and 'drug-tier' in a future release.  This issue will be addressed more comprehensively for a future release under a separate ticket. We will need provide guidance that this will change in a future release such that only the lower-case parameters will be allowed.  This will probably be an STU2 ballot change, which will happen some time in 2022.
  </li>
</ul>	
</p>
