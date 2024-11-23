Alias: $measure-population = http://terminology.hl7.org/CodeSystem/measure-population
Alias: $organization-type = http://terminology.hl7.org/CodeSystem/organization-type

Instance: measurereport-example-ach-subjectlist1
InstanceOf: DEQMSubjectListMeasureReport
Title: "MeasureReport - Example ACH Subject List 1"
Description: "Measure Report - Example ACH Subject List Example 1"
Usage: #example
* meta.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-received-date-extension"
* meta.extension.valueDateTime = "2023-05-23T06:07:08Z"

//* text.status = #extensions
//* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Generated Narrative: MeasureReport</b><a name=\"measurereport-example-subjectlist1\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource MeasureReport &quot;measurereport-example-subjectlist1&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-subjectlist-measurereport.html\">Subject-List MeasureReport Profile</a></p></div><p><b>status</b>: complete</p><p><b>type</b>: subject-list</p><p><b>measure</b>: <a href=\"http://www.cdc.gov/nhsn/fhirportal/dqm/ig/Measure/NHSNdQMAcuteCareHospitalInitialPopulation\">http://www.cdc.gov/nhsn/fhirportal/dqm/ig/Measure/NHSNdQMAcuteCareHospitalInitialPopulation|1.0.0</a></p><p><b>period</b>: 2022-08-01 00:00:00+0000 --&gt; 2022-08-31 23:59:59+0000</p><blockquote><p><b>group</b></p><h3>Populations</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Code</b></td><td><b>Count</b></td><td><b>SubjectResults</b></td></tr><tr><td style=\"display: none\">*</td><td>Initial Population <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/5.0.0/CodeSystem-measure-population.html\">MeasurePopulationType</a>#initial-population)</span></td><td>2</td><td><a name=\"list-example-individual-measurereport-list\"> </a><blockquote><p/><p><a name=\"list-example-individual-measurereport-list\"> </a></p><p><b>status</b>: current</p><p><b>mode</b>: snapshot</p><blockquote><p><b>entry</b></p><p><b>item</b>: <a href=\"MeasureReport-measurereport-example-individual-measurereport-sameresultdiffday.html\">MeasureReport/measurereport-example-individual-measurereport-sameresultdiffday</a></p></blockquote><blockquote><p><b>entry</b></p><p><b>item</b>: <a href=\"MeasureReport-measurereport-example-individual-measurereport-hypo.html\">MeasureReport/measurereport-example-individual-measurereport-hypo</a></p></blockquote></blockquote></td></tr></table></blockquote><hr/><blockquote><table class=\"clstu\"><tr><td>Mode: snapshotStatus: current</td></tr><tr><td/></tr></table><table class=\"grid\"><tr style=\"backgound-color: #eeeeee\"><td><b>Items</b></td></tr><tr><td><a href=\"MeasureReport-measurereport-example-individual-measurereport-sameresultdiffday.html\">MeasureReport/measurereport-example-individual-measurereport-sameresultdiffday</a></td></tr><tr><td><a href=\"MeasureReport-measurereport-example-individual-measurereport-hypo.html\">MeasureReport/measurereport-example-individual-measurereport-hypo</a></td></tr></table></blockquote></div>"
* contained = list-example-ach-individual-measurereport-list
* status = #complete
* type = #subject-list
* date = "2022-08-01T00:00:00+00:00"
* reporter = Reference(organization-example-submitting-organization)
* measure = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/Measure/NHSNdQMAcuteCareHospitalInitialPopulation|1.0.0-cibuild"
* period.start = "2022-08-01T00:00:00+00:00"
* period.end = "2022-08-31T23:59:59+00:00"
* group.population.code = $measure-population#initial-population "Initial Population"
* group.population.count = 2
* group.population.subjectResults = Reference(list-example-ach-individual-measurereport-list)


Instance: list-example-ach-individual-measurereport-list
InstanceOf: DEQMIndividualMeasureReportList
Title: "List - Example ACH Individual Measure Report List"
Description: "List - Example ACH Individual Measure Report List Example"
Usage: #example
//* id = "list-example-individual-measurereport-list"
* status = #current
* mode = #snapshot
//* entry[+].item = Reference(measurereport-example-individual-ach-ach-pass1)
//* entry[+].item = Reference(measurereport-example-individual-ach-ach-pass2)
//* entry[+].item = Reference(measurereport-example-individual-ach-ach-pass3)
* entry[+].item
  * identifier.system = "http://example.org/fhir/measurereport/id"
  * identifier.value = "123456789-pass1"
* entry[+].item
  * identifier.system = "http://example.org/fhir/measurereport/id"
  * identifier.value = "123456789-pass2"
* entry[+].item
  * identifier.system = "http://example.org/fhir/measurereport/id"
  * identifier.value = "123456789-pass3"



Instance: organization-example-submitting-organization
InstanceOf: QICoreOrganization
Title: "Organization - Example Submitting Organization 1"
Description: "Organization - Submitting Organization Example 1"
Usage: #example
* identifier[0].system = "https://www.cdc.gov/nhsn/OrgID"
* identifier[=].value = "ExampleNHSNSubmitterOrgID"
* active = true
* type = $organization-type#prov "Healthcare Provider"
* name = "Example NHSN Submitter"
* address.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* address.extension.valueCode = #unknown
* telecom.system = #phone
* telecom.value = "5555555551"
* telecom.rank = 1