IVAN - True Detection
=====================

Wymagania
---------

* VirtualBox w najnowszej wersji <http://www.virtualbox.org/>
* Vagrant w najnowszej wersji <http://www.vagrantup.com/>
* Minimum 10 GB miejsca na skonfigurowanej partycji systemowej VirtualBoxa (tyle co najmniej po konfiguracji zajmuje obraz dysku)

Przygotowanie projektu do działania
-----------------------------------

1.  Sklonownie tego repozytorium oraz ściągnięcie podprojektów

    1.  W przypadku korzystania z [SourceTree](http://www.sourcetreeapp.com/) wystarczy sklonowanie tego repozytorium

    2.  Z poziomu commandline

        ```shell
        $ git clone git@github.com:ivan-project/ivan.git
        ```

    3.  A następnie :

        ```shell
        $ cd ivan
        $ ./install.sh
        ```

2.  Uruchomienie maszyny wirtualnej

    1.  Z poziomu commandline należy wejsć do podkatalogu **vagrant**:

        ```shell
        $ cd ivan/vagrant
        ```

    2.  Oraz uruchomić komendę

        ```shell
        $ vagrant up
        ```

    3.  Proces ten trwa dość długo, w jego trakcie ściągana i konfigurowana jest maszyna wirtualna obsługująca projekt.

3.  Konfiguracja lokalnej domeny w pliku *hosts*

    1.  Dla systemów uniksowych konieczne zedytowanie pliku `/etc/hosts` (koniecznie posiadanie uprawnień roota w systemie)

    2.  Dla systemów windowsowych analogiczny plik znajduje się w `C:\Windows\system32\drivers\etc\hosts` - edytor tekstowy (np. Notatnik) musi być uprzednio uruchomiony z uprawnieniami administratora

    3.  Do tegoż pliku dopisanie linijki

        ```
        172.70.70.70 ivan.dev
        ```

4.  Pierwsze połączenie z maszyną

    1.  Po zakończeniu procesu instalacji maszyny wirtualnej, w tym samym katalogu wykoanie polecenia, które wykona połączenie SSH do systemu maszyny.

        ```shell
        $ vagrant ssh
        ```

5.  Instalacja słownika

    1.  Na maszynie wirtualnej po połączeniu się z nią przejście do katalogu projektu importującego słownik

        ```shell
        $ cd /var/ivan/dictionary_importer
        ```

    2.  Wykonanie poleceń

        ```shell
        $ tar -zxvf dict.tar.gz
        $ make run
        ```

    3.  Importowanie słownika powinno zajać kilkanaście minut, po zaimportowaniu blisko 5 milionów rekordów

6.   Import bazy danych strony www

    1.  Na maszynie wirtualnej przejść do katalogu z projektem www

        ```shell
        $ cd /var/ivan/frontend
        ```

    2.  Wykonanie importu następującymi poleceniami:

        ```shell
        $ mongo ivan --eval "db.dropDatabase()"
        $ mongorestore -d ivan db/ivan
        ```

7.   Uruchomienie strony www

    1.  Po otworzeniu w przeglądarce adresu <http://ivan.dev/> powinien ukazać się interfejs projektu.
