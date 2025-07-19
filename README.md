# 🛠️ Apache Auto-Healer Using Cron

This project solves a common problem in production: **What if Apache (httpd) crashes silently?**

## ✅ What It Does
A cron job checks every 5 minutes if Apache (`httpd`) is running. If it's not, it:
- Logs the downtime
- Automatically restarts the Apache service

## 🧰 Tech Used
- EC2 (Amazon Linux 2)
- Cronie (cron daemon)
- Bash scripting
- `pgrep`, `systemctl`

## 📦 Setup Instructions

1. **Install Cronie**
```bash
sudo yum install cronie -y
sudo systemctl start crond
sudo systemctl enable crond
```
2. **Install and Start Apache**
```bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
```
3. **Add Auto-Healing Cron Job**
```bash
sudo bash -c 'echo "*/5 * * * * root pgrep httpd > /dev/null || (echo \"$(date) - Apache restarted\" >> /home/ec2-user/health.log && systemctl restart httpd)" >> /etc/crontab'
```
### ⏱️ Cron Job Behavior

- Runs **every 5 minutes**
- Checks if **Apache (httpd)** is running using `pgrep httpd`
- If not running:
  - Logs the restart event with a timestamp
  - Restarts Apache using `systemctl`

---

### 📄 Log Location

Logs of Apache restarts are saved at:

To check the logs anytime, use:

```bash
cat /home/ec2-user/health.log
```

