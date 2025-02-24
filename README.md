# my First Repo
# Fixing GitHub Repository Connection and Pushing Code from Ubuntu VM

## Step 1: Check Your Git Remote URL

Before pushing code, verify whether your Git remote URL is set to HTTPS or SSH.

Run the following command:

```bash
git remote -v
```

If the output shows an HTTPS URL (e.g., `https://github.com/your-username/repo.git`), you need to switch to SSH to avoid authentication issues.

## Step 2: Remove Incorrect HTTPS Remote

If your remote is set to HTTPS, remove it using:

```bash
git remote remove origin
```

## Step 3: Add the Correct SSH Remote

Now, add the correct SSH remote URL:

```bash
git remote add origin git@github.com:your-username/repository-name.git
```

Verify the update:

```bash
git remote -v
```

You should now see:

```
origin  git@github.com:your-username/repository-name.git (fetch)
origin  git@github.com:your-username/repository-name.git (push)
```

## Step 4: Configure SSH Access (If Not Set Up)

To ensure SSH authentication is set up correctly:

### 4.1 Generate SSH Key (If You Don’t Have One)

Run the following command to generate an SSH key:

```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
```

- Press **Enter** to save the key in the default location (`~/.ssh/id_ed25519`).
- Leave the passphrase empty (or set one if preferred).

### 4.2 Add the SSH Key to GitHub

To copy your SSH public key, run:

```bash
cat ~/.ssh/id_ed25519.pub
```

- Copy the output.
- Go to **GitHub → Settings → SSH and GPG keys**.
- Click **New SSH Key**, paste the copied key, and save.

### 4.3 Test SSH Connection

Run:

```bash
ssh -T git@github.com
```

If SSH is correctly set up, you should see:

```
Hi your-username! You've successfully authenticated, but GitHub does not provide shell access.
```

## Step 5: Commit and Push Your Code

Once SSH is configured and the remote is set up correctly, proceed with pushing your code.

### 5.1 Stage and Commit Changes

```bash
git add .
git commit -m "Initial commit"
```

### 5.2 Push Code to GitHub

```bash
git push -u origin main
```

## Step 6: Verify on GitHub

1. Open your GitHub repository in a web browser.
2. Refresh the page to check if the files are uploaded successfully.

## Troubleshooting

### If You Still Get Authentication Errors

- Ensure your SSH key is correctly added to GitHub.
- Restart the SSH agent and add the key manually:
  ```bash
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/id_ed25519
  ```
- Check your repository permissions on GitHub.

By following these steps, you should be able to push your code to GitHub seamlessly using SSH. 🚀

