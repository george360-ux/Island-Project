# Island-Project



nstalling terra (1.8-86) ... 
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
