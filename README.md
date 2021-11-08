### 권한문제 해결

### CI/CD 배포시 주의할점
- ec2의 태그명과 codedeploy의 배포그룹 설정시 태그명이 일치하기만 하면 된다.
- S3에 배포시에 코드 전체를 배포하는게 아니라 배포전에 zip파일로 압축해서 던진다.
- zip파일로 압축해서 던진 파일을 codedeploy하게 되면 bundle_type에 맞게 자동으로 압축이 풀려서 배포된다.(새로운 기능)

```yml
git update-index --chmod=+x gradlew
git ls-tree HEAD
git commit -m "permission access for travis"
```