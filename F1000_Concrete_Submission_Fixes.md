# CRES: concrete submission fixes

This file converts the multi-persona review into repository-side actions that should be checked before external submission of the F1000 software paper for `CRES`.

## Detectable Local State
- Documentation files detected: `README.md`, `f1000_artifacts/tutorial_walkthrough.md`.
- Environment lock or container files detected: `environment.yml`.
- Package manifests detected: none detected.
- Example data files detected: `f1000_artifacts/example_dataset.csv`.
- Validation artifacts detected: `f1000_artifacts/validation_summary.md`, `test_fin_selenium.py`.
- Detected public repository root: `https://github.com/mahmood726-cyber/cres`.
- Detected public source snapshot: Fixed public commit snapshot available at `https://github.com/mahmood726-cyber/cres/tree/96d705b1140c992a4b1e2a2ff26c73698df6a8d6`.
- Detected public archive record: No project-specific DOI or Zenodo record URL was detected locally; archive registration pending.

## High-Priority Fixes
- Check that the manuscript's named example paths exist in the public archive and can be run without repository archaeology.
- Confirm that the cited repository root (`https://github.com/mahmood726-cyber/cres`) resolves to the same fixed public source snapshot used for submission.
- Archive the tagged release and insert the Zenodo DOI or record URL once it has been minted; no project-specific archive DOI was detected locally.
- Reconfirm the quoted benchmark or validation sentence after the final rerun so the narrative text matches the shipped artifacts.
- Keep the embedded WebR validation panel enabled in shipped HTML files and rerun it after any UI or calculation changes.

## Numeric Evidence Available To Quote
- `manuscript_cres_plos_one.md` reports Composite cardiovascular endpoint (9 trials, 3 classes): Pooled HR was 0.79 (95% CI 0.71-0.87) for SGLT2i (5 trials), 0.87 (0.73-1.02) for finerenone (2 trials, not statistically significant), and 0.75 (0.63-0.90) for steroidal MRA (2 trials: TOPCAT and EMPHASIS-HF).
- `manuscript_cres_v4.md` reports For the composite endpoint (CV death + heart failure hospitalisation), pooled HRs were: SGLT2i 0.79 (95% CI 0.73–0.86, 5 trials), Finerenone 0.87 (0.73–1.02, 2 trials), Steroidal MRA 0.63 (0.54–0.74, 1 trial).

## Manuscript Files To Keep In Sync
- `F1000_Software_Tool_Article.md`
- `F1000_Reviewer_Rerun_Manifest.md`
- `F1000_MultiPersona_Review.md`
- `F1000_Submission_Checklist_RealReview.md` where present
- README/tutorial files and the public repository release metadata
