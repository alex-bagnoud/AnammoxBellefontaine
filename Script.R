#### 1) Load the data set into R
    
amx <- read.csv("amx_matrix.csv", header = TRUE)


#### 2) Log-transform abundance data

amx$AMXcopiesNb <- log(amx$AMXcopiesNb + 1)
amx$AOBcopiesNb <- log(amx$AOBcopiesNb + 1)
amx$AOAcopiesNb <- log(amx$AOAcopiesNb + 1)


#### 3) Subset complete data sets from the dataframe (without any NAs)

# Soils 1 to 4:
amx_s1to4 <- amx[, 3:14]

# Soils 2 to 4:
amx_s2to4 <- amx[10:41, c(3:14, 17:25)]

# Soils 1 to 3:
amx_s1to3 <- amx[1:30, 3:16]


#### 4) Correlation between variables

##### Correlation matrix

library(Hmisc)

rcorr(as.matrix(amx[3:25]))


##### Correlation plots

library(corrplot)

# cor.mtest function from:
# http://www.sthda.com/french/wiki/matrice-de-correlation-guide-simple-pour-analyser-formater-et-visualiser

cor.mtest <- function(mat, conf.level = 0.95){
    mat <- as.matrix(mat)
    n <- ncol(mat)
    p.mat <- lowCI.mat <- uppCI.mat <- matrix(NA, n, n)
    diag(p.mat) <- 0
    diag(lowCI.mat) <- diag(uppCI.mat) <- 1
    for(i in 1:(n-1)){
        for(j in (i+1):n){
            tmp <- cor.test(mat[,i], mat[,j], conf.level = conf.level)
            p.mat[i,j] <- p.mat[j,i] <- tmp$p.value
            lowCI.mat[i,j] <- lowCI.mat[j,i] <- tmp$conf.int[1]
            uppCI.mat[i,j] <- uppCI.mat[j,i] <- tmp$conf.int[2]
        }
    }
    return(list(p.mat, lowCI.mat, uppCI.mat))
}

# Soils 1 to 4 (n = 41):
mcor_s1to4 <- cor(amx_s1to4, method = c("pearson"))
res_s1to4 <- cor.mtest(amx_s1to4,0.99)
corrplot(mcor_s1to4, p.mat = res_s1to4[[1]], sig.level=0.05, addrect=6, tl.cex=1)

# Soils 2 to 4 (n = 32):
mcor_s2to4 <- cor(amx_s2to4, method = c("pearson"))
res_s2to4 <- cor.mtest(amx_s2to4,0.99)
corrplot(mcor_s2to4, p.mat = res_s2to4[[1]], sig.level=0.05, addrect=6, tl.cex=1)

# Soils 1 to 3 (n = 30):
mcor_s1to3 <- cor(amx_s1to3, method = c("pearson"))
res_s1to3 <- cor.mtest(amx_s1to3,0.99)
corrplot(mcor_s1to3, p.mat = res_s1to3[[1]], sig.level=0.05, addrect=6, tl.cex=1)


#### 5) Fitting a generalized linear model (GLM) without interactions

# With DaysBelowWaterTable:
amx.glm1 <- glm(AMXpresence~DaysBelowWaterTable,data=amx_s1to4,family=binomial)
summary(amx.glm1)

# With pHSoil:
amx.glm2 <- glm(AMXpresence~pHSoil,data=amx_s1to4,family=binomial)
summary(amx.glm2)

# With N:
amx.glm3 <- glm(AMXpresence~N,data=amx_s1to4,family=binomial)
summary(amx.glm3)


#### 6) Fitting a generalized linear model (GLM) with interactions

library(arm)

# DaysBelowWaterTable and pHSoil:
amx.glm4 <- bayesglm(AMXpresence~DaysBelowWaterTable*pHSoil,data=amx_s1to4,family=binomial)
summary(amx.glm4)

# DaysBelowWaterTable and N:
amx.glm5 <- bayesglm(AMXpresence~DaysBelowWaterTable*N,data=amx_s1to4,family=binomial)
summary(amx.glm5)

# pHSoil and N:
amx.glm6 <- bayesglm(AMXpresence~pHSoil*N,data=amx_s1to4,family=binomial)
summary(amx.glm6)


#### 7) Improving ```amx.glm1``` by considering interactions with other variables.

# DaysBelowWaterTable and avNH4Water:
amx.glm7 <- bayesglm(AMXpresence~DaysBelowWaterTable*avNH4Water,data=amx_s2to4,family=binomial)
summary(amx.glm7)

# DaysBelowWaterTable and avFeIIIWater:
amx.glm8 <- bayesglm(AMXpresence~DaysBelowWaterTable*avFeIIIWater,data=amx_s2to4,family=binomial)
summary(amx.glm8)

# DaysBelowWaterTable and avSIIWater:
amx.glm9 <- bayesglm(AMXpresence~DaysBelowWaterTable*avSIIWater,data=amx_s2to4,family=binomial)
summary(amx.glm9)

# DaysBelowWaterTable and NH4Soil:
amx.glm10 <- bayesglm(AMXpresence~DaysBelowWaterTable*NH4Soil,data=amx_s1to3,family=binomial)
summary(amx.glm10)

