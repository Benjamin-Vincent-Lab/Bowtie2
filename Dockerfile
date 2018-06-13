# bowtie2_2.3.3.1:1

FROM debian:stretch

USER root

# install tools
# python is for bowtie2-build

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

# 
# CMD \
#   bash -c "stig --help"
# /import/git_files/lib/stig \
#   --chr7-filename=$CH7_FILENAME \
#   --chr14-filename=$CH14_FILENAME \
#   --tcell-data=$TCELL_DATA \
#   --repertoire-size=$REPERTOIRE_SIZE \
#   --population-size=$POPULATION_SIZE \
#   --read-type=$READ_TYPE \
#   --sequence-type=$SEQUENCE_TYPE \
#   --sequence-count=$SEQUENCE_COUNT \
#   --read-length-mean=$READ_LENGTH_MEAN \
#   --read-length-sd=$READ_LENGTH_SD \
#   --insert-length-mean=$INSERT_LENGTH_MEAN \
#   --insert-length-sd=$INSERT_LENGTH_SD \

#   --population-distribution=$POPULATION_DISTRIBUTION \
#   --population-chisquare-parameters=$POPULATION_CHISQUARE_PARAMETERS \
#   --receptor-ratio=$RECEPTOR_RATIO \
#   --output=$OUTPUT \
#   $ALLELE_FILES
