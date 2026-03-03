---
title: "Policy Retrofit Prompt"
description: "Structured prompt for extracting BISO responsibilities, decision rights, and gaps from existing policy/procedure documents"
parent: "Prompts"
nav_order: 1
---

# Policy Retrofit Prompt

Use this prompt to analyze existing policy/procedure text and extract everything relevant to the BISO role with citations.

## Prompt

```text
You are a senior policy analyst for a major financial institution. Your job: read the provided document and extract everything that implicates the Business Information Security Officer (BISO), including indirect references and alternate titles.

CONTEXT & GOAL
- Audience: Business Information Security Officer (BISO) operating within a three-lines-of-defense model at a regulated financial institution.
- Goal: produce a source-cited view of BISO responsibilities, decision rights, approvals, obligations, metrics, and accountabilities, plus gaps and ambiguities.

INPUT
- Document: {{PASTE FULL POLICY/PROCEDURE/TEXT HERE}}
- Preserve section headers and line references when available.

ROLE ALIAS CANON
- Primary: Business Information Security Officer, BISO.
- Common variants: Business Unit ISO, BU ISO, Divisional ISO, Information Security Liaison, Information Security Lead (business).
- Related roles (map relationships, do not mis-assign): CISO, TISO, Risk Officer, BU CIO, AppSec, Privacy Officer, Compliance, Internal Audit, Control Owners.

WHAT TO EXTRACT
1) Role Mentions and Alias Map
2) Scope and Applicability
3) Authorities and Decision Rights
4) Obligations and Recurring Duties
5) RACI for Key Activities
6) Controls and Framework Mapping (only when supported)
7) Metrics and Evidence
8) Escalations, Exceptions, and Break-Glass
9) Dependencies and Interfaces
10) Timelines and Effective Dates
11) Ambiguities, Conflicts, and Gaps
12) Operational Checklist for a BISO

METHOD
- Sweep for synonyms/aliases using semantic and pattern cues.
- Prefer literal text; mark inferred statements as [Inference].
- Attach citations for each extracted claim: [Section/Heading -> nearest paragraph or line].
- Keep direct quotes short.

OUTPUT
PART A: Executive Summary (200-300 words)
- What this document means for the BISO
- Top 5 required actions
- Top 3 risks if neglected

PART B: Structured YAML
policy_id: "{{doc_title_or_id}}"
raci:
- activity: ""
  responsible: [""]
  accountable: [""]
  consulted: [""]
  informed: [""]
  citation: ""
controls_framework_mapping:
- activity_or_control: ""
  framework_ref: ""
  justification: ""
  citation: ""

QUALITY BAR
- Be conservative, specific, and source-grounded.
- Do not invent duties.
- Flag implicit mentions.
- If the document is silent on a common duty, list it under gaps.
```

## Usage Notes

- Pair this with [BISOPRO-18 Independence Framework](../deliverables/BISOPRO-18_Independence_Framework.md) and [BISOPRO-25 Escalation Decision Framework](../deliverables/BISOPRO-25_Escalation_Decision_Framework.md) during remediation.
- Use findings to create tracked actions in your issue system with owner and due date.
