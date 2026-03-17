# CRES v5.0 — Comprehensive cross-validation for PLOS ONE manuscript
# Validates DL tau2, pooled HR (z and t-dist CIs), I2, Q, Qp
# Replicates the app's exact method: DL tau2 + t(df = k - K) CIs
library(metafor)

fmt <- function(x, d=4) formatC(x, format="f", digits=d)
fmtHR <- function(logHR, ci.lb, ci.ub) {
  paste0(fmt(exp(logHR), 2), " (", fmt(exp(ci.lb), 2), "-", fmt(exp(ci.ub), 2), ")")
}

# ===== COMPOSITE OUTCOME (9 HR trials, 3 classes) =====
comp <- data.frame(
  trial = c("FIDELIO-DKD","FIGARO-DKD","TOPCAT","EMPHASIS-HF",
            "EMPEROR-Reduced","EMPEROR-Preserved","DELIVER","DAPA-HF","DECLARE-TIMI 58"),
  class = c("Finerenone","Finerenone","Steroidal MRA","Steroidal MRA",
            "SGLT2i","SGLT2i","SGLT2i","SGLT2i","SGLT2i"),
  hr = c(0.86, 0.87, 0.89, 0.63, 0.75, 0.79, 0.82, 0.74, 0.83),
  lower = c(0.75, 0.76, 0.77, 0.54, 0.65, 0.69, 0.73, 0.65, 0.73),
  upper = c(0.99, 0.98, 1.04, 0.74, 0.86, 0.90, 0.92, 0.85, 0.95),
  stringsAsFactors = FALSE
)
comp$yi <- log(comp$hr)
comp$sei <- (log(comp$upper) - log(comp$lower)) / (2 * qnorm(0.975))

cat("====================================================================\n")
cat("COMPOSITE OUTCOME\n")
cat("====================================================================\n")

dl_comp <- rma(yi, sei=sei, mods = ~ factor(class) - 1, method="DL", data=comp)
cat("DL tau2:", fmt(dl_comp$tau2, 6), "\n")
cat("DL I2:", fmt(dl_comp$I2, 1), "%\n")
cat("DL Q:", fmt(dl_comp$QE, 3), " p=", fmt(dl_comp$QEp, 4), "\n")

# App method: df = k - K = 9 - 3 = 6
k_comp <- nrow(comp)
K_comp <- length(unique(comp$class))
df_comp <- k_comp - K_comp
t_cv <- qt(0.975, df_comp)
z_cv <- qnorm(0.975)
cat("k =", k_comp, ", K =", K_comp, ", df =", df_comp, "\n")
cat("t(0.975, df) =", fmt(t_cv, 4), " vs z(0.975) =", fmt(z_cv, 4), "\n\n")

cat("--- z-based CIs (standard metafor DL) ---\n")
classes_comp <- sort(unique(comp$class))
for (i in 1:length(dl_comp$b)) {
  cls <- classes_comp[i]
  kj <- sum(comp$class == cls)
  logHR <- dl_comp$b[i]
  se_i <- sqrt(dl_comp$vb[i,i])
  cat(sprintf("  %-16s k=%d  HR=%s  logHR=%s  SE=%s\n",
    cls, kj, fmtHR(logHR, logHR - z_cv*se_i, logHR + z_cv*se_i), fmt(logHR), fmt(se_i)))
}

cat("\n--- t-based CIs (app method: DL tau2 + t(df=k-K)) ---\n")
for (i in 1:length(dl_comp$b)) {
  cls <- classes_comp[i]
  kj <- sum(comp$class == cls)
  logHR <- dl_comp$b[i]
  se_i <- sqrt(dl_comp$vb[i,i])
  lb <- logHR - t_cv * se_i
  ub <- logHR + t_cv * se_i
  sig <- ifelse(exp(ub) < 1, "SIG", "NS")
  cat(sprintf("  %-16s k=%d  HR=%s  %s\n", cls, kj, fmtHR(logHR, lb, ub), sig))
}

# REML + HKSJ for sensitivity
reml_comp <- rma(yi, sei=sei, mods = ~ factor(class) - 1, method="REML", data=comp)
hksj_comp <- rma(yi, sei=sei, mods = ~ factor(class) - 1, method="REML", test="knha", data=comp)
cat("\n--- REML+HKSJ sensitivity ---\n")
cat("REML tau2:", fmt(reml_comp$tau2, 6), "\n")
for (i in 1:length(hksj_comp$b)) {
  cls <- classes_comp[i]
  kj <- sum(comp$class == cls)
  cat(sprintf("  %-16s k=%d  HR=%s\n", cls, kj,
    fmtHR(hksj_comp$b[i], hksj_comp$ci.lb[i], hksj_comp$ci.ub[i])))
}

