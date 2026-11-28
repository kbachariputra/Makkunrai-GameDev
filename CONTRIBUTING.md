# SOP: Making a Code Change (Git + Jira)

Our Jira project key is **KAN**. Replace the ticket number in the examples with your own.

## Rules

1. Never commit or push directly to `main`.
2. One ticket = one branch = one pull request.
3. Every branch name, commit message, and PR title starts with the ticket key (e.g. `KAN-12`).
4. Only one person edits a given scene (`.tscn`) at a time. Check Jira assignments first.
5. Everyone uses the same Godot version (see the README).
6. Move or rename files inside Godot's FileSystem dock, not the OS file explorer, so `.uid` files and references stay intact.

## Procedure

### 1. Claim the ticket

- Assign the ticket to yourself in Jira.
- Move it to **In Progress**.

### 2. Create a branch from the latest `main`

```bash
git checkout main
git pull
git checkout -b KAN-12-short-description
```

### 3. Make your changes

- Work in Godot, save, and run the game to test.
- Check what changed before committing:

```bash
git status
```

### 4. Commit with the ticket key

```bash
git add .
git commit -m "KAN-12: describe what you did"
```

Commit small and often. Rough "WIP" messages are fine on a feature branch.

### 5. Push the branch

```bash
git push -u origin KAN-12-short-description
```

The `-u` is only needed the first time. After that, use `git push`.

### 6. Open a Pull Request

- Title: `KAN-12: short description`
- Describe what changed and how to test it.
- Use a **Draft PR** if the work isn't finished yet.
- Move the Jira ticket to **In Review**.
- Ask a teammate to review.

### 7. Review

- The reviewer pulls the branch (or reads the diff), checks that the project opens and runs, and approves or requests changes.
- If changes are requested, commit and push to the same branch. The PR updates automatically.

### 8. Merge

- Merge the PR into `main` on GitHub once it's approved.
- Move the Jira ticket to **Done**.
- Delete the merged branch (GitHub offers a button for this).

### 9. Sync your local copy

```bash
git checkout main
git pull
```

## While Working on a Long Task

Pull the latest `main` into your branch regularly so conflicts stay small:

```bash
git pull origin main
```

## If There's a Merge Conflict

1. Run `git pull origin main`. Git will list the conflicted files.
2. Open each file and look for the `<<<<<<<`, `=======`, and `>>>>>>>` markers.
3. Keep the correct code and delete the markers.
4. Then run:

```bash
git add .
git commit -m "KAN-12: resolve merge conflict"
```

5. For `.tscn` conflicts, talk to the teammate who changed the file and decide together which version to keep.

## Pre-Push Checklist

- [ ] The project opens in Godot without errors.
- [ ] `.godot/` is not being committed.
- [ ] The commit message includes the ticket key.
- [ ] You're on your ticket branch, not `main` (`git branch` shows your current branch).

## Jira Status Flow

**To Do → In Progress → In Review → Done**

## Quick Reference

| Goal | Command |
|---|---|
| Start a task | `git checkout main && git pull && git checkout -b KAN-12-name` |
| Save progress | `git add . && git commit -m "KAN-12: message"` |
| Share it | `git push -u origin KAN-12-name` |
| Update your branch | `git pull origin main` |
| Get others' work | `git checkout main && git pull` |
| Check status | `git status` |
