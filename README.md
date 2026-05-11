# Khali_Namechanger
<img width="1536" height="1024" alt="name changer" src="https://github.com/user-attachments/assets/536cc27b-5d1a-4dc3-bc8a-da78c610a631" />


# 🪶 khali_namechanger

Ein modernes Admin-Namechanger Script für RedM basierend auf **VORP Core** und **oxmysql** mit UI, History System und Discord Logging.

---

# 🇩🇪 Deutsch

## 📌 Beschreibung

`khali_namechanger` ist ein Admin-Tool, mit dem berechtigte Jobs den Namen von Spielern ändern können.  
Das Script bietet ein immersives Western-UI mit History Tracking und Discord Logs.

---

## ✨ Features

- 🧑 Spieler Namensänderung (Vorname + Nachname)
- 📜 History System (letzte Änderungen)
- 🟢 Online / 🔴 Offline Status im UI
- 🌐 DE / EN Sprachsystem
- 🔔 Ingame Notifications (VORP TipBottom)
- 💬 Discord Webhook Logging (sprachabhängig)
- 🎨 modernes Western UI mit Blur & Animation
- 🔒 Job-basiertes Permission System

---

## ⚙️ Requirements

- vorp_core
- oxmysql
- RedM Server

---

## 🛠️ Installation

1. Resource in deinen Server Ordner legen:

resources/[vorp]/khali_namechanger


2. In `server.cfg` eintragen:


3. Datenbank Tabelle erstellen:
```sql
CREATE TABLE IF NOT EXISTS namechange_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    charid INT,
    oldname VARCHAR(255),
    newname VARCHAR(255),
    admin VARCHAR(255),
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

4. Config anpassen:
Sprache setzen (de / en)
Discord Webhook einfügen
Jobs definieren

🎮 Command
/changename

🔐 Permissions

Standardmäßig erlaubt:

admin
superadmin
marshal
police
📜 Discord Logging

Alle Änderungen werden im Discord geloggt:

Admin Name
Job
Character ID
Alter Name
Neuer Name
Zeitstempel
🧪 UI Features
Player Liste mit Status:
🟢 Online = Grün
🔴 Offline = Rot
History Panel im UI
Smooth Fade Animation
Western Style Design
🔔 Notify System
Ingame Notification über VORP
Kein NUI Popup nötig
Sprachabhängig (DE/EN)
⚠️ Hinweise
Script benötigt korrekt konfiguriertes VORP Core
oxmysql muss aktiv sein
Webhook muss gültig sein
🧑 Author

Khali Scripts


🇬🇧 English
📌 Description

khali_namechanger is an admin tool for RedM that allows authorized jobs to change player names.
It includes a cinematic Western UI, history tracking, and Discord logging.

✨ Features
🧑 Change player names (first + last name)
📜 History system (recent changes)
🟢 Online / 🔴 Offline status display
🌐 DE / EN language support
🔔 In-game notifications (VORP TipBottom)
💬 Discord webhook logging (language-based)
🎨 cinematic Western UI with blur & animations
🔒 job-based permission system
⚙️ Requirements
vorp_core
oxmysql
RedM server

🛠️ Installation
1. Place resource into:
resources/[vorp]/khali_namechanger

2. Add to server.cfg:
ensure khali_namechanger

3. Create database table: 
CREATE TABLE IF NOT EXISTS namechange_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    charid INT,
    oldname VARCHAR(255),
    newname VARCHAR(255),
    admin VARCHAR(255),
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

4. Configure: 
Set language (de / en)
Add Discord webhook
Define allowed jobs

🎮 Command
/changename

🔐 Permissions

Default allowed jobs:

admin
superadmin
marshal
police
📜 Discord Logging

Every name change is logged:

Admin name
Job
Character ID
Old name
New name
Timestamp
🧪 UI Features
Player list with status:
🟢 Online (green)
🔴 Offline (red)
History panel inside UI
Smooth fade animation
Western themed design
🔔 Notify System
In-game VORP notifications
Language based (DE/EN)
No intrusive popups
⚠️ Notes
Requires properly configured VORP Core
Requires oxmysql
Discord webhook must be valid
🧑 Author

Khali Scripts
