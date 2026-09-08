# Git Workflow Guide

This README explains the complete Git workflow, starting from repository initialization to pushing changes to GitHub.

## 1. Initialize a Repository
```bash
git init
2. Configure User Information (Global)
bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global core.editor "nano"
3. Check Repository Status
bash
git status
4. Stage Files
bash
git add filename.sql
Or stage all changes:

bash
git add .
5. Commit Changes
bash
git commit -m "Meaningful commit message"
6. Connect to Remote Repository
bash
git remote add origin https://github.com/username/repository.git
7. Push Changes
bash
git push -u origin main
8. Common Useful Commands
bash
git log        # View commit history
git remote -v  # Check remote connections
git pull origin main  # Pull latest changes
Author
Mohamed Hassan

Code

This is now a **single-page README.md** that covers everything from `git init` to `git push` without breaking across multiple sections.  

Would you like me to also add a **quick diagram (ASCII style)** inside the README showing the flow: *Working Directory → Staging Area → Commit → Remote*? That makes it even easier for beginners to visualize.