# ===== RENAL OUTCOME (5 HR trials, 2 classes) =====
renal <- data.frame(
  trial = c("FIDELIO-DKD","FIGARO-DKD","DAPA-CKD","EMPA-KIDNEY","CREDENCE"),
  class = c("Finerenone","Finerenone","SGLT2i","SGLT2i","SGLT2i"),
  hr = c(0.82, 0.87, 0.61, 0.72, 0.70),
  lower = c(0.73, 0.76, 0.51, 0.64, 0.59),
  upper = c(0.93, 1.01, 0.72, 0.82, 0.82),
  stringsAsFactors = FALSE
)
renal$yi <- log(renal$hr)
renal$sei <- (log(renal$upper) - log(renal$lower)) / (2 * qnorm(0.975))

cat("\n====================================================================\n")
cat("RENAL OUTCOME\n")
cat("====================================================================\n")

dl_renal <- rma(yi, sei=sei, mods = ~ factor(class) - 1, method="DL", data=renal)
cat("DL tau2:", fmt(dl_renal$tau2, 6), "\n")
cat("DL I2:", fmt(dl_renal$I2, 1), "%\n")

k_renal <- nrow(renal)
K_renal <- length(unique(renal$class))
df_renal <- k_renal - K_renal
t_cv_r <- qt(0.975, df_renal)
cat("k =", k_renal, ", K =", K_renal, ", df =", df_renal, "\n")
cat("t(0.975, df) =", fmt(t_cv_r, 4), "\n\n")

cat("--- z-based CIs ---\n")
classes_renal <- sort(unique(renal$class))
for (i in 1:length(dl_renal$b)) {
  cls <- classes_renal[i]
  kj <- sum(renal$class == cls)
  logHR <- dl_renal$b[i]
  se_i <- sqrt(dl_renal$vb[i,i])
  cat(sprintf("  %-16s k=%d  HR=%s\n", cls, kj,
    fmtHR(logHR, logHR - z_cv*se_i, logHR + z_cv*se_i)))
}

cat("\n--- t-based CIs (app method: DL tau2 + t(df=k-K)) ---\n")
for (i in 1:length(dl_renal$b)) {
  cls <- classes_renal[i]
  kj <- sum(renal$class == cls)
  logHR <- dl_renal$b[i]
  se_i <- sqrt(dl_renal$vb[i,i])
  lb <- logHR - t_cv_r * se_i
  ub <- logHR + t_cv_r * se_i
  sig <- ifelse(exp(ub) < 1, "SIG", "NS")
  cat(sprintf("  %-16s k=%d  HR=%s  %s\n", cls, kj, fmtHR(logHR, lb, ub), sig))
}

# REML + HKSJ
reml_renal <- rma(yi, sei=sei, mods = ~ factor(class) - 1, method="REML", data=renal)
hksj_renal <- rma(yi, sei=sei, mods = ~ factor(class) - 1, method="REML", test="knha", data=renal)
cat("\n--- REML+HKSJ sensitivity ---\n")
cat("REML tau2:", fmt(reml_renal$tau2, 6), "\n")
for (i in 1:length(hksj_renal$b)) {
  cls <- classes_renal[i]
  kj <- sum(renal$class == cls)
  cat(sprintf("  %-16s k=%d  HR=%s\n", cls, kj,
    fmtHR(hksj_renal$b[i], hksj_renal$ci.lb[i], hksj_renal$ci.ub[i])))
}

# ===== MORTALITY OUTCOME (9 HR trials, 2 classes) =====
mort <- data.frame(
  trial = c("RALES","EPHESUS","DAPA-CKD","DAPA-HF","EMPA-REG OUTCOME",
            "DECLARE-TIMI 58","CANVAS Program","VERTIS-CV","EMPEROR-Reduced"),
  class = c("Steroidal MRA","Steroidal MRA","SGLT2i","SGLT2i","SGLT2i",
            "SGLT2i","SGLT2i","SGLT2i","SGLT2i"),
  hr = c(0.70, 0.85, 0.69, 0.83, 0.68, 0.93, 0.87, 0.93, 0.92),
  lower = c(0.60, 0.75, 0.53, 0.71, 0.57, 0.82, 0.74, 0.80, 0.77),
  upper = c(0.82, 0.96, 0.88, 0.97, 0.82, 1.04, 1.01, 1.08, 1.10),
  stringsAsFactors = FALSE
)
mort$yi <- log(mort$hr)
mort$sei <- (log(mort$upper) - log(mort$lower)) / (2 * qnorm(0.975))

cat("\n====================================================================\n")
cat("MORTALITY OUTCOME\n")
cat("====================================================================\n")

dl_mort <- rma(yi, sei=sei, mods = ~ factor(class) - 1, method="DL", data=mort)
cat("DL tau2:", fmt(dl_mort$tau2, 6), "\n")
cat("DL I2:", fmt(dl_mort$I2, 1), "%\n")

