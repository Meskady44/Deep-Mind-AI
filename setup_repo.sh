#!/bin/bash

# Lista commit message'ów
commit_messages=("feat: Added new feature"
                "fix: Bug fix"
                "chore: Code cleanup"
                "docs: Improved documentation"
                "style: Updated formatting"
                "perf: Performance improvements"
                "test: Added tests"
                "ci: Updated pipeline"
                "refactor: Code refactoring"
                "chore: Updated dependencies")

# Wymuszenie zmiany timestampów dla wszystkich plików
git ls-files | xargs touch

# Dodanie i commitowanie każdego pliku z losowym commit message
for file in $(ls -1); do
    git add "$file"
    git commit -m "${commit_messages[$RANDOM % ${#commit_messages[@]}]}"
done

# Wypchnięcie wszystkich commitów na GitHuba
git branch -M main
git push --force origin main

echo "Repozytorium zostało skonfigurowane i pliki zostały commitowane z różnymi opisami!"
