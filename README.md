# 🚀 CI/CD Demo Project

GitHub Actions + Docker + AWS EC2를 활용한 CI/CD 파이프라인 샘플 프로젝트입니다.

## 프로젝트 구조

```
├── src/
│   └── main/
│       ├── java/com/example/demo/
│       │   ├── DemoApplication.java
│       │   └── HealthController.java
│       └── resources/
│           ├── static/
│           │   └── index.html
│           └── application.yml
├── .github/
│   └── workflows/
│       └── deploy.yml
├── Dockerfile
├── build.gradle
└── settings.gradle
```

## 기술 스택

- Java 17
- Spring Boot 3.5.9
- Gradle 8.5
- MySQL (AWS RDS)
- Docker
- GitHub Actions

---

## GitHub Secrets 설정

Repository → Settings → Secrets and variables → Actions에서 아래 값들을 등록하세요.

| Secret Name       | 설명 | 예시 |
|-------------------|------|------|
| `DOCKER_USERNAME` | Docker Hub 사용자명 | `myusername` |
| `DOCKER_PASSWORD` | Docker Hub 비밀번호 | `mypassword` |
| `EC2_HOST`        | EC2 퍼블릭 IP | `3.35.xxx.xxx` |
| `EC2_SSH_KEY`     | EC2 SSH 프라이빗 키 (.pem 내용 전체) | `-----BEGIN RSA...` |
| `DB_URL`          | JDBC URL | `jdbc:mysql://mydb.xxxxx.ap-northeast-2.rds.amazonaws.com:3306/demo` |
| `DB_USERNAME`     | DB 사용자명 | `admin` |
| `DB_PASSWORD`     | DB 비밀번호 | `mydbpassword` |

---

## 로컬 실행 (선택사항)

```bash
# 빌드
./gradlew build

# 실행 (환경변수 설정 필요)
DB_HOST=localhost DB_NAME=demo DB_USERNAME=root DB_PASSWORD=password ./gradlew bootRun
```

---

## 배포 흐름

```
1. main 브랜치에 Push
2. GitHub Actions 자동 실행
   ├── Docker 이미지 빌드
   └── Docker Hub에 Push
3. EC2에 SSH 접속
   ├── 새 이미지 Pull
   └── 컨테이너 재시작
4. 배포 완료!
```

---

## 확인 방법

- 웹 브라우저: `http://{EC2_IP}:8080`
- Health Check: `http://{EC2_IP}:8080/health`

---

## 주의사항

⚠️ 이 프로젝트는 학습용입니다.

- RDS 퍼블릭 액세스는 실무에서 사용하지 마세요
- 세션 종료 후 AWS 리소스를 꼭 삭제하세요
