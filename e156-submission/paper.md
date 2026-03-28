Mahmood Ahmad
Tahir Heart Institute
author@example.com

CRES: Browser-Based Cardiorenal Evidence Synthesis with Integrated Meta-Analysis and Health-Economic Modelling

Can a single browser-based file deliver transparent, reproducible cardiorenal evidence synthesis integrating meta-analysis with health-economic modelling? CRES curates 20 randomised controlled trials enrolling 123,977 participants across finerenone, SGLT2 inhibitors, and steroidal mineralocorticoid receptor antagonists for cardiorenal outcomes. The platform implements DerSimonian-Laird random-effects pooling with t-distribution confidence intervals, a three-state Markov cost-effectiveness model, probabilistic sensitivity analysis, GRADE assessments, and Cochrane Risk of Bias 2.0 evaluations, cross-validated against R metafor version 4.8. Pooled HR was 0.79 for SGLT2 inhibitors (95% CI 0.71 to 0.87), 0.87 for finerenone, and 0.75 for steroidal MRAs, with I-squared of 50.3 percent and GRADE certainty rated LOW for the composite. An automated Selenium suite verified 227 end-to-end assertions spanning all computational outputs, interface elements, and security properties. CRES demonstrates that portable, installation-free evidence synthesis can honestly surface both favourable and unfavourable findings within a single auditable artifact. A limitation is that single-author data extraction departs from PRISMA best practice of independent dual extraction.

Outside Notes

Type: methods
Primary estimand: Hazard ratio
App: CRES v5.0
Data: 20 RCTs (N=123,977): finerenone, SGLT2i, steroidal MRA
Code: https://github.com/mahmood726-cyber/cres
Version: 5.0
Validation: DRAFT

References

1. Guyatt GH, Oxman AD, Vist GE, et al. GRADE: an emerging consensus on rating quality of evidence and strength of recommendations. BMJ. 2008;336(7650):924-926.
2. Schunemann HJ, Higgins JPT, Vist GE, et al. Completing 'Summary of findings' tables and grading the certainty of the evidence. Cochrane Handbook Chapter 14. Cochrane; 2023.
3. Borenstein M, Hedges LV, Higgins JPT, Rothstein HR. Introduction to Meta-Analysis. 2nd ed. Wiley; 2021.

AI Disclosure

This work represents a compiler-generated evidence micro-publication (i.e., a structured, pipeline-based synthesis output). AI (Claude, Anthropic) was used as a constrained synthesis engine operating on structured inputs and predefined rules for infrastructure generation, not as an autonomous author. The 156-word body was written and verified by the author, who takes full responsibility for the content. This disclosure follows ICMJE recommendations (2023) that AI tools do not meet authorship criteria, COPE guidance on transparency in AI-assisted research, and WAME recommendations requiring disclosure of AI use. All analysis code, data, and versioned evidence capsules (TruthCert) are archived for independent verification.
