## Ocena szkodliwości mutacji

### Zadanie1 
#### Format VCF 
Proszę zapoznać się (przypomnieć sobie) podstawowe informacje o formacie plików
 **Variant Calling Format** [VCF](https://en.wikipedia.org/wiki/Variant_Call_Format)  
```bash
#CHROM POS      ID         REF   ALT    QUAL  FILTER   INFO                             FORMAT       NA00001         NA00002         
20     14370    rs6054257  G     A      29    PASS    NS=3;DP=14;AF=0.5;DB;H2           GT:GQ:DP:HQ  0|0:48:1:51,51  1|0:48:8:51,51  
20     17330    .          T     A      3     q10     NS=3;DP=11;AF=0.017               GT:GQ:DP:HQ  0|0:49:3:58,50  0|1:3:5:65,3    
20     1110696  rs6040355  A     G,T    67    PASS    NS=2;DP=10;AF=0.333,0.667;AA=T;DB GT:GQ:DP:HQ  1|2:21:6:23,27  2|1:2:0:18,2    
20     1230237  .          T     .      47    PASS    NS=3;DP=13;AA=T                   GT:GQ:DP:HQ  0|0:54:7:56,60  0|0:48:4:51,51  
20     1234567  microsat1  GTC   G,GTCT 50    PASS    NS=3;DP=9;AA=G                    GT:GQ:DP     0/1:35:4        0/2:17:2        
```
1. Genotypy ilu osób są opisane powyżej?  
2. Jaki nukleotyd występuje w genomie referencyjnym człowieka na chromosomie 20 w pozycji 1110696? 
3. Czy warianty w tej pozycji sa nowe, czy były juz wcześniej opisane?  
4. Jaki jest genotyp osoby *NA00001* w tej pozycji? A jaki jest jej genotyp w pozycji 14370?  
5. Jaką dodatkową informację niesie zapis `0|1` w stosunku do `0/1`?

***
***
### Zadanie2 
#### Dodanie informacji o częstościach
W tym zadaniu dodadzą państwo do pliku vcf zawierajacego informację o wariantach znalezionych u jednego pacjenta (*237*) 
dane o częstościach wariantów w populacji człowieka z bazy danych [**gnomAD**](https://gnomad.broadinstitute.org/). Uwaga: plik, który będą państwo analizować (`/usr/local/share/237.vcf.gz`)
 zawiera dane dotyczące tylko krótkiego odcinka chromosomu 1 tego pacjenta.  
 
 Informacja o częstości wariantów w populacji, może pomóc w ocenie ich szkodliwości.
  Proszę zauważyć, że mutacje częste w populacji nie mogą być przyczyną rzadkich, poważnych schorzeń genetycznych 
  (bo wtedy choroby te nie byłyby rzadkie). Tak więc jednym z podstawowych kroków przy ocenie szkodliwosci wariantu jest sprawdzenie,
   czy jest on obecny w bazach danych takich jak [1000 Genomes Project](https://www.internationalgenome.org/),
    gnomAD czy Exac (ta baza danych została ostatnia została ostatnio dodana do gnomAD). Baza gnomAD zawiera w tej chwili
     informacje o sekwencjach ponad 70 000 genomów i 125 000 eskomów ludzkich.   
      Plik, jaki wykorzystają państwo do dodania adnotacji (`/usr/local/share/gnomad.genomes.r3.0.sites.chr1.fragment.vcf.gz`)
został pobrany ze strony gnomAD i przygotowany w następujący sposób:  
```bash
wget -c 'https://storage.googleapis.com/gnomad-public/release/3.0/vcf/genomes/gnomad.genomes.r3.0.sites.chr1.vcf.bgz'
wget -c 'https://storage.googleapis.com/gnomad-public/release/3.0/vcf/genomes/gnomad.genomes.r3.0.sites.chr1.vcf.bgz.tbi'
tabix gnomad.genomes.r3.0.sites.chr1.vcf.bgz chr1:91500000-94000000 | bgzip > gnomad.genomes.r3.0.sites.chr1.fragment.vcf.gz
tabix -p vcf gnomad.genomes.r3.0.sites.chr1.fragment.vcf.gz
```
Powyższe kroki miały na celu jedynie ograniczenie jego wielkości. Proszę zauważyć, że wiele z programów, jakie można wykorzystywać 
do przeprowadzania manipulacji na plikach vcf spodziewa się spakowanych i zindeksowanych plików wejściowych. Przedostatnie 
polecenie wycina fragment z wejściowego pliku vcf i kompresuje go (`bgzip`). Ostatnie polecenie tworzy dla niego indeks 
(plik o nazwie `gnomad.genomes.r3.0.sites.chr1.fragment.vcf.gz.tbi`)  .   

Do dodania adnotacji wykorzystają państwo program `bcftools annotate`:  
 ```bash
## pomoc
bcftools annotate

## utworzenie skrótu do katalogu z danymi
ln -s /user/local/share ~/data

## Dodanie informacji o częstościach wariantów (alleli) w populacji (AF)
bcftools annotate \
    -a data/gnomad.genomes.r3.0.sites.chr1.fragment.vcf.gz \
    -c INFO/gnomad_AF:=INFO/AF  \
    237.vcf.gz \
    -O z -o 237-with-gnomad.vcf.gz

## Utworzenie indeksu
tabix -p vcf 237-with-gnomad.vcf.gz

```
Powyższe polecenia do pliku `237.vcf.gz` dodadzą informacje z pliku `/usr/local/shate/gnomad.genomes.r3.0.sites.chr1.fragment.vcf.gz`
(a dokładniej informacje z pola `INFO/AF` tego pliku). Nowo dodana adnotacja będzie nazywać się `gnomad_AF`. 
Plik wynikowy to `237-with-gnomad.vcf.gz`. Proszę pooglądać wejściowe i wynikowe pliki vcf, oraz przestudiować pomoc programu
 `bcftools annotate`, tak aby zrozumieć, jak działają powyższe polecenia. Proszę zauważyć, 
że adotacje nie zostały dodane do wszystkich linii. Dlaczego?  
```bash
zcat data/237.vcf.gz | grep -v '^##' | less  
zcat data/local/share/gnomad.genomes.r3.0.sites.chr1.fragment.vcf.gz | grep -v '^##' | less
zcat 237-with-gnomad.vcf.gz | grep -v '^##' | less
```
 Jakie polecenie doda informację o częstości wariantów w populacji afrykańskiej (`AF_afr`). Proszę przetestować.  
 
 ***
 ***
 ### Zadanie3  
 #### Dodanie informacji o konserwacji ewolucyjnej
 Innymi przydatnymi informacjami do oceny patogenności wariantu są dane o konserwacji ewolucyjnej danej pozycji w genomie. 
 W tej części ćwiczenia do uzyskanego w **Zadaniu2** pliku dodadzą państwo współczynniki konserwacji ewolucyjnej 
 [PhyloP](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2798823/). Algorytm phyloP analizuje 
  tempo substytucji danej pozycji genomu w drzewie filogenetycznym ssaków. Jeśli dana pozycja zmieniała się częściej, niż przewiduje model
  ewolucji neutralnej, to współczynnik phyloP przyjmuje wartość ujemną. I odwrotnie, współczynnik będzie miał wartość dodatnią dla wolno ewoluujących, 
  zakonserwowanych pozycji. Do adnotacji wykorzystają państwo plik w formacie
   [bed](https://genome.ucsc.edu/FAQ/FAQformat.html#format1) i ponownie program `bcftools annotate`:
   ```bash
## utworzenie pliku z linia opisu (będzie dodana do nagłówka pliku vcf):
printf '##INFO=<ID=phyloP100way,Number=1,Type=Float,Description="PhyloP100way conservation score">\n' >  header-phyloP.txt

## dodanie adnotacji
bcftools annotate \
    -a data/chr1.phyloP100way.bed.gz \
    -c CHROM,FROM,-,-,phyloP100way \
    -h header-phyloP.txt \
     237-with-gnomad.vcf.gz \
     -O z -o 237-with-phyloP-and-gnomad.vcf.gz 

## utworzenie indeksu
tabix -p vcf 237-with-phyloP-and-gnomad.vcf.gz
   
```
Sam plik do adnotacji został pobrany ze strony [UCSC](https://genome.ucsc.edu/) - proszę pooglądać,
 co jeszcze mogą państwo na tej stronie znaleźć -i przygotowany w następujący sposób: (zajęło mi to 3 godziny ;) -to sobie chociaż opiszę
```bash
wget 'http://hgdownload.cse.ucsc.edu/goldenpath/hg38/phyloP100way/hg38.100way.phyloP100way/chr1.phyloP100way.wigFix.gz'
wig2bed < chr1.phyloP100way.wigFix > chr1.phyloP100way.bed
bgzip chr1.phyloP100way.bed > chr1.phyloP100way.bed.gz
tabix -p bed chr1.phyloP100way.bed.gz
```

***
***
### Zadanie4 
#### Dodanie informacji funkcjonalnej  
Na koniec, wykorzystają państwo program snpEff, aby dodać informację, jaki wpływ analizowane warianty mają na funkcjonalne elementy 
genomu  (czy prowadzą do zmian w białku, jaki typ zmiany wprowadzają itp):
```bash
## dodanie informacji efektach mutacji, GRCh38.99, to oparta na danych z Ensembl baza danych wykorzystywana przez program 
zcat 237-with-phyloP-and-gnomad.vcf.gz  | java -Xmx4g -jar /opt/tools/snpEff/snpEff.jar GRCh38.99 | bgzip > 237-annotated.vcf.gz

## utworzenie indeksu 
tabix -p vcf 237-annotated.vcf.gz
```
Program dodaje do kolumny INFO pliku vcf pole ANN, oraz ewentualnie LOF i NMD. Proszę zapoznać się z formatem dodawanych adnotacji 
[link](http://snpeff.sourceforge.net/SnpEff_manual.html#input)

### Zadanie5
#### Odfiltrowanie nieszkodliwych wariantów
Wykorzystując wszystkie dodane przez siebie adnotacje, proszę odfiltrować z pliku **237-annotated.vcf.gz** te mutacje, które 
są według państwa nieszkodliwe. Prosze opisać w punktach, jakie mutacje chcą państwo zostawić/odrzucić i dlaczego. Bardzo dobrym 
źródłem informacji na ten temat jest publikacja [*Standards and Guidelines for the Interpretation of Sequence Variants: A Joint Consensus
 Recommendation of the American College of Medical Genetics and Genomics and the Association for Molecular 
 Pathology*](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4544753/).   
 Do filtrowania proszę wykorzystać program `bcftools filter`.
 Poniżej kilka przykładów wykorzystania programu, więcej znajdą państwo
w pomocy programu [bcftools filter](http://samtools.github.io/bcftools/bcftools.html#filter).  
Informację o tym, jak tworzyć wyrażenia służące do filtrowania znajda państwo
 [tutaj](http://samtools.github.io/bcftools/bcftools.html#expressions).
```bash
## pozostawienie tylko tych wariantów, które są nieobecne w bazie danych gnomad 
## lub dla których częstość w tej  bazie danych jest niższa niż 0.01

bcftools filter -i  'INFO/gnomad_AF < 0.01 | INFO/gnomad_AF="."' 237-annotated.vcf.gz

## pozostawienie tylko tych wariantów, które w polu ANN zawieraja słowo 'missense' albo albo slowo 'frameshift'
bcftools filter -i 'INFO/ANN ~ "missense" | INFO/ANN ~ "frameshift"' 237-annotated.vcf.gz

## wyrzucenie wariantów zawierających w polu ANN slowo "LOW"
bcftools filter -e 'INFO/ANN ~ "LOW" ' 237-annotated.vcf.gz
``` 
Uwaga, powyższe komendy wyświetlą linie wariantów, które przeszły przez zastosowany filtr w oknie terminala. Aby wynik zapisać
 do pliku należy do powyższych komend dodać opcję definiującą format wynikowego pliku oraz jego nazwę (analogicznie, jak dla komendy `
 bcftools annotate`). Filtrowanie mozna przeprowadzić wieloetapowo.  

Czy któraś/któreś z mutacji uznaliby państwo za prawdopodobnie patogenne? Prosze sprawdzić, czy wybrane mutacje były już kiedyś
 opisane w bazie [ClinVar](https://www.ncbi.nlm.nih.gov/clinvar/). 
 ***
 ***
 [Powrót do strony zajęć](https://github.com/genomika-2020/genomika/blob/master/README.md) 