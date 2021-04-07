### Aktywacja środowiska wirtualnego

1) Proszę się zalogować (tak, jak zawsze)

2) Proszę wpisać:
```bash
/opt/miniconda3/dist/bin/conda init bash ### zatwierdzić Enter
```


3) Proszę się wylogować (`exit`)

4) Proszę się ponownie zalogować. Po zalogowaniu znak zachęty;) powinien być inny niż dotychczas:
```bash
### przed nazwą użytkownika pojawia się (base)
(base) user1xx@thor1804:~$
```
5) Jeśli tak nie jest, proszę wpisać:
```bash
/opt/miniconda3/dist/bin/conda activate base ### zatwierdzić Enter
```
6) Teraz proszę sprawdzić, czy programy są widoczne np.:
```bash
prodigal -h
bcftools annotate
```
7) Polecenie z punktu 5 trzeba będzie powtórzyć po każdym zalogowaniu, o ile przed znakiem zachęty 
   nie pojawi się `(base)`
