FROM rocker/shiny-verse:4.1.0
RUN apt-get update && apt-get upgrade -y && apt-get install -y  git-core libcurl4-openssl-dev libgit2-dev libicu-dev libssl-dev libxml2-dev make pandoc pandoc-citeproc pip libavfilter-dev libmagick++-dev
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl')" >> /usr/local/lib/R/etc/Rprofile.site
RUN Rscript -e 'remotes::install_version("config",upgrade="never", version = "0.3")'
RUN Rscript -e 'remotes::install_version("echarts4r",upgrade="never", version = "0.4.0")'
RUN Rscript -e 'remotes::install_version("reactable",upgrade="never", version = "0.2.3")'
RUN Rscript -e 'remotes::install_version("golem",upgrade="never", version = "0.2.1")'
RUN Rscript -e 'remotes::install_version("av",upgrade="never", version = "0.6.0")'
RUN R -e 'remotes::install_github("lbraglia/telegram",upgrade="never", ref = "67dcf9d")'
RUN R -e 'remotes::install_github("jhelvy/xaringanBuilder",upgrade="never",ref="235c8c4")'

RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get install -y python3.9
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 2
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1
RUN pip install pandas argparse requests datetime



