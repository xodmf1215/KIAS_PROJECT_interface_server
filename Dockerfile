# Node.js 14 버전 이미지를 기반으로 한다.
FROM node:18

# 작업 디렉토리를 /app으로 지정
WORKDIR /app

# 의존성 패키지를 설치
COPY package*.json ./
RUN npm install

# 소스코드를 복사
COPY . .

# 포트 지정
EXPOSE 3000

# 서버 실행
CMD [ "node", "server.js" ]
CMD [ "npm", "start" ]

# Nginx 구성
RUN if [ -e /etc/nginx/conf.d/default.conf ]; then rm /etc/nginx/conf.d/default.conf; fi
COPY nginx.conf /etc/nginx/conf.d/