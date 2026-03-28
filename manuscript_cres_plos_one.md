# CRES: A browser-based interactive evidence synthesis platform for cardiorenal pharmacotherapy with integrated meta-analysis, GRADE assessment, and health-economic modelling

**Authors:** Mahmood Ahmad^1^

^1^ Royal Free Hospital, London, United Kingdom

**Corresponding author:** mahmood.ahmad2@nhs.net

**ORCID:** 0009-0003-7781-4478

**Target journal:** PLOS ONE

---

## Abstract

**Background.** Clinicians face fragmented cardiorenal pharmacotherapy data across heterogeneous trial populations with inconsistent composite endpoints. Interactive tools integrating meta-analysis with health-economic modelling could help, but most require server infrastructure.

**Methods.** We developed CRES (CardioRenal Evidence Synthesizer), a browser-based platform implemented as a single HTML file. CRES v5.0 curates 20 RCTs (N = 123,977) spanning finerenone, SGLT2 inhibitors, and steroidal MRAs. It implements DerSimonian-Laird random-effects meta-analysis with t-distribution CIs, a 3-state Markov cost-effectiveness model, probabilistic sensitivity analysis, GRADE assessments, and Cochrane RoB 2.0 evaluations, all cross-validated against R metafor v4.8.

**Results.** Composite endpoint pooled HRs: SGLT2i 0.79 (95% CI 0.71-0.87, 5 trials), finerenone 0.87 (0.73-1.02, 2 trials, NS), steroidal MRA 0.75 (0.63-0.90, 2 trials); I^2 = 50.3%. Renal composite: SGLT2i 0.69 (0.60-0.79), finerenone 0.84 (0.72-0.98). All-cause mortality: SGLT2i 0.84 (0.75-0.95), steroidal MRA 0.78 (0.64-0.95). GRADE certainty: LOW (composite), MODERATE (renal), LOW (mortality). The upper-bound finerenone ICER was ~$891,000/QALY (P(cost-effective) = 0%), reflecting renal benefit only (excluding HHF cost avoidance).

**Conclusions.** CRES demonstrates that transparent, reproducible evidence synthesis can be delivered as a single portable file with embedded data, GRADE assessments, RoB evaluations, and health-economic modelling, honestly surfacing both favourable and unfavourable findings.

**Keywords:** systematic review; meta-analysis; cardiorenal; finerenone; SGLT2 inhibitors; cost-effectiveness; GRADE; risk of bias; open-access tool

---

## 1. Introduction

The cardiorenal pharmacotherapy landscape has expanded rapidly since the landmark RALES trial (1999), with SGLT2 inhibitors, non-steroidal mineralocorticoid receptor antagonists (MRAs), and steroidal MRAs demonstrating varying degrees of efficacy across chronic kidney disease (CKD), heart failure (HF), and type 2 diabetes (T2DM) populations [1-4]. The ESC 2023 Focused Update gives MRA therapy a Class I recommendation for HFrEF and finerenone a Class I recommendation for reducing heart failure hospitalisation risk in patients with T2DM and CKD [5]. The KDIGO 2024 CKD guideline recommends a layered approach: first-line RASi plus SGLT2i, with finerenone considered when albuminuria persists [6].

Despite this expanding evidence base, clinicians and health-technology assessment bodies face fragmented data across heterogeneous trial populations, inconsistent composite endpoint definitions, and rapidly evolving trial results. Living systematic reviews -- continuously updated syntheses with pre-specified search and analysis protocols -- have been proposed to address evidence currency [7], but implementation remains challenging: most require server infrastructure, proprietary software, and dedicated analyst teams.

Several meta-analyses exist for individual drug classes, including the FIDELITY pooled analysis for finerenone [8] and the cross-class pooled analysis by Vaduganathan et al. for SGLT2i across the HF spectrum [9]. However, no existing tool integrates all three drug classes in a single interactive platform with health-economic modelling, GRADE certainty assessment, and complete source-code transparency.

We developed CRES (CardioRenal Evidence Synthesizer), a browser-based living interactive evidence synthesis platform that runs entirely within a single HTML file. CRES integrates stratified meta-analysis, cumulative meta-analysis, principal component analysis for trial similarity, GRADE certainty-of-evidence assessments, Cochrane Risk of Bias 2.0 evaluations, and probabilistic cost-effectiveness analysis -- all with no installation, no server dependency, and full source-code transparency.

---

## 2. Methods

This study was conducted and reported in accordance with the PRISMA 2020 statement [10] (S1 Checklist). As a secondary analysis of published aggregate trial-level data, no ethics approval or informed consent was required.

### 2.1 Eligibility Criteria

Eligible studies were Phase III or IV randomised controlled trials of finerenone, SGLT2 inhibitors (dapagliflozin, empagliflozin, canagliflozin, ertugliflozin, sotagliflozin), or steroidal MRAs (spironolactone, eplerenone) that (a) compared active treatment to placebo or standard of care, (b) enrolled >= 1,000 randomised participants, and (c) reported hazard ratios or rate ratios for at least one of three pre-specified outcomes: composite cardiovascular endpoint (predominantly CV death + heart failure hospitalisation, though component definitions varied; see Section 4.5), renal composite endpoint, or all-cause mortality. Sotagliflozin was classified with SGLT2i based on its predominant SGLT2 pharmacology (20-fold selectivity for SGLT2 over SGLT1) and consistent cardiorenal outcomes, consistent with classification in major meta-analyses [9].

### 2.2 Information Sources and Search Strategy

Trials were identified from three sources: (1) ClinicalTrials.gov API v2 (query: Finerenone OR Mineralocorticoid OR Kidney Disease OR SGLT2 OR Heart Failure; filter: COMPLETED with results), (2) PubMed/MEDLINE systematic search, and (3) ESC and KDIGO guideline reference lists. The search was conducted from database inception through January 2025 (living review -- planned updates post-publication). No language restrictions were applied.

### 2.3 Data Extraction and Verification

Trial-level data (hazard ratios, 95% confidence intervals, sample sizes, population characteristics, endpoint definitions, estimand types) were extracted from the primary publication of each trial and verified against ClinicalTrials.gov registry records. NCT identifiers are provided for all trials. Standard errors were derived from published 95% CIs as SE = (ln(upper) - ln(lower)) / 3.92, consistent with the normal-approximation CI construction used in the original publications; t-distribution quantiles are applied at the pooling stage (Section 2.6). Data extraction was performed by a single author (MUH) and verified against ClinicalTrials.gov registry records; this is a departure from PRISMA 2020 best practice of independent dual extraction and is acknowledged as a limitation (Section 4.5).

### 2.4 Risk of Bias Assessment

