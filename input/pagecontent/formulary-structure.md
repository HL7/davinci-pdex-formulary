<a name="formulary-structure"></a>
### Formulary Structure
<p>
  Formularies in the United States are normally published by health insurers on an annual basis, with minor updates during the year. It is critical that health insurers update their published Formularies following these minor updates.
</p>
<p>
  Insurers regularly administer multiple health insurance and drug coverage plans and each of those plans may have its own formulary.
</p>
<p>
  Each formulary contains a list of drugs. Drugs are placed into <strong>tiers</strong> that largely determine the cost to the consumer/patient. The number and purpose of drug tiers varies across payers. Each tier has an associated cost-sharing model that includes deductibles and/or coinsurance components for drugs in the tier when purchased through various pharmacy types.
</p>
<p>
  In addition to the drug tier, drugs may also list requirements on the patient (e.g., age or gender) or limitations on prescription (e.g., prior authorization).
</p>
<p>
  This Implementation Guide closely follows the formulary information model of the <a href="https://github.com/CMSgov/QHP-provider-formulary-APIs">formularies for Qualified Health Plans (QHPs) on the federal health insurance marketplace for healthcare.gov</a>. Publishing formularies in the QHP format should be familiar to many payers. Drugs are specified by RxNorm codes of prescribable drugs, as constrained by the <a href="https://build.fhir.org/ig/HL7/US-Core-R4/ValueSet-us-core-medication-codes.html"> US Core Medication Codes value set</a>. The QHP data model mandates specific value sets for some data types (e.g., types of copayments), but leaves value sets for other data types at the discretion of the payer (e.g., drug tier identifiers, pharmacy types). and does not include data that is fairly standard across formularies (drug classifications, alternative drugs). The following object model shows the relationships between the resources in the current IG. The only areas where this Implementation Guide extends beyond the QHP formulary information model is the addition of DrugClass and DrugAlternatives to FormularyDrug, as highlighted in the figure.
</p>
<p>&nbsp;</p>
<p><img style="width: 100%; height: auto;" src="formularyQHP.jpg" /></p>
<p>
  A FormularyDrug represents the availability of a drug with a specific RxNorm code within the tier structure and prescribing constraints of a specific CoveragePlan. If a FHIR endpoint provides data on multiple CoveragePlans, querying for FormularyDrugs by their RxNorm code would return multiple entries. Each of these FormularyDrugs could associate the drug to a distinct DrugTier in the associated CoveragePlan, with plan-specific prescribing constraints. The CoveragePlan PlanID field and the FormularyDrug PlanID extension field associate a FormularyDrug with a CoveragePlan.
</p>
<a name="expected-users"></a>
### Expected Users 
<p>
  This Implementation Guide is intended for insurers within the United States. Currently, many insurers make their formularies available to patients using PDFs or drug search forms through their websites. Providing formularies using FHIR may allow patients to more easily comparison-shop between plans and could help insurers educate consumers about the differences between various drug tiers/classes.
</p>