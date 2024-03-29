
## Instalacja bez uprawnien administratora  
1. Na serwerze zainstalowana jest [conda](https://docs.conda.io/projects/conda/en/stable/commands/index.html).  
 Każdy użytkownik może dla własnego użytku zainstalować sobie popularne programy bioinformatyczne lub moduły programu python. W tym celu należy stworzyć nowe środowisko, zaktywizować je i zainstlować w nim odpowiednie programy/moduły. Przykładowe komendy:

   ```bash
   ## stworzenie nowego środowiska
   conda create --name dowolna_nazwa
   ## aktywacja
   conda activate dowolna_nazwa
   ## instalacja modułu pysam (python)   
   conda install pysam
   ```
   Po skończeniu pracy mozna opuścić stworzone środowisko wpisując:
   ```bash
   conda deactivate
   ```  
   Uwaga: w dystrybucji condy nie zawsze (czy raczej rzadko) dostępne są najnowsze wersje programów/modułów.  

2. Jeśli dany moduł pythona nie ma dystrybucji dla condy (tak jest np. w przypadku `biopymart`) można wykorzystać moduł [venv](https://docs.python.org/3/library/venv.html#creating-virtual-environments). Podobnie, jak w przypadku condy, należy stworzyć środowisko wirtualne, zaktywizować je i zaistalować w nim odpowiedni moduł. Przykładowe komendy:  
   ```bash
   ## stworzenie środowiska wirtualnego (w bieżącym katalogu)
   python3 -m venv dowolna_nazwa
   ## aktywacja
   source dowolna_nazwa/bin/activate
   ## instalacja modułu pybiomart (z użyciem pip)
   pip3 install pybiomart
   ```
   Po zakończeniu pracy środowisko można "wyłączyć" wpisując:
   ```bash
   source ~/.bashrc
   ```
3. Pakiety R można zainstalować w następujący sposób (trwa to dość długo) - tutaj na przykładzie tych potrzebnych do dzialania skryptu `cw1.R`:  
   ```bash
   ## otwarcie R (zatwierdzenie Enter)
   R
   
   ## instalacja pakietów - program poprosi o zatwierdzenie lokalizacji pakietów - prosze dwa razy wpisać yes
   install.packages(c("stringr", "tidyr", "BiocManager", "argparse", "devtools"), dependiencies = TRUE)

   ## instalowanie dplyr (specyficznej wersji wymaganej przez biomaRt) 
   devtools::install_version("dbplyr", version = "2.3.4") 

   ## instalowanie biomaRt
   BiocManager::install("biomaRt")

   ## opuszczenie R
   q()
    
   ```


