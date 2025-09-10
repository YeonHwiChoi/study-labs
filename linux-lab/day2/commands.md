# Day2 Linux 실습: 프로세스 & 서비스 & 로그 관리

## 📌 프로세스 확인
1. 전체 프로세스 목록
ps aux

2. 특정 프로세스 검색
ps aux | grep postgres

3. CPU/메모리 사용량 실시간 모니터링
top
(종료: q)

📌 서비스 관리 (systemd)
1. 서비스 상태 확인
systemctl status ssh

2. 서비스 제어
systemctl start ssh      # 서비스 시작
systemctl stop ssh       # 서비스 중지
systemctl restart ssh    # 서비스 재시작

📌 로그 확인
1. 최근 시스템 에러 로그
journalctl -xe

2. syslog 확인
tail -n 20 /var/log/syslog

3. 인증 로그 확인
tail -n 20 /var/log/auth.log

4. 특정 키워드 필터
grep "error" /var/log/syslog