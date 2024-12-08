Alias: $loinc = http://loinc.org
Alias: $v2datatype = http://bodyweight.oemig.de/fhir/CodeSystem/V2datatype


// This is an abstract base to allow for further profiling into groups of segments

Logical: AbstractSegment
Parent: Base
Id: AbstractSegment
Title: "LM for an abstract segment"
Description: "This LM operates as a base for adding further fields and to aggregate into segment groups"

* ^version = "0.1.0"
* ^abstract = false
* ^type = "http://bodyweight.oemig.de/fhir/StructureDefinition/AbstractSegment"
* insert HeaderDetailRules


//=========================


Logical: OBXsegment
Parent: AbstractSegment
Id: OBXsegment
Title: "OBX Segment LM"
Description: "LM for relevant attributes of **OBX Segment** (Observation in v2.x)"

* ^version = "0.1.0"
* ^abstract = false
* ^type = "http://bodyweight.oemig.de/fhir/StructureDefinition/OBXsegment"
//* . ^definition = "Observation Segment"
* insert HeaderDetailRules

* seqNo 0..1 integer "Sequence Number (OBX-1)"
* valueDataType 0..1 CodeableConcept "Data Type (OBX-2)"
* observationCode 0..* CodeableConcept "code for observed value (OBX-3)"
* observationGroup 0..1 string "group of observations that belong together"
* value 0..* integer "observed/measured value (OBX-5)"
* unit 1..1 CodeableConcept "units (OBX-6)"
* referenceRange 0..1 CodeableConcept "reference range for values (OBX-7)"
* interpretation 0..1 CodeableConcept "interpretation code (OBX-8)"
* observationDateTime 0..1 instant "Diagnosis Date/Time (OBX-14)"
* responsibleObserver 0..1 Reference(Practitioner) "responsible observer (OBX-16)"
* observationSite 0..1 CodeableConcept "body structure (OBX-20)"
* observationAbsentReason 0..1 CodeableConcept "data absent reason (OBX-32)"



//===========================================================================

Logical: SegmentGroup
Title: "Segment Group LM"
Description: "Segment Group for Blood Pressure Observations"
* ^version = "0.1.0"
* insert HeaderDetailRules

* segment 0..* OBXsegment "group of OBX segments"




//===========================================================================


Profile: OBXmainBW
Parent: OBXsegment
Id: OBXmainBW
Title: "Body Weight Main (Profile) in v2"
Description: "v2 Profile: **Body Weight Measurement**"

* ^version = "0.1.0"
* insert HeaderDetailRules

* seqNo = 1
* valueDataType 1..1 MS
* valueDataType = $v2datatype#NM
* observationCode 1..1 MS
//* observationCode = $loinc#85354-9



Profile: OBXclothing
Parent: OBXsegment
Id: OBXclothing
Title: "Body Weight Clothing (Profile) in v2"
Description: "v2 Profile: **Body Weight Clothing Observation**"

* ^version = "0.1.0"
* insert HeaderDetailRules

* seqNo = 1
* valueDataType 1..1 MS
* valueDataType = $v2datatype#NM
* observationCode 1..1 MS
//* observationCode = $loinc#85354-9




Profile: OBXeating
Parent: OBXsegment
Id: OBXeating
Title: "Body Weight Eating (Profile) in v2"
Description: "v2 Profile: **Body Weight Eating Observation**"

* ^version = "0.1.0"
* insert HeaderDetailRules

* seqNo = 1
* valueDataType 1..1 MS
* valueDataType = $v2datatype#NM
* observationCode 1..1 MS
//* observationCode = $loinc#85354-9


//===========================================================================

Profile: OBXmeasuringType
Parent: OBXsegment
Id: OBXmeasuringType
Title: "Mesuring Type (Profile) in v2"
Description: "v2 Profile: **Measuring Type Observation**"

* ^version = "0.1.0"
* insert HeaderDetailRules

* seqNo = 1
* valueDataType 1..1 MS
* valueDataType = $v2datatype#CNE
* observationCode 1..1 MS
//* observationCode = $loinc#85354-9


//===========================================================================

Profile: OBXbodyweightsegmentgroup
Parent: SegmentGroup
Title: "OBX Body Weight Segment Group"
Description: "This profile should describe in which way the segment instances for PID, OBX and REL belong together"

* segment 3..* MS

//slice the segment
* segment ^slicing.discriminator.type = #value
* segment ^slicing.discriminator.path = "observationCode"
* segment ^slicing.rules = #openAtEnd

//the slice has the name diastolicBP
* segment contains
   PIDsegment 1..1 MS and
   OBXmainBW 1..1 MS and
   RELsegment 0..1 MS and
   OBXclothing 0..1 MS and
   OBXeating 0..1 MS and
   OBXmeasuringType 0..1 MS







CodeSystem: V2datatype
Id: V2datatype
Title: "v2 Data Type"
Description: "**v2 Data Type**"

* ^url = "http://bodyweight.oemig.de/fhir/CodeSystem/V2datatype"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^caseSensitive = false
* ^valueSet = "http://bodyweight.oemig.de/fhir/ValueSet/V2datatype"
* ^hierarchyMeaning = #is-a
* ^compositional = false
* ^versionNeeded = false
* ^content = #complete

* #NM "numeric"
* #ST "string"
* #CWE "coded element, with exceptions"
* #CNE "coded element, no exceptions"


ValueSet: V2datatype
Id: V2datatype
Title: "v2 Data Type"
Description: "**v2 Data Type**"

* ^url = "http://bodyweight.oemig.de/fhir/ValueSet/V2datatype"
* ^version = "0.1.0"

* insert HeaderDetailRules

* include codes from system http://bodyweight.oemig.de/fhir/CodeSystem/V2datatype

