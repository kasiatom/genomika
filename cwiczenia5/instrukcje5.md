## Analiza sekwencjonowania NGS (Illumina)

Instrukcje znajdują się w w pliku [PBioinfo-2022-6.pdf]()   
Przed ich wykonaniem potrzebne będzie przygotowanie okrojonej sekwecji referencyjnej (plik `chr1_fragment.fasta`), zawierającej fragment chromosomu pierwszego człowieka, od pozycji 91500000 do 94000000). Plik można przygotować w następujący sposób: 
```bash
samtools faidx /dane/GCF_000001405.33_GRCh38.p13_genomic.fna NC_000001.11:91500000-94000000 > chr1_fragment.fasta
sed -i 's/>/>chr1 /' chr1_fragment.fasta
```
