<a name="Search Parameters Required By This Implementation Guide"></a>

### Search Parameters Required by This Implementation Guide
<p>&nbsp;</p>
#### PayerInsurancePlan & Formulary (InsurancePlan)
<table class="grid" style="width: 100%">
	<thead>
		<tr>
			<th>Parameter</th>
			<th>Type</th>
			<th>Conf.</th>
			<th>Description</th>
			<th>Example</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><a href="http://hl7.org/fhir/R4/search.html">_id</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><strong>SHALL</strong></td>
			<td>FHIR resource id of an InsurancePlan</td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?_id=[id]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-InsurancePlan-lastupdated.html">_lastUpdated</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#date">date</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the last updated date of an InsurancePlan</td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?_lastUpdated=[date]</code></td>
		</tr>
  		<tr>
			<td><a href="SearchParameter-InsurancePlan-identifier.html">identifier</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the business identifier of an InsurancePlan</td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?identifier=[system]|[code]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-InsurancePlan-status.html">status</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the status of an InsurancePlan</td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?status=[code]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-InsurancePlan-period.html">period</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#date">date</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the active period of an InsurancePlan</td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?period=[date]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-InsurancePlan-type.html">type</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the Type of an InsurancePlan</td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?type=[system]|[code]</code></td>
		</tr>	
		<tr>
			<td><a href="SearchParameter-InsurancePlan-name.html">name</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#string">string</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the name of an InsurancePlan</td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?name=[string]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-InsurancePlan-coverage-type.html">coverage-type</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the coverage type of an InsurancePlan</td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?coverage-type=[system]|[code]</code></td>
		</tr>			
		<tr>
			<td><a href="SearchParameter-InsurancePlan-formulary-coverage.html">formulary-coverage</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#reference">reference</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the Coverage Formulary Reference of an InsurancePlan</td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?formulary-coverage=[reference]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-InsurancePlan-coverage-area.html">coverage-area</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#reference">reference</a></td>
			<td><strong>SHALL</strong></td>
			<td>Search InsurancePlan by coverage location.</td>
			<td><code class="highlighter-rouge">GET [base]/InsurancePlan?coverage-area=[reference]</code></td>
		</tr>
	</tbody>
</table>
<p>&nbsp;</p>

#### InsurancePlanLocation (Location)
<table class="grid" style="width: 100%">
	<thead>
		<tr>
			<th>Parameter</th>
			<th>Type</th>
			<th>Conf.</th>
			<th>Description</th>
			<th>Example</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><a href="http://hl7.org/fhir/R4/search.html">_id</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><strong>SHALL</strong></td>
			<td>FHIR resource id of a Location</td>
			<td><code class="highlighter-rouge">GET [base]/Location?_id=[id]</code></td>
		</tr>
		<tr>
			<td><a href="https://www.hl7.org/fhir/search.html#lastUpdated">_lastUpdated</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#date">date</a></td>
			<td><strong>SHOULD</strong></td>
			<td>Access the last updated date of a Location</td>
			<td><code class="highlighter-rouge">GET [base]/Location?_lastUpdated=[date]</code></td>
		</tr>
		<tr>
			<td>address</td>
			<td><a href="https://www.hl7.org/fhir/search.html#string">string</a></td>
			<td><strong>SHOULD</strong></td>
			<td>Access the address of a Location</td>
			<td><code class="highlighter-rouge">GET [base]/Location?address=[string]</code></td>
		</tr>
		<tr>
			<td>address-city</td>
			<td><a href="https://www.hl7.org/fhir/search.html#string">string</a></td>
			<td><strong>SHOULD</strong></td>
			<td>Access the city of a Location</td>
			<td><code class="highlighter-rouge">GET [base]/Location?address-city=[string]</code></td>
		</tr>
		<tr>
			<td>address-state</td>
			<td><a href="https://www.hl7.org/fhir/search.html#string">string</a></td>
			<td><strong>SHOULD</strong></td>
			<td>Access the state of a Location</td>
			<td><code class="highlighter-rouge">GET [base]/Location?address-state=[string]</code></td>
		</tr>
		<tr>
			<td>address-postalcode</td>
			<td><a href="https://www.hl7.org/fhir/search.html#string">string</a></td>
			<td><strong>SHOULD</strong></td>
			<td>Access the postal code of a Location</td>
			<td><code class="highlighter-rouge">GET [base]/Location?address-postalcode=[string]</code></td>
		</tr>
	</tbody>