Risk of bias was assessed for all 20 trials using the Cochrane Risk of Bias 2.0 tool [11] across five domains: randomisation process (D1), deviations from intended interventions (D2), missing outcome data (D3), measurement of outcome (D4), and selection of reported result (D5). Overall risk-of-bias judgements follow the RoB 2.0 algorithm (low/some concerns/high).

### 2.5 GRADE Certainty-of-Evidence Assessment

Certainty of evidence was assessed for each outcome using the GRADE framework [12], starting from HIGH (randomised trials) and considering five downgrading domains: risk of bias, inconsistency, indirectness, imprecision, and publication bias. Assessments were performed per outcome across all drug classes.

### 2.6 Stratified Meta-Analysis

Drug-class effects were estimated using DerSimonian-Laird random-effects meta-analysis via weighted least squares (WLS) with a one-hot drug-class design matrix [13]. This approach is equivalent to stratified meta-analysis against a common comparator (placebo/standard of care) and does not involve indirect comparisons between active treatments.

Confidence intervals use the t-distribution with degrees of freedom df = k - K (where k = total trials pooled across all classes for that outcome and K = number of drug classes) for finite-sample correction. This approach accounts for the limited number of studies per class and provides more conservative inference than z-based intervals [14]. Prediction intervals follow IntHout et al. (2016), with per-class degrees of freedom (df = k_j - 2) [15].

Heterogeneity is quantified as residual within-class I^2 and Cochran's Q with associated P-value. The shared tau^2 model assumes homogeneous between-study variance across drug classes -- a simplification that we evaluate via REML + Hartung-Knapp-Sidik-Jonkman (HKSJ) sensitivity analysis [16].

Trials reporting rate ratios from recurrent-event models (FINEARTS-HF, SCORED, SOLOIST-WHF) were retained in the registry but excluded from inverse-variance weighted pooling due to incompatible estimands. Trials with 3-point MACE as the sole composite (EMPA-REG OUTCOME, CANVAS Program, VERTIS-CV) had their composite excluded from pooling to avoid endpoint heterogeneity; mortality data were included where available.

### 2.7 Cumulative Meta-Analysis

For the "living" evidence visualisation, trials within each drug class are ordered chronologically by publication year. At each accumulation step k, the IV-weighted pooled hazard ratio is computed using DerSimonian-Laird random-effects. Confidence intervals use the t-distribution with df = k - 1; at k = 1, the normal quantile is used as the t-distribution with 0 degrees of freedom is degenerate.

### 2.8 Principal Component Analysis

Trial similarity is assessed via SVD-based eigendecomposition on Z-score standardised features: mean age, proportion male, mean eGFR, and publication year [17]. Trial-to-profile distance is computed as L2 (Euclidean) distance in the full 4-dimensional PC space, enabling identification of trials most relevant to a given patient profile.

### 2.9 Health-Economic Model

A 3-state competing-risks Markov model (Stable CKD -> ESRD -> Dead) with quarterly cycles, 10-year horizon, and half-cycle correction (Sonnenberg-Beck) was implemented [18]. Parameters: base CKD-to-ESRD progression rate 3%/year; base mortality 6%/year (Go et al. 2004, CKD Stage 3 average [19]); ESRD mortality multiplier 3x; drug costs: finerenone $8,500/year (US Kerendia WAC), SGLT2i $6,000/year, steroidal MRA $150/year; ESRD cost $90,000/year (USRDS 2024 [20]); utilities: stable CKD 0.85 (Sullivan 2011 [21], UK EQ-5D catalogue applied in US cost context), ESRD 0.58 (Gorodetskaya 2005 [22]); discount rate 3.0% (Second Panel on Cost-Effectiveness in Health and Medicine, consistent with US convention).

Treatment hazard ratios for renal progression and mortality are applied only in the Stable CKD state; in the ESRD state, drug benefit is assumed to cease (no treatment HR applied), reflecting the assumption that drug effects do not persist after progression to end-stage disease. For drug classes without pooled mortality data (finerenone), the mortality HR is set to 1.0 (no effect); the FIDELITY pooled analysis reported all-cause mortality HR 0.89 (0.79-1.00) [8], suggesting the finerenone ICER may be an overestimate. Additionally, the 3-state model captures only renal progression benefit and does not model heart failure hospitalisation cost avoidance; since HHF reduction was finerenone's primary CV benefit (FIDELITY HHF HR 0.78), the reported ICER should be interpreted as an upper bound.

### 2.10 Probabilistic Sensitivity Analysis

PSA was conducted with 1,000 Monte Carlo iterations using a seeded pseudo-random number generator (xoshiro128**, seed = 42) for full reproducibility. Parameter distributions: Beta (transition rates, utilities), Gamma (costs), Lognormal (hazard ratios, using predictive variance = SE^2 + tau^2 to capture both sampling uncertainty and between-study heterogeneity, consistent with decision-analytic convention for representing the full range of plausible treatment effects [44]). Cost-effectiveness acceptability curves (CEACs) were derived via the net monetary benefit criterion (pairwise versus status quo).

### 2.11 Publication Bias Assessment

Egger's regression test for funnel plot asymmetry [43] was performed for each outcome via weighted meta-regression of effect sizes on standard errors (R metafor `regtest()` with default settings), with t-distribution P-value [23]. This test has limited statistical power with fewer than 10 studies per outcome. The CRES app implements a simplified OLS variant of Egger's test for display; the P-values reported in this manuscript are from the R metafor implementation. Additional limitation: the test uses raw study-level HRs, not class-residualised effects; systematic differences between drug classes may confound the assessment.

### 2.12 Cross-Validation

All meta-analytic results (pooled HRs, CIs, tau^2, I^2, Q) were cross-validated against R metafor v4.8 [23] using both DerSimonian-Laird and REML estimators. An automated Selenium test suite (227 end-to-end assertions across 24 test sections) validates all computational outputs, UI elements, accessibility compliance, and security properties.

### 2.13 Technical Implementation

CRES is implemented as a single HTML file (~3,200 lines) containing all HTML, CSS, and JavaScript. External dependencies (Plotly.js v2.27, vis-network v9.1, Tailwind CSS v3.4, math.js v12.3) are loaded via CDN; four of five dependencies use Subresource Integrity (SRI) hashes (Tailwind CSS Play CDN does not support SRI and should be replaced with pre-built CSS for production deployment). The application includes a Content Security Policy (CSP) meta tag that restricts resource origins; however, `unsafe-inline` and `unsafe-eval` directives are required for single-file operation, so the CSP does not prevent inline script injection, and XSS prevention relies primarily on systematic input escaping via `escapeHtml()`. Touch targets comply with WCAG 2.5.8 (>=44px); focus indicators, skip links, ARIA roles, screen-reader results, and `prefers-reduced-motion` support are implemented, though formal WCAG 2.1 AA conformance has not been independently audited. A negligible ridge penalty (lambda = 1e-4) is added to the WLS normal equations for numerical stability. The source code serves simultaneously as the data repository -- all trial-level data are embedded in a structured JavaScript object (CONFIG_LIBRARY) viewable via browser "View Source." A configurable multi-domain architecture supports additional therapeutic areas (oncology NSCLC immunotherapy included as proof of extensibility).

