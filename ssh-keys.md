## ssh-keys  
Procedura ustawienia dostępu do serwera za pomocą kluczy ssh dla różnych systemów operacyjnych jest opisana [tutaj](https://code.visualstudio.com/docs/remote/troubleshooting#_configuring-key-based-authentication). Niestety droga opisana dla systemu Windows rzadko prowadzi do sukcesu (z różnych powodów, takich jak brak odpowiednich programów itp.). Pewnym obejściem jest utworzenie kluczy na serwerze (Linux) i przeniesienie ich na komputer lokalny. Zostanie to opisane poniżej.   

1) Proszę się zalogować na serwer używając hasła.
2) Proszę sprawdzić, czy w katalogu domowym znajduje się katalog `.ssh` :  
   ```bash
    ls -a ~
	```  
3) W wypadku, gdy katalog istnieje proszę do niego przejść. Jeśli nie istnieje, proszę go stworzyć i przejść do niego:  
   ```bash
   mkdir ~/.ssh; cd ~/.ssh ## nie ma katalogu
   cd ~/.ssh ## katalog istnieje
   ```
4) Utworzenie pary kluczy:
   ```bash
   ssh-keygen -t ed25519 ## utworzenie kluczy
   ```
   Program będzie pytał o hasło oraz nazwę kluczy - zostawiamy wszystko domyślnie, nic nie wpisujemy, zatwiedzamy kolejne pytania przez naciśniecie klawisza `Enter`.
   W wyniku powyższej komendy w katalogu `.ssh` pojwią sie dwa pliki -  klucz publiczny `id_ed25519.pub` i klucz prywatny `id_ed25519`.

5) Zapisanie klucza **publicznego** do pliku z listą zaufanych kluczy:
   ```bash
   cat id_ed25519.pub > authorized_keys   
   ```
6) Skopiowanie kluczy na komputer lokalny (Linux, MAC: polecenia scp, Windows: program WinSCP). Klucze najlepiej umieścić w tym samym katalogu, w którym znajduje się plik konfiguracyjny ssh, zazwyczaj będzie to:  
  - Linux/MAC:  `~/.ssh/`  
  - Windows:  
Lokalizację pliku konfiguracyjnego można sprawdzić w VSCode wybierając opcje *"Open a Remote Window"* (lewy dolny róg) => *"Connect to Host..."* => *"Configure SSH Hosts..."*.  


7) Usunięcie kluczy z serwera: 
   ```bash
   rm  id_ed25519.pub id_ed25519
   ```
8) Dodanie ścieżki do klucza prywatnego w pliku konfiguracyjnym. 
  Proszę otworzyć plik konfiguracyjny (**"Open a Remote Window" => *"Connect to Host..."* => *"Configure SSH Hosts..."* => wybrać plik). W systemie Linux będzie to zazwyczaj plik: `~/.ssh/config`, w Windows: ``) i dodać informację o kluczu (ostatnia linia):
   ```bash
    Host kontiki
      HostName 149.156.165.148
      User user174
	  IdentityFile /home/user_komp_lok/.ssh/id_ed25519 ## uzgodnić odpowiednio, podać pełną ścieżkę. 
	``` 
	 

9) Teraz praca na serwerze powinna być możliwa bez podawania hasła. Oczywiście dotyczy to tylko komputera, na którym znajduje się prywatny klucz. Tego klucza nie wolno udostępniać innym osobom!!!  