</table>
<p>&nbsp;</p>

#### FormularyItem (Basic)
<table class="grid" style="width: 100%">
	<thead>
		<tr>
			<th>Parameter</th>
			<th>Type</th>
			<th>Conf.</th>
			<th>Description</th>
			<th>Example</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><a href="http://hl7.org/fhir/R4/search.html">_id</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><strong>SHALL</strong></td>
			<td>FHIR resource id of a FormularyItem</td>
			<td><code class="highlighter-rouge">GET [base]/Basic?_id=[id]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-Basic-lastupdated.html">_lastUpdated</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#date">date</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the last updated date of a FormularyItem</td>
			<td><code class="highlighter-rouge">GET [base]/Basic?_lastUpdated=[date]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-Basic-code.html">code</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the Code of a Basis resource to find a FormularyItem</td>
			<td><code class="highlighter-rouge">GET [base]/Basic?code=formulary-item</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-Basic-subject.html">subject</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#reference">reference</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the subject FormularyDrug (MedicationKnowledge) reference of a FormularyItem</td>
			<td><code class="highlighter-rouge">GET [base]/Basic?subject=[reference]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-Basic-status.html">status</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the status of a FormularyItem</td>
			<td><code class="highlighter-rouge">GET [base]/Basic?status=[code]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-Basic-period.html">period</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#date">date</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the active period of a FormularyItem</td>
			<td><code class="highlighter-rouge">GET [base]/Basic?period=[date]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-Basic-formulary.html">formulary</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#reference">reference</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the formulary reference of a FormularyItem</td>
			<td><code class="highlighter-rouge">GET [base]/Basic?formulary=[reference]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-Basic-pharmacy-type.html">pharmacy-type</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the Pharmacy Network Type of a FormularyItem</td>
			<td><code class="highlighter-rouge">GET [base]/Basic?pharmacy-type=[system]|[code]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-Basic-drug-tier.html">drug-tier</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the Drug Tier of a FormularyItem</td>
			<td><code class="highlighter-rouge">GET [base]/Basic?drug-tier=[system]|[code]</code></td>
		</tr>
	</tbody>
</table>
<p>&nbsp;</p>

#### FormularyDrug (MedicationKnowledge)
<table class="grid" style="width: 100%">
	<thead>
		<tr>
			<th>Parameter</th>
			<th>Type</th>
			<th>Conf.</th>
			<th>Description</th>
			<th>Example</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><a href="http://hl7.org/fhir/R4/search.html">_id</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><strong>SHALL</strong></td>
			<td>FHIR resource id of a FormularyDrug</td>
			<td><code class="highlighter-rouge">GET [base]/MedicationKnowledge?_id=[id]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-MedicationKnowledge-lastupdated.html">_lastUpdated</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#date">date</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the last updated date of a FormularyItem</td>
			<td><code class="highlighter-rouge">GET [base]/MedicationKnowledge?_lastUpdated=[date]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-MedicationKnowledge-status.html">status</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the status of a FormularyDrug</td>
			<td><code class="highlighter-rouge">GET [base]/MedicationKnowledge?status=[code]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-MedicationKnowledge-code.html">code</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the status of a FormularyDrug</td>
			<td><code class="highlighter-rouge">GET [base]/MedicationKnowledge?code=[system]|[code]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-MedicationKnowledge-drug-name.html">drug-name</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#string">string</a></td>
			<td><strong>SHALL</strong></td>
			<td>Accesses the Drug Name of a FormularyDrug</td>
			<td><code class="highlighter-rouge">GET [base]/MedicationKnowledge?drug-name=[string]</code></td>
		</tr>
		<tr>
			<td><a href="SearchParameter-MedicationKnowledge-doseform.html">doseform</a></td>
			<td><a href="https://www.hl7.org/fhir/search.html#token">token</a></td>
			<td><strong>SHOULD</strong></td>
			<td>Accesses the dose form of a FormularyDrug</td>
			<td><code class="highlighter-rouge">GET [base]/MedicationKnowledge?doseform=[system|code]</code></td>
		</tr>
	</tbody>
</table>


<p>
<ul>
  <li>
    Search parameters for a particular resource generally can be used in any combination.
  </li>
</ul>	
</p>
