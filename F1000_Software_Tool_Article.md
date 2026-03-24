# CRES: a software tool for reviewer-auditable evidence synthesis

## Authors
- Mahmood Ahmad [1,2]
- Niraj Kumar [1]
- Bilaal Dar [3]
- Laiba Khan [1]
- Andrew Woo [4]
- Corresponding author: Andrew Woo (andy2709w@gmail.com)

## Affiliations
1. Royal Free Hospital
2. Tahir Heart Institute Rabwah
3. King's College Medical School
4. St George's Medical School

## Abstract
**Background:** Living evidence synthesis in cardiorenal medicine is difficult to operationalize when comparative efficacy, trial similarity, and economic interpretation are spread across multiple disconnected tools. Reviewers also expect a walk-through dataset, transparent assumptions, and evidence that a browser tool reproduces its own outputs.

**Methods:** CRES is a zero-installation HTML application that curates phase III and IV cardiorenal trials and combines stratified random-effects pooling, cumulative meta-analysis, trial geometry mapping, and probabilistic cost-effectiveness analysis in a single portable file.

**Results:** The local package includes the executable dashboard (`fin.html`), a journal-style methods manuscript, worked trial registry content, and Selenium-based interface tests that exercise the analytic workflow and key result panels.

**Conclusions:** CRES is best presented as a transparent browser delivery layer for curated cardiorenal evidence, with explicit scope limits around estimand harmonization and health-economic assumptions.

## Keywords
cardiorenal pharmacotherapy; browser-based meta-analysis; cumulative meta-analysis; cost-effectiveness; living evidence; software tool

## Introduction
The software addresses a practical niche between conventional statistical software and hosted evidence apps: a self-contained browser file that can be reviewed locally, inspected in source, and rerun without a server. The emphasis is on transparent implementation rather than maximal feature breadth.

Relevant comparators include RevMan, MetaInsight, and package-based R workflows. CRES does not replace those tools; instead it packages a curated cardiorenal use case with cumulative plots, similarity mapping, and health-economic outputs in a reviewer-friendly, inspectable format.

The manuscript structure below is deliberately aligned to common open-software review requests: the rationale is stated explicitly, at least one runnable example path is named, local validation artifacts are listed, and conclusions are bounded to the functions and outputs documented in the repository.

## Methods
### Software architecture and workflow
The application bundles trial-level metadata, hazard ratio inputs, outcome panels, cumulative evidence views, patient-risk translations, and deterministic and probabilistic cost-effectiveness modules directly in the HTML source. This design keeps the run state, curated inputs, and displayed methods in one file.

### Installation, runtime, and reviewer reruns
The local implementation is packaged under `C:\Models\CRES`. The manuscript identifies the local entry points, dependency manifest, fixed example input, and expected saved outputs so that reviewers can rerun the documented workflow without reconstructing it from scratch.

- Entry directory: `C:\Models\CRES`.
- Detected documentation entry points: `README.md`, `f1000_artifacts/tutorial_walkthrough.md`.
- Detected environment capture or packaging files: `environment.yml`.
- Named worked-example paths in this draft: `fin.html` as the executable browser application; `manuscript_cres_v4.md` as the domain-specific narrative source for the software paper; Trial-level curation embedded in the `CONFIG.trials` object and surfaced through the interface.
- Detected validation or regression artifacts: `f1000_artifacts/validation_summary.md`, `test_fin_selenium.py`.
- Detected example or sample data files: `f1000_artifacts/example_dataset.csv`.
- Detected browser deliverables with built-in WebR self-validation: `fin.html`.

### Worked examples and validation materials
**Example or fixed demonstration paths**
- `fin.html` as the executable browser application.
- `manuscript_cres_v4.md` as the domain-specific narrative source for the software paper.
- Trial-level curation embedded in the `CONFIG.trials` object and surfaced through the interface.

**Validation and reporting artifacts**
- `test_fin_selenium.py` for end-to-end interface checks.
- `validate_metafor.R` and `validate_comprehensive.R` for cross-checking analytic outputs.
- `F1000_Submission_Checklist_RealReview.md` for reviewer-aligned reporting expectations.

### Typical outputs and user-facing deliverables
- Drug-class forest plots and cumulative trajectories.
- Patient-profile similarity mapping and evidence geometry views.
- Deterministic and probabilistic cost-effectiveness outputs with CEAC displays.

### Reviewer-informed safeguards
- Provides a named example workflow or fixed demonstration path.
- Documents local validation artifacts rather than relying on unsupported claims.
- Positions the software against existing tools without claiming blanket superiority.
- States limitations and interpretation boundaries in the manuscript itself.
- Requires explicit environment capture and public example accessibility in the released archive.

## Review-Driven Revisions
This draft has been tightened against recurring open peer-review objections taken from the supplied reviewer reports.
- Reproducibility: the draft names a reviewer rerun path and points readers to validation artifacts instead of assuming interface availability is proof of correctness.
- Validation: claims are anchored to local tests, validation summaries, simulations, or consistency checks rather than to unsupported assertions of performance.
- Comparators and niche: the manuscript now names the relevant comparison class and keeps the claimed niche bounded instead of implying universal superiority.
- Documentation and interpretation: the text expects a worked example, input transparency, and reviewer-verifiable outputs rather than a high-level feature list alone.
- Claims discipline: conclusions are moderated to the documented scope of CRES and paired with explicit limitations.
- Browser verification: HTML applications in this directory now include embedded WebR checks so reviewer-facing dashboards can validate their displayed calculations in situ.

