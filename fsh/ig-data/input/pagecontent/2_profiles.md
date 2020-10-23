<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir ../../input-cache/schemas-r5/fhir-single.xsd">
  <h3>Profiles defined as part of this Implementation Guide</h3>
  <table class="codes">
    <thead>
      <tr>
        <td>
          <b>Name</b>
        </td>
        <td>
          <b>Based On</b>
        </td>
        <td>
          <b>Definition</b>
        </td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><a href="StructureDefinition-usdf-CoveragePlan.html">CoveragePlan</a></td>
        <td><a href="http://hl7.org/fhir/R4/list.html">List (R4)</a></td>
        <td>
          {% capture md_text %}The CoveragePlan resource represents a health plan and contains 
          links to administrative information, a list of formulary drugs covered under that 
          plan, and a definition of drug tiers and their associated cost-sharing models.
          {% endcapture %}{{ md_text | markdownify }}
        </td>
      </tr>
      <tr>
        <td><a href="StructureDefinition-usdf-FormularyDrug.html">FormularyDrug</a></td>
        <td><a href="http://hl7.org/fhir/R4/medicationknowledge.html">MedicationKnowledge (R4)</a></td>
        <td>
          {% capture md_text %}The FormularyDrug resource represents a drug that is part of a 
          drug formulary. A drug formulary is a list of brand-name and generic prescription 
          drugs a health insurer agrees to pay for, at least partially, as part of health 
          insurance coverage.In addition to identifying the drug by its RxNorm code, and the 
          PlanID of the formulary, the FormularyDrug entry provides information on prescribing 
          limitations, and optionally drug classification and alternatives.{% endcapture %}
          {{ md_text | markdownify }}
        </td>
      </tr>
    </tbody>
  </table>
</div>

