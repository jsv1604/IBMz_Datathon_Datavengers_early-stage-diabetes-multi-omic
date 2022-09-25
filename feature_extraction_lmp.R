library(mixOmics)

L <- read.csv("C:/Users/kavin/OneDrive/Desktop/ibm/Final_Lipidomics.csv")
P <- read.csv("C:/Users/kavin/OneDrive/Desktop/ibm/Reduced_Proteomics.csv")
M <- read.csv("C:/Users/kavin/OneDrive/Desktop/ibm/Reduced_Metabolomics.csv")

res1 <- pca(L)
plotIndiv(res1)
res2 <- pca(P)
plotIndiv(res2)
res3 <- pca(M)
plotIndiv(res3)

working_l <- L[1:174, c(98, 99, 100, 101, 102)]
working_m <- M[1:174, c(16, 20, 85, 19, 106)]
working_p <- P[1:174, c(6, 54, 56, 59, 82)]

X <- list(l = working_l, m = working_m, p = working_p)
Y <- as.factor(L[, c(1)])
res <- block.splsda(X, Y)
cimDiablo(res)

write.csv(c(working_l, working_p, working_m), "C:/Users/kavin/OneDrive/Desktop/ibm/lpm.csv", row.names = FALSE)



