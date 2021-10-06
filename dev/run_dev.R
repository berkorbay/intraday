# Set options here
options(golem.app.prod = FALSE) # TRUE = production mode, FALSE = development mode

# Detach all loaded packages and clean your environment
golem::detach_all_attached()
# rm(list=ls(all.names = TRUE))

# Document and reload your package
golem::document_and_reload()

devtools::install(".",upgrade="never")

rmarkdown::render(system.file("rmd/intraday_report.Rmd",package="intraday"),output_file = "~/Documents/intraday_report.html")

# Run the application
run_app()