## Use Cases and Results
The software outputs should be described in terms of concrete reviewer-verifiable workflows: running the packaged example, inspecting the generated results, and checking that the reported interpretation matches the saved local artifacts. In this project, the most important result layer is the availability of a transparent execution path from input to analysis output.

Representative local result: `manuscript_cres_plos_one.md` reports Composite cardiovascular endpoint (9 trials, 3 classes): Pooled HR was 0.79 (95% CI 0.71-0.87) for SGLT2i (5 trials), 0.87 (0.73-1.02) for finerenone (2 trials, not statistically significant), and 0.75 (0.63-0.90) for steroidal MRA (2 trials: TOPCAT and EMPHASIS-HF).

### Concrete local quantitative evidence
- `manuscript_cres_plos_one.md` reports Composite cardiovascular endpoint (9 trials, 3 classes): Pooled HR was 0.79 (95% CI 0.71-0.87) for SGLT2i (5 trials), 0.87 (0.73-1.02) for finerenone (2 trials, not statistically significant), and 0.75 (0.63-0.90) for steroidal MRA (2 trials: TOPCAT and EMPHASIS-HF).
- `manuscript_cres_v4.md` reports For the composite endpoint (CV death + heart failure hospitalisation), pooled HRs were: SGLT2i 0.79 (95% CI 0.73–0.86, 5 trials), Finerenone 0.87 (0.73–1.02, 2 trials), Steroidal MRA 0.63 (0.54–0.74, 1 trial).

## Discussion
Representative local result: `manuscript_cres_plos_one.md` reports Composite cardiovascular endpoint (9 trials, 3 classes): Pooled HR was 0.79 (95% CI 0.71-0.87) for SGLT2i (5 trials), 0.87 (0.73-1.02) for finerenone (2 trials, not statistically significant), and 0.75 (0.63-0.90) for steroidal MRA (2 trials: TOPCAT and EMPHASIS-HF).

The real software contribution is not merely the statistical formulas; it is the transparent packaging of a curated clinical registry, explicit methods text, and inspectable browser logic in a format that clinicians can review without a programming environment.

### Limitations
- The registry is curated for a defined cardiorenal scope rather than automated across the full evidence base.
- Economic assumptions are context-specific and currently aligned to a US-style pricing interpretation.
- Some trials use incompatible estimands and therefore require display-only rather than pooled treatment effects.

## Software Availability
- Local source package: `CRES` under `C:\Models`.
- Public repository: `https://github.com/mahmood726-cyber/cres`.
- Public source snapshot: Fixed public commit snapshot available at `https://github.com/mahmood726-cyber/cres/tree/96d705b1140c992a4b1e2a2ff26c73698df6a8d6`.
- DOI/archive record: No project-specific DOI or Zenodo record URL was detected locally; archive registration pending.
- Environment capture detected locally: `environment.yml`.
- Reviewer-facing documentation detected locally: `README.md`, `f1000_artifacts/tutorial_walkthrough.md`.
- Reproducibility walkthrough: `f1000_artifacts/tutorial_walkthrough.md` where present.
- Validation summary: `f1000_artifacts/validation_summary.md` where present.
- Reviewer rerun manifest: `F1000_Reviewer_Rerun_Manifest.md`.
- Multi-persona review memo: `F1000_MultiPersona_Review.md`.
- Concrete submission-fix note: `F1000_Concrete_Submission_Fixes.md`.
- License: see the local `LICENSE` file.

## Data Availability
All trial-level inputs used by the browser application are embedded in the local HTML source and supporting project files. No individual patient data are distributed.

## Reporting Checklist
Real-peer-review-aligned checklist: `F1000_Submission_Checklist_RealReview.md`.
Reviewer rerun companion: `F1000_Reviewer_Rerun_Manifest.md`.
Companion reviewer-response artifact: `F1000_MultiPersona_Review.md`.
Project-level concrete fix list: `F1000_Concrete_Submission_Fixes.md`.

## Declarations
### Competing interests
The authors declare that no competing interests were disclosed.

### Grant information
No specific grant was declared for this manuscript draft.

### Author contributions (CRediT)
| Author | CRediT roles |
|---|---|
| Mahmood Ahmad | Conceptualization; Software; Validation; Data curation; Writing - original draft; Writing - review and editing |
| Niraj Kumar | Conceptualization |
| Bilaal Dar | Conceptualization |
| Laiba Khan | Conceptualization |
| Andrew Woo | Conceptualization |

### Acknowledgements
The authors acknowledge contributors to open statistical methods, reproducible research software, and reviewer-led software quality improvement.

## References
1. DerSimonian R, Laird N. Meta-analysis in clinical trials. Controlled Clinical Trials. 1986;7(3):177-188.
2. Higgins JPT, Thompson SG. Quantifying heterogeneity in a meta-analysis. Statistics in Medicine. 2002;21(11):1539-1558.
3. Viechtbauer W. Conducting meta-analyses in R with the metafor package. Journal of Statistical Software. 2010;36(3):1-48.
4. Page MJ, McKenzie JE, Bossuyt PM, et al. The PRISMA 2020 statement: an updated guideline for reporting systematic reviews. BMJ. 2021;372:n71.
5. Fay C, Rochette S, Guyader V, Girard C. Engineering Production-Grade Shiny Apps. Chapman and Hall/CRC. 2022.
