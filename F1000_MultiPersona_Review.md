# CRES: multi-persona peer review

This memo applies the recurring concerns in the supplied peer-review document to the current F1000 draft for this project (`CRES`). It distinguishes changes already made in the draft from repository-side items that still need to hold in the released repository and manuscript bundle.

## Detected Local Evidence
- Detected documentation files: `README.md`, `f1000_artifacts/tutorial_walkthrough.md`.
- Detected environment capture or packaging files: `environment.yml`.
- Detected validation/test artifacts: `f1000_artifacts/validation_summary.md`, `test_fin_selenium.py`.
- Detected browser deliverables: `fin.html`.
- Detected public repository root: `https://github.com/mahmood726-cyber/cres`.
- Detected public source snapshot: Fixed public commit snapshot available at `https://github.com/mahmood726-cyber/cres/tree/96d705b1140c992a4b1e2a2ff26c73698df6a8d6`.
- Detected public archive record: No project-specific DOI or Zenodo record URL was detected locally; archive registration pending.

## Reviewer Rerun Companion
- `F1000_Reviewer_Rerun_Manifest.md` consolidates the shortest reviewer-facing rerun path, named example files, environment capture, and validation checkpoints.

## Detected Quantitative Evidence
- `manuscript_cres_plos_one.md` reports Composite cardiovascular endpoint (9 trials, 3 classes): Pooled HR was 0.79 (95% CI 0.71-0.87) for SGLT2i (5 trials), 0.87 (0.73-1.02) for finerenone (2 trials, not statistically significant), and 0.75 (0.63-0.90) for steroidal MRA (2 trials: TOPCAT and EMPHASIS-HF).
- `manuscript_cres_v4.md` reports For the composite endpoint (CV death + heart failure hospitalisation), pooled HRs were: SGLT2i 0.79 (95% CI 0.73–0.86, 5 trials), Finerenone 0.87 (0.73–1.02, 2 trials), Steroidal MRA 0.63 (0.54–0.74, 1 trial).

## Current Draft Strengths
- States the project rationale and niche explicitly: Living evidence synthesis in cardiorenal medicine is difficult to operationalize when comparative efficacy, trial similarity, and economic interpretation are spread across multiple disconnected tools. Reviewers also expect a walk-through dataset, transparent assumptions, and evidence that a browser tool reproduces its own outputs.
- Names concrete worked-example paths: `fin.html` as the executable browser application; `manuscript_cres_v4.md` as the domain-specific narrative source for the software paper; Trial-level curation embedded in the `CONFIG.trials` object and surfaced through the interface.
- Points reviewers to local validation materials: `test_fin_selenium.py` for end-to-end interface checks; `validate_metafor.R` and `validate_comprehensive.R` for cross-checking analytic outputs; `F1000_Submission_Checklist_RealReview.md` for reviewer-aligned reporting expectations.
- Moderates conclusions and lists explicit limitations for CRES.

## Remaining High-Priority Fixes
- Keep one minimal worked example public and ensure the manuscript paths match the released files.
- Ensure README/tutorial text, software availability metadata, and public runtime instructions stay synchronized with the manuscript.
- Confirm that the cited repository root resolves to the same fixed public source snapshot used for the submission package.
- Mint and cite a Zenodo DOI or record URL for the tagged release; none was detected locally.
- Reconfirm the quoted benchmark or validation sentence after the final rerun so the narrative text stays synchronized with the shipped artifacts.
- Keep the embedded WebR validation panel enabled in public HTML releases and rerun it after any UI or calculation changes.

## Persona Reviews

### Reproducibility Auditor
- Review question: Looks for a frozen computational environment, a fixed example input, and an end-to-end rerun path with saved outputs.
- What the revised draft now provides: The revised draft names concrete rerun assets such as `fin.html` as the executable browser application; `manuscript_cres_v4.md` as the domain-specific narrative source for the software paper and ties them to validation files such as `test_fin_selenium.py` for end-to-end interface checks; `validate_metafor.R` and `validate_comprehensive.R` for cross-checking analytic outputs.
- What still needs confirmation before submission: Before submission, freeze the public runtime with `environment.yml` and keep at least one minimal example input accessible in the external archive.

