# 🔒 SafetyFirst Firewall Blocker by @jdabsofficial

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



### 🔐 Step-by-Step Guide

1. **Backup Your Firewall Rules (DO THIS FIRST) (IMPORTANT!)**
   ```cmd
   netsh advfirewall export "%UserProfile%\Desktop\firewall-backup.wfw"

2. **Download the Script Above** - SafetyFirst_FirewallBlocker.cmd

3. **Place the Script**
    ```cmd
    Move the .cmd file to the folder containing executables you want to block
4. **Run the Script**
    ```cmd
    Move the .cmd file to the folder containing executables you want to block
5. **Verification** (Optional)
    ```cmd
    Check Windows Firewall rules to confirm new block rules exist

---


## 🧼 How To Revert (Restore)

If something goes wrong or you want to undo everything:

1. Go to your Desktop.
2. Find the file: `firewall-backup.wfw`
3. Double-click it or run this command in CMD:

```cmd
netsh advfirewall import "%UserProfile%\Desktop\firewall-backup.wfw"


### All rights reserved @JDabsOfficial 2025