---

## 3. Results

### 3.1 Study Selection and Trial Registry

The CRES v5.0 registry contains 20 trials enrolling 123,977 participants across three drug classes: finerenone (3 trials, N = 19,087), SGLT2 inhibitors (13 trials, N = 90,413), and steroidal MRAs (4 trials, N = 14,477) (Table 1; Fig 1). Publication years range from 1999 (RALES) to 2024 (FINEARTS-HF).

Of the 20 trials, 9 contributed HR data for the composite endpoint (2 finerenone, 5 SGLT2i, 2 steroidal MRA), 5 for the renal composite (2 finerenone, 3 SGLT2i), and 9 for all-cause mortality (7 SGLT2i, 2 steroidal MRA). Three trials (FINEARTS-HF, SCORED, SOLOIST-WHF) report rate ratios from recurrent-event models and were excluded from IV-weighted pooling. Three CVOT trials (EMPA-REG OUTCOME, CANVAS Program, VERTIS-CV) had 3-point MACE composites excluded; mortality data were included.

### 3.2 Risk of Bias

Risk of bias was low for 16 of 20 trials (Table 2). Two trials (SCORED, SOLOIST-WHF) received "some concerns" due to early termination (COVID-19 and funding loss) with missing outcome data (D3). TOPCAT was rated high risk on D2 (deviations from intended interventions) due to well-documented regional recruitment heterogeneity: low spironolactone metabolite levels at Russia/Georgia sites suggest protocol deviations including possible enrollment of non-HF patients or widespread non-adherence [24,28]. FINEARTS-HF was rated low risk across all domains.

### 3.3 Stratified Meta-Analysis

R-validated results for all three outcomes are presented below (Table 3). All confidence intervals use the t-distribution with df = k - K.

**Composite cardiovascular endpoint (9 trials, 3 classes):** Pooled HR was 0.79 (95% CI 0.71-0.87) for SGLT2i (5 trials), 0.87 (0.73-1.02) for finerenone (2 trials, not statistically significant), and 0.75 (0.63-0.90) for steroidal MRA (2 trials: TOPCAT and EMPHASIS-HF). Within-class heterogeneity was moderate: I^2 = 50.3%, Cochran's Q P = 0.061. DL tau^2 = 0.0047. An important caveat: composite endpoint definitions differ across drug classes. The SGLT2i and steroidal MRA trials use a 2-component composite (CV death + HHF), with the exception of TOPCAT which also included aborted cardiac arrest (extremely rare events). The finerenone trials (FIDELIO-DKD, FIGARO-DKD) use a 4-component composite (CV death + non-fatal MI + non-fatal stroke + HHF). This broader finerenone composite may attenuate the apparent treatment effect relative to a 2-component endpoint and contributes to the GRADE inconsistency downgrade. Excluding TOPCAT (high risk of bias, Limitation 6) would leave only EMPHASIS-HF for steroidal MRA (k=1), precluding a pooled estimate for that class.

REML + HKSJ sensitivity analysis yielded consistent point estimates with slightly wider CIs: SGLT2i 0.79 (0.70-0.88), finerenone 0.87 (0.73-1.03), steroidal MRA 0.75 (0.62-0.91). REML tau^2 = 0.0046.

**Renal composite endpoint (5 trials, 2 classes):** Pooled HR was 0.69 (0.60-0.79) for SGLT2i (3 trials: DAPA-CKD, EMPA-KIDNEY, CREDENCE) and 0.84 (0.72-0.98) for finerenone (2 trials: FIDELIO-DKD, FIGARO-DKD). No residual heterogeneity was detected (I^2 = 0%, tau^2 = 0). Notably, SGLT2i trials define the renal composite to include CV death (kidney + CV death), while finerenone trials use kidney-only endpoints -- this definitional asymmetry may inflate the apparent SGLT2i advantage.

**All-cause mortality (9 trials, 2 classes):** Pooled HR was 0.84 (0.75-0.95) for SGLT2i (7 trials) and 0.78 (0.64-0.95) for steroidal MRA (2 trials: RALES, EPHESUS). Within-class heterogeneity was substantial: I^2 = 57.4%, Cochran's Q P = 0.021, tau^2 = 0.0088.

### 3.4 GRADE Certainty of Evidence

GRADE assessments are summarised in Table 4.

**Composite endpoint: LOW certainty.** Starting from HIGH (RCTs), downgraded two levels: serious inconsistency (primarily clinical rather than statistical -- composite definitions vary across drug classes: 2-component CV death + HHF for SGLT2i/steroidal MRA vs. 4-component including MI and stroke for finerenone; the I^2 of 50.3% reflects this definitional heterogeneity as well as population differences) and serious indirectness (pooling across DKD, HFrEF, HFpEF, and T2DM+CVD populations with different baseline risks).

**Renal composite: MODERATE certainty.** Downgraded one level: serious indirectness (SGLT2i trials include CV death in the renal composite while finerenone trials use kidney-only endpoints, creating non-comparable composites; additionally, renal progression thresholds differ across SGLT2i trials -- doubling of creatinine in CREDENCE vs. 40% eGFR decline in DAPA-CKD/EMPA-KIDNEY).

**All-cause mortality: LOW certainty.** Downgraded two levels: serious indirectness (diverse populations including DKD, HFrEF, post-MI, T2DM+CVD; mortality often a secondary endpoint) and serious imprecision (CIs cross 1.0 for several individual trials; insufficient events for precise per-class mortality estimates). We did not additionally downgrade for inconsistency despite I^2 = 57.4% and significant Cochran's Q (P = 0.021). The direction of effect is consistent across all 9 trials and both classes (all point estimates favour treatment), and the SGLT2i HR range (0.68-0.93) likely reflects population heterogeneity (T2DM-CVOTs vs. dedicated HF trials) rather than true treatment-effect inconsistency. However, this is a judgement call; applying a third downgrade for inconsistency would reduce certainty to VERY LOW, which we consider overly conservative given the uniformly favourable direction. Alternative assessors may reasonably disagree with this decision.

### 3.5 Publication Bias

