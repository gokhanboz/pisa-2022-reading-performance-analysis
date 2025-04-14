
# 📘 PISA 2022 Reading Performance Analysis (Turkey)

> 📌 **Aşağıda Türkçe açıklama da mevcuttur**

This project analyzes the factors influencing Turkish students' reading achievement using the PISA 2022 dataset.

## 📁 Contents

- **Data Import**: PISA .sav files were loaded using the `haven` package.
- **Data Cleaning and Sampling**: Stratified sampling was conducted using the `sampling` package.
- **Explanatory Variables**:
  - Number of books (reverse-coded)
  - Parental education (mother and father)
  - Gender and school type
  - Psychological indicators: sense of belonging, safety perception, math anxiety
- **Statistical Analyses**:
  - Simple and multiple linear regression models
  - t-tests
  - Correlation matrix and visualizations

## 📦 Packages Used

```r
library(haven)
library(dplyr)
library(ggplot2)
library(corrplot)
library(sampling)
```

## 📊 Visualizations

The following plots are provided to support the findings:

- `plots/Kitap_Sayisi_ile_Okuma_Basarısi.png`: Book availability vs reading performance
- `plots/Cinsiyete_Gore_Okuma_Basarısi.jpg`: Gender-based reading performance
- `plots/Aidiyet_Duygusu_ile_Okuma_Basarısi.png`: Belonging and academic success
- `plots/Artıklar.png`, `Artıkların_Histogramı.png`, `Artıkların_Normalligi.png`: Residual diagnostics

## ▶️ Running the Project

Use the provided `pisa_cleaned_script.R` script to run the full analysis step by step in R or RStudio.

---

## 📌 Türkçe Açıklama

Bu proje, PISA 2022 veri seti kullanılarak Türkiye'deki öğrencilerin okuma başarıları üzerinde çeşitli değişkenlerin etkilerini incelemektedir.

### 📁 İçerik

- **Veri Yükleme**: SPSS (.sav) formatındaki PISA verisi `haven` paketi ile yüklenmiştir.
- **Veri Temizliği ve Örnekleme**: Tabakalı örnekleme (`sampling` paketi) uygulanmıştır.
- **Açıklayıcı Değişkenler**:
  - Kitap sayısı (ters kodlanmış)
  - Anne ve baba eğitim düzeyi
  - Cinsiyet ve okul türü
  - Psikolojik değişkenler: Aidiyet duygusu, güvenlik algısı, matematik kaygısı
- **İstatistiksel Analizler**:
  - Basit ve çoklu regresyon modelleri
  - t-testleri
  - Korelasyon matrisi ve görselleştirmeler

### 📦 Kullanılan Paketler

```r
library(haven)
library(dplyr)
library(ggplot2)
library(corrplot)
library(sampling)
```

### 📊 Görselleştirmeler

- `plots/Kitap_Sayisi_ile_Okuma_Basarısi.png`: Kitap sayısı ile başarı ilişkisi
- `plots/Cinsiyete_Gore_Okuma_Basarısi.jpg`: Cinsiyete göre başarı karşılaştırması
- `plots/Aidiyet_Duygusu_ile_Okuma_Basarısi.png`: Aidiyet hissi ile başarı ilişkisi
- `plots/Artıklar.png`, `Artıkların_Histogramı.png`, `Artıkların_Normalligi.png`: Artık analizi grafikleri

---

**Hazırlayan / Author:** Gökhan Boz  
**Tarih / Date:** 2025
