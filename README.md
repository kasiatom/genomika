## Ćwiczenia z genomiki porównawczej  

### Instrukcje do ćwiczeń
 * [ćwiczenia 1](https://github.com/genomika-2020/genomika/blob/master/cwiczenia1/Instrukcje1.md)
 * [ćwiczenia 2](https://github.com/genomika-2020/genomika/blob/master/cwiczenia2/instrukcje2.md)
 * [ćwiczenia 3](https://github.com/genomika-2020/genomika/blob/master/cwiczenia3/Instrukcje3.md)
 * [ćwiczenia 4](https://github.com/genomika-2020/genomika/blob/master/cwiczenia4/Instrukcje4.md)
   
***
***
### Praca na serwerze
**Linux, MAC**  
Z serwerem mozna połączyć sie wpisując w terminalu:  
```bash
ssh numer_ip -l nazwa_konta
```  

**Windows**   
Logowanie wymaga zainstalowania jednego z dwóch programów:  
* [puTTy](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html);Szczegółowe instrukcje obsługi znajdują się [tutaj](https://the.earth.li/~sgtatham/putty/0.73/puttydoc.txt)  
* [MobaXterm](https://mobaxterm.mobatek.net/download.html); [tutaj](https://mobaxterm.mobatek.net/documentation.html) pomoc programu

Proszę o zmianę hasła po pierwszym zalogowaniu (polecenie *passwd*)  

***

### Przenoszenie plików na serwer  
**Linux, MAC**  
Pliki można kopiować używając polecenia:
```bash
scp [user@]SRC_HOST:]file1 [user@]DEST_HOST:]file2
gdzie
[user@]SRC_HOST:]file1 to położenie pliku, który chcemy skopiować
[user@]DEST_HOST:]file2 to lokalizacja docelowa  
```
**Windows**   
Należy zainstalować:  
* [WinSCP](https://winscp.net/eng/download.php) 
Instrukcje obsługi programu znajdują się [tutaj](https://winscp.net/eng/docs/getting_started)  
lub
* [MobaXterm](https://mobaxterm.mobatek.net/download.html)  

***
### Program screen  
Podstawowe instrukcje znajdują się [tutaj](https://github.com/kasiatom/genomika/blob/master/screen.md)  
Podstawowy (i wystarczający dla celów ćwiczeń) opis działania programu znajdą państwo [tutaj](http://www.blog.hnatyszyn.pl/2016/03/screen-czyli-wirtualny-terminal/).  
Szczegółowy manual programu pod tym [linkiem](https://www.gnu.org/software/screen/manual/screen.html)

***
### Aktywacja środowiska wirtualnego  
Instrukcje znajdują sie [tutaj](https://github.com/genomika-2020/genomika/blob/master/conda.md)  
