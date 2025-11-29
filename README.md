# Lucrare de laborator nr. 4
Implementarea unui site web bazat pe Apache + PHP + MariaDB utilizand Docker si WordPress

## 1. Scopul lucrarii

Scopul acestei lucrari este de a construi un mediu web complet functional utilizand containere Docker, care sa includa:
- un server web Apache configurat cu PHP (mod_php),
- serverul de baze de date MariaDB cu volume persistente,
- configurarea fisierelor specifice (apache2.conf, php.ini, 50-server.cnf, supervisord.conf),
- instalarea si configurarea unei aplicatii WordPress in interiorul containerului.

## 2. Sarcina de lucru

Conform cerintelor laboratorului, au fost realizate:
1. Crearea unui proiect `laborator4` pe GitHub.
2. Construirea unui container Docker bazat pe Debian cu Apache2, PHP, MariaDB si Supervisor.
3. Configurarea volumelor pentru baza de date si loguri.
4. Configurarea fisierelor pentru Apache, PHP si MariaDB.
5. Instalarea WordPress si pornirea site-ului prin container Docker.
6. Documentarea tuturor etapelor in acest raport.

## 3. Etapele lucrarii

### 3.1 Structura proiectului

Directorul `files/` contine configuratiile:
- apache2/
- php/
- mariadb/
- supervisor/

### 3.2 Crearea Dockerfile-ului

Imaginea Debian este folosita pentru a instala:
- Apache2
- PHP + libapache2-mod-php
- MariaDB Server
- Supervisor

WordPress este descarcat si extras manual in `/var/www/html`.

### 3.3 Configurarea Apache

Au fost configurate:
- ServerName localhost
- permisiuni pentru /var/www/html
- DirectoryIndex

### 3.4 Configurarea PHP

In php.ini au fost modificate:
- memory_limit = 128M
- upload_max_filesize = 128M
- post_max_size = 128M
- max_execution_time = 120
- error_log = /var/log/php_errors.log

### 3.5 Configurarea MariaDB

A fost activat log_error si configurate volume persistente.

### 3.6 Configurarea Supervisor

Supervisor porneste automat Apache si MariaDB.

### 3.7 Initializarea bazei de date WordPress

A fost creata baza de date:
CREATE DATABASE wordpress;
CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'wordpress';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';

### 3.8 Configurarea WordPress

Fiind accesata la:
http://localhost:8000/<img width="1512" height="623" alt="Screenshot 2025-11-29 at 19 18 00" src="https://github.com/user-attachments/assets/5b0915a2-5e7a-4b52-b00b-323edfc21608" />


WordPress a fost configurat iar wp-config.php a fost adaugat in imagine.<img width="750" height="418" alt="Screenshot 2025-11-29 at 19 16 48" src="https://github.com/user-attachments/assets/b9d5cfa4-f10d-4021-836f-e0e8e71f728c" />


## 4. Raspunsuri la intrebarile de control

1. Fisiere modificate: apache2.conf, 000-default.conf, php.ini, 50-server.cnf, supervisord.conf, wp-config.php  
2. DirectoryIndex defineste ce fisier este incarcat ca pagina principala.  
3. wp-config.php contine configurarea conexiunii la baza de date si setari WordPress.  
4. post_max_size controleaza dimensiunea maxima a datelor transmise prin POST.  
5. Dezavantaje imagine: dimensiune mare, toate serviciile intr-un singur container, actualizari manuale WordPress, dependenta de Supervisor.

## 5. Concluzii

A fost construit cu succes un mediu complet LAMP containerizat folosind Docker. WordPress ruleaza corect peste Apache + PHP + MariaDB, iar toate componentele au fost configurate manual.
