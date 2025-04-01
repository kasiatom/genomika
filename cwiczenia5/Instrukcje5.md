## SARS-CoV-2

Celem ćwiczenia będzie analiza danych dotyczących epidemii COVID-19
SARS-CoV-2.   

### Zadanie1  
#### Drzewo filogenetyczne betakoronawirusów  
Proszę obejrzeć drzewo filogenetyczne betakoronawirusów [link](https://nextstrain.org/groups/blab/sars-like-cov) i odpowiedzieć na następujące pytania:
1. Jak nazywa się wirus najbliżej spokrewniony z wirusem SARS-CoV-2, 
jaki gatunek jest jego gospodarzem (wystarczy nazwa potoczna)? 
Czy jest to już dowód na to, że do transmisji wirusa SARS-CoV-2 na człowieka doszło właśnie z tego gatunku?
Proszę uzasadnić. 
2. Czy transmisja między gatunkami jest czymś wyjątkowym? Jaki gatunek jest gospodarzem wirusów najbliżej spokrewnionych z wirusem SARS-CoV?
 
Jakie jest pochodzenie innych wirusów atakujących człowieka (HIV, Ebola)?

***  
***  
  
### Zadanie2 
#### Drzewo filogenetyczne wirusa SARS-CoV-2
Proszę wejść na stronę [nextstrain](https://nextstrain.org/ncov/global) dotyczącą wirusa SARS-CoV-2. 
Proszę obejrzeć animację i rozejrzeć się na stronie, tak aby znaleźć odpowiedzi na poniższe pytania. Pomocne mogą 
okazać się przygotowane przez twórców strony tutoriale 
[*How to interpret the phylogenetic trees*](https://nextstrain.org/help/general/how-to-read-a-tree) 
oraz [*Exploring interactive phylogenies with Auspice*](https://neherlab.org/201901_krisp_auspice.html).
1. Czy wszystkie wirusy SARS-CoV-2 zostały wyizolowane z człowieka? 
2. Ile kladów wirusa jest wyodrębnionych na stronie, wirusy z ilu kladów występuja obecnie?    
3. Który z genów wirusa cechuje sie najwiekszą zmiennością? Za co odpowiada kodowane przez niego białko? O czym może świadczyć podwyższony poziom zmienności?  
4. Czym różnią się dwie zastosowane na stronie nextstrain miary zmienności danej pozycji wirusa ([*ENTROPY*](https://www.hiv.lanl.gov/content/sequence/ENTROPY/entropy_readme.html) vs *EVENTS*)? 
O czym mogą świadczyć wysokie wartości tych miar obserwowane dla niektórych pozycji w genomie wirusa?

 
***  
***  


### Zadanie3
#### Podatność na ciężki przebieg COVID-19

Czy ryzyko ciężkiego przebiegu zakażenia wirusem SARS-CoV-2 jest związane z jakimiś wariantami
genetycznymi w genomie gospodarza (człowieka)? Odpowiedzi na to pytanie mogą dostarczyć całogenomowe badania asocjacyjne [**GWAS** 
(ang. Genome-Wide Association Study)](https://en.wikipedia.org/wiki/Genome-wide_association_study). Od początku epidemii
badania w kierunku podatności na zakażenie wirusem SARS-CoV-2 były prowadzone przez wiele grup badawczych. 
Wiele z nich zgodziło się dzielić uzyskanymi wynikami w ramach [The COVID-19 Host Genetics Initiative](https://www.covid19hg.org/).

 
1. Proszę na podstawie powyższego opisu w Wikipedii (albo wiedzy ogólnej) opisać własnymi słowami cel i zasadę badań GWAS  
2. Proszę przyjrzeć się wynikom badania [`B1_ALL_leave_23andme`](https://www.covid19hg.org/results/): 
   * Ile osób zostało poddanych tym badaniom. Genotypy jakich grup osób, były tu porównywane?
   * Jak zinterpretować przedstawiony poniżej wykres "Manhattan"? 
     Warianty w ilu regionach były istotnie związane z ciężkim przebiegiem choroby? Zastosowano tutaj bardzo niski próg istotności (pozioma linia na wykresie). Dlaczego?
   * Proszę pobrać odfiltrowany plik z wynikami rozpatrywanego badania (`GRCh38 (filtered)`), pozostawić w nim tylko warianty spełniające próg istotności stosowany zwyczajowo w badaniach GWAS u czlowieka, tj. *5e-08* (wartości w kolumnie 9),
     a następnie dowiedzieć się, czy w zidentyfikowananych obszarach leżą jakieś geny (jakie?). Pomóc może tutaj BioMart i Ensembl.  
   * Jakie jest pochodzenie regionu o najsilniejszej asocjacji? [link](https://www.nature.com/articles/s41586-020-2818-3). 
     Czy obce DNA chroni, czy też zwiększa ryzyko ciężkiego przebiegu choroby? 
   * W jakich populacjach takie DNA występuje, a w jakich nie? Dlaczego? 
     [link](https://en.wikipedia.org/wiki/Neanderthal#Interbreeding_with_modern_humans)
3. Czy jakiekolwiek istotne statystycznie asocjacje (niekoniecznie w badaniu B1_ALL_leave_23andme) znaleziono dla genu ACE2? Proszę poszukać odpowiedzi w omówieniu wyników zamieszczonym      [tutaj](https://www.covid19hg.org/blog/2021-07-30-data-freeze-6-summary/).
   Co to za region/gen?



***
***
 [Powrót do strony zajęć](https://github.com/genomika-2020/genomika/blob/master/README.md) 
