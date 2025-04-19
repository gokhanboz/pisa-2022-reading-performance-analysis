📘 PISA 2022 Reading Performance Analysis (Turkey)

📌 Aşağıda Türkçe açıklama da mevcuttur
# 📘 PISA 2022 Reading Performance Analysis (Turkey)

> 📌 **Türkçe açıklama aşağıdadır**


This project analyzes the socio-economic and emotional factors affecting Turkish students' reading performance using the PISA 2022 dataset. All analyses were conducted using R.



📁 Contents

Data Import: PISA .sav files were loaded using the haven package.

- **Data Import**: Loaded PISA `.sav` files using the `haven` package.
- **Data Cleaning and Sampling**: Applied stratified sampling via the `sampling` package.
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

Data Cleaning and Sampling: Stratified sampling was conducted using the sampling package.

Explanatory Variables:

Number of books (reverse-coded)

Parental education (mother and father)

Gender and school type

Psychological indicators: sense of belonging, safety perception, math anxiety

Statistical Analyses:

Simple and multiple linear regression models (with multiple imputation for plausible values)

t-tests

Correlation matrix and visualizations

📦 Packages Used

library(haven)
library(dplyr)
library(ggplot2)
library(corrplot)
library(sampling)
library(mitools)  # for combining multiple plausible values

📊 Visualizations

library(mitools)  # For plausible value analysis

📊 Visualizations
The following plots are included:


plots/Kitap_Sayisi_ile_Okuma_Basarısi.png: Book access vs reading score


plots/Kitap_Sayisi_ile_Okuma_Basarısi.png: Book availability vs reading performance

plots/Cinsiyete_Gore_Okuma_Basarısi.jpg: Gender-based reading performance

plots/Aidiyet_Duygusu_ile_Okuma_Basarısi.png: Belonging and academic success

plots/Artıklar.png, Artıkların_Histogramı.png, Artıkların_Normalligi.png: Residual diagnostics

▶️ Running the Project

Use the provided pisa_cleaned_script.R script to run the full analysis step by step in R or RStudio.

📌 Türkçe Açıklama

plots/Cinsiyete_Gore_Okuma_Basarısi.jpg: Reading scores by gender

plots/Aidiyet_Duygusu_ile_Okuma_Basarısi.png: Belonging vs reading score

plots/Artıklar.png, Artıkların_Histogramı.png, Artıkların_Normalligi.png: Residual diagnostics

▶️ How to Run the Project
Run the pisa_cleaned_script.R script in R or RStudio to reproduce the full analysis step-by-step.

📌 Türkçe Açıklama
Bu proje, PISA 2022 veri seti kullanılarak Türkiye’deki öğrencilerin okuma başarılarını etkileyen sosyo-ekonomik ve duygusal faktörleri analiz etmektedir. Analizler R programı ile gerçekleştirilmiştir.


📁 İçerik
Veri Yükleme: .sav formatındaki PISA verileri haven paketiyle yüklenmiştir.


📁 İçerik

Veri Yükleme: SPSS (.sav) formatındaki PISA verisi haven paketi ile yüklenmiştir.

Veri Temizliği ve Örnekleme: Tabakalı örnekleme (sampling paketi) uygulanmıştır.

Açıklayıcı Değişkenler:

Kitap sayısı (ters kodlanmış)

Veri Temizliği ve Örnekleme: Tabakalı örnekleme sampling paketi ile uygulanmıştır.

Açıklayıcı Değişkenler:

Evdeki kitap sayısı (ters kodlanmış)

Anne ve baba eğitim düzeyi

Cinsiyet ve okul türü

Psikolojik değişkenler: Aidiyet duygusu, güvenlik algısı, matematik kaygısı

İstatistiksel Analizler:

Basit ve çoklu regresyon modelleri (tüm plausible value'lar ile çoklu imputasyon kullanılarak)

t-testleri

Korelasyon matrisi ve görselleştirmeler

📦 Kullanılan Paketler

Psikolojik göstergeler: aidiyet duygusu, güvenlik algısı, matematik kaygısı

İstatistiksel Analizler:

Basit ve çoklu regresyon

Tüm 10 plausible value (PV1READ–PV10READ) ile çoklu imputasyon

Nihai öğrenci ağırlıkları (W_FSTUWT) ile ağırlıklı analiz

Korelasyon analizi, t-testleri ve artık analizleri


library(haven)
library(dplyr)
library(ggplot2)
library(corrplot)
library(sampling)
library(mitools)  # çoklu plausible value analizi için

📊 Görselleştirmeler

plots/Kitap_Sayisi_ile_Okuma_Basarısi.png: Kitap sayısı ile başarı ilişkisi

plots/Cinsiyete_Gore_Okuma_Basarısi.jpg: Cinsiyete göre başarı karşılaştırması

plots/Aidiyet_Duygusu_ile_Okuma_Basarısi.png: Aidiyet hissi ile başarı ilişkisi

plots/Artıklar.png, Artıkların_Histogramı.png, Artıkların_Normalligi.png: Artık analizi grafikleri

Hazırlayan / Author: Gökhan Boz
Tarih / Date: 2025

library(mitools)  # Tüm PV’ler ile analiz için

📊 Görselleştirmeler
plots/Kitap_Sayisi_ile_Okuma_Basarısi.png: Kitap sayısı ve başarı ilişkisi

plots/Cinsiyete_Gore_Okuma_Basarısi.jpg: Cinsiyete göre başarı farkı

plots/Aidiyet_Duygusu_ile_Okuma_Basarısi.png: Aidiyet hissi ve başarı

plots/Artıklar.png, Artıkların_Histogramı.png, Artıkların_Normalligi.png: Regresyon artık analizleri

Hazırlayan / Author: Gökhan Boz
Tarih / Date: 2025

