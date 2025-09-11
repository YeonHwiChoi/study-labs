# Day3 Linux 로그 실습

1. 최근 1시간 SSH 로그
journalctl -u ssh --since "1 hour ago"

2. 인증 실패 로그
grep "failed" /var/log/auth.log

3. PostgreSQL 로그 추출
grep "postgres" /var/log/syslog

4. 실시간 로그 모니터링
tail -f /var/log/syslog