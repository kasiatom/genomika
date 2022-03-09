### Program `screen`  

Przydatny, gdy chcą Państwo uruchomić proces, który może trwać długo oraz gdy połączenie z internetowe jest niestabilne.  

1. Utworzenie i otworzenie nowej sesji programu screen:  
   ```bash
   screen -S nazwa_sesji
   ```
2. Po otwarciu można wpisać komendy i pomimo braku znaku zachęty (ang. *prompt*) opuścić sesję, nie kończąc 
   uruchomionego procesu, naciskając jednocześnie <kbd>Ctrl</kbd> + <kbd>a</kbd> + <kbd>d</kbd>   
   Pojawi się wtedy komunikat:
   ```bash
   [detached from 1735536.nazwa_sesji]
   ```  
3. Aby powrócić do sesji, należy wpisać:
   ```bash
   screen -r nazwa_sesji
   ```
4. Aby uzyskać listę wszystkich sesji użytkownika, należy wpisać:
   ```bash
   screen -ls
   ## przykładowy wynik:
   There are screens on:
	1735536.nazwa_sesji	(09.03.2022 19:42:58)	(Detached)
	136402.histat2	(07.03.2022 09:11:26)	(Detached)
   
   ```  
   
