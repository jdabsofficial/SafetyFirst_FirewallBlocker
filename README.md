# 🔒 SafetyFirst_FirewallBlocker by @jdabsofficial

This is a simple Windows batch script that blocks every `.exe`, `.com`, `.scr`, and `.bat` file in a folder (and its subfolders) using the Windows Firewall.

It’s useful if you want to stop unknown apps from accessing the internet, or if you’re testing untrusted files.

---

## 📦 How It Works

- It scans the folder where the script is placed.
- Every executable file it finds will be **blocked from both sending and receiving internet data**.
- A **firewall backup** is automatically created before any changes.

---

## ⚙️ How To Use

> 🧠 **No coding needed** — just follow these steps.

### 🔐 Step 1 — Backup Your Firewall Rules (DO THIS FIRST)

Before running the script, open Command Prompt and run:

```cmd
netsh advfirewall export "%UserProfile%\Desktop\firewall-backup.wfw"

2. **Download** the script file: `SafetyFirst_FirewallBlocker.cmd`.
3. **Place** the `.cmd` file in the folder that contains the executables you want to block.
4. **Right-click** the file and **Run as Administrator**.
5. Done. All `.exe`, `.com`, `.scr`, and `.bat` files inside that folder and subfolders are now blocked.

---

### ✅ Full `SafetyFirst_FirewallBlocker.cmd` Script (Batch File)

Save the following as `SafetyFirst_FirewallBlocker.cmd` or download the cmd file above:

```bat
@echo off
setlocal EnableExtensions EnableDelayedExpansion

cd /d "%~dp0"

echo 🔒 Starting executable blocking process...
echo.

echo 🔄 Backing up current firewall rules...
netsh advfirewall export "%UserProfile%\Desktop\firewall-backup.wfw"
echo ✅ Firewall rules backed up to: %UserProfile%\Desktop\firewall-backup.wfw
echo.

echo 🚀 Scanning for executables and applying firewall blocks...

for /R %%F in (*.exe *.com *.scr *.bat) do (
    set "file=%%~fF"
    set "rulename=Block_%%~nxF_!random!"
    netsh advfirewall firewall add rule name="!rulename!-In"  dir=in  action=block program="!file!" profile=any >nul
    netsh advfirewall firewall add rule name="!rulename!-Out" dir=out action=block program="!file!" profile=any >nul
    echo 🔐 Blocked: !file!
)

echo.
echo ✅ Done. Executables in this folder are now blocked from internet access.
echo 🔁 You can restore the firewall using the backup file if needed.
pause


## 🧼 How To Revert (Restore)

If something goes wrong or you want to undo everything:

1. Go to your Desktop.
2. Find the file: `firewall-backup.wfw`
3. Double-click it or run this command in CMD:

```cmd
netsh advfirewall import "%UserProfile%\Desktop\firewall-backup.wfw"


# All rights reserved @JDabsOfficial 2025
