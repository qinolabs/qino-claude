# Qino Concept Agent — Concept File Specification  
*This document defines the canonical structure of a concept.md file used by the **Qino Concept Agent**.  
It is a technical specification — not a concept itself.  
It guides the agent in reading, creating, refining, and organizing concept documents.*

---

## 1. Purpose of This Document  
This file describes the **required structure**, **sections**, and **formatting rules** of every `concept.md` document in a Qino concept ecosystem.  
The Qino Concept Agent reads this file on startup to understand:

- how to parse concept files  
- how to extract and rewrite specific sections  
- how to generate new concept files during ingestion  
- how to maintain consistency across the entire ecosystem  

This file should remain stable and minimal.

---

## 2. Concept File Structure Overview  

Every concept must be stored at:

```
concepts/<concept-id>/concept.md
```

Each concept.md must follow the structure below:

```
# <Concept Name>

## 1. Real-World Impulse
<Short explanation of the core lived impulse that gave rise to the concept.>

## 2. Glowing Connections
<High-level thematic links to other concepts or ideas. Not technical integrations.>

## 3. Primary Surfaces
<The main experiential surfaces where the user encounters the concept.>

## 4. Interfaces & Communication
<How the concept communicates outward or receives information from the user or other concepts.>

## 5. Ecosystem Integration
<How this concept relates to the broader ecosystem—inputs, outputs, flows, complementarities.>

## 6. Scoped Features (Smallest Living Version)
<Key features or abilities required for the simplest meaningful expression of the concept.>

## 7. Build Plan (Rough)
<High-level implementation notes if desired—kept rough and optional.>

## Sources
<Optional list of raw notes or external references linked to this concept.>
```

All sections **must exist**, though some may be empty when a concept is new.

Spacing rules:
- Exactly one `#` title at the top  
- All other sections begin with `##`  
- No deeper levels (`###`) should be used for core sections  
- The Qino Concept Agent rewrites only the body **below** a section heading and above the next heading  

---

## 3. Section-by-Section Specification  

### **1. Real-World Impulse**  
This is the **heartbeat** of the concept.  
It must:

- express the lived, human impulse that gave rise to the concept  
- stay grounded in real-world phenomena, not abstractions  
- emphasize what *still feels alive* today  

The agent often refines this section first.

---

### **2. Glowing Connections**  
This section captures **high-level narrative or thematic connections** to other concepts.  
It should NOT include:

- technical integration  
- data flows  
- feature sets  

It should include:

- shared impulses  
- conceptual resonance  
- areas of potential synergy  

The agent may update this section during `/relate`.

---

### **3. Primary Surfaces**  
These are the **primary experiential touchpoints** where the concept becomes real for the user.

Examples:
- interfaces  
- moments  
- views  
- rituals  
- flows  

This section is expanded during `/explore`.

---

### **4. Interfaces & Communication**  
This describes **how the concept exchanges information** with:

- the user  
- other concepts  
- external systems  

It is conceptual, not technical.

---

### **5. Ecosystem Integration**  
This section expresses how the concept sits within the larger ecosystem.

May include:
- input/output relationships  
- conceptual adjacency  
- supportive roles  
- dependencies (conceptual, not technical)  

This section should grow as concepts become more mature.

---

### **6. Scoped Features (Smallest Living Version)**  
Defines the **essence** of functionality required for the concept’s smallest complete expression.

Characteristics:
- minimal  
- essential  
- viable  
- not a roadmap  

This is where the agent helps avoid scope bloat.

---

### **7. Build Plan (Rough)**  
This optional section provides a **non-binding outline** of how the concept might eventually be implemented.

Rules:
- high-level  
- non-committal  
- no hard dependencies  
- not required for early concepts  

---

### **Sources**  
An optional list of:

- raw notes  
- original documents  
- audio transcripts  
- previous drafts  

The agent may append file references during ingestion.

---

## 4. Encoding & Formatting Requirements  

- File encoding: **UTF-8**  
- Must be plain Markdown  
- No frontmatter blocks (`---`)  
- Headings must be exactly as shown  
- Section numbers must remain stable  
- Each section must be separated by a single blank line  
- The agent may reorder sections only under explicit `/organize` commands  

---

## 5. Concept Lifecycle Expectations  

A concept file:

1. Begins minimal — only the Real-World Impulse may be filled.  
2. Gains structure and clarity through refinement (`/refine`).  
3. Expands with possibility during exploration (`/explore`).  
4. Develops relational coherence during `/relate`.  
5. Achieves order and identity during `/organize`.  

The specification ensures every concept grows within the same structural frame.

---

## 6. Responsibilities of the Qino Concept Agent  

When reading this file, the agent must:

- treat this as the authoritative schema  
- follow heading names and numbering exactly  
- modify only section bodies, not headings  
- generate new concept.md files using this structure  
- validate section presence before modification  
- create missing sections if needed  

---

## 7. Future Extensions  

Possible optional sections the agent may someday support:

- `## Narrative Examples`  
- `## Energetic Qualities`  
- `## Questions to Revisit`  

None are required or recognized today.

