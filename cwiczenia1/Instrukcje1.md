## Ensembl  

### Zadanie1 
Proszę otworzyć stronę [Ensembl](https://www.ensembl.org/index.html) i rozejrzeć się. Informacje o jakich gatunkach są tutaj zawarte? 
Jaki typ danych można tu znaleźć? 
  
Proszę zauważyć, że dane dotyczące wielu pozostałych gatunków można uzyskać, korzystając z podobnie zorganizowanych "stron siostrzanych":
 [Ensembl Bacteria](http://bacteria.ensembl.org/index.html), [Ensembl Protists](http://protists.ensembl.org/index.html), 
 [Ensembl Fungi](http://fungi.ensembl.org/index.html), [Ensembl Plants](http://plants.ensembl.org/index.html) oraz 
 [Ensembl Metazoa](http://metazoa.ensembl.org/index.html). Proszę o obejrzenie jednej z nich.    

***
***

### Zadanie2 
##### Wyszukiwanie informacji dla jednego genu (na przykładzie *BRCA1*)
Proszę o wyszukanie następujących informacji o ludzkim genie *BRCA1*:  
 1. Położenie genu (chromosom, początek, koniec, nić)  
 2. Ile transkryptów jest znanych dla tego genu? Jaki proces doprowadza do powstawania różnych transkryptów? 
 Ile z nich koduje białko? Proszę przeczytać opis kategorii transkryptów
  [link](https://www.ensembl.org/info/genome/genebuild/transcript_quality_tags.html#tsl). Jak oznaczane są transkrypty o 
  największym znaczeniu biologicznym według różnych klasyfikacji (MANE, TSL, APRIS, GENCODE)? Który z transkryptów genu *BRCA1* uznaliby
   państwo za podstawowy?
 3. Proszę pooglądać, jak transkrypty przedstawione są w zakładce *Location*   
 4. Ile aminokwasów wchodzi w skład białka powstającego w wyniku translacji transkryptu **BRCA1-203**?
 5. Ile eksonów wchodzi w skład tego transkryptu? W którym eksonie położony jest kodon start? Czy zawsze tak jest - 
 proszę sprawdzić na przykładzie innych genów/transkryptów.  
 6. Proszę wyjaśnić, co to jest "faza" początku i końca eksonu. Czy w wyniku translacji transkryptu, który nie zawierałby 5 eksonu, 
 powstałoby funkcjonalne białko? Dlaczego?   
  Podpowiedź na obrazku *Kolkman, J., Stemmer, W. Directed evolution of proteins by exon shuffling. Nat Biotechnol 19, 423–428 (2001).*:    
   ![](faza-eksonow.png)
 7. Jaką funkcję molekularną pełni białko BRCA1? (**GO: Molecular function**)
 8. W jakich miejscach gen *BRCA1* ulega najwyższej ekspresji (według Genotype-Tissue Expression **GTEx**)? W jakiej części mózgu gen ten jest eksprymowany?

W znalezieniu powyższych informacji mogą pomóc załączone ryciny [informacje na poziomie genu](https://github.com/genomika-2020/genomika/blob/master/cwiczenia1/gene-level.png), [informacje na poziomie transkryptu](https://github.com/genomika-2020/genomika/blob/master/cwiczenia1/transcript-level.png)  
  
***
***
  
 ### Zadanie3
Ze strony Ensembl można także wygodnie pozyskać informacje dotyczące większej ilości genów/białek/regionów na raz, z 
wykorzystaniem narzędzia **BioMart**. W tym ćwiczeniu użyją państwo tego narzędzia, aby sprawdzić, czy w czasie niezależnej 
ewolucji białek ludzkich i mysich dochodziło do tasowania domen. Inaczej mówiąc, porównają państwo skład domen wchodzących w skład 
białek człowieka i ich mysich ortologów i policzą przypadki, gdy jakaś domena jest obecna u jednego gatunku, a nie ma jej u drugiego.    
  
 Zadanie to można podzielić na następujące etapy:  
  1. Pozyskanie listy identyfikatorów wszystkich genów kodujących białka u człowieka i odpowiadających im mysich ortologów. 
  Do listy tej dodatkowo należy dodać informację o rodzaju ortologii.  
  2. Pozyskanie listy nazw domen (według klasyfikacji [Pfam](https://pfam.xfam.org/)) dla wszystkich białek człowieka i myszy
  3. Połączenie i odfiltrowanie powyższych list, tak aby wybrać identyfikatory genów mających odmienny skałd domen oraz nazwy domen 
  występujących tylko u jednego gatunku. Uwaga, dla potrzeb ćwiczenia przyjmiemy, że jeśli ludzki gen ma domeny A, A i B, 
  a jego mysi odpowiednik A i B, to skład domen się nie zmienił. Interesować nas będą przypadki, 
   A, B, C vs A, B oraz A, B vs A, B, C.   
  4. Wyliczenie prostych statystyk: jak często pojawiły się unikatowe domeny na gałęzi prowadzącej od wspólnego przodka 
  obu gatunków do człowieka, a jak często na gałęzi mysiej. Czy typ homologii ("one to one" vs "one to many"), 
  a tym samym duplikacje genów, wpłynęły na częstość zmian składu domen? 

***

##### AD1. Jak korzystać z narzędzia BioMart, by uzyskać listę ortologów
 * Proszę kliknąć w zakładkę **BioMart** (na górze strony) 
 * Proszę następnie wybrać bazę danych **Ensembl Genes 111** (111 to wersja bazy danych, baza jest uaktualniana dość często -
  zazwyczaj dwa razy w roku). Proszę spojrzeć jakie inne bazy danych są udostępnione.    
 * Proszę teraz wybrać zakres danych (**Human Genes GRCh38.p14**). Co oznacza skrót GRCh38.p14? 
 * Po lewej stronie pojawił się teraz pasek z filtrami oraz atrybutami do wyboru.
   * Ustawienie filtrów (tutaj zawężamy zakres danych, w naszym przykładzie chcemy wybrać tylko geny kodujące białko)  
    `Filters => GENE => Gene type => protein_coding`   
   * Ustawienie atrybutów (tutaj można ustalić, jakie informacje chcemy uzyskać, w naszym przykładzie to ID genu ludzkiego, 
   ID jego mysiego ortologa oraz informacje o rodzaju homologii)  
      ```
      Attributes => Homologues (Max select 6 orthologues)   
                   => GENE => Gene stable ID (proszę odkliknąć pozostałe wybrane automatycznie atrybuty)  
                   => ORTHOLOGUES [K-O] => Mouse Orthologues => Mouse gene stable ID  oraz Mouse homology type
      ```
 * Teraz można powrócić na górę strony i kliknąć przycisk **Results**. Pojawi się tabelka z trzema kolumnami. Aby zapisać pełną tabelę do 
 pliku, można wybrać:  
 *Export result as* => *File* => *TSV* => *Go* (proszę też zaznaczyć opcję *Unique results only*). Pobrany plik proszę zapisać na dysku i 
 nadać mu jakąś sensowną nazwę. Plik proszę następnie przenieść na swoje konto na serwerze wykorzystując [scp](https://github.com/genomika-2020/genomika/blob/master/README.md#przenoszenie-plików-na-serwer) lub
  [WinSCP](https://github.com/genomika-2020/genomika/blob/master/README.md#przenoszenie-plików-na-serwer).    
  Alternatywnie plik można pobrać bezpośrednio na serwer. W tym celu należy wybrać opcję: **XML** (na górze strony) -
   wybrane atrybuty i filtry zostaną wtedy przetłumaczone na zapytanie xml.
    Należy je wyedytować, tak aby całość zapisać w jednej linii, po czym użyć programu *wget* lub *curl* do 
   pobrania pliku z wynikami.  
   Tutaj dokładne instrukcje [link](https://www.ensembl.org/info/data/biomart/biomart_restful.html). 
   W naszym przypadku będzie to:
   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE Query>
   <Query  virtualSchemaName = "default" formatter = "TSV" header = "0" uniqueRows = "0" count = "" datasetConfigVersion = "0.6" >
			
	    <Dataset name = "hsapiens_gene_ensembl" interface = "default" >
		    <Filter name = "biotype" value = "protein_coding"/>
		    <Attribute name = "ensembl_gene_id" />
		    <Attribute name = "mmusculus_homolog_ensembl_gene" />
		    <Attribute name = "mmusculus_homolog_orthology_type" />
	    </Dataset>
   </Query>
   ```  
   Komenda do pobrania pliku (wynikowy plik będzie nazywał się *results.txt* - można zmienić):
    ```bash
    wget -O result.txt 'http://www.ensembl.org/biomart/martservice?query=<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE Query><Query  virtualSchemaName = "default" formatter = "TSV" header = "0" uniqueRows = "0" count = "" datasetConfigVersion = "0.6" > <Dataset name = "hsapiens_gene_ensembl" interface = "default" ><Filter name = "biotype" value = "protein_coding"/><Attribute name = "ensembl_gene_id" /><Attribute name = "mmusculus_homolog_ensembl_gene" /><Attribute name = "mmusculus_homolog_orthology_type" /></Dataset></Query>'
   ```
 *  Pobrany plik ma 28090 linii z danymi, niektóre z nich nie mają wpisu w kolumnach 2 i 3 (geny bez mysich ortologów).
  Przed dalszą analizą proszę o odfiltrowanie takich linii, proszę też o usunięcie nagłówka i zapisanie do dwóch osobnych plików danych dotyczących 
  ortologów "one to one" i "one to many". Można to zrobić z wykorzystaniem *awk* (lub w dowolny wymyślony przez siebie sposób):  
    ```bash
    awk '$1 ~ "ENS" && $3 ~ "one2one" ' result.txt  > one2one-homologs.txt     ##kolumna pierwsza zawiera tekst "ENS" i kolumna 3 zawiera tekst "one2one" 
    awk  '$1 ~ "ENS" && $3 ~ "one2many" ' result.txt > one2many-homologs.txt   ##kolumna pierwsza zawiera tekst "ENS" i kolumna 3 zawiera tekst "one2many" 
    ```
***

 ##### AD2. Wyszukiwanie danych o domenach
 Proszę w podobny sposób pobrać dane o składzie domen białek mysich i ludzkich. 
 W filtrach proszę ponownie wybrać opcję:  
  `Filters => GENE => Gene type => protein_coding`
 Natomiast jako atrybuty proszę zaznaczyć:  
 ```
  Attributes => Features
         => GENE => Gene stable ID (ponownie proszę o usuniecie pozostałych zaznaczonych automatycznie atrybutów)
         => PROTEIN DOMAINS AND FAMILIES => Domains => Pfam ID 
``` 
Proszę pamiętać, aby zmienić zakres danych na **Mouse genes GRCm39** 
przy pobieraniu danych o domenach w białkach mysich. Powinni państwo uzyskać dwa pliki z ID genu w pierwszej kolumnie i ID domeny w drugiej.
Proszę ponownie usunąć linie z pustą drugą kolumną oraz linie nagłówka. 

***  
  ##### AD3. Połączenie list i wybranie odpowiednich danych
   Proszę przeanalizować otrzymane i odfiltrowane pliki, tak aby uzyskać listę genów mysich i ludzkich,
   w których występuje domena nieobecna w białku ortologicznym z drugiego gatunku oraz id tej domeny.
    Mogą państwo zastosować dowolny sposób analizy.
   Można także wykorzystać poniższe polecenie (działające jednak dość wolno):
   ```bash
     printf "human gene\thuman only domain\tmouse gene\tmouse only domain\n" >> wynik-one2one.txt
     while read f; do \
              human=$( echo $f | cut -f1 -d ' ' ); \
              mouse=$( echo $f | cut -f2 -d ' ' ); \
              awk -v human=$human '$1 == human {print $2}' human-domains.txt | sort | uniq > human-tmp.txt ; \
              awk -v mouse=$mouse '$1 == mouse {print $2}' mouse-domains.txt | sort | uniq > mouse-tmp.txt; \
              human_only=$( grep -v -w -f mouse-tmp.txt human-tmp.txt | tr '\n' ';' | sed 's/;$//' ); \
              mouse_only=$( grep -v -w -f human-tmp.txt mouse-tmp.txt | tr '\n' ';' | sed 's/;$//' ); \
              printf "$human\t$human_only\t$mouse\t$mouse_only\n" >> wynik-one2one.txt;\
              done<one2one-homologs.txt
      rm human-tmp.txt mouse-tmp.txt
```
  
  W wynikowym pliku *wynik-one2one.txt* w kolumnach 1 i 3 znajdują się identyfikatory genów, odpowiednio ludzkich i mysich, a w
  kolumnach 2 i 4 ID domen obecnych tylko w jednym z homologicznych białek (lub nic, jeśli skład domen nie różni się pomiędzy gatunkami). 
  Polecenie przeprowadza analizę tylko dla homologów "one to one". Proszę je następnie uruchomić dla drugiego pliku
  (z ortologami "one to many").
  Zakłada ono, że odfiltrowane pliki z id domen to odpowiednio **human-domains.txt** i **mouse-domains.txt**  
  
***    
  ##### AD4. Podsumowanie otrzymanych wyników
   Proszę przeanalizować uzyskane dane. Oprócz podania wyników wyliczeń proszę dokładnie przyjrzeć się jednemu białku z unikatową domeną.
   Jaką funkcję pełni to białko, jaką funkcję ma unikatowa domena, czy domena ta występuje we wszystkich formach tego białka?
    (niezależnie od transkryptu)?     

****  
****  

 ### Zadanie4  
 Oprócz "ręcznego" pobierania danych z użyciem programu BioMart możliwe jest także wykorzystanie do tego celu odpowiednich pakietów programu R [`biomaRt`](https://bioconductor.org/packages/release/bioc/vignettes/biomaRt/inst/doc/accessing_ensembl.html )lub biblioteki Python [`pybiomart`](https://jrderuiter.github.io/pybiomart/). Tutaj przykładowy skrypt, który wykonuje analizy z zadania 3: https://github.com/kasiatom/genomika/blob/master/cwiczenia1/cw1.R
 
 Proszę spróbować napisać prosty skrypt (dowolny język), który pobierze automatycznie ze strony Ensembl i zapisze do pliku sekwencje (*"Unspliced (Gene)"*) wszystkich ludzkich genów kodujących tRNA i zlokalizowanych na chromosomie mitochondrialnym (*"MT"*). Sekwencje powinny być zapisane w formacie [fasta](https://pl.wikipedia.org/wiki/FASTA_format). W liniach opisu pliku fasta ("header") proszę zawrzeć nazwę genu oraz jego identyfukator Ensembl.   
 Skrypt można przetestować na serwerze - [tutaj](https://github.com/kasiatom/genomika/blob/master/cwiczenia1/install.md) znajdują sie instrukcje, jak zainstalować moduły/pakiety dla R/pythona na serwerze.


 ***
 ***
[Powrót do strony zajęć](https://github.com/genomika-2020/genomika/blob/master/README.md)
