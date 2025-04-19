# ====================================
# PISA 2022 T??rkiye Verisi Analizi (Temizlenmi?? S??r??m)
# ====================================

# 1. GEREKL?? K??T??PHANELER
library(haven)
library(dplyr)
library(ggplot2)
library(corrplot)
library(sampling)

# 2. VER??N??N Y??KLENMES??
file_path <- file.choose()  # Dosya se??me penceresi
pisa_data <- read_sav(file_path)

# 3. T??RK??YE VER??S??N??N F??LTRELENMES??
turkey_data <- pisa_data %>% filter(CNT == "TUR")

# 4. SE????LEN DE??????KENLER??N BEL??RLENMES??
turkey_selected <- turkey_data %>%
  select(PV1READ, ST004D01T, ST005Q01JA, ST006Q01JA, ST006Q02JA, ST022Q01TA, STRATUM,
         BELONG, FEELSAFE, ANXMAT, FEELLAH)

# 5. TABAKALI ??RNEKLEME UYGULAMASI
cleaned_data <- turkey_selected %>%
  filter(!is.na(ST004D01T), !is.na(ST022Q01TA)) %>%
  mutate(stratum = interaction(ST004D01T, ST022Q01TA))

set.seed(123)
orneklem_plan <- strata(cleaned_data, stratanames = "stratum", 
                        size = rep(30, length(unique(cleaned_data$stratum))), 
                        method = "srswor")
sample_data <- getdata(cleaned_data, orneklem_plan)

# 6. DE??????KEN D??N??????MLER??
sample_data <- sample_data %>%
  mutate(
    KitapSayisi = 6 - ST005Q01JA,  # Ters kodlama
    Cinsiyet = factor(ST004D01T, labels = c("Erkek", "K??z")),
    OkulTuru = factor(ST022Q01TA, labels = c("Genel", "Meslek"))
  )

# 7. KORELASYON MATR??S??
numeric_data <- sample_data %>%
  select(PV1READ, ST005Q01JA, ST006Q01JA, ST006Q02JA) %>%
  na.omit()
cor_matrix <- cor(numeric_data)
corrplot(cor_matrix, method = "color", type = "upper", tl.col = "black", addCoef.col = "black")

# 8. REGRESYON MODELLER??
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

# 9. G??RSELLE??T??RMELER
## a) Kitap say??s?? ile okuma ba??ar??s??
ggplot(sample_data, aes(x = KitapSayisi, y = PV1READ)) +
  geom_point(alpha = 0.3, color = "darkblue") +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "Kitap Say??s?? ile Okuma Ba??ar??s?? Aras??ndaki ??li??ki",
       x = "Kitap Say??s?? (Ters Kodlanm????)",
       y = "Okuma Ba??ar?? Puan?? (PV1READ)") +
  theme_minimal()

## b) Cinsiyete g??re da????l??m
ggplot(sample_data, aes(x = Cinsiyet, y = PV1READ, fill = Cinsiyet)) +
  geom_boxplot() +
  labs(title = "Cinsiyete G??re Okuma Ba??ar??s?? Da????l??m??",
       x = "Cinsiyet", y = "Okuma Ba??ar?? Puan??") +
  theme_minimal()

## c) Okul t??r??ne g??re da????l??m
ggplot(sample_data, aes(x = OkulTuru, y = PV1READ, fill = OkulTuru)) +
  geom_boxplot() +
  labs(title = "Okul T??r??ne G??re Okuma Ba??ar??s??",
       x = "Okul T??r??", y = "Okuma Puan??") +
  theme_minimal()

## d) Aidiyet ve ba??ar?? ili??kisi
ggplot(sample_data, aes(x = BELONG, y = PV1READ)) +
  geom_point(alpha = 0.3, color = "darkgreen") +
  geom_smooth(method = "lm", se = TRUE, color = "firebrick") +
  labs(title = "Aidiyet Duygusu ile Okuma Ba??ar??s?? ??li??kisi",
       x = "Aidiyet Skoru (BELONG)", y = "Okuma Puan??") +
  theme_minimal()

# 10. MODEL ARTIK ANAL??Z??
plot(model5$fitted.values, resid(model5),
     xlab = "Tahmin Edilen De??erler (??)",
     ylab = "Art??klar (Residuals)",
     main = "Tahmin Edilen De??ere Kar???? Art??klar")
abline(h = 0, col = "red")

hist(resid(model5),
     main = "Art??klar??n Histogram??",
     xlab = "Art??klar",
     col = "lightblue",
     breaks = 30)

qqnorm(resid(model5), main = "QQ Plot ??? Art??klar??n Normalli??i")
qqline(resid(model5), col = "red")

# 11. T-TESTLER??
t_test_gender <- t.test(PV1READ ~ Cinsiyet, data = sample_data)
t_test_school <- t.test(PV1READ ~ OkulTuru, data = sample_data)
print(t_test_gender)
print(t_test_school)