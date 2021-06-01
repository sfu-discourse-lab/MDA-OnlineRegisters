# MDA-OnlineRegisters

#### Supplementary materials for: Characterising online news comments: a multi-dimensional cruise through online registers (version 1.0)


[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4885180.svg)](https://doi.org/10.5281/zenodo.4885180)


### Description

This repository comprises the data, scripts for conducting a multi-dimensional analysis of online news comments and other web registers, as well as comprehensive statistical material as described in 

* Ehret, Katharina, and Maite Taboada. (accepted). “Characterising online news comments: a multi-dimensional cruise through online registers”. _Frontiers in Artificial Intelligence_.

The paper presents a text-linguistic study of the characteristics of online news comments in comparison to other online registers. Online news comments are rather understudied, yet, there has been a sence among researchers and journalists alike that they are like conversation.  A recent article, which compared online news comments to face-to-face conversation and other traditional registers, established that online news comments are best described as instances of written evaluative and argumentative discourse ([Ehret and Taboada 2020](https://www.jbe-platform.com/content/journals/10.1075/rs.19012.ehr)). As a natural next step, the related paper describes the linguistic properties of online news comments in the context of other online registers such as travel blog, personal blog or interactive discussion. 

The dataset published in this repository orginates from the [*Simon Fraser University Opinion and Comments Corpus*](https://github.com/sfu-discourse-lab/SOCC)  (SOCC) and the [*Corpus of Online Registers of English*](https://www.english-corpora.org/core/) (CORE). The corpus data was annotated with parts-of-speech tags using the Multidimensional Analysis Tagger and all tags were automatically retrieved with a custom-written python script (available here https://github.com/sfu-discourse-lab/MDA_project).  See the related publication for details on the dataset and methodology.

### File description and overview

* eigenvalues.csv

This csv contains the unrotated eigenvalues which were calculated based on the correlation matrix of normalised feature frequencies.

* factor_analysis.r

The r script containing the commands for conducting factor analysis (multi-dimensional analysis) and other statistics as described in the related publication. 

* factorScores.csv

This csv contains the factor scores of a three factor solution for each of the individual texts in the dataset. The first column contains the file names.

* loadings.csv

The feature loadings of each linguistic feature on each factor in the three factor solution. The first column lists the feature tags (see POS-tag_description.csv, for a description of the features). Loadings were rounded to three decimal places.

* meanFactorScores.csv

A csv containing the mean factor scores for each register in the dataset. The mean factor scores were calculated based on the factor scores of the individual texts in the dataset. Mean factor scores are essentially an average across all texts belonging to one register.

* normalized_postag_counts.csv

This csv contains normalised feature frequencies of 67 lexico-grammatical features (see postag_description) which were automatically retrieved from each text in the dataset. The frequencies were normalised per 1000 word tokens. This csv serves as input for the factor analysis. The file is zipped, because it is rather large.

* postag_counts.csv

This csv contains the raw feature frequencies of 67 lexico-grammatical features (see postag_description) which were automatically retrieved from each text in the dataset.

* postag_description.csv

A list of 67 lexico-grammatical features. The first column provides the part-of-speech tag, the second column gives a brief description of the feature.

* register_labels.csv

A csv file containing all register labels of the analysed registers: the original label used in CORE, the CORE file prefix, a long label which is used in graphs and tables throughout the related publication, and a short label which is used in csv files. 

* sd_meanFactorScores.csv

The standard deviation of the mean factor scores per register. 

* texts_by_register.csv

A list of all individual texts (first column) and information on their register (second column). Note that short register labels are used.




