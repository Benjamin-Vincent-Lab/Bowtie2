# bowtie2_2.3.3.1:1

FROM debian:stretch

USER root

# install tools
# python was needed for bowtie2-build

RUN \
  apt-get update && \
  apt-get install -yq \
    less \
    nano \
    python \
    unzip \
    wget && \
  apt-get clean
  
RUN \
  cd /opt && \
  wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.3.3.1/bowtie2-2.3.3.1-linux-x86_64.zip && \
  unzip bowtie2-2.3.3.1-linux-x86_64.zip && \
  rm bowtie2-2.3.3.1-linux-x86_64.zip && \
  ln -s /opt/bowtie2-2.3.3.1-linux-x86_64/bowtie2 /usr/local/bin && \
  ln -s /opt/bowtie2-2.3.3.1-linux-x86_64/bowtie2-build /usr/local/bin
  
CMD \
  bash -c "bowtie2 --help"
