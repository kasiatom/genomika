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

### Zadanie2 
#### Drzewo filogenetyczne wirusa SARS-CoV-2
Proszę wejść na stronę [nextstrain](https://nextstrain.org/ncov/global) dotyczącą wirusa SARS-CoV-2. 
Proszę obejrzeć animację i rozejrzeć się na stronie, tak aby znaleźć odpowiedzi na poniższe pytania. Pomocne mogą 
okazać się przygotowane przez twórców strony tutoriale 
[*How to interpret the phylogenetic trees*](https://nextstrain.org/help/general/how-to-read-a-tree) 
oraz [*Exploring interactive phylogenies with Auspice*](https://neherlab.org/201901_krisp_auspice.html).
1. Czy wszystkie wirusy SARS-CoV-2 zostały wyizolowane z człowieka? 
2. Jak wirus dotarł do Ameryki Północnej - bezpośrednio z Chin, czy z Europy?
3. Ile kladów wirusa jest wyodrębnionych na stronie, jaka mutacja charakteryzuje najliczniejszy
 klad, jak się ten klad nazywa?
4. Powyższa mutacja dotyczy białka S koronawirusa. 
Proszę przeczytać artykuł [*Structural basis for the recognition of SARS-CoV-2 by full-length human ACE2*](https://science.sciencemag.org/content/367/6485/1444). 
Jaką rolę pełni to białko podczas infekcji? Proszę wypisać, które pozycje tego białka wydają się być 
ważne dla jego funkcji (Fig4, tekst).
5. Proszę teraz sprawdzić, czy opisano mutacje tych pozycji u wirusa SARS-CoV-2. 
Jeśli tak, to proszę je wypisać. Czy ewentualna obecność takich mutacji wskazuje na omyłkę autorów powyższej publikacji (
tj. na to, że wskazane przez nich pozycje białka nie są istotne dla jego funkcji)?
Proszę uzasadnić.
6. Czym różnią się dwie zastosowane na stronie nextstrain miary zmienności danej pozycji wirusa ([*ENTROPY*](https://www.hiv.lanl.gov/content/sequence/ENTROPY/entropy_readme.html) vs *EVENTS*)? 
O czym mogą świadczyć wysokie wartości tych miar obserwowane dla niektórych pozycji w genomie wirusa? 

### Zadanie3
#### Czy wirus z czasem staje się mniej zjadliwy? Czy częściej atakuje mężczyzn? Czy są mutacje ułatwiające infekcję osób młodych?

Proszę o zaplanowanie i przeprowadzenie analiz mających na celu uzyskanie odpowiedzi na **jedno** 
z powyższych (zawartych w tytule) pytań, lub innego interesującego państwa pytania dotyczącego epidemii COVID-19.
Na stronie `http://data.nextstrain.org/ncov_global.json` znajdą państwo dane, które posłużyły do otrzymania
 analizowanego w poprzednim zadaniu drzewa filogenetycznego wirusa (w formacie [json](https://pl.wikipedia.org/wiki/JSON)). Są one podzielone na trzy
  główne części (meta, tree, version). Do analizy danych można (ale nie trzeba) wykorzystać skrypt 
  [ncov-tree-parser.py](https://github.com/genomika-2020/genomika/blob/master/cwiczenia4/ncov-tree-parser.py).
   Skrypt kopiuje rozwiązanie podane 
   tutaj [link](https://towardsdatascience.com/flattening-json-objects-in-python-f5343c794b10).
  Jeśli zdecydują się państwo na użycie skryptu, to wejściowe dane należy przygotować w następujący sposób:
  ```bash
## pobranie pliku z danymi (plik ncov_global.json):
Proszę przejść na stronę http://data.nextstrain.org/ncov_global.json
Po czym wybrać zakładkę "Raw Data" i następnie "save"

## "wycięcie" z pliku cnov_global.json części dotyczącej drzewa filogenetycznego:
cat ncov_global.json | jq .tree > ncov-tree.json

## pobranie skryptu "ncov-tree-parser.py" ze strony ćwiczeń:
wget 'https://github.com/genomika-2020/genomika/raw/master/cwiczenia4/ncov-tree-parser.py' 

## pomoc dla skryptu "ncov-tree-parser.py"
python3 ncov-tree-parser.py --help

## przykładowe użycie skryptu; 
## wynikowy plik to tabela z id szczepu, wiekiem pacjenta i listą mutacji (aa) w kolejnych kolumnach
python3 ncov-tree-parser.py --input ncov-tree.json --output ncov-table.tab --features "age,mutations"
  ``` 
Jeśli nie chcą państwo korzystać z powyższego skryptu, można spróbować przeanalizować dane z użyciem 
programu `jq` (pomoc: `man jq`), lub uzyskać potrzebne dane z innego źródła.   

W ramach rozwiązania tego zadania należy:  
1. Przedstawić i krótko uzasadnić wybrane pytanie badawcze
2. Opisać przeprowadzone analizy (źródło danych, obróbka danych, test statystyczny itp.)  
3. Podać wnioski, do jakich państwo doszli
5. Podać założenia, jakie musieli państwo poczynić, przy analizie danych i interpretacji wyników 
6. Jeśli państwa projekt ma jakieś słabe strony, to proszę zaproponować, jak można by go było ulepszyć   
7. Przygotować krótką prezentację projektu   

Uwaga: To zadanie mogą państwo rozwiązać w zespołach (maksymalnie trzyosobowych).  

***
***
 [Powrót do strony zajęć](https://github.com/genomika-2020/genomika/blob/master/README.md) 