### Validation and Benchmarking Statistician
- Review question: Checks whether the paper shows evidence that outputs are accurate, reproducible, and compared against known references or stress tests.
- What the revised draft now provides: The manuscript now cites concrete validation evidence including `test_fin_selenium.py` for end-to-end interface checks; `validate_metafor.R` and `validate_comprehensive.R` for cross-checking analytic outputs; `F1000_Submission_Checklist_RealReview.md` for reviewer-aligned reporting expectations and frames conclusions as being supported by those materials rather than by interface availability alone.
- What still needs confirmation before submission: Concrete numeric evidence detected locally is now available for quotation: `manuscript_cres_plos_one.md` reports Composite cardiovascular endpoint (9 trials, 3 classes): Pooled HR was 0.79 (95% CI 0.71-0.87) for SGLT2i (5 trials), 0.87 (0.73-1.02) for finerenone (2 trials, not statistically significant), and 0.75 (0.63-0.90) for steroidal MRA (2 trials: TOPCAT and EMPHASIS-HF); `manuscript_cres_v4.md` reports For the composite endpoint (CV death + heart failure hospitalisation), pooled HRs were: SGLT2i 0.79 (95% CI 0.73–0.86, 5 trials), Finerenone 0.87 (0.73–1.02, 2 trials), Steroidal MRA 0.63 (0.54–0.74, 1 trial).

### Methods-Rigor Reviewer
- Review question: Examines modeling assumptions, scope conditions, and whether method-specific caveats are stated instead of implied.
- What the revised draft now provides: The architecture and discussion sections now state the method scope explicitly and keep caveats visible through limitations such as The registry is curated for a defined cardiorenal scope rather than automated across the full evidence base; Economic assumptions are context-specific and currently aligned to a US-style pricing interpretation.
- What still needs confirmation before submission: Retain method-specific caveats in the final Results and Discussion and avoid collapsing exploratory thresholds or heuristics into universal recommendations.

### Comparator and Positioning Reviewer
- Review question: Asks what gap the tool fills relative to existing software and whether the manuscript avoids unsupported superiority claims.
- What the revised draft now provides: The introduction now positions the software against an explicit comparator class: Relevant comparators include RevMan, MetaInsight, and package-based R workflows. CRES does not replace those tools; instead it packages a curated cardiorenal use case with cumulative plots, similarity mapping, and health-economic outputs in a reviewer-friendly, inspectable format.
- What still needs confirmation before submission: Keep the comparator discussion citation-backed in the final submission and avoid phrasing that implies blanket superiority over better-established tools.

### Documentation and Usability Reviewer
- Review question: Looks for a README, tutorial, worked example, input-schema clarity, and short interpretation guidance for outputs.
- What the revised draft now provides: The revised draft points readers to concrete walkthrough materials such as `fin.html` as the executable browser application; `manuscript_cres_v4.md` as the domain-specific narrative source for the software paper; Trial-level curation embedded in the `CONFIG.trials` object and surfaced through the interface and spells out expected outputs in the Methods section.
- What still needs confirmation before submission: Make sure the public archive exposes a readable README/tutorial bundle: currently detected files include `README.md`, `f1000_artifacts/tutorial_walkthrough.md`.

### Software Engineering Hygiene Reviewer
- Review question: Checks for evidence of testing, deployment hygiene, browser/runtime verification, secret handling, and removal of obvious development leftovers.
- What the revised draft now provides: The draft now foregrounds regression and validation evidence via `f1000_artifacts/validation_summary.md`, `test_fin_selenium.py`, and browser-facing projects are described as self-validating where applicable.
- What still needs confirmation before submission: Before submission, remove any dead links, exposed secrets, or development-stage text from the public repo and ensure the runtime path described in the manuscript matches the shipped code.

### Claims-and-Limitations Editor
- Review question: Verifies that conclusions are bounded to what the repository actually demonstrates and that limitations are explicit.
- What the revised draft now provides: The abstract and discussion now moderate claims and pair them with explicit limitations, including The registry is curated for a defined cardiorenal scope rather than automated across the full evidence base; Economic assumptions are context-specific and currently aligned to a US-style pricing interpretation; Some trials use incompatible estimands and therefore require display-only rather than pooled treatment effects.
- What still needs confirmation before submission: Keep the conclusion tied to documented functions and artifacts only; avoid adding impact claims that are not directly backed by validation, benchmarking, or user-study evidence.

### F1000 and Editorial Compliance Reviewer
- Review question: Checks for manuscript completeness, software/data availability clarity, references, and reviewer-facing support files.
- What the revised draft now provides: The revised draft is more complete structurally and now points reviewers to software availability, data availability, and reviewer-facing support files.
- What still needs confirmation before submission: Confirm repository/archive metadata, figure/export requirements, and supporting-file synchronization before release.
