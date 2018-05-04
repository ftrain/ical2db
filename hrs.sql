SELECT
SUM(
 STRFTIME('%s', dtend)
 - STRFTIME('%s', DTSTART))/3600 AS hrs,
organizer
FROM meeting
GROUP BY organizer
ORDER BY hrs
DESC LIMIT 24;
