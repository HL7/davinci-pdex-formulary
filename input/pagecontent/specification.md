
### Access Methods
The formulary service can potentially be accessed two different ways:
* Authenticated API: Access to the formulary service when integrated with protected health information (PHI) or personally identifiable information (PII) as part of the Patient Access API **SHALL** be protected through an authorized, authenticated transaction as described in the Da Vinci Health Record Exchange (HRex) FHIR Implementation Guide [Security and Privacy Section](({{site.data.fhir.ver.hrex}}/security.html).
* Unauthenticated API: When exchanging formulary data exclusively, which is public information without any PHI or PII, the formulary service **MAY** also be accessed through an API that does not require authentication or authorization. The formulary server **SHALL NOT** maintain any records through the unauthenticated API that could associate the consumer with the medications queried.


#### Authenticated 
When accessing data through an authenticated API, the response for queries on InsurancePlan depends on whether the authenticated member has access to the plan in relation to their membership.  

* For the [Payer Insurance Plan](StructureDefinition-usdf-PayerInsurancePlan.html), this is the overall plan or plans that the individual is a member of.
* For [Formulary](StructureDefinition-usdf-Formulary.html), this means all Formularies that are generally available to the member. If the member is in a group, all group associated formularies are returned. If not in a group, all generally available formularies (that is, those that are not restricted to only one or more groups) are returned.

Clients can determine the Formulary InsurancePlan(s) that the member is subscribed by first retrieving the Payer Insurance Plan(s) and identifying the Formulary(s) through the [Payer Insurance Plan InsurancePlan.coverage](StructureDefinition-usdf-PayerInsurancePlan-definitions.html#InsurancePlan.coverage:drug-coverage).

This can be done by searching for Coverage resources where Coverage.type=DRUGPOL for the authenticated member. Next, extract Payer InsurancePlan from the [profile-InsurancePlan](https://hl7.org/fhir/uv/xver-r5.r4/0.1.0/StructureDefinition-profile-InsurancePlan.html) extension on returned Coverage(s).


The following table indicates how the Formulary API should respond to requests when a Formulary Insurance plan (by resource reference) is specified and when it is not.

<table border="1">
  <thead>
    <th>InsurancePlan specified – GET by resource ID</th>
    <th>InsurancePlan reference not specified - Search</th>
  </thead>
  <tbody>
    <tr>
      <td>Return plan if covered by insurer and included in group if member is part of a group<br />If not, return 400</td>
      <td> Return all plans if covered by insurer and included in group if member is part of a group<br />If none, return 200 </td>
    </tr>
  </tbody>
</table>

Access to other profiled resources in this IG ([FormularyItem](StructureDefinition-usdf-FormularyItem.html) & [FormularyDrug]( StructureDefinition-usdf-FormularyDrug.html)) is not constrained by this IG.

Server implementers **SHALL** make other profiled resources in this IG ([FormularyItem](StructureDefinition-usdf-FormularyItem.html), [FormularyDrug]( StructureDefinition-usdf-FormularyDrug.html)) associated to a member’s available plans available through authenticated access. This IG does not define restrictions on authenticated access to resources not associated with a member’s available plan or the [Plan Location]( StructureDefinition-usdf-InsurancePlanLocation.html) resource.


#### Unauthenticated
When accessing data through an unauthenticated API, the conformant payer formulary service **SHALL NOT** require an application to send consumer identifying information in order to query for the list of health plans provided by that payer and the medication and costs for each plan.


### Bulk Data

The [HL7 FHIR Bulk Data Access Implementation Guide (4.0.0-ballot)](https://hl7.org/fhir/uv/bulkdata/4.0.0-202609-ballot/en/) defines mechanisms for exchanging large datasets of FHIR resources. Drug formularies may contain thousands of drugs across multiple insurance plans, with associated coverage, restrictions, and cost-sharing information. Bulk Data provides an efficient alternative to retrieving this information through individual FHIR RESTful queries.

Formulary servers **SHOULD** support one or both of the following Bulk Data mechanisms:

- [Bulk Export](https://hl7.org/fhir/uv/bulkdata/4.0.0-202609-ballot/en/export.html): Enables a Data Consumer to request and retrieve formulary information from a Formulary server using an asynchronous export operation.
- [Bulk Publish](https://hl7.org/fhir/uv/bulkdata/4.0.0-202609-ballot/en/publish.html): Enables a Data Provider to publish formulary information as downloadable files for retrieval by multiple Data Consumers without requiring each consumer to initiate a separate export.

Implementations supporting either mechanism **SHALL** conform to the applicable requirements of the Bulk Data Access IG.

#### Formulary Bulk Data Resources

A Formulary Bulk Data dataset **SHOULD** include all applicable resources conforming to the Formulary profiles defined in this IG, including the following FHIR resource types:

| Resource Type | Description |
|---------------|-------------|
| `InsurancePlan` | Payer insurance plans and their associated formularies, represented using the Payer Insurance Plan and Formulary profiles. |
| `Basic` | Formulary items representing drug coverage within a formulary, including associated coverage details and restrictions. |
| `MedicationKnowledge` | Formulary drugs, including drug identification and descriptive information. |
| `Location` | Geographic locations or coverage areas associated with insurance plans and formularies. |

The dataset **SHOULD** include sufficient related resources to allow Data Consumers to resolve references and reconstruct the relationships between payer insurance plans, formularies, formulary items, drugs, and coverage areas.

Resources included in a Bulk Data dataset **SHALL** conform to the applicable Formulary profiles and requirements defined in this IG.

The following GraphDefinitions describe relationships between Formulary resources and **MAY** be used to determine the resources included in a Bulk Data dataset:

- [Payer Insurance Plan Bulk Data Graph Definition](StructureDefinition-usdf-PayerInsurancePlanBulkDataGraphDefinition.html): Describes resources associated with a Payer Insurance Plan, including related formularies.
- [Formulary Bulk Data Graph Definition](StructureDefinition-usdf-FormularyBulkDataGraphDefinition.html): Describes resources associated with a Formulary, without requiring inclusion of the associated Payer Insurance Plan.

#### Bulk Export

Formulary servers supporting Bulk Export **SHOULD** support the [System Level Export](https://hl7.org/fhir/uv/bulkdata/4.0.0-202609-ballot/en/export.html) operation:

`POST [base]/$export`

The system-level export enables Data Consumers to retrieve formulary information, including resources that are not associated with individual patients.

For Bulk Export:

- The server **SHALL** support exporting all four Formulary resource types listed above.
- The server **SHOULD** support the `_type` parameter to allow Data Consumers to request specific resource types.
- The server **SHOULD** support the `_since` parameter to allow Data Consumers to retrieve resources updated since a specified point in time, consistent with the Bulk Data Access IG.
- The server **SHOULD** include resources of the requested types that are necessary to represent the formulary information within the scope of the export.
- The server **SHALL** implement the applicable Bulk Data Export kick-off, status, and file retrieval interactions as defined in the Bulk Data Access IG.

Exported resources are delivered in newline-delimited JSON (NDJSON) files, with the file locations identified in the Bulk Data Export completion manifest.

#### Bulk Publish

Formulary servers supporting Bulk Publish **SHOULD** implement the [Bulk Publish](https://hl7.org/fhir/uv/bulkdata/4.0.0-202609-ballot/en/publish.html) mechanism defined in the Bulk Data Access IG.

Bulk Publish allows a Data Provider to make formulary information available through a published manifest and associated downloadable resource files. Unlike Bulk Export, the Data Provider determines the contents of the published dataset, and multiple Data Consumers may retrieve the same published files.

For Bulk Publish:

- The Data Provider **SHALL** support publishing all four Formulary resource types listed above, as applicable to the formularies being published.
- The Data Provider **SHALL** make a Bulk Publish manifest available through an HTTP GET endpoint terminating in `$bulk-publish`, as defined in the Bulk Data Access IG.
- The manifest **SHALL** identify the downloadable files containing the published FHIR resources.
- The published files **SHALL** conform to the applicable file format, access, and retrieval requirements of the Bulk Data Access IG.
- The Data Provider **SHOULD** update the published dataset regularly to reflect changes to formulary information, including changes to covered drugs, coverage restrictions, and cost-sharing information.

Bulk Publish also supports incremental updates, allowing Data Providers to publish changes to formulary information without requiring Data Consumers to download the entire dataset each time. Implementations **MAY** use this capability to distribute additions, modifications, and deletions to formulary resources.

#### Bulk Data Security and Authorization

Formulary information that does not contain protected health information (PHI) or personally identifiable information (PII) is generally intended to be publicly accessible. Bulk Data implementations **SHOULD** provide unauthenticated access to public formulary data, consistent with the privacy and security requirements of this IG.

When Bulk Data access involves member-specific information, PHI, or PII, implementations **SHALL** follow the applicable authentication and authorization requirements of this IG and the Bulk Data Access IG.

When authentication or authorization is required, implementations **SHALL** follow the applicable security requirements of the Bulk Data Access IG, including its guidance for [SMART Backend Services Authorization](https://hl7.org/fhir/uv/bulkdata/4.0.0-202609-ballot/en/authorization.html).

### Searching Formulary Drugs
This guide provides a mechanism for rudimentary drug searching and filtering based on drug codes, names, and forms, by requiring server systems to support this data. This capability is not robust and client systems are encouraged to augment their drug searching capabilities using outside services or data sources to better meet the needs of their users.

Searching for formulary drugs can be done by RxNorm code, RxNorm drug name, and dose form. In a formulary API, payers are likely to only include the specific drugs, specific down to form and strength, that are included in the coverage. If a search does not return the anticipated or desireable results, it is recommended that the client broaden the search (e.g. include both generic and brand RxNorm codes, search on name without strength, or search on an RxNorm code that does not include strength - see more guidance about supported RxNorm code term types below). Additionally, drugs that have special coverage rules may or may not be included in an API. These rules are often expressed in additional formulary documentation, referenced by the [InsurancePlan.contact](StructureDefinition-usdf-PayerInsurancePlan-definitions.html#InsurancePlan.contact), which **SHOULD** be presented to the user of the client application.

Formulary searches may be restricted to just the drugs supported by the payer therefore it is up to the user or calling application to convert patient searching requirements for branded or equivalent drugs into one or more formulary searches.

Covered drugs may appear in the formulary and non-covered drugs are simply not included. For example, a payer may pay for a generic form of a drug, but does not have a brand in their formulary. To retrieve matching drugs and available alternatives, it may be necessary for a client to search using the ingredient (generic) in addition to a brand.

Note: In addition to the guidance and requirements below regarding searching for drugs based on an RxNorm code or display, servers may wish to support additional coding systems and display values in order to represent specific drugs that may have the same RxNorm code, but have different coverage specifics as defined in the [Specific Drug Coverage Details](#specific-drug-coverage-details) section. This may result in more than one [FormularyDrug]( StructureDefinition-usdf-FormularyDrug.html) with the same RxNorm code and display value.

#### Searching By Drug Code

The preferred way to search for drugs is to use an RxNorm code (RxCUI). The RxNorm codes and names are freely available and services to look-up codes exist. If a client application is performing a query with the intent on finding generic or brand alternatives, the client application **SHOULD** search using both the brand and the generic RxNorm code.

Servers **SHALL** support a MedicationKnowledge.code.coding repetition including the detailed drug, strength, and form, including RxNorm Term Types (TTY) of `SCD` (Semantic Clinical Drug), `SBD` Semantic Branded Drug), `GPCK` (Generic Pack), or `BPCK` (Branded Pack). Additionally, servers **SHALL** support a MedicationKnowledge.code.coding repetition including the general RxNorm code (and name) with Term Type of` SCDG` (Semantic Clinical Drug Form Group) or `SBDG` (Semantic Branded Drug Form Group) when there is a concept matching the primary code represented by the Term Type `SCD` or `SBD` respectively. This requirement includes using the respective RxNorm name in the display of the coding repetition. 

Searches for drugs with the above RxNorm Term Types (SCDG and SBDG) by either code will provide the client with a way to search for drugs without a specified strength.

#### Searching By Drug Name

This Implementation Guide provides the ability to search for FormularyDrug (MedicationKnowledge) resources by drug name through the [drug-name](SearchParameter-MedicationKnowledge-drug-name.html) search parameter. This search parameter is based on the MedicationKnowledge.code.coding.display and provides a full (`exact`) or partial (`contains`) equals (`eq`) string match. Per the FHIR Specification, the [Correct RxNorm Display](https://www.hl7.org/fhir/rxnorm.html#4.3.2.3) is the Full RxNorm name of either the Semantic Clinical Drug (SCD) or Semantic Brand Drug (SBD). The full drug name has several components presented in the following formats:

* SCD = Ingredient + Strength + Dose Form
* SBD = Ingredient + Strength + Dose Form + [Brand Name]

In addition to these RxNorm names, drug combination packs may also appear in formularies. Drug combination packs can contain multiple drugs or strengths that are packaged and prescribed together, under a brand or generic drug name, to meet a particular set of administration requirements. The full name for drug combination packs have components presented in the following formats:

* GPCK = {# (Ingredient + Strength + Dose Form) / # (Ingredient + Strength + Dose Form)} Pack
* BPCK = {# (Ingredient + Strength + Dose Form) / # (Ingredient + Strength + Dose Form)} Pack [Brand Name]
  
Servers are required to support the more general drug form group code and name where one exists. This display name will be included in any drug name search for which the general drug form group code exists. The RxNorm name of these codes has several components presented in the following formats:
* SCDG = Ingredient + Dose Form Group
* SBDG = Ingredient + Dose Form Group + [Brand Name]

The [drug-name SearchParameter](SearchParameter-MedicationKnowledge-drug-name.html) includes the `multipleAnd` capability, which allows for multiple `drug-name` search parameters within a single query. With this capability it is possible to search by drug name and form where a dose form group is not available. This capability should be used sparingly, as each additional partial string search parameter increases the load on the server. 

For Example:
  `MedicationKnowledge?drug-name:contains=acetaminophen&drug-name:contains=Tablet`

This search will return all matching drug names with both the ingredient “acetaminophen” and dose form “Tablet”. This will also return any matching combination or pack drugs. 

Another factor clients need to consider when searching for drugs by name, is that individual drug names may be contained within combination drugs (e.g., a search on acetaminophen will return many combination drugs). Clients may need to filter search results to fit their requirements.

### Additional Guidance

Specific Drug Coverage Details

RxNorm codes and descriptions were chosen as the mechanism for searching and describing covered drugs for consumer use because that is what consumers will generally have access to given the requirements laid out in US regulation. RxNorm is also the code system used for many outpatient pharmacy prescribing transactions.

RxNorm provides a consumer accessible categorization for prescribable drugs. This categorization may not be specific enough for payers that have very detailed coverage constraints they feel are necessary to express to their members.

This IG Provides the following ways to express various levels of coverage (coverage status, requirements, or costs) for multiple drugs represented under one RxNorm code.

Specific drugs identified by unique FormularyDrug resource instances that are  associated to a Formulary with specific coverage conditions, requirements, and costs through a FormularyItem.
A specific drug code using NDC or other code system is included as a FormularyDrug MedicationKnowledge.code.coding that includes the specific name in the display to enable searching.
Drugs identified by a general RxNorm code in a single FormularyDrug MedicationKnowledge resource with specific coverage conditions and requirements communicated in the referenced FormularyItem.
Specific details including drugs covered or not covered, coverage conditions, or requirements are specified in the FormularyItem Basic.extensions[usdf-AdditionalCoverageInformation-extension].
 

To the Searching Formulary Drugs section, at the bottom of the main section add:

Note: In addition to the guidance and requirements below regarding searching for drugs based on an RxNorm code or display, servers may wish to support additional coding systems and display values in order to represent specific drugs that may have the same RxNorm code, but have different coverage specifics as defined in [Specific Drug Coverage Details](#specific-drug-coverage-details). This may result in more than one [FormularyDrug]( StructureDefinition-usdf-FormularyDrug.html) with the same RxNorm code and display value.

#### Specific Drug Coverage Details

RxNorm codes and descriptions were chosen as the mechanism for searching and describing covered drugs for consumer use because that is what consumers will generally have access to given the requirements laid out in US regulation. RxNorm is also the code system used for many outpatient pharmacy prescribing transactions.

RxNorm provides a consumer accessible categorization for prescribable drugs. This categorization may not be specific enough for payers that have very detailed coverage constraints they feel are necessary to express to their members.

This IG Provides the following ways to express various levels of coverage (coverage status, requirements, or costs) for multiple drugs represented under one RxNorm code.

* Specific drugs identified by unique [FormularyDrug]( StructureDefinition-usdf-FormularyDrug.html) resource instances that are  associated to a Formulary with specific coverage conditions, requirements, and costs through a [FormularyItem](StructureDefinition-usdf-FormularyItem.html).
    - A specific drug code using NDC or other code system is included as a [FormularyDrug]( StructureDefinition-usdf-FormularyDrug.html) MedicationKnowledge.code.coding that includes the specific name in the display to enable searching.
  
* Drugs identified by a general RxNorm code in a single [FormularyDrug]( StructureDefinition-usdf-FormularyDrug.html) MedicationKnowledge resource with specific coverage conditions and requirements communicated in the referenced [FormularyItem](StructureDefinition-usdf-FormularyItem.html).
  - Specific details including drugs covered or not covered, coverage conditions, or requirements are specified in the [FormularyItem](StructureDefinition-usdf-FormularyItem.html) Basic.extensions.
  
#### Linking Coverage to Plans

Version 2.1.0 of this IG added the [Insurance Plan Coverage](StructureDefinition-insurance-plan-coverage.html) profile for linking a patient's coverage to specific drug plans in a [Payer Insurance Plan](StructureDefinition-usdf-PayerInsurancePlan.html).

First, the Payer Insurance Plan profile added a new constraint under Coverage making InsurancePlan.plan:drug-plan.identifier must-support, providing an identifier to link to inside the InsurancePlan resource which may include multiple actual plans (later versions of FHIR have a new resource called InsuranceProduct, which addresses this confusions (a given product may have multiple plans).

The new Coverage profile extends the US Core Coverage profile and adds two cross-version extensions to enable features of Converage not available in FHIR R4, specifically a reference to an InsurancePlan resource that contains the specific drug plan in question, as well as adding an identifier extension under Coverage.class:plan to reference InsurancePlan.plan:drug-plan.identifier, since in FHIR R4 Coverage.class only allows a string to identify the actual plan.

This solution may require multiple Coverage resources on a given FHIR server even though in the real world there may be a single plan that covers all situations, one for drug coverages and another for everything else, and that the current solution will be revisited for FHIR R6. 

#### Presenting Drug Alternatives 
Finding appropriate alternatives of a prescribed medication is complex and often depends on additional clinical information about the patient well as the condition or set of conditions for which the medication is meant to address. The means to identify therapeutic alternatives to drugs does exist in the industry, but such capability is complex, requires clinical information about the patient that is not within in scope of this guide, and a clinical understanding of the intended therapeutic use of the medication which is not generally within the competency of most members.  The information and business rules necessary to identify possible therapeutic alternatives, and therefore the ability to search for such alternatives, currently lies outside of the scope of this guide.

<a name="representing-drug-tiers"></a>
#### Representing Drug Tiers
Drug tiers are not standardized. The current Implementation Guide provides a defined, but extensible value set for tier identifiers based on the example list in the QHP formulary specification. A move towards standardization might make this data more useful for clients of the interface.

<a name="representing-pharmacy-benefit-types"></a>
#### Representing Pharmacy Benefit Types
Pharmacy benefit types are not standardized. The current Implementation Guide provides a defined value set for tier identifiers based on the example list in the QHP formulary specification which mixes channels (retail and mail order) with quantity prescribed (1 month, 3 month, etc). A move towards standardization might make this data more useful for clients of the interface.
