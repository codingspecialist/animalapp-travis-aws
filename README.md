### 권한문제 해결

```yml
git update-index --chmod=+x gradlew
git ls-tree HEAD
git commit -m "permission access for travis"
```