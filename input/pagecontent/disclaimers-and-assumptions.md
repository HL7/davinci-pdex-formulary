<a name="disclaimers-assumptions"></a>
### Disclaimers and Assumptions 
<ul>
  <li>
    <strong>Drug Formulary includes Plan-Level Data Only</strong>: The intent of this implementation guide is to make the plan-level information regarding formulary content and cost-sharing available through a standard interface for third party applications. Most users will access this data through a third party application. That application should clearly communicate to the user that the cost-sharing information in the formulary may not tell them precisely what they will pay at the pharmacy, and might not reflect their drug benefit. There is an ongoing effort by Carin/NCPDP to develop a Real Time Pharmacy Benefit Check (RTPBC) implementation guide. Future ballots of this implementation guide and the RTPBC implementation guide should be harmonized.
  </li>
  <li>
    <strong>The MedicationKnowledge Resource is immature</strong>: When designing this IG, we initially planned to profile Medication.&nbsp; Based on a strong recommendation from the PharmaWG we shifted to profiling Medicationknowledge.&nbsp; &nbsp;The PharmaWG felt that MedicationKnowledge was a better choice, even with its low maturity, since it is more suitable as an artifact and already included some of fields that would be required as extensions to medication (e.g., classification). MedicationKnowledge and FormularyDrug will co-evolve moving forward.
  </li>
  <li>
    <strong>The formulary endpoint is known to the client</strong>: This IG assumes that the formulary endpoint is known to the client.&nbsp; There is an overarching system architecture issue that is critical to resolve -- how does the client discover the FHIR endpoint of interest.&nbsp;&nbsp;&nbsp;For the purposes of this IG, we consider that problem out of scope.
  </li>
</ul>