Egger's regression test was non-significant for all outcomes: composite P = 0.178, renal P = 0.145, mortality P = 0.062. Egger's test has limited statistical power with fewer than 10 studies per outcome, so these results should not be interpreted as evidence of absence of publication bias. The mortality result approaches significance but is limited by potential confounding from drug-class structure (systematic differences in effect size between classes may mimic funnel plot asymmetry).

### 3.6 Cumulative Meta-Analysis

The cumulative meta-analysis for SGLT2i composite endpoints shows progressive narrowing of the confidence interval from 2019 (DECLARE-TIMI 58 alone, 1 trial) through 2022 (DELIVER, 5 trials). The pooled SGLT2i HR stabilised around 0.79 by the fourth trial accumulation (Fig 3), suggesting evidence maturity for this drug class and outcome.

### 3.7 Patient Geometry

PCA on the four features (age, proportion male, eGFR, publication year) explains 50.6% (PC1) and 21.9% (PC2) of total variance (Fig 4). The DKD target profile (age 66, eGFR 44) clusters nearest to FIDELIO-DKD and CREDENCE. The HFpEF profile (age 72, eGFR 55) clusters nearest to EMPEROR-Preserved and DELIVER.

### 3.8 Health-Economic Analysis

**Deterministic analysis:** The ICER for finerenone versus status quo was $890,844/QALY, substantially exceeding standard willingness-to-pay (WTP) thresholds. The SGLT2i universal strategy yielded an ICER of $130,667/QALY, within the $50K-$150K/QALY range. The steroidal MRA strategy was dominant (lower cost, better outcomes) relative to status quo.

**PSA (1,000 iterations):** Mean ICER for finerenone was $1,005,607/QALY. P(cost-effective) was 0.0% at all standard WTP thresholds ($50K, $100K, $150K/QALY). The CEAC was flat at 0% across the entire WTP range (Fig 5), driven by the high drug cost ($8,500/year) relative to the modest renal HR benefit (0.84) and absence of pooled mortality benefit for finerenone.

---

## 4. Discussion

### 4.1 Principal Findings

CRES demonstrates that a fully functional, transparent, and reproducible evidence synthesis platform can be delivered as a single portable HTML file with embedded GRADE assessments and risk-of-bias evaluations. The R-validated meta-analysis surfaces several clinically relevant findings: (1) SGLT2 inhibitors show the most robust composite endpoint benefit (HR 0.79, 95% CI 0.71-0.87, 5 trials), (2) steroidal MRAs show a pooled composite HR of 0.75 (0.63-0.90) from TOPCAT and EMPHASIS-HF, though this result should be interpreted with particular caution: TOPCAT has a high risk-of-bias rating, and the two trials enrolled fundamentally different populations (EMPHASIS-HF: HFrEF NYHA II with HR 0.63 vs. TOPCAT: HFpEF with non-significant HR 0.89), making the pooled estimate sensitive to trial inclusion decisions, (3) finerenone's composite benefit does not reach statistical significance with only 2 trials (HR 0.87, 0.73-1.02), and (4) finerenone is not cost-effective at current US pricing -- a finding the platform surfaces without bias.

### 4.2 Comparison with Existing Approaches

Traditional meta-analysis software (RevMan, Stata, R metafor) requires installation, programming expertise, and manual data management. Web-based tools (MetaInsight [25], CINeMA [26]) offer more accessibility but still require server infrastructure. CRES occupies a distinct niche: a self-contained, versionable, auditable evidence synthesis that can be emailed, hosted on any web server, or opened directly from disk.

The cumulative meta-analysis feature aligns with the living systematic review paradigm [7] but with important caveats: CRES does not implement pre-specified update triggers, stopping rules, or formal evidence stabilisation assessment (e.g., trial sequential analysis). It should be understood as a visualisation and analysis tool that facilitates living evidence monitoring, not a substitute for a fully registered living review protocol.

### 4.3 Methodological Considerations

The stratified meta-analysis approach pools within drug classes against a common comparator. This avoids the assumptions of network meta-analysis (transitivity, consistency) but cannot estimate relative effects between active treatments. The one-hot design matrix with shared tau^2 assumes homogeneous between-study variance across classes. REML + HKSJ sensitivity analysis provided consistent results, supporting the robustness of the primary DL estimates.

The use of t-distribution CIs (df = k - K) instead of the standard normal approximation reflects the finite number of studies informing each drug class. This conservative approach is supported by IntHout et al. [14], who demonstrated that z-based CIs can be anti-conservative when k is small. For the composite outcome (df = 6), the t-quantile (2.45) is 25% larger than z (1.96), materially widening the confidence intervals.

Rate ratio trials (FINEARTS-HF, SCORED, SOLOIST-WHF) are displayed but excluded from IV-weighted pooling. This is conservative: including rate ratios alongside hazard ratios would violate estimand homogeneity.

### 4.4 Implications for Practice

