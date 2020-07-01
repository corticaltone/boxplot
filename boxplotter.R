# Libraries
library(tidyverse)
library(hrbrthemes)
library(viridis)


chart <- read.csv("MassSpecOL.csv", sep = ",")
row.names(chart) <- chart[,1]
chart <- chart[1:8, 2:10]
# create a dataset
data <- data.frame(
  gene=c( rep("EEF1A",9), rep("HSPA5",9), rep("PKM",9), rep("HSPA8",9)),
  value=c( chart[1,], chart[2,], chart[3,], chart[4,1])
)

# Plot
chart %>%
  ggplot( aes(x=row.names(chart), y=chart, fill=row.names(chart))) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("A boxplot with jitter") +
  xlab("")

# library
library(ggplot2)

# create a data frame
gene=c( rep("EEF1A",9), rep("HSPA5",9), rep("PKM",9), rep("HSPA8",9))
treatment = rep(c("Young","Young", "Young", "Young", "Old", "Old", "Old", "Old", "Old"),4)
EEF1A <- as.numeric(chart[1,])
HSPA5 <- as.numeric(chart[2,])
PKM <- as.numeric(chart[3,])
HSPA8 <- as.numeric(chart[4,])

note <- c(EEF1A, HSPA5, PKM, HSPA8)
data=data.frame(gene, treatment ,  note)

# grouped boxplot
ggplot(data, aes(x=gene, y=note, fill=treatment)) + 
  geom_boxplot()

data %>%
  ggplot( aes(x=gene, y=note, fill=treatment)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme_ipsum() +
  theme(
    plot.title = element_text(size=11)
  ) +
  ggtitle("MassSpecIntensities-CortexGenes") +
  xlab("")


CST3 <- as.numeric(chart[5,])
IGFBP2 <- as.numeric(chart[6,])
CPE <- as.numeric(chart[7,])
SPARCL1 <- as.numeric(chart[8,])



note1 <- c(CST3, SPARCL1)
note2 <- c(IGFBP2, CPE)

gene1=c( rep("CST3",9), rep("SPARC1",9))
gene2=c(rep("IGFBP2",9), rep("CPE",9))

treatment = rep(c("Young","Young", "Young", "Young", "Old", "Old", "Old", "Old", "Old"),2)

data=data.frame(gene1, treatment ,  note1)


ggplot(data, aes(x=gene1, y=note1, fill=treatment)) + 
  geom_boxplot()

data %>%
  ggplot( aes(x=gene1, y=note1, fill=treatment)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  geom_jitter(color="black", size=0, alpha=1.2) +
  theme_ipsum() +
  theme(
    plot.title = element_text(size=11)
  ) +
  ggtitle("MassSpecIntensities-HippSVZGenes") +
  xlab("")

data=data.frame(gene1, treatment ,  note1)


ggplot(data, aes(x=gene1, y=note1, fill=treatment)) + 
  geom_boxplot()

data %>%
  ggplot( aes(x=gene2, y=note2, fill=treatment)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  geom_jitter(color="black", size=0, alpha=1.2) +
  theme_ipsum() +
  theme(
    plot.title = element_text(size=11)
  ) +
  ggtitle("MassSpecIntensities-HippSVZGenes") +
  xlab("")
