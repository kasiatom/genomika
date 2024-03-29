## Analiza sekwencjonowania NGS (Illumina)

Instrukcje znajdują się w w pliku [PBioinfo-2022-6.pdf](https://github.com/kasiatom/genomika/blob/master/cwiczenia5/PBioinfo-2022-6.pdf)   
Przed ich wykonaniem potrzebne będzie przygotowanie okrojonej sekwecji referencyjnej (plik `chr1_fragment.fasta`), zawierającej fragment chromosomu pierwszego człowieka, od pozycji 91500000 do 94000000). Plik można szybko przygotować w następujący sposób: 
```bash
mkdir -p $HOME/ngs/ref

samtools faidx /dane/GCF_000001405.33_GRCh38.p13_genomic.fna NC_000001.11:91500000-94000000 > $HOME/ngs/ref/chr1_fragment.fasta
sed -i 's/>/>chr1 /' $HOME/ngs/ref/chr1_fragment.fasta
```
Uwaga: komendy podane w instrukcjach nie mają zazwyczaj "ustawionych" ścieżek. Państwa zadaniem jest (też) zamiana schematycznych nazw plików na prawidłowe ścieżki dostepu.  