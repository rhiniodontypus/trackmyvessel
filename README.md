# trackmyvessel (TMV)

## 1. Introduction
trackmyvessel (TMV) is a tool to receive and decode a live feed of AIS AIVDM signals from ships.

It allows to define a personal list of ships and to track them. It also allows to define certain regions, so that when the ship reaches or leaves the region, an information mail is sent.

The program evaluates each incoming AIVDM data packet individually, compares it with the information from the database and initiates the sending of an e-mail if necessary.

Please be aware that this software is not intended for safety-critical applications, but for hobby use only. I disclaim all responsibility for any damage caused by the use of this software. 

## 2. Setting up the virtual environment for Ruby with Rbenv

1. Installing Rbenv [(Installation Guide)](https://github.com/rbenv/rbenv)

for MacOS

```sh
brew install rbenv ruby-build
```
for Debian, Ubuntu and derivatives
```sh
sudo apt install rbenv
```

2. Learn how to init
```sh
rbenv init
```

3. Close your Terminal window and open a new one so your changes take effect.

4. Install a Ruby version ~> 2.0
```sh
rbenv install 2.7.4
```

5. Switch to your local repository and set your local Ruby version.
```sh
rbenv local 2.7.4
```

6. Install bundler for installing ruby gems
```sh
gem install bundler
```

7. Specify the local gem installation directory: In the root of your project directory, create a file named .bundle/config (create the .bundle directory if it doesn't exist) and add the following content:

```sh
mkdir .bundle/
nano .bundle/config
```

```
--- 
BUNDLE_PATH: "vendor/bundle"
```

8. Now you can install the Gemfile
```sh
bundle install
```

9. Activate the gem environment:
```sh
rbenv rehash
```
This will update the rbenv shims to include the locally installed gems.


## 3. Creating the database
I use the MariaDB database.

1a. [MacOs](https://mariadb.com/kb/en/installing-mariadb-on-macos-using-homebrew/)
```sh
brew install mariadb
```

1b. Debian/Ubuntu
```sh
sudo apt install mariadb-server
```

2. Now run the configuration process:

```sh
sudo mysql_secure_installation
```

3. Check if the service is running:

```sh
sudo systemctl status mariadb
```
Now you can import the table structures and the data:
The user 'vesseltracker' is created and the password 'password' is set. I recommend to change the password in line 12 and 13 before you import the database in [tmv_database.sql](./database/tmv_database.sql) (combined table structures for all tables and area and terminal data for the port of Hamburg). After that you can import the database:

```sh
sudo mariadb < ./database/tmv_database.sql
```

## 4. Creating your personal vessel list

To create your personal list of vessels to track run

```sh
sh ./scripts/tmv_myvessels_insert_new_vessel.sh
```

and enter the vessel's details. So far you can only enter one vessel at a time.

## 5. Setting up your DB and Mail client connection

Add your database credentials to [DB_CONNECT.rb](./config/DB_CONNECT.rb).

Add your mail client credential to [nmea_mailer.rb](./config/nmea_mailer.rb).

## 6. Running the code

In the main repo folder start the program with

```sh
ruby nmea_main.rb
```

## 7. Future work
- Optimization of the database access to reduce CPU and memory usage
- Implementation of additional features such as
    - easier insertion of ships to be tracked into the database
    - graphical representation of ship positions
    - creation of a dashboard with additional information about the ships



This software is licensed with [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
