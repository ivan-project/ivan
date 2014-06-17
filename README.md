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

    *   W przypadku korzystania z [SourceTree](http://www.sourcetreeapp.com/) wystarczy sklonowanie tego repozytorium

    *   Z poziomu commandline

        ```shell
        $ git clone git@github.com:ivan-project/ivan.git
        ```

        a następnie :

        ```shell
        $ cd ivan
        $ ./install.sh
        ```

2.  Uruchomienie maszyny wirtualnej

    *   Z poziomu commandline należy wejsć do podkatalogu **vagrant**:

        ```shell
        $ cd ivan/vagrant
        ```

        oraz uruchomić komendę

        ```shell
        $ vagrant up
        ```

    *   Proces ten trwa dość długo, w jego trakcie ściągana i konfigurowana jest maszyna wirtualna obsługująca projekt.

3.  Konfiguracja lokalnej domeny w pliku *hosts*

    *   Dla systemów uniksowych konieczne zedytowanie pliku `/etc/hosts` (koniecznie posiadanie uprawnień roota w systemie)

    *   Dla systemów windowsowych analogiczny plik znajduje się w `C:\Windows\system32\drivers\etc\hosts` - edytor tekstowy (np. Notatnik) musi być uprzednio uruchomiony z uprawnieniami administratora

    *   Do tegoż pliku dopisanie linijki

        ```
        172.70.70.70 ivan.dev
        ```

4.  Pierwsze połączenie z maszyną

    *   Po zakończeniu procesu instalacji maszyny wirtualnej, w tym samym katalogu wykoanie polecenia, które wykona połączenie SSH do systemu maszyny.

        ```shell
        $ vagrant ssh
        ```

5.  Instalacja słownika

    *   Na maszynie wirtualnej po połączeniu się z nią przejście do katalogu projektu importującego słownik

        ```shell
        $ cd /var/ivan/dictionary_importer
        ```

    *   Wykonanie poleceń

        ```shell
        $ tar -zxvf dict.tar.gz
        $ make run
        ```

    *   Importowanie słownika powinno zajać kilkanaście minut, po zaimportowaniu blisko 5 milionów rekordów

6.   Import bazy danych strony www

    *   Na maszynie wirtualnej przejść do katalogu z projektem www

        ```shell
        $ cd /var/ivan/frontend
        ```

    *   Wykonanie importu następującymi poleceniami:

        ```shell
        $ mongo ivan --eval "db.dropDatabase()"
        $ mongorestore -d ivan db/ivan
        ```

7.   Uruchomienie strony www

    *   Po otworzeniu w przeglądarce adresu <http://ivan.dev/> powinien ukazać się interfejs projektu.
