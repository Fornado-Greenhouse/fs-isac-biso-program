---
title: "Monthly NTS Pulse"
description: "Recurring monthly workflow for collecting and acting on NTS responses using the canonical trust scorecard"
parent: "Templates"
nav_order: 3
---

# Monthly NTS Pulse

- **Purpose:** Monthly operational execution of the NTS trust standard
- **Time to Complete:** 2 minutes per stakeholder, ~45 minutes/month to run
- **Frequency:** Monthly
- **Primary Use:** Early warning and focused trust-improvement actions

{: .important }
> Use the exact scoring and thresholds from [Trust Scorecard (NTS Standard)](./BISO_TEMPLATE-02_Trust_Scorecard_NTS.md). Do not use a separate 1-5 satisfaction scale.

---

## Monthly Survey Instrument

### Primary Question (Required, 0-10)

> How likely are you to recommend early BISO involvement for a major business initiative in your area?

Scoring bands:
- `0-6` = Detractor
- `7-8` = Passive
- `9-10` = Promoter

### Six Diagnostic Follow-Ups (Required, Non-Scored, 1-5)

- D1 Strategic Relevance: BISO input improves business decision quality in meaningful ways.
- D2 Clarity: Security guidance is clear, actionable, and appropriately prioritized.
- D3 Responsiveness: BISO engagement operates at the speed required by business timelines.
- D4 Partnership Behavior: BISO teams collaborate to find viable options rather than blocking progress.
- D5 Confidence: I trust BISO judgment on high-impact risk trade-offs.
- D6 Integration: BISO involvement is easiest when brought in early, not late.

{: .note }
> Diagnostics guide action plans only. They do not change NTS math.

---

## Monthly Operating Rhythm

1. **Send (Day 1):** Send to Tier 1 and Tier 2 stakeholders.
2. **Remind (Day 3):** Reminder to non-responders.
3. **Close (Day 5):** Lock responses and calculate NTS.
4. **Act (Day 6):** Trigger G/Y/R action path.
5. **Report (Day 7):** Update monthly trust brief and owners.

---

## Rollup Worksheet (Monthly)

| Item | Value | Calculation |
|---|---|---|
| Total Responses | ___ | Count of valid primary-question responses |
| Promoters (9-10) | ___ | Count |
| Passives (7-8) | ___ | Count |
| Detractors (0-6) | ___ | Count |
| % Promoters | ___% | `(Promoters / Total Responses) x 100` |
| % Detractors | ___% | `(Detractors / Total Responses) x 100` |
| **Net Trust Score (NTS)** | **___** | **`% Promoters - % Detractors`** |
| Status (G/Y/R) | ___ | `G` if NTS >= +30; `Y` if 0 to +29; `R` if < 0 |

{: .note }
> Validation: `Promoters + Passives + Detractors = Total Responses`.

---

## Action Rules By Status

- `G` (`+30` to `+100`): Maintain cadence and codify what stakeholders value.
- `Y` (`0` to `+29`): Select lowest 1-2 diagnostics and assign a 30-day improvement plan.
- `R` (below `0`): Schedule reset conversation within 48 hours and open executive-supported recovery actions.

---

## Monthly Trust Brief (One-Page)

Use this output in your monthly leadership update:

| Field | Entry |
|---|---|
| Reporting Month | ______ |
| Total Respondents | ______ |
| NTS | ______ |
| Status (G/Y/R) | ______ |
| Lowest Diagnostics | D__ / D__ |
| Actions This Month | ______ |
| Owner(s) | ______ |
| Due Date(s) | ______ |

---

**Related Resources:**
- [Trust Scorecard (NTS Standard)](./BISO_TEMPLATE-02_Trust_Scorecard_NTS.md)
- [BISOPRO-05 Success Metrics](../deliverables/BISOPRO-05_Success_Metrics.md#monthly-nts-survey)
- [Core Success Measurement](../core/06_Success_Measurement.md)
