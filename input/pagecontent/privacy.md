<h4 id="privacy-considerations">Privacy Considerations</h4>
<p>The formulary service can potentially be accessed two different ways:</p>
<ol>
  <li>
    <em data-stringify-type="italic">Authenticated API</em>: Access to the formulary service when integrated with protected&nbsp;health&nbsp;information (PHI) or personally identifiable information (PII) as part of the Patient Access API SHALL be protected through an authorized, authenticated transaction as described in the Da Vinci Health Record Exchange (HRex) FHIR Implementation Guide for the&nbsp;<a class="c-link" href="http://hl7.org/fhir/us/davinci-hrex/2020Sep/security.html" target="_blank" rel="noopener noreferrer" data-stringify-link="http://hl7.org/fhir/us/davinci-hrex/2020Sep/security.html" data-sk="tooltip_parent">September 2020 Ballot</a>.
  </li>
  <li>
    <em data-stringify-type="italic">Unauthenticated API</em>: When exchanging formulary data exclusively, which is public information without any PHI or PII, the formulary service MAY also be accessed through an API that does not require authentication or authorization.&nbsp;The formulary server SHALL NOT maintain any records through the unauthenticated API that could associate the consumer with the medication list that was queried.
  </li>
</ol>
<h5 id="authenticated">Authenticated</h5>
<p>
  When accessing data through an authenticated API, the response depends on whether the member is currently enrolled in a plan and whether they are a member of a group.  The following table indicates how the Formulary API should respond to requests when a plan ID is specified and when it is not.
</p>
<table border="1">
  <thead>
    <th>Situation</th>
    <th>PlanID specified</th>
    <th>PlanID not specified</th>
  </thead>
  <tbody>
    <tr>
      <td>No plan available</td>
      <td>Zero plans returned (200)</td>
      <td>Zero plans returned (200)</td>
    </tr>
    <tr>
      <td>No plan selected/no group</td>
      <td>Zero plans returned (200)</td>
      <td>Bundle of available individual CoveragePlans</td>
    </tr>
    <tr>
      <td>No plan selected/in group</td>
      <td>Zero plans returned (200)</td>
      <td>Bundle of available group CoveragePlans</td>
    </tr>
    <tr>
      <td>Plan selected/no group</td>
      <td>If PlanID matches selected plan, return CoveragePlan, otherwise zero plans returned</td>
      <td>Zero plans returned (200)</td>
    </tr>
    <tr>
      <td>Plan selected/in group</td>
      <td>If PlanID matches selected plan, return CoveragePlan, otherwise zero plans returned</td>
      <td>Bundle of available group CoveragePlans. If no plans available, zero plans returned</td>
    </tr>
  </tbody>
</table>
<h5 id="unauthenticated">Unauthenticated</h5>
<p>
  When accessing data through an unauthenticated API, the conformant payer formulary service SHALL NOT require a formulary mobile application to send consumer identifying information in order to query for the list of health plans provided by that payer and the medication costs for each plan, specific to the consumer&rsquo;s set of medications.
</p>
<p>
  An unauthenticated API to the formulary service is needed to implement the &ldquo;Shopping for Health Plans&rdquo; use case detailed in this implementation guide.
</p>
