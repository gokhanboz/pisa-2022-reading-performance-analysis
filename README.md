# 📘 PISA 2022 Reading Performance Analysis (Turkey)

This project analyzes the socio-economic and emotional factors affecting Turkish students' reading performance using the PISA 2022 dataset. All analyses were conducted using R.

📁 Contents

Data Import: PISA .sav files were loaded using the haven package.

- **Data Import**: Loaded PISA `.sav` files using the `haven` package.
- **Explanatory Variables**:
  - Number of books at home (reverse-coded)
  - Maternal and paternal education levels
  - Gender and school type
  - Psychological indicators: sense of belonging, safety perception, math anxiety
- **Statistical Analyses**:
  - Simple and multiple linear regression models
  - Multiple imputation using all 10 plausible values (PV1READ–PV10READ)
  - Weighted analyses using final student weights (`W_FSTUWT`)
  - Correlation matrix, t-tests, and diagnostic plots

---

📦 Packages Used

library(haven)

library(dplyr)

library(ggplot2)

library(corrplot)

library(sampling)

library(mitools) # for combining multiple plausible values

library(mitools)  # For plausible value analysis

📊 Visualizations
The following plots are included:
plots/Kitap_Sayisi_ile_Okuma_Basarısi.png: Book access vs reading score

plots/Kitap_Sayisi_ile_Okuma_Basarısi.png: Book availability vs reading performance

plots/Cinsiyete_Gore_Okuma_Basarısi.jpg: Gender-based reading performance

plots/Aidiyet_Duygusu_ile_Okuma_Basarısi.png: Belonging and academic success

plots/Artıklar.png, Artıkların_Histogramı.png, Artıkların_Normalligi.png: Residual diagnostics

▶️ How to Run the Project
Run the pisa_cleaned_script.R script in R or RStudio to reproduce the full analysis step-by-step.

Author: Gökhan Boz

Date: 2025

