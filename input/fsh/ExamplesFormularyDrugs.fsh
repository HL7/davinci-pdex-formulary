
// NDF-RT terms retried from Archive(https://evs.nci.nih.gov/ftp1/NDF-RT/Archive/): https://evs.nci.nih.gov/ftp1/NDF-RT/Archive/NDF-RT%202018-02-05.txt
Instance: FormularyDrug-1000091
InstanceOf: FormularyDrug
Description: "Formulary Drug 1000091"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"

* code = $RxNorm#1000091 "doxepin hydrochloride 50 MG/ML Topical Cream"
* status = #active
* synonym[+] = "doxepin hydrochloride 5 % Topical Cream"
* synonym[+] = "doxepin HCl 5 % Topical Cream"
* relatedMedicationKnowledge[0].type = RelatedMedicationTypeCS#alternative "Drug Alternative"
* relatedMedicationKnowledge[0].reference = Reference(FormularyDrug-284520)
* medicineClassification[+].type = #STRUCT "Established Pharmacologic Class"
* medicineClassification[=].classification = $MEDRT#N0000175752 "Tricyclic Antidepressant"
* medicineClassification[+].type = #EPC "Established Pharmacologic Class"
* medicineClassification[=].classification = $NDFRT#N0000146208 "DOXEPIN HYDROCHLORIDE"




Instance: FormularyDrug-1049640
InstanceOf: FormularyDrug
Description: "Formulary Drug 1049640"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"

* code = $RxNorm#1049640 "acetaminophen 325 MG / oxycodone hydrochloride 5 MG Oral Tablet [Percocet]"
* status = #active
* medicineClassification.type = #EPC "Established Pharmacologic Class"
* medicineClassification.classification = $MEDRT#N0000175690 "Opioid Agonist"
* medicineClassification[+].type = #EPC "Established Pharmacologic Class"
* medicineClassification[=].classification = $NDFRT#N0000020170 "ACETAMINOPHEN/OXYCODONE"
 



Instance: FormularyDrug-209459
InstanceOf: FormularyDrug
Description: "Formulary Drug 209459"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"

* code = $RxNorm#209459 "acetaminophen 500 MG Oral Tablet [Tylenol]"
* status = #active
* medicineClassification[+].type = #EPC "Established Pharmacologic Class"
* medicineClassification[=].classification = $NDFRT#N0000177915 "Acetaminophen"

Instance: FormularyDrug-284520
InstanceOf: FormularyDrug
Description: "Formulary Drug 284520"
Usage: #example

* meta.lastUpdated = "2021-08-22T18:36:03.000+00:00"

* code = $RxNorm#284520 "tacrolimus 0.001 MG/MG Topical Ointment [Protopic]"
* status = #active
* synonym[+] = "Protopic 0.001 MG/MG Topical Ointment"
* synonym[+] = "Protopic 0.1 % Topical Ointment"
* relatedMedicationKnowledge[0].type = RelatedMedicationTypeCS#alternative "Drug Alternative"
* relatedMedicationKnowledge[0].reference = Reference(FormularyDrug-1000091)

* medicineClassification.type = #ATC1-4 "Anatomical Therapeutic Chemical"
* medicineClassification.classification = $MEDRT#D11AH "Agents for dermatitis, excluding corticosteroids"
* medicineClassification[+].type = #EPC "Established Pharmacologic Class"
* medicineClassification[=].classification = $NDFRT#N0000148372 "TACROLIMUS"
