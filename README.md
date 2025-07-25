# 🔒 SafetyFirst Firewall Blocker by @jdabsofficial

This is a simple Windows batch script that blocks every .exe, .com, .scr, and .bat file in a folder (and its subfolders) using the Windows Firewall.

It’s especially useful for blocking cracked or suspicious applications from accessing the internet, or when testing untrusted files in a controlled environment.

---

## 📦 How It Works

- It scans the folder where the script is placed.
- Every executable file it finds will be **blocked from both sending and receiving internet data**.
- A **firewall backup** is automatically created before any changes.

---

## ⚙️ How To Use

> 🧠 **No coding needed** — just follow these steps.

> 🔍 **Security Check**: If you're unsure about running this script, you can:  
> **[View VirusTotal Analysis](https://www.virustotal.com/gui/file/36fb05ce0f00bd2c01abc96434e827f847cc884714325fba2c11e360f5cbe25b?nocache=1)** (0/60 detections as of 2025-07-25)
> - **Hashes**:
>   - **MD5**: `82c3229cef96f1fe2ad7b53a3d8e068c`
>   - **SHA-1**: `337dbdb1443fb0e18789972d2ac1233078199855`
>   - **SHA-256**: `36fb05ce0f00bd2c01abc96434e827f847cc884714325fba2c11e360f5cbe25b`

---

### 🔐 Step-by-Step Guide

1. **Backup Your Firewall Rules (DO THIS FIRST) (IMPORTANT!)**
   ```cmd
   netsh advfirewall export "%UserProfile%\Desktop\firewall-backup.wfw"
2. **Download the Script Above**
   ```cmd
   Download the Script Above SafetyFirst_FirewallBlocker.cmd
3. **Place the Script**
    ```cmd
    Move the .cmd file to the folder containing executables you want to block
4. **Run the Script**
    ```cmd
    Right-click → "Run as Administrator"
5. **Verification** (Optional)
   ```cmd
   Check Windows Firewall rules to confirm new block rules exist

---

### 🧼 How To Revert (Restore)

If something goes wrong or you want to undo everything:

1. Go to your Desktop.
2. Find the file: `firewall-backup.wfw`
3. Double-click it or run this command in CMD:
   ```cmd
   netsh advfirewall import "%UserProfile%\Desktop\firewall-backup.wfw"

---


### ⚠️ Safety & Usage Notes

> **🔐 Backup First**  
> Always export firewall rules before running (`netsh advfirewall export`)

> **🚫 Restricted Locations**  
> Never run from system directories (`C:\Windows`, `C:\Program Files`)

> **🔄 Reverting Changes**  
> - Delete rules manually via Windows Firewall  
> - Or restore from your `.wfw` backup file

> **🔍 Monitoring**  
> Check Windows Security logs for blocked connection attempts
