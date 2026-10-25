# Working together

## Edit through GitHub

1. Open the file and click the pencil icon. For a document, edit `docs/proposal/main.tex` or a section under `docs/report/sections/`.
2. Choose a new branch and open a pull request describing the change.
3. Wait for **Build documents** to pass. Download `document-pdfs` from that Actions run to preview the PDFs.
4. Ask another teammate to review, then squash-merge the pull request. GitHub builds and updates the PDFs on `main` automatically.

No local LaTeX installation is needed for this workflow. Small documentation fixes can be committed directly to `main`; use pull requests for technical changes and substantial writing.

## Edit locally

```sh
git switch main
git pull --ff-only
git switch -c docs/update-proposal
# Edit files, then:
git add docs/proposal/main.tex
git commit -m "Clarify proposal scope"
git push -u origin docs/update-proposal
```

Open a pull request on GitHub and follow the same review steps. Before starting further work, pull `main` again, including the automatic PDF commit. If Git reports conflicting changes, resolve them on your branch; do not force-push `main`.

## Optional local document builds

Install a TeX distribution with `latexmk` and pdfLaTeX (MacTeX on macOS, TeX Live on Linux, or MiKTeX on Windows). The documents use standard LaTeX packages; Source Sans is used if installed, with Latin Modern as a fallback.

From the repository root, in Bash (Git Bash or WSL on Windows):

```sh
make docs
make clean-docs
```

`make docs` builds both documents, placing temporary files in each document's ignored `build/` folder. Only after both builds succeed are the PDFs beside the sources replaced. `make clean-docs` removes the temporary build folders and preserves the PDFs. GitHub uses these same commands.

Commit text sources and figures. Normally leave PDF updates to GitHub; do not hand-edit generated PDFs. Failed builds retain the last successful PDFs, so always check the latest Actions result before submission.

## Organize work

- Use Issues with a concrete outcome and an assignee; link pull requests with `Closes #123` where appropriate.
- Record decisions and meeting outcomes in `docs/notes.md`.
- Divide report writing between section files to reduce conflicts.
- Store hardware sources with their tool/version, and tie manufacturing exports and test data to a board revision and firmware commit.
- Record each member's contribution in the report. Agree roles together; the initial Issues are unassigned.

The repository supports collaboration and version history, not simultaneous editing of the same file. Coordinate before editing the same paragraph or PCB file.

## PDF automation

The workflow builds on document changes in pull requests and every push to `main`, and can be run manually from Actions. Preview builds have read-only repository access. A separate publish job on `main` uses GitHub's built-in token to update only the two PDFs. Old runs cannot replace PDFs for newer source commits. No personal access token is required.

`main` blocks deletion and force pushes. Pull-request reviews are a team convention rather than a mandatory rule, allowing the PDF publisher and small direct edits to work without exceptions.
