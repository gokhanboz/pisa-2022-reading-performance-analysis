# ====================================
# PISA 2022 Türkiye Verisi Analizi (Temizlenmiş Sürüm)
# ====================================

# 1. GEREKLİ KÜTÜPHANELER
library(haven)
library(dplyr)
library(ggplot2)
library(corrplot)
library(sampling)

# 2. VERİNİN YÜKLENMESİ
file_path <- file.choose()  # Dosya seçme penceresi
pisa_data <- read_sav(file_path)

# 3. TÜRKİYE VERİSİNİN FİLTRELENMESİ
turkey_data <- pisa_data %>% filter(CNT == "TUR")

# 4. SEÇİLEN DEĞİŞKENLERİN BELİRLENMESİ
turkey_selected <- turkey_data %>%
  select(PV1READ, ST004D01T, ST005Q01JA, ST006Q01JA, ST006Q02JA, ST022Q01TA, STRATUM,
         BELONG, FEELSAFE, ANXMAT, FEELLAH)

# 5. EKSİK GÖZLEMLERİ TEMİZLENMESİ
sample_data <- turkey_selected %>%
  filter(!is.na(PV1READ), !is.na(ST004D01T), !is.na(ST005Q01JA),
         !is.na(ST006Q01JA), !is.na(ST006Q02JA), !is.na(ST022Q01TA),
         !is.na(BELONG), !is.na(FEELSAFE), !is.na(ANXMAT), !is.na(FEELLAH))

# 6. DEĞİŞKEN DÖNÜŞÜMLERİ
sample_data <- sample_data %>%
  mutate(
    KitapSayisi = 6 - ST005Q01JA,  # Ters kodlama
    Cinsiyet = factor(ST004D01T, labels = c("Erkek", "Kız")),
    OkulTuru = factor(ST022Q01TA, labels = c("Genel", "Meslek"))
  )

# 7. KORELASYON MATRİSİ
numeric_data <- sample_data %>%
  select(PV1READ, ST005Q01JA, ST006Q01JA, ST006Q02JA) %>%
  na.omit()
cor_matrix <- cor(numeric_data)
corrplot(cor_matrix, method = "color", type = "upper", tl.col = "black", addCoef.col = "black")

# 8. REGRESYON MODELLERİ
model1 <- lm(PV1READ ~ ST005Q01JA, data = sample_data)
model2 <- lm(PV1READ ~ ST005Q01JA + ST006Q01JA + ST006Q02JA, data = sample_data)
model3 <- lm(PV1READ ~ ST005Q01JA + ST006Q01JA + ST006Q02JA +
               factor(ST004D01T) + factor(ST022Q01TA), data = sample_data)
model4 <- lm(PV1READ ~ ST005Q01JA + ST006Q01JA + ST006Q02JA + 
               factor(ST004D01T) + factor(ST022Q01TA) + BELONG + FEELSAFE + ANXMAT + FEELLAH,
             data = sample_data)
model5 <- lm(PV1READ ~ KitapSayisi + ST006Q01JA + ST006Q02JA +
               factor(ST004D01T) + factor(ST022Q01TA) + BELONG + FEELSAFE + ANXMAT + FEELLAH,
             data = sample_data)

# 9. GÖRSELLEŞTİRMELER
## a) Kitap sayısı ile okuma başarısı
ggplot(sample_data, aes(x = KitapSayisi, y = PV1READ)) +
  geom_point(alpha = 0.3, color = "darkblue") +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "Kitap Sayısı ile Okuma Başarısı Arasındaki İlişki",
       x = "Kitap Sayısı (Ters Kodlanmış)",
       y = "Okuma Başarı Puanı (PV1READ)") +
  theme_minimal()

## b) Cinsiyete göre dağılım
ggplot(sample_data, aes(x = Cinsiyet, y = PV1READ, fill = Cinsiyet)) +
  geom_boxplot() +
  labs(title = "Cinsiyete Göre Okuma Başarısı Dağılımı",
       x = "Cinsiyet", y = "Okuma Başarı Puanı") +
  theme_minimal()

## c) Okul türüne göre dağılım
ggplot(sample_data, aes(x = OkulTuru, y = PV1READ, fill = OkulTuru)) +
  geom_boxplot() +
  labs(title = "Okul Türüne Göre Okuma Başarısı",
       x = "Okul Türü", y = "Okuma Puanı") +
  theme_minimal()

## d) Aidiyet ve başarı ilişkisi
ggplot(sample_data, aes(x = BELONG, y = PV1READ)) +
  geom_point(alpha = 0.3, color = "darkgreen") +
  geom_smooth(method = "lm", se = TRUE, color = "firebrick") +
  labs(title = "Aidiyet Duygusu ile Okuma Başarısı İlişkisi",
       x = "Aidiyet Skoru (BELONG)", y = "Okuma Puanı") +
  theme_minimal()

# 10. MODEL ARTIK ANALİZİ
plot(model5$fitted.values, resid(model5),
     xlab = "Tahmin Edilen Değerler (Ŷ)",
     ylab = "Artıklar (Residuals)",
     main = "Tahmin Edilen Değere Karşı Artıklar")
abline(h = 0, col = "red")

hist(resid(model5),
     main = "Artıkların Histogramı",
     xlab = "Artıklar",
     col = "lightblue",
     breaks = 30)

qqnorm(resid(model5), main = "QQ Plot – Artıkların Normalliği")
qqline(resid(model5), col = "red")

# 11. T-TESTLERİ
t_test_gender <- t.test(PV1READ ~ Cinsiyet, data = sample_data)
t_test_school <- t.test(PV1READ ~ OkulTuru, data = sample_data)
print(t_test_gender)
print(t_test_school)