The P(cost-effective) = 0% finding for finerenone should be interpreted with several caveats: (a) it reflects current US Kerendia pricing ($8,500/year) and does not account for potential price reductions, value-based contracts, or non-US health systems; (b) the 3-state Markov model captures only renal progression benefit and omits heart failure hospitalisation cost avoidance (finerenone's primary CV benefit); and (c) the mortality HR is set to 1.0 due to absence of per-trial pooled mortality data, whereas the FIDELITY analysis suggests a borderline benefit (HR 0.89). Together, these limitations mean the finerenone ICER should be interpreted as an upper bound. The SGLT2i universal strategy yielded an ICER of $130,667/QALY, which exceeds the $50K and $100K/QALY thresholds commonly applied in the US but falls within the $150K/QALY threshold sometimes used for severe conditions. The steroidal MRA strategy was dominant, consistent with generic pricing ($150/year). Current KDIGO 2024 guidelines recommend combination MRA + SGLT2i therapy, not either/or -- the per-class ICERs should not be interpreted as endorsing monotherapy.

### 4.5 Limitations

Key limitations include: (1) composite endpoint definitions vary materially across drug classes -- finerenone trials use a 4-component composite (CV death + MI + stroke + HHF) while SGLT2i and steroidal MRA trials use 2-component (CV death + HHF), and TOPCAT includes aborted cardiac arrest; (2) renal endpoint definitions differ between drug classes (kidney-only for finerenone, kidney + CV death for SGLT2i), and renal progression thresholds differ within SGLT2i trials (doubling creatinine in CREDENCE vs. 40% eGFR decline in DAPA-CKD/EMPA-KIDNEY); (3) populations are clinically heterogeneous (DKD, HFrEF, HFpEF, T2DM+CVD, post-MI), captured by the GRADE indirectness downgrade; (4) the health-economic model uses US-centric cost parameters (UK utility values applied in US cost context); (5) base mortality (6%/year, CKD Stage 3) underestimates HF subgroup mortality (10-20%/year); a sensitivity analysis with population-specific rates would strengthen the CEA; (6) TOPCAT uses the overall ITT result (HR 0.89) rather than the Americas subgroup (HR 0.82, 0.69-0.98); substituting the Americas HR would shift the pooled steroidal MRA composite estimate toward 0.72, narrowing the gap with EMPHASIS-HF and strengthening the significance of the pooled result; (7) sotagliflozin is a dual SGLT1/2 inhibitor grouped with SGLT2i for class-level analysis, consistent with its predominant SGLT2 pharmacology; (8) the shared tau^2 model does not allow class-specific heterogeneity; per-class subgroup analyses would require larger per-class k to be informative; (9) Egger's test has limited power with <10 studies and may be confounded by drug-class structure; (10) finerenone is absent from the mortality analysis -- the FIDELITY pooled estimate (HR 0.89, 0.79-1.00) suggests a borderline mortality benefit that could improve the finerenone ICER; (11) data extraction, RoB 2.0, and GRADE assessments were performed by a single author, which departs from PRISMA 2020 best practice of independent dual assessment; (12) the Markov model assumes drug benefit ceases upon progression to ESRD (no treatment HR applied in the ESRD state), which may underestimate drug benefit for agents with cardiovascular effects beyond renal progression; (13) this review was not prospectively registered on PROSPERO; the analysis protocol was developed prior to data extraction, and registration was submitted concurrently with manuscript preparation.

### 4.6 Reproducibility and Transparency

All trial-level data, analysis code, GRADE assessments, RoB 2.0 evaluations, and visualisations are embedded in the CRES HTML file. The platform can be independently verified by opening the file in any modern web browser and inspecting the source code. The TruthCert evidence fingerprint provides SHA-256 cryptographic verification that the embedded trial data (CONFIG.trials) have not been modified; code integrity requires external file-hash verification (e.g., SHA-256 of the complete HTML file). All meta-analytic results were cross-validated against R metafor v4.8, with the validation script provided as supplementary material.

---

## 5. Conclusion

CRES provides a paradigm for transparent, reproducible, zero-installation evidence synthesis in cardiorenal pharmacotherapy. By embedding data, analysis code, GRADE certainty assessments, risk-of-bias evaluations, and health-economic modelling in a single auditable file, it enables rapid evidence assessment without server infrastructure or programming expertise. The platform's honest surfacing of cost-effectiveness findings -- including unfavourable results for finerenone -- demonstrates the value of neutral, open-access evidence synthesis tools in the era of living evidence.

---

## Data Availability Statement

All data underlying this study are publicly available. Trial-level aggregate data (hazard ratios, confidence intervals, sample sizes, population characteristics) were extracted from published primary trial publications and ClinicalTrials.gov registry records. All extracted data are embedded in the CRES source code (CONFIG_LIBRARY JavaScript object) and can be viewed by opening the HTML file in any web browser and selecting "View Source." The complete CRES v5.0 HTML file, Selenium test suite (227 automated assertions), R metafor cross-validation script, and this manuscript are available at [repository URL]. No individual patient data were used.

---

## Funding Statement

This research received no specific funding from any agency in the public, commercial, or not-for-profit sectors.

---

## Competing Interests

The author declares no competing interests.

---

## Author Contributions

**Conceptualization:** MUH. **Data curation:** MUH. **Formal analysis:** MUH. **Investigation:** MUH. **Methodology:** MUH. **Software:** MUH. **Validation:** MUH. **Visualization:** MUH. **Writing -- original draft:** MUH. **Writing -- review & editing:** MUH.

---

## Ethics Statement

This study is a secondary analysis of published aggregate trial-level data extracted from peer-reviewed publications and public clinical trial registries. No individual patient data were accessed or used. Ethics approval was not required.

---

## Registration

This review is registered on PROSPERO (ID: [to be assigned upon submission]).

---

## References

1. Bakris GL, Agarwal R, Anker SD, et al. Effect of finerenone on chronic kidney disease outcomes in type 2 diabetes. N Engl J Med. 2020;383:2219-2229. doi:10.1056/NEJMoa2025845 (FIDELIO-DKD)
2. Pitt B, Filippatos G, Agarwal R, et al. Cardiovascular events with finerenone in kidney disease and type 2 diabetes. N Engl J Med. 2021;385:2252-2263. doi:10.1056/NEJMoa2110956 (FIGARO-DKD)
3. McMurray JJV, Solomon SD, Inzucchi SE, et al. Dapagliflozin in patients with heart failure and reduced ejection fraction. N Engl J Med. 2019;381:1995-2008. doi:10.1056/NEJMoa1911303 (DAPA-HF)
4. Heerspink HJL, Stefansson BV, Correa-Rotter R, et al. Dapagliflozin in patients with chronic kidney disease. N Engl J Med. 2020;383:1436-1446. doi:10.1056/NEJMoa2024816 (DAPA-CKD)
5. McDonagh TA, Metra M, Adamo M, et al. 2023 Focused Update of the 2021 ESC Guidelines for the diagnosis and treatment of acute and chronic heart failure. Eur Heart J. 2023;44:3627-3639. doi:10.1093/eurheartj/ehad195
6. Kidney Disease: Improving Global Outcomes (KDIGO) CKD Work Group. KDIGO 2024 Clinical Practice Guideline for the Evaluation and Management of Chronic Kidney Disease. Kidney Int. 2024;105(4S):S117-S314.
7. Thomas J, Noel-Storr A, Marshall I, et al. Living systematic reviews: 2. Combining human and machine effort. J Clin Epidemiol. 2017;91:31-37. doi:10.1016/j.jclinepi.2017.08.011
8. Agarwal R, Filippatos G, Pitt B, et al. Cardiovascular and kidney outcomes with finerenone in patients with type 2 diabetes and chronic kidney disease: the FIDELITY pooled analysis. Eur Heart J. 2022;43:474-484. doi:10.1093/eurheartj/ehab777
9. Vaduganathan M, Docherty KF, Claggett BL, et al. SGLT-2 inhibitors in patients with heart failure: a comprehensive meta-analysis of five randomised controlled trials. Lancet. 2022;400:757-767. doi:10.1016/S0140-6736(22)01429-5
10. Page MJ, McKenzie JE, Bossuyt PM, et al. The PRISMA 2020 statement: an updated guideline for reporting systematic reviews. BMJ. 2021;372:n71. doi:10.1136/bmj.n71
11. Sterne JAC, Savovic J, Page MJ, et al. RoB 2: a revised tool for assessing risk of bias in randomised trials. BMJ. 2019;366:l4898. doi:10.1136/bmj.l4898
12. Guyatt GH, Oxman AD, Vist GE, et al. GRADE: an emerging consensus on rating quality of evidence and strength of recommendations. BMJ. 2008;336:924-926. doi:10.1136/bmj.39489.470347.AD
13. DerSimonian R, Laird N. Meta-analysis in clinical trials. Control Clin Trials. 1986;7:177-188. doi:10.1016/0197-2456(86)90046-2
14. IntHout J, Ioannidis JP, Borm GF. The Hartung-Knapp-Sidik-Jonkman method for random effects meta-analysis is straightforward and considerably outperforms the standard DerSimonian-Laird method. BMC Med Res Methodol. 2014;14:25. doi:10.1186/1471-2288-14-25
15. IntHout J, Ioannidis JP, Rovers MM, Goeman JJ. Plea for routinely presenting prediction intervals in meta-analysis. BMJ Open. 2016;6:e010247. doi:10.1136/bmjopen-2015-010247
16. Hartung J, Knapp G. A refined method for the meta-analysis of controlled clinical trials with binary outcome. Stat Med. 2001;20:3875-3889. doi:10.1002/sim.1009
17. Jolliffe IT, Cadima J. Principal component analysis: a review and recent developments. Philos Trans A Math Phys Eng Sci. 2016;374:20150202. doi:10.1098/rsta.2015.0202
18. Sonnenberg FA, Beck JR. Markov models in medical decision making. Med Decis Making. 1993;13:322-338. doi:10.1177/0272989X9301300409
19. Go AS, Chertow GM, Fan D, et al. Chronic kidney disease and the risks of death, cardiovascular events, and hospitalization. N Engl J Med. 2004;351:1296-1305. doi:10.1056/NEJMoa041031
20. United States Renal Data System. 2024 USRDS Annual Data Report: Epidemiology of kidney disease in the United States. National Institutes of Health, National Institute of Diabetes and Digestive and Kidney Diseases; 2024.
21. Sullivan PW, Slejko JF, Sculpher MJ, Ghushchyan V. Catalogue of EQ-5D scores for the United Kingdom. Med Decis Making. 2011;31:800-804. doi:10.1177/0272989X11401031
22. Gorodetskaya I, Zenios S, McCulloch CE, et al. Health-related quality of life and estimates of utility in chronic kidney disease. Kidney Int. 2005;68:2801-2808. doi:10.1111/j.1523-1755.2005.00752.x
23. Viechtbauer W. Conducting meta-analyses in R with the metafor package. J Stat Softw. 2010;36:1-48. doi:10.18637/jss.v036.i03
24. de Denus S, O'Meara E, Bhatt DL, et al. Spironolactone metabolites in TOPCAT: refining the question of regional variation. N Engl J Med. 2017;376:1690-1692. doi:10.1056/NEJMc1612601
25. Owen RK, Bradbury N, Xin Y, et al. MetaInsight: an interactive web-based tool for analyzing, interrogating, and visualizing network meta-analyses using R-shiny and netmeta. Res Synth Methods. 2019;10:569-581. doi:10.1002/jrsm.1373
26. Papakonstantinou T, Nikolakopoulou A, Higgins JPT, et al. CINeMA: software for semiautomated assessment of the confidence in the results of network meta-analysis. Campbell Syst Rev. 2020;16:e1080. doi:10.1002/cl2.1080
27. Zannad F, McMurray JJV, Krum H, et al. Eplerenone in patients with systolic heart failure and mild symptoms. N Engl J Med. 2011;364:11-21. doi:10.1056/NEJMoa1009492 (EMPHASIS-HF)
28. Pfeffer MA, Claggett B, Assmann SF, et al. Regional variation in patients and outcomes in the Treatment of Preserved Cardiac Function Heart Failure With an Aldosterone Antagonist (TOPCAT) trial. Circulation. 2015;131:34-42. doi:10.1161/CIRCULATIONAHA.114.013255
29. Pitt B, Zannad F, Remme WJ, et al. The effect of spironolactone on morbidity and mortality in patients with severe heart failure. N Engl J Med. 1999;341:709-717. doi:10.1056/NEJM199909023411001 (RALES)
30. Pitt B, Remme W, Zannad F, et al. Eplerenone, a selective aldosterone blocker, in patients with left ventricular dysfunction after myocardial infarction. N Engl J Med. 2003;348:1309-1321. doi:10.1056/NEJMoa030207 (EPHESUS)
31. Solomon SD, McMurray JJV, Vaduganathan M, et al. Finerenone in heart failure with mildly reduced or preserved ejection fraction. N Engl J Med. 2024;391:1475-1485. doi:10.1056/NEJMoa2407107 (FINEARTS-HF)
32. Zinman B, Wanner C, Lachin JM, et al. Empagliflozin, cardiovascular outcomes, and mortality in type 2 diabetes. N Engl J Med. 2015;373:2117-2128. doi:10.1056/NEJMoa1515920 (EMPA-REG OUTCOME)
33. Neal B, Perkovic V, Mahaffey KW, et al. Canagliflozin and cardiovascular and renal events in type 2 diabetes. N Engl J Med. 2017;377:644-657. doi:10.1056/NEJMoa1611925 (CANVAS Program)
34. Cannon CP, Pratley R, Dagogo-Jack S, et al. Cardiovascular outcomes with ertugliflozin in type 2 diabetes. N Engl J Med. 2020;383:1425-1435. doi:10.1056/NEJMoa2004967 (VERTIS-CV)
35. Wiviott SD, Raz I, Bonaca MP, et al. Dapagliflozin and cardiovascular outcomes in type 2 diabetes. N Engl J Med. 2019;380:347-357. doi:10.1056/NEJMoa1812389 (DECLARE-TIMI 58)
36. Bhatt DL, Szarek M, Pitt B, et al. Sotagliflozin in patients with diabetes and chronic kidney disease. N Engl J Med. 2021;384:129-139. doi:10.1056/NEJMoa2030186 (SCORED)
37. Bhatt DL, Szarek M, Steg PG, et al. Sotagliflozin in patients with diabetes and recent worsening heart failure. N Engl J Med. 2021;384:117-128. doi:10.1056/NEJMoa2030183 (SOLOIST-WHF)
38. Anker SD, Butler J, Filippatos G, et al. Empagliflozin in heart failure with a preserved ejection fraction. N Engl J Med. 2021;385:1451-1461. doi:10.1056/NEJMoa2107038 (EMPEROR-Preserved)
39. Packer M, Anker SD, Butler J, et al. Cardiovascular and renal outcomes with empagliflozin in heart failure. N Engl J Med. 2020;383:1413-1424. doi:10.1056/NEJMoa2022190 (EMPEROR-Reduced)
40. Solomon SD, McMurray JJV, Claggett B, et al. Dapagliflozin in heart failure with mildly reduced or preserved ejection fraction. N Engl J Med. 2022;387:1089-1098. doi:10.1056/NEJMoa2206286 (DELIVER)
41. Herrington WG, Staplin N, Wanner C, et al. Empagliflozin in patients with chronic kidney disease. N Engl J Med. 2023;388:117-127. doi:10.1056/NEJMoa2204233 (EMPA-KIDNEY)
42. Perkovic V, Jardine MJ, Neal B, et al. Canagliflozin and renal outcomes in type 2 diabetes and nephropathy. N Engl J Med. 2019;380:2295-2306. doi:10.1056/NEJMoa1811744 (CREDENCE)
43. Egger M, Davey Smith G, Schneider M, Minder C. Bias in meta-analysis detected by a simple, graphical test. BMJ. 1997;315:629-634. doi:10.1136/bmj.315.7109.629
44. Higgins JPT, Thompson SG, Spiegelhalter DJ. A re-evaluation of random-effects meta-analysis. J R Stat Soc Ser A Stat Soc. 2009;172:137-159. doi:10.1111/j.1467-985X.2008.00552.x

---

## Tables

### Table 1. Characteristics of 20 included randomised controlled trials (N = 123,977)

| Trial | NCT ID | Drug Class | Population | N | Year | Composite HR (95% CI) | Renal HR (95% CI) | Mortality HR (95% CI) | Estimand | Ref |
|-------|--------|-----------|------------|---|------|----------------------|-------------------|----------------------|----------|-----|
| FIDELIO-DKD | NCT02540993 | Finerenone | DKD | 5,734 | 2020 | 0.86 (0.75-0.99)*^a^ | 0.82 (0.73-0.93)* | -- | HR | [1] |
| FIGARO-DKD | NCT02545049 | Finerenone | DKD | 7,352 | 2021 | 0.87 (0.76-0.98)*^a^ | 0.87 (0.76-1.01)^b^ | -- | HR | [2] |
| FINEARTS-HF | NCT04435626 | Finerenone | HF EF>=40% | 6,001 | 2024 | 0.84 (0.74-0.95)* | -- | -- | RR | [31] |
| TOPCAT | NCT00094302 | Steroidal MRA | HF EF>=45% | 3,445 | 2014 | 0.89 (0.77-1.04)^c^ | -- | -- | HR | [28] |
| EMPHASIS-HF | NCT00232180 | Steroidal MRA | HFrEF | 2,737 | 2011 | 0.63 (0.54-0.74)* | -- | -- | HR | [27] |
| RALES | RALES-1999^d^ | Steroidal MRA | HFrEF | 1,663 | 1999 | -- | -- | 0.70 (0.60-0.82)* | HR | [29] |
| EPHESUS | NCT00090986 | Steroidal MRA | post-MI | 6,632 | 2003 | -- | -- | 0.85 (0.75-0.96)* | HR | [30] |
| DAPA-CKD | NCT03036150 | SGLT2i | CKD | 4,304 | 2020 | -- | 0.61 (0.51-0.72)* | 0.69 (0.53-0.88)* | HR | [4] |
| EMPA-KIDNEY | NCT03594110 | SGLT2i | CKD | 6,609 | 2023 | -- | 0.72 (0.64-0.82)* | -- | HR | [41] |
| CREDENCE | NCT02065791 | SGLT2i | DKD | 4,401 | 2019 | -- | 0.70 (0.59-0.82)* | -- | HR | [42] |
| EMPEROR-Reduced | NCT03057977 | SGLT2i | HFrEF | 3,730 | 2020 | 0.75 (0.65-0.86)* | -- | 0.92 (0.77-1.10) | HR | [39] |
| EMPEROR-Preserved | NCT03057951 | SGLT2i | HFpEF | 5,988 | 2021 | 0.79 (0.69-0.90)* | -- | -- | HR | [38] |
| DELIVER | NCT03619213 | SGLT2i | HFpEF | 6,263 | 2022 | 0.82 (0.73-0.92)* | -- | -- | HR | [40] |
| DAPA-HF | NCT03036124 | SGLT2i | HFrEF | 4,744 | 2019 | 0.74 (0.65-0.85)* | -- | 0.83 (0.71-0.97)* | HR | [3] |
| DECLARE-TIMI 58 | NCT01730534 | SGLT2i | T2DM+CVD/risk | 17,160 | 2019 | 0.83 (0.73-0.95)* | -- | 0.93 (0.82-1.04) | HR | [35] |
| EMPA-REG OUTCOME | NCT01131676 | SGLT2i | T2DM+CVD | 7,020 | 2015 | -- | -- | 0.68 (0.57-0.82)* | HR | [32] |
| CANVAS Program | NCT01032629 | SGLT2i | T2DM+CVD | 10,142 | 2017 | -- | -- | 0.87 (0.74-1.01) | HR | [33] |
| VERTIS-CV | NCT01986881 | SGLT2i | T2DM+CVD | 8,246 | 2020 | -- | -- | 0.93 (0.80-1.08) | HR | [34] |
| SCORED | NCT03315143 | SGLT2i | T2DM+CKD | 10,584 | 2021 | 0.74 (0.63-0.88)* | -- | -- | RR | [36] |
| SOLOIST-WHF | NCT03521934 | SGLT2i | T2DM+WHF | 1,222 | 2021 | 0.67 (0.52-0.85)* | -- | -- | RR | [37] |

*Statistically significant (P < 0.05). ^a^Finerenone composite is 4-component (CV death + non-fatal MI + non-fatal stroke + HHF), broader than the 2-component (CV death + HHF) used by SGLT2i and steroidal MRA trials. ^b^Secondary endpoint. ^c^TOPCAT composite includes aborted cardiac arrest (3 vs. 5 events). ^d^RALES predates ClinicalTrials.gov; no NCT identifier exists. HR = hazard ratio; RR = rate ratio; DKD = diabetic kidney disease; CKD = chronic kidney disease; HFrEF = heart failure with reduced ejection fraction; HFpEF = heart failure with preserved ejection fraction; T2DM = type 2 diabetes mellitus; CVD = cardiovascular disease; WHF = worsening heart failure.

### Table 2. Risk of Bias 2.0 Assessment

| Trial | D1: Randomisation | D2: Deviations | D3: Missing Data | D4: Measurement | D5: Reporting | Overall | Notes |
|-------|:-:|:-:|:-:|:-:|:-:|:-:|-------|
| FIDELIO-DKD | Low | Low | Low | Low | Low | Low | |
| FIGARO-DKD | Low | Low | Low | Low | Low | Low | |
| FINEARTS-HF | Low | Low | Low | Low | Low | Low | |
| TOPCAT | Low | **High** | Low | Low | Low | **High** | Regional recruitment heterogeneity: low spironolactone metabolite levels at Russia/Georgia sites suggest protocol deviations (non-adherence or enrollment of non-HF patients) [24,28] |
| EMPHASIS-HF | Low | Low | Low | Low | Low | Low | |
| RALES | Low | Low | Low | Low | Low | Low | |
| EPHESUS | Low | Low | Low | Low | Low | Low | |
| DAPA-CKD | Low | Low | Low | Low | Low | Low | |
| EMPA-KIDNEY | Low | Low | Low | Low | Low | Low | |
| CREDENCE | Low | Low | Low | Low | Low | Low | |
| EMPEROR-Reduced | Low | Low | Low | Low | Low | Low | |
| EMPEROR-Preserved | Low | Low | Low | Low | Low | Low | |
| DELIVER | Low | Low | Low | Low | Low | Low | |
| DAPA-HF | Low | Low | Low | Low | Low | Low | |
| DECLARE-TIMI 58 | Low | Low | Low | Low | Low | Low | |
| EMPA-REG OUTCOME | Low | Low | Low | Low | Low | Low | |
| CANVAS Program | Low | Low | Low | Low | Low | Low | |
| VERTIS-CV | Low | Low | Low | Low | Low | Low | |
| SCORED | Low | Low | **Some** | Low | Low | **Some** | Early termination (COVID-19 + funding loss) |
| SOLOIST-WHF | Low | Low | **Some** | Low | Low | **Some** | Early termination (COVID-19 + funding loss) |

### Table 3. Pooled Meta-Analysis Results (R metafor cross-validated)

| Outcome | Drug Class | k | Pooled HR | 95% CI (t-dist) | I^2 (%) | tau^2 (DL) | Q P-value |
|---------|-----------|---|-----------|-----------------|---------|-----------|-----------|
| Composite (CV death + HHF) | SGLT2i | 5 | 0.79 | 0.71-0.87 | 50.3 | 0.0047 | 0.061 |
| | Finerenone | 2 | 0.87 | 0.73-1.02 | | | |
| | Steroidal MRA | 2 | 0.75 | 0.63-0.90 | | | |
| Renal composite | SGLT2i | 3 | 0.69 | 0.60-0.79 | 0.0 | 0.0000 | 0.422 |
| | Finerenone | 2 | 0.84 | 0.72-0.98 | | | |
| All-cause mortality | SGLT2i | 7 | 0.84 | 0.75-0.95 | 57.4 | 0.0088 | 0.021 |
| | Steroidal MRA | 2 | 0.78 | 0.64-0.95 | | | |

CI = confidence interval; t-dist = t-distribution with df = k_total - K_classes; DL = DerSimonian-Laird; HHF = heart failure hospitalisation. Heterogeneity statistics (I^2, tau^2, Q) are reported at the outcome level (shared across classes within each meta-regression model).

### Table 4. GRADE Certainty-of-Evidence Summary

| Outcome | Starting Level | Risk of Bias | Inconsistency | Indirectness | Imprecision | Publication Bias | Overall Certainty |
|---------|---------------|-------------|--------------|-------------|------------|-----------------|------------------|
| Composite (CV death + HHF) | HIGH | Not serious | Serious (-1) | Serious (-1) | Not serious | Undetected | **LOW** |
| Renal composite | HIGH | Not serious | Not serious | Serious (-1) | Not serious | Undetected | **MODERATE** |
| All-cause mortality | HIGH | Not serious | Not serious | Serious (-1) | Serious (-1) | Undetected | **LOW** |

**Composite:** Downgraded for inconsistency (primarily clinical: 2-component vs. 4-component composite definitions across drug classes; I^2 = 50.3% reflects this definitional and population heterogeneity) and indirectness (pooling across DKD, HFrEF, HFpEF, and T2DM+CVD populations with different baseline risks).
**Renal:** Downgraded for indirectness (SGLT2i renal composites include CV death; finerenone uses kidney-only endpoints; renal progression thresholds also differ).
**Mortality:** Downgraded for indirectness (diverse populations; mortality often secondary) and imprecision (several per-class CIs cross 1.0). I^2 = 57.4% with Q P = 0.021, but direction of effect consistent across all 9 trials (all favour treatment); not additionally downgraded for inconsistency (see Section 3.4 for detailed rationale).

---

## Figures

**Fig 1.** PRISMA 2020 flow diagram showing trial identification and selection from ClinicalTrials.gov and PubMed.

**Fig 2.** Forest plot of pooled hazard ratios by drug class for the composite endpoint (CV death + HHF). Diamond represents pooled estimate with 95% t-distribution CI; squares represent individual trial HRs with size proportional to inverse-variance weight.

**Fig 3.** Cumulative meta-analysis showing chronological evidence accrual for SGLT2i composite endpoint (2019-2022). Dashed lines indicate 95% CI narrowing over time.

**Fig 4.** PCA-based trial similarity map with target patient profile overlays (DKD, HFpEF, advanced CKD). Axes represent PC1 (50.6% variance) and PC2 (21.9% variance).

**Fig 5.** Cost-effectiveness acceptability curves from 1,000-iteration PSA showing P(cost-effective) versus willingness-to-pay threshold for finerenone, SGLT2i, and steroidal MRA strategies.

**Fig 6.** Screenshot of the CRES v5.0 interface showing the four analysis tabs (Core, Geometry, World, Methods).

---

## Supporting Information

**S1 Checklist.** PRISMA 2020 checklist.

**S1 File.** CRES v5.0 HTML file (fin.html) -- the complete, executable evidence synthesis platform.

**S2 File.** Selenium test suite (test_fin_selenium.py) -- 227 automated end-to-end assertions.

**S3 File.** R metafor cross-validation script (validate_comprehensive.R) -- reproduces all pooled estimates.

**S1 Table.** REML + HKSJ sensitivity analysis results for all outcomes.

| Outcome | Drug Class | REML tau^2 | HR (HKSJ) | 95% CI (HKSJ) |
|---------|-----------|-----------|-----------|---------------|
| Composite | SGLT2i | 0.0046 | 0.79 | 0.70-0.88 |
| | Finerenone | | 0.87 | 0.73-1.03 |
| | Steroidal MRA | | 0.75 | 0.62-0.91 |
| Renal | SGLT2i | ~0 | 0.69 | 0.60-0.78 |
| | Finerenone | | 0.84 | 0.73-0.97 |
| Mortality | SGLT2i | 0.0090 | 0.84 | 0.75-0.95 |
| | Steroidal MRA | | 0.78 | 0.63-0.95 |
