# Read data from the command line argument
data <- read.table(commandArgs(trailingOnly=TRUE)[1], header = FALSE, col.names = c("PHRED"))

# Check the structure of the loaded data
str(data)

# Ensure the data has the expected structure
if (ncol(data) == 1 && all(colnames(data) %in% c("PHRED"))) {
  # Summary statistics of PHRED qualities
  summary_stats <- summary(data$PHRED)

  # Print summary statistics
  cat("Summary Statistics of PHRED Qualities:\n")
  print(summary_stats)

  # Plot histogram of PHRED qualities
  pdf("phred_qualities_histogram.pdf")
  hist(data$PHRED, breaks = 30, col = "skyblue", xlab = "PHRED Quality", main = "Distribution of PHRED Qualities")
  dev.off()
} else {
  cat("Error: Data does not have the expected structure.\n")
}
