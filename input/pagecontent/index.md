> This is the new homepage for body weight.
> It has been separated from the vital signs demo guide to demonstrate further
> how individual guides should be written.
> It still requires the addition of more details.

### Step 1: MindMap

The following mindmap collects and sorts all aspects around body weight that are necessary 
for a correct interpretation and clinical use. It has to be recognized that some artifacts 
(eg. reference range) are abbreviated, and the corresponding details must be duplicated. 
Unfortunately, PlantUML mindmaps do not allow for cross-links to denote that.

The following diagram aggregates all aspects that can be found somewhere. 
It tries to arrange them in a way that helps to understand the semantics, and to sort them. 
For the moment, additional explanatory text has not been duplicated from other sources for copyright 
and IP reasons. It can be expected, that this will be done later on.


<div width="400px">
{% include body_weight_mm.svg %}
</div>

### Step 2: Information Model

<div width="500px">
{% include body_weight_im.svg %}
</div>

### Step 3: Hierarchy for Vital Signs Profiles (informative)

<div width="500px">
{% include body_weight_hierarchy.svg %}
</div>

### Step 4: Technology Binding (ITS)

**How to represent the same information in different standards?**

#### Step 4a: Profile (with FHIR)

<div width="500px">
{% include body_weight_profile.svg %}
</div>

#### Step 4b: Template (with CDA)

tbd

#### Step 4c: OBX Segment Group profile (with v2.x)


Please see [logical model](StructureDefinition-OBXbodyweightsegmentgroup.html).

As a draft:

| Segment | Card. | Content | Value Type | Unit | Code | Comment |
| --- | --- | --- | --- | --- | --- |
| PID | 1..1 | Patient information | n/a | n/a | n/a | PID-3 |
| PV1 | 1..1 | Visit information | n/a | n/a | n/a | PV1-19 |
| OBX | 1..1 | body weight |  NM | (k)g | $LOINC#tbd | main entry into BW results |
| PRT | 0..* | for different participants | n/a | n/a | n/a | appropriate participant definitions are necessary |
| OBX | 0..1 | eating | CWE | tbd |  $LOINC#tbd |
| OBX | 0..1 | clothing | CWE | tbd | $LOINC#tbd |
| OBX | 0..* | missing body structures | CWE | tbd | $SCT#tbd |

Notes:

* It has to be considered that segments are relevant that are not directly represented in the same group.
* Some codes are just place holders.

### Country-specific Derivations

.. are not necessary so far.

### References + Specifics

* US Core
* DE Core
* NHS Core
