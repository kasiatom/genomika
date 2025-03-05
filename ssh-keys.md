## ssh-keys  
Procedura ustawienia dostępu do serwera za pomocą kluczy ssh dla różnych systemów operacyjnych jest opisana [tutaj](https://code.visualstudio.com/docs/remote/troubleshooting#_configuring-key-based-authentication). Niestety droga opisana dla systemu Windows rzdko prowadzi do sukcesu (z różnych powodów, takich jak brak odpowiednich programów itp.). Pewnym obejściem jest utworzenie kluczy na serwerze (Linux) i przeniesienie ich na komputer lokalny. Zostanie to opisane poniżej.   

1) Proszę się zalogować na serwer używając hasła.
2) Proszę sprawdzić, czy w katalogu domowym znajduje się katalog `.ssh` :  
   ```bash
    ls -a ~
	```  
3) W wypadku, gdy katalog istnieje proszę do niego przejść. Jeśli nie istnieje, prosze go stworzyć i przejść do niego:  
   ```bash
   mkdir ~/.ssh; cd ~/.ssh ## nie ma katalogu
   cd ~/.ssh ## katalog istnieje
   ```
4) Utworzenie pary kluczy:
   ```bash
   ssh-keygen -t ed25519 ## utworzenie kluczy, program będzie pytał o hasło - nic nie podawać, zatwiedzić Enter
   ```
   W wyniku powyższej komendy w katalogu .ssh pojwią sie dwa pliki -  klucz publiczny `id_ed25519.pub` i klucz prywatny `id_ed25519`.

5) Zapisanie klucza **publicznego** do pliku z listą zaufanych kluczy:
   ```bash
   cat id_ed25519.pub > authorized_keys   
   ```
6) Przeniesienie kluczy na komputer lokalny (Linux, MAC: polecenia scp, Windows: program WinSCP). Klucze najlepiej umieścić w tym samym katalogu, w którym znajduje sie plik konfiguracyjny połaczenia z serwerem:
  - Linux/MAC:  `~/.ssh/`  
  - Windows:  

7) Usunięcie kluczy z serwera: 
   ```bash
   rm  id_ed25519.pub id_ed25519
   ```
8) Dodanie ścieżki do klucza prywatnego w pliku konfiguracyjnym. 
  Proszę otworzyć plik konfiguracyjny (Linux: `~/.ssh/config`, Windows: ``) i dodać informację o kluczu (ostatnia linia):
   ```bash
    Host kontiki
      HostName 149.156.165.148
      User user174
	  IdentityFile ~/.ssh/id_ed25519 ## uzgodnić odpowiednio
	```  
9) Teraz praca na serwerze powinna być możliwa bez podawania hasła. Oczywiście dotyczy to tylko komputera, na którym znajduje się prywatny klucz. Tego klucza nie wolno udostępniać innym osobom!!!  







