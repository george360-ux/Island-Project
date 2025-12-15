# Island-Project

Deforestation Dynamics on New Britain, Papua New Guinea (2001–2023)
📌 Project Overview

This project examines spatial and temporal patterns of forest loss on New Britain, the largest island in the Bismarck Archipelago of Papua New Guinea, between 2001 and 2023. The analysis focuses on comparing East New Britain and West New Britain provinces using annual, cumulative, and normalized (percentage-based) forest loss metrics.

The project demonstrates the use of R, Quarto, and Shiny to produce professional reports, maps, and interactive web applications for environmental data analysis.

## Objectives

Analyze annual and cumulative forest loss trends on New Britain.

Compare deforestation patterns between East and West New Britain.

Normalize forest loss by baseline forest area to allow fair comparison.

Communicate results using static figures, animated maps, and an interactive Shiny app.

## Data Sources

Global Forest Watch (GFW)
Subnational tree cover loss data (2001–2023), reported annually in hectares.

Humanitarian Data Exchange (HDX)
Administrative boundary shapefiles (ADM1) for Papua New Guinea.

Baseline Forest Extent (Year 2000)
Used to compute normalized (% of forest area) loss metrics.

All datasets are publicly available. Large raw data files (e.g., shapefiles, Excel files, GIFs) are not tracked in this repository due to size constraints and are instead generated locally via code.

## Data Processing Workflow

Forest loss data were filtered to include only East and West New Britain

Data were reshaped to long format and cleaned

Annual forest loss (ha) was computed

Cumulative forest loss was calculated as a running sum

Forest loss was normalized by baseline forest area (%)

Cleaned tabular data were joined with provincial boundary shapefiles

The final spatial dataset was saved as nb_all.rds

This separation ensures fast Shiny app performance, reproducibility, and clean deployment to RStudio Connect

## Shiny Application

The Shiny app provides interactive maps with a year slider and four tabs:

Annual Forest Loss (ha)

Cumulative Forest Loss (ha)

Annual Forest Loss (% of forest area)

Cumulative Forest Loss (% of forest area)

The app loads a preprocessed spatial dataset (nb_all.rds) and does not recompute data during deployment.

## Quarto Report

The Quarto report (report.qmd) includes:

Background and motivation

Description of data sources

Static time-series plots

Static maps

Interpretation of results

Discussion of limitations and future work

Computationally intensive code (e.g., animations) is excluded from re-execution during rendering, and pre-generated figures are included directly.

Software & Packages

Key R packages used include:

Data wrangling: dplyr, tidyr, stringr, readxl

Spatial analysis: sf

Visualization: ggplot2, tmap, leaflet, scales, viridis

Animation: gganimate, gifski

Web applications: shiny

Reporting: quarto

Key Findings (Summary)

West New Britain consistently experienced higher forest loss than East New Britain

Deforestation intensified after approximately 2010

Normalized metrics confirm that differences persist even after accounting for province size

Cumulative metrics highlight long-term environmental change more clearly than annual values

# Error for Deploying Shiny App
installing terra (1.8-86) ... 
curl: HTTP 200 https://cran.rstudio.com/src/contrib/PACKAGES.rds
Error: Command failed (1)

Failed to run system command:

	'/usr/local/lib64/R/bin/R' --vanilla CMD INSTALL --preclean '/opt/rstudio-connect/mnt/tmp/RtmpQSMULb/packrat-install-c90e479fbcd89/terra' --library='/opt/rstudio-connect/mnt/app/packrat/lib/x86_64-pc-linux-gnu/4.5.1' --install-tests --no-docs --no-multiarch --no-demo 

The command failed with output:
* installing *source* package ‘terra’ ...
** this is package ‘terra’ version ‘1.8-86’
** package ‘terra’ successfully unpacked and MD5 sums checked
** using staged installation
configure: CC: gcc
configure: CXX: g++ -std=gnu++17
checking for gdal-config... no
configure: error: gdal-config not found or not executable. 
*** Installing this package from source requires the prior
*** installation of external software, see for details
*** https://rspatial.github.io/terra/
ERROR: configuration failed for package ‘terra’
* removing ‘/opt/rstudio-connect/mnt/app/packrat/lib/x86_64-pc-linux-gnu/4.5.1/terra’

Unable to fully restore the R packages associated with this deployment.
Please review the preceding messages to determine which package
encountered installation difficulty and the cause of the failure.

An error occurred while building your content.
This link offers advice for this kind of error:
    https://docs.posit.co/connect/user/troubleshooting/#r-missing-system-library
Build error: An error occurred while building your content. (Error code: r-missing-system-library)
── Deployment complete ─────────────────────────────────────────────────────────
✖ Deployment failed with error: An error occurred while building your content. (Error code: r-missing-system-library)
