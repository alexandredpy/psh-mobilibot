# MobiliBot - Powershell
PowerShell script to get Mobilijeune's quota

Used and tested with PowerShell 5.1 (Windows) and PowerShell 7.1 (Debian)

## Requirements :
- An up and running MySQL Database Server
- The SimplySQL PowerShell's module :
```powershell
# Install the SimplySQL module : 
Install-Module -Name SimplySQL
```
- Optional but useful : phpMyAdmin

## MySQL commands used :
```sql
CREATE DATABASE mobilibot;
CREATE TABLE mobilitable (
    testid int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    resultcode int NOT NULL,
    time datetime
);
CREATE USER 'user'@localhost IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'user'@localhost IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
```

## License :
![image](https://user-images.githubusercontent.com/18117508/142445231-064881dd-8fcd-4437-8122-de4b9027d4b8.png)

[Creative Commons : CC-BY-NC-SA](https://creativecommons.org/licenses/by-nc-sa/4.0/)