k_mort <- nrow(mort)
K_mort <- length(unique(mort$class))
df_mort <- k_mort - K_mort
t_cv_m <- qt(0.975, df_mort)
cat("k =", k_mort, ", K =", K_mort, ", df =", df_mort, "\n")
cat("t(0.975, df) =", fmt(t_cv_m, 4), "\n\n")

cat("--- z-based CIs ---\n")
classes_mort <- sort(unique(mort$class))
for (i in 1:length(dl_mort$b)) {
  cls <- classes_mort[i]
  kj <- sum(mort$class == cls)
  logHR <- dl_mort$b[i]
  se_i <- sqrt(dl_mort$vb[i,i])
  cat(sprintf("  %-16s k=%d  HR=%s\n", cls, kj,
    fmtHR(logHR, logHR - z_cv*se_i, logHR + z_cv*se_i)))
}

cat("\n--- t-based CIs (app method: DL tau2 + t(df=k-K)) ---\n")
for (i in 1:length(dl_mort$b)) {
  cls <- classes_mort[i]
  kj <- sum(mort$class == cls)
  logHR <- dl_mort$b[i]
  se_i <- sqrt(dl_mort$vb[i,i])
  lb <- logHR - t_cv_m * se_i
  ub <- logHR + t_cv_m * se_i
  sig <- ifelse(exp(ub) < 1, "SIG", "NS")
  cat(sprintf("  %-16s k=%d  HR=%s  %s\n", cls, kj, fmtHR(logHR, lb, ub), sig))
}

# REML + HKSJ
reml_mort <- rma(yi, sei=sei, mods = ~ factor(class) - 1, method="REML", data=mort)
hksj_mort <- rma(yi, sei=sei, mods = ~ factor(class) - 1, method="REML", test="knha", data=mort)
cat("\n--- REML+HKSJ sensitivity ---\n")
cat("REML tau2:", fmt(reml_mort$tau2, 6), "\n")
for (i in 1:length(hksj_mort$b)) {
  cls <- classes_mort[i]
  kj <- sum(mort$class == cls)
  cat(sprintf("  %-16s k=%d  HR=%s\n", cls, kj,
    fmtHR(hksj_mort$b[i], hksj_mort$ci.lb[i], hksj_mort$ci.ub[i])))
}

# ===== EGGER'S TEST =====
cat("\n====================================================================\n")
cat("EGGER'S TEST (per outcome)\n")
cat("====================================================================\n")
# Composite: use raw study-level (limitation noted)
erg_comp <- regtest(rma(yi, sei=sei, method="DL", data=comp))
cat("Composite: z =", fmt(erg_comp$zval, 3), "  p =", fmt(erg_comp$pval, 4), "\n")
erg_renal <- regtest(rma(yi, sei=sei, method="DL", data=renal))
cat("Renal:     z =", fmt(erg_renal$zval, 3), "  p =", fmt(erg_renal$pval, 4), "\n")
erg_mort <- regtest(rma(yi, sei=sei, method="DL", data=mort))
cat("Mortality: z =", fmt(erg_mort$zval, 3), "  p =", fmt(erg_mort$pval, 4), "\n")

# ===== TOTAL SAMPLE SIZE =====
cat("\n====================================================================\n")
cat("SAMPLE SIZE SUMMARY\n")
cat("====================================================================\n")
all_trials <- data.frame(
  trial = c("FIDELIO-DKD","FIGARO-DKD","FINEARTS-HF","TOPCAT","RALES",
            "DAPA-CKD","EPHESUS","EMPHASIS-HF","EMPA-KIDNEY","CREDENCE",
            "EMPEROR-Reduced","EMPEROR-Preserved","DELIVER","DAPA-HF",
            "EMPA-REG OUTCOME","SCORED","SOLOIST-WHF","DECLARE-TIMI 58",
            "CANVAS Program","VERTIS-CV"),
  n = c(5734, 7352, 6001, 3445, 1663, 4304, 6632, 2737, 6609, 4401,
        3730, 5988, 6263, 4744, 7020, 10584, 1222, 17160, 10142, 8246),
  class = c("Finerenone","Finerenone","Finerenone","Steroidal MRA","Steroidal MRA",
            "SGLT2i","Steroidal MRA","Steroidal MRA","SGLT2i","SGLT2i",
            "SGLT2i","SGLT2i","SGLT2i","SGLT2i","SGLT2i","SGLT2i","SGLT2i",
            "SGLT2i","SGLT2i","SGLT2i"),
  stringsAsFactors = FALSE
)
cat("Total N:", sum(all_trials$n), "\n")
cat("By class:\n")
for (cls in sort(unique(all_trials$class))) {
  sub <- all_trials[all_trials$class == cls, ]
  cat(sprintf("  %-16s %d trials  N=%d\n", cls, nrow(sub), sum(sub$n)))
}

cat("\nDONE\n")
