<a name="open-issues"></a>
### Additional Background and Open Issues 
<a name="presenting-alternative-medications"></a>
#### Presenting Drug Alternatives 
<p>
  There may be brand or generic alternatives to a particular drug in the formulary. The QHP formulary information model, does not include drug alternatives. The current Implementation Guide provides for each FormularyDrug to include an array of references to other FormularyDrugs within the same CoveragePlan. There may be better ways to represent equivalence classes among FormularyDrugs using the DrugClass.
</p>
<a name="representing-drug-tiers"></a>
#### Representing Drug Tiers
<p>
  Drug tiers are not standardized. The current Implementation Guide provides a defined, but extensible value set for tier identifiers based on the example list in the QHP formulary specification. A move towards standardization might make this data more useful for clients of the interface.
</p>
<a name="representing-drug-classifications"></a>
#### Representing Drug Classifications
<p>
  Within a consumer-facing drug formulary the primary use of drug classification is to enable hierarchical browsing of the formulary contents from a therapeutic disease area (e.g., hypertension) or pharmacologic action (e.g., beta blocker) perspective. An empirical review of web/PDF-based drug formularies found a variety of different hierarchies being used to present the formulary to consumers. The current IG suggests the utility of using the FormularyDrug.medicineClassification field to provide drug classification information, but does not specify a particular vocabulary. This might be a fruitful area for subsequent standardization.
</p>
<a name="representing-pharmacy-types"></a>
#### Representing Pharmacy Types
<p>
  Pharmacy types are not standardized. The current Implementation Guide provides a defined value set for tier identifiers based on the example list in the QHP formulary specification which mixes channels (retail and mail order) with quantity prescribed (1 month, 3 month, etc). A move towards standardization might make this data more useful for clients of the interface.
</p>
<a name="provision-of-formulary-ids"></a>
#### Provision of Formulary IDs and Availability of Directory
<p>
  There is no single, authoritative indentifier that can be associated with a formulary (e.g., like NPI numbers identify providers in the United States). How can unique formulary IDs be provisioned such that they can be implemented consistently by all payers and referenced by other entities (e.g., health plans)? The NCPDP Formulary and Benefits eRx implementation guide requires an identifier for each formulary. Perhaps that can be leveraged.
</p>