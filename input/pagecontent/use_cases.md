<a name="actors"></a>
### Actors
<ul>
  <li>
    <strong>Member</strong>: A person to whom health care coverage has been extended by the policyholder (generally their employer) or any of their covered family members. Sometimes referred to as the insured or insured person. The cost of medications for a member is a function of the drug coverage under their health insurance plan, their benefits based on their already satisified deductibles, and the pharmacy where their prescriptions are filled.
  </li>
  <li>
    <strong>Consumer</strong>: A person who may or may not be a member, who wishes to explore the formulary content and plan-level co-insurance.
  </li>
  <li>
    <strong>Health Plan</strong>: A provider of drug coverage who publishes their formulary content and plan-level co-insurance information through the Drug Formulary FHIR API.
  </li>
</ul>

<a name="Med Copays under Health Plan"></a>
### Med Copays under Health Plan
<p>
  This use case allows a member to determine the plan level estimated costs of each of their medications under the drug coverage of their current health plan. The mobile application queries the formulary service for cost information about the drugs that the member takes and provides the plan level estimated cost for each medication under the member's current health plan.
</p>
<p>
  Note that for this use case the coverage plan could provide authenticated or open access to the plan formulary, and the privacy of the member's data is protected.
</p>
<p><img style="width: 100%; height: auto;" src="Slide1.jpg" /></p>
<p>&nbsp;</p>
<a name="Shopping for Health Plans"></a>
### Shopping for Health Plans
<p>
  This use case allows a consumer to compare the drug coverage of several different health plans and determine which plan has the lowest plan level estimated cost, personalized to the consumers's set of medications. The mobile application retrieves the consumer's medication list from an electronic health record system where the consumer's patient data is stored. This security and privacy of a patient's access to their health information is beyond the scope of this Implementation Guide. The consumer could also independently maintain their medication list in the mobile application or elsewhere. The mobile application identifies the relevant formulary endpoint through means that are beyond the scope of this implementation guide (see <a href="disclaimers-and-assumptions.html">Disclaimers and Assumptions</a>). For each payer, the mobile application queries the payer's formulary service to retrieve the list of health plans provided by that payer. Then, for each plan,the mobile application queries the formulary service to retrieve the plan-level estimated costs specific to the consumer's medication list.
</p>
<p>
  Access to the formulary service should not require authentication, and the server should not maintain any records that could associate the consumer with the medication list that was queried.
</p>
<p>&nbsp;</p>
<p><img style="width: 100%; height: auto;" src="Slide2.jpg" /></p>
<p>&nbsp;</p>