# DaysBelowWaterTable and avNO3Water:
amx.glm11 <- bayesglm(AMXpresence~DaysBelowWaterTable*avNO3Water,data=amx_s2to4,family=binomial)
summary(amx.glm11)


#### 8) Improving ```amx.glm2``` by considering interactions with other variables.

# pHSoil and avNH4Water:
amx.glm12 <- bayesglm(AMXpresence~pHSoil*avNH4Water,data=amx_s2to4,family=binomial)
summary(amx.glm12)

# pHSoil and avFeIIIWater:
amx.glm13 <- bayesglm(AMXpresence~pHSoil*avFeIIIWater,data=amx_s2to4,family=binomial)
summary(amx.glm13)

# pHSoil and avSIIWater:
amx.glm14 <- bayesglm(AMXpresence~pHSoil*avSIIWater,data=amx_s2to4,family=binomial)
summary(amx.glm14)

# pHSoil and NH4Soil:
amx.glm15 <- bayesglm(AMXpresence~pHSoil*NH4Soil,data=amx_s1to3,family=binomial)
summary(amx.glm15)

# pHSoil and avNO3Water:
amx.glm16 <- bayesglm(AMXpresence~pHSoil*avNO3Water,data=amx_s2to4,family=binomial)
summary(amx.glm16)


#### 9) Improving ```amx.glm3``` by considering interactions with other variables.

# N and avNH4Water:
amx.glm17 <- bayesglm(AMXpresence~N*avNH4Water,data=amx_s2to4,family=binomial)
summary(amx.glm17)

# N and avFeIIIWater:
amx.glm18 <- bayesglm(AMXpresence~N*avFeIIIWater,data=amx_s2to4,family=binomial)
summary(amx.glm18)

# N and avSIIWater:
amx.glm19 <- bayesglm(AMXpresence~N*avSIIWater,data=amx_s2to4,family=binomial)
summary(amx.glm19)

# N and NH4Soil:
amx.glm20 <- bayesglm(AMXpresence~N*NH4Soil,data=amx_s1to3,family=binomial)
summary(amx.glm20)

# N and avNO3Water:
amx.glm21 <- bayesglm(AMXpresence~N*avNO3Water,data=amx_s2to4,family=binomial)
summary(amx.glm21)


#### 10) Which GLM is the best?

# DaysBelowWaterTable and avNO3Water:
amx.glm11 <- bayesglm(AMXpresence~DaysBelowWaterTable*avNO3Water,data=amx_s2to4,family=binomial)
summary(amx.glm11)
coefficients(amx.glm11)
plot(amx_s2to4$AMXpresence, amx.glm11$fitted.values)

# pHSoil and avNO3Water:
amx.glm16 <- bayesglm(AMXpresence~pHSoil*avNO3Water,data=amx_s2to4,family=binomial)
summary(amx.glm16)
plot(amx_s2to4$AMXpresence, amx.glm16$fitted.values)

# DaysBelowWaterTable and avNO3Water:
amx.glm22 <- glm(AMXcopiesNb~DaysBelowWaterTable*avNO3Water,data=amx_s2to4,family=poisson)
summary(amx.glm22)
plot(amx_s2to4$AMXcopiesNb, amx.glm22$fitted.values)

# pHSoil and avNO3Water:
amx.glm23 <- glm(AMXcopiesNb~pHSoil*avNO3Water,data=amx_s2to4,family=poisson)
summary(amx.glm23)
plot(amx_s2to4$AMXcopiesNb, amx.glm23$fitted.values)

plot(amx$DaysBelowWaterTable, amx$pHSoil)

plot(amx_s2to4$pHSoil, amx_s2to4$avNH4Water)
plot(amx_s2to4$pHSoil, amx_s2to4$avNO3Water)

# AMXpresence with avNH4Water and avNO3Water:
amx.glm24 <- bayesglm(AMXpresence~avNH4Water*avNO3Water,data=amx_s2to4,family=binomial)
summary(amx.glm24)

# AMXcopiesNb withavNH4Water and avNO3Water:
amx.glm25 <- bayesglm(AMXcopiesNb~avNH4Water*avNO3Water,data=amx_s2to4,family=poisson)
summary(amx.glm25)

#### 11) Generalized linear mixed model (GLMM)

library(glmm)

# avNO3Water:
amx.glmm1 <- glmm(AMXpresence ~ 0 + avNO3Water,
                  random = list(AMXpresence ~ 0 + amx$Soil[10:41]), data = amx_s2to4, family.glmm=binomial.glmm,
                  varcomps.names = c("Soil"), m = 10^5)
summary(amx.glmm1)

# DaysBelowWaterTable:
amx.glmm2 <- glmm(AMXpresence ~ 0 + DaysBelowWaterTable,
                  random = list(AMXpresence ~ 0 + Soil), data=amx, family.glmm=binomial.glmm,
                  varcomps.names = c("Soil"), m = 10^5)
summary(amx.glmm2)

# DaysBelowWaterTable and avNO3Water:
amx.glmm3 <- glmm(AMXpresence ~ 0 + avNO3Water:DaysBelowWaterTable,
                  random = list(AMXpresence ~ 0 + amx$Soil[10:41]), data=amx_s2to4, family.glmm=binomial.glmm,
                  varcomps.names = c("Soil"), m = 10^5)
summary(amx.glmm3)
