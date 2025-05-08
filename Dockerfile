# 도커를 사용하기 위한 base 이미지 설정
# node:22-alpine3.20: node.js 22 버전과 최소한의 alpine 리눅스 기반 이미지
FROM node:22-alpine3.20

# /app 디렉토리로 작업 디렉토리 설정
WORKDIR /app

# Docker는 레이어 시스템을 사용하므로, 변경되지 않는 파일은 상단에 배치하여 캐시 활용 최적화
# package.json, package-lock.json 파일을 복사하여 의존성 설치에 필요한 정보만 먼저 처리
COPY package.json package-lock.json ./

# 의존성 설치 (npm ci는 package-lock.json에 명시된 버전으로 설치)
RUN npm ci

# index.js를 컨테이너의 /app 디렉토리로 복사 (실행할 파일)
COPY index.js .

# 엔트리 포인트 설정: 컨테이너 실행 시 "node index.js" 명령어로 실행
ENTRYPOINT [ "node", "index.js" ]


# ######################
# 도커 주요 명령어 모음
# ######################

# 1. 도커 이미지 빌드
# docker build -t <이미지 이름>:<태그> .

# 2. 도커 컨테이너 실행
# docker run -d -p <호스트 포트>:<컨테이너 포트> <이미지 이름>:<태그>

# 3. 실행 중인 컨테이너 확인
# docker ps

# 4. 모든 컨테이너 확인 (실행 중인 + 중지된 컨테이너)
# docker ps -a

# 5. 컨테이너 시작
# docker start <컨테이너 ID 또는 이름>

# 6. 컨테이너 중지
# docker stop <컨테이너 ID 또는 이름>

# 7. 컨테이너 삭제
# docker rm <컨테이너 ID 또는 이름>

# 8. 컨테이너 로그 확인
# docker logs <컨테이너 ID 또는 이름>

# 9. 이미지 목록 확인
# docker images

# 10. 이미지 삭제
# docker rmi <이미지 ID 또는 이름>

# 11. 이미지 강제 삭제
# docker rmi -f <이미지 ID 또는 이름>

# 12. 이미지 실행 후 쉘 접속
# docker run -it <이미지 이름> /bin/sh

# 13. 도커 시스템 정리 (사용하지 않는 리소스 삭제)
# docker system prune

# 14. 도커 볼륨 목록 확인
# docker volume ls

# 15. 도커 네트워크 목록 확인
# docker network ls

# 16. 도커 정보 확인 (전체 상태 확인)
# docker info

# 17. 도커 로그아웃
# docker logout

# 18. 도커 로그인
# docker login