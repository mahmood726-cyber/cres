# CRES: reviewer rerun manifest

This manifest is the shortest reviewer-facing rerun path for the local software package. It lists the files that should be sufficient to recreate one worked example, inspect saved outputs, and verify that the manuscript claims remain bounded to what the repository actually demonstrates.

## Reviewer Entry Points
- Project directory: `C:\Models\CRES`.
- Preferred documentation start points: `README.md`, `f1000_artifacts/tutorial_walkthrough.md`.
- Detected public repository root: `https://github.com/mahmood726-cyber/cres`.
- Detected public source snapshot: Fixed public commit snapshot available at `https://github.com/mahmood726-cyber/cres/tree/96d705b1140c992a4b1e2a2ff26c73698df6a8d6`.
- Detected public archive record: No project-specific DOI or Zenodo record URL was detected locally; archive registration pending.
- Environment capture files: `environment.yml`.
- Validation/test artifacts: `f1000_artifacts/validation_summary.md`, `test_fin_selenium.py`.

## Worked Example Inputs
- Manuscript-named example paths: `fin.html` as the executable browser application; `manuscript_cres_v4.md` as the domain-specific narrative source for the software paper; Trial-level curation embedded in the `CONFIG.trials` object and surfaced through the interface; f1000_artifacts/example_dataset.csv.
- Auto-detected sample/example files: `f1000_artifacts/example_dataset.csv`.

## Expected Outputs To Inspect
- Drug-class forest plots and cumulative trajectories.
- Patient-profile similarity mapping and evidence geometry views.
- Deterministic and probabilistic cost-effectiveness outputs with CEAC displays.

## Minimal Reviewer Rerun Sequence
- Start with the README/tutorial files listed below and keep the manuscript paths synchronized with the public archive.
- Create the local runtime from the detected environment capture files if available: `environment.yml`.
- Run at least one named example path from the manuscript and confirm that the generated outputs match the saved validation materials.
- Quote one concrete numeric result from the local validation snippets below when preparing the final software paper.
- Open the browser deliverable and confirm that the embedded WebR validation panel completes successfully after the page finishes initializing.

## Local Numeric Evidence Available
- `manuscript_cres_plos_one.md` reports Composite cardiovascular endpoint (9 trials, 3 classes): Pooled HR was 0.79 (95% CI 0.71-0.87) for SGLT2i (5 trials), 0.87 (0.73-1.02) for finerenone (2 trials, not statistically significant), and 0.75 (0.63-0.90) for steroidal MRA (2 trials: TOPCAT and EMPHASIS-HF).
- `manuscript_cres_v4.md` reports For the composite endpoint (CV death + heart failure hospitalisation), pooled HRs were: SGLT2i 0.79 (95% CI 0.73–0.86, 5 trials), Finerenone 0.87 (0.73–1.02, 2 trials), Steroidal MRA 0.63 (0.54–0.74, 1 trial).

## Browser Deliverables
- HTML entry points: `fin.html`.
- The shipped HTML applications include embedded WebR self-validation and should be checked after any UI or calculation change.
