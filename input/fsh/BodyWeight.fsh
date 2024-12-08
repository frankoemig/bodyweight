Logical: BodyWeight
Parent: Base
Id: BodyWeight
Title: "Body Weight LM"
Description: "LM for **Body Weight**"

* ^version = "0.1.0"
* ^abstract = false
* ^type = "http://bodyweight.oemig.de/fhir/StructureDefinition/BodyWeight"
* . ^definition = "Body Weight"

* insert HeaderDetailRules

* weight 1..1 SU BackboneElement "body weight"
  * value 1..1 SU positiveInt "value"
    * obeys shall-be-under-400-kg
  * unit 1..1 CodeableConcept "units"
  * unit from http://bodyweight.oemig.de/fhir/ValueSet/BWunits (required)
  * interpretation 0..1 CodeableConcept "interpretation"
  * referenceRange 0..1 BackboneElement "reference range"
    * low 0..1 integer "lower bound"
    * high 0..1 integer "upper bound"
    * age 0..1 integer "designated age this weight is associated with"

* clothing 0..1 CodeableConcept "type of clothing during measurement"
* clothing from http://bodyweight.oemig.de/fhir/ValueSet/Clothing (required)

* missingBodyParts 0..* CodeableConcept "Are there any relevant parts of the body missing that heavily influencese the resulting weight?"

* subject 0..1 Reference(Patient) "reference to the subject of the measurement"
* author 0..1 Reference(Practitioner) "reference to the author of the measurement"
* performer 0..1 Reference(Practitioner) "reference to the performer of the measurement"




// @Name: String Length Invariant
// @Description: Limit string length invariant
Invariant:   shall-be-under-400-kg
Description: "Value SHALL be <400 kg for valid data."
Expression:  "$this < 250"
Severity:    #error




CodeSystem: Clothing
Id: Clothing
Title: "Clothing"
Description: "**Clothing**"

* ^url = "http://bodyweight.oemig.de/fhir/CodeSystem/Clothing"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^caseSensitive = false
* ^valueSet = "http://bodyweight.oemig.de/fhir/ValueSet/Clothing"
* ^hierarchyMeaning = #is-a
* ^compositional = false
* ^versionNeeded = false
* ^content = #complete

* #none "no clothes" "the patient is naked."
* #light "light clothes" "the patient is only wearing underwar."
* #normal "normal clothes" "the patient is wearing normal everyday clothes."
* #heavy "heavy clothes" "the patient is wearing heavy clothes like in winter."


ValueSet: Clothing
Id: Clothing
Title: "Clothing"
Description: "**Clothing**"

* ^url = "http://bodyweight.oemig.de/fhir/ValueSet/Clothing"
* ^version = "0.1.0"

* insert HeaderDetailRules

* include codes from system http://bodyweight.oemig.de/fhir/CodeSystem/Clothing




CodeSystem: MeasuringType
Id: MeasuringType
Title: "Measuring Type"
Description: "**Measuring Type**"

* ^url = "http://bodyweight.oemig.de/fhir/CodeSystem/MeasuringType"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^caseSensitive = false
* ^valueSet = "http://bodyweight.oemig.de/fhir/ValueSet/MeasuringType"
* ^hierarchyMeaning = #is-a
* ^compositional = false
* ^versionNeeded = false
* ^content = #complete

* #measured "measured"
* #estimated "estimated"


ValueSet: MeasuringType
Id: MeasuringType
Title: "Measuring Type"
Description: "**Measuring Type**"

* ^url = "http://bodyweight.oemig.de/fhir/ValueSet/MeasuringType"
* ^version = "0.1.0"

* insert HeaderDetailRules

* include codes from system http://bodyweight.oemig.de/fhir/CodeSystem/MeasuringType





ValueSet: BWunits
Id: BWunits
Title: "Body Weight Units"
Description: "**Units for measuring Body Weight**"

* ^url = "http://bodyweight.oemig.de/fhir/ValueSet/BWunits"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^compose.include[+].system = "http://unitsofmeasure.org"
* ^compose.include[=].concept[+].code = #g
* ^compose.include[=].concept[+].code = #kg


