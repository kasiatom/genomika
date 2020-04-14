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
2. Czy transmisja między gatunkami jest czymś wyjątkowym? Jaki gatunek był najbardziej
 prawdopodobnie pierwotnym gospodarzem wirusa SARS-CoV? 
 
Jakie jest pochodzenie innych wirusów atakujacych człowieka (HIV, Ebola)?

### Zadanie2 
#### Drzewo filogenetyczne wirusa SARS-CoV-2
Proszę wejść na stronę [nextstrain](https://nextstrain.org/ncov/global) dotyczącą wirusa SARS-CoV-2. 
Proszę obejrzeć animację i rozejrzeć się na stronie, tak aby znaleźć odpowiedzi na poniższe pytania. Pomocne mogą 
okazać sie przygotowane przez tworców strony tutoriale 
[*How to interpret the phylogenetic trees*](https://nextstrain.org/help/general/how-to-read-a-tree) 
oraz [*Exploring interactive phylogenies with Auspice*](https://neherlab.org/201901_krisp_auspice.html).
1. Czy wszystkie wirusy SARS-CoV-2 zostały wyizolowane z człowieka? 
2. Jak wirus dotarł do Ameryki Północnej - bezpośrednio z Chin, czy z Europy?
3. Ile kladów wirusa jest wyodrębnionych na stronie, jaka mutacja charakteryzuje najliczniejszy
 klad, jak się ten klad nazywa?
4. Powyższa mutacja dotyczy białka S koronawirusa. 
Proszę przeczytać artykuł [*Structural basis for the recognition of SARS-CoV-2 by full-length human ACE2*](https://science.sciencemag.org/content/367/6485/1444). 
Jaką rolę pełni to białko podczas infekcji? Proszę wypisać, które pozycje tego białka wydają się być 
ważne dla jego funkcji (Fig4, tekst)
5. Proszę teraz sprawdzić, czy opisano mutacje tych pozycji u wirusa SARS-CoV-2. 
Jeśli tak, to proszę je wypisać. Czy ewentualna obecność takich mutacji wskazuje na omyłkę autorów powyższej publikacji?
Prosze uzasadnić.
6. Czym różnią się dwie zastosowane na stronie nextstrain miary zmienności danej pozycji wirusa (*ENTROPY* vs *EVENTS*)?
O czym mogą świadczyć wysokie warości tych miar obserwowane dla niektórych pozycji w genomie wirusa? 

### Zadanie3
#### Czy wirus z czasem staje się mniej zjadliwy? Czy częściej atakuje mężczyzn? Czy są mutacje ułatwiające infekcję osób młodych?

Na stronie `http://data.nextstrain.org/ncov_global.json` znajdują sie dane, które posłużyły do otrzymania
 analizowanego w poprzednim ćwiczeniu drzewa filogenetycznego wirusa w formacie json. Są one podzielone na trzy
  główne części (meta, tree, version). Proszę pobrać ze strony plik z danymi, a nastepnie "wyciąć" z niego 
  cześć dotyczącą drzewa:
  ```bash
wget http://data.nextstrain.org/ncov_global.json
cat ncov_global.json | jq .tree > ncov-tree.json
  ``` 
Proszę także pobrać ze strony ćwiczeń skrypt ułatwiający parsowanie pliku `ncov-tree.json`
 (program kopiuje rozwiązanie podane tutaj
  [link](https://towardsdatascience.com/flattening-json-objects-in-python-f5343c794b10): 
```bash
wget 'https://github.com/genomika-2020/genomika/raw/master/cwiczenia4/ncov-tree-parser.py' 

## pomoc 
python3 ncov-tree-parser.py --help

## przykładowe użycie: 
## wynikowy plik to tabela z id szczepu, wiekiem pacjenta i listą mutacji (aa) w kolejnych kolumnach
python3 ncov-tree-parser.py --input ncov-tree.json --output ncov-table.tab --features "age,mutations"
```
Proszę spróbować przeanalizować pobrane dane, tak aby odpowiedzieć na **jedno** z powyższych (zawartych w tytule) pytań. 
Proszę opisać przeprowadzone analizy, podać wnioski oraz założenia, jakie musieli państwo poczynić,
przy analizie danych i interpretacji wyników.   
Uwaga: dane można przeanalizować dowolnie, skrypt ncov-tree-parser.py ma państwu ułatwić zadanie i nie trzeba go 
używać.

***
***
 [Powrót do strony zajęć](https://github.com/genomika-2020/genomika/blob/master/README.md) 
