BEGIN TRANSACTION;

.headers on
.mode columns

DROP TABLE IF EXISTS meeting;

CREATE TABLE IF NOT EXISTS meeting (
       uid TEXT PRIMARY KEY,
       organizer TEXT,
       dtstart DATETIME,
       dtend DATETIME,
       description TEXT);

INSERT INTO meeting
       SELECT uid,
       	      json_extract(json, '$.organizer'),
       	      json_extract(json, '$.dtstart'),
	      json_extract(json, '$.dtend'),
	      json_extract(json, '$.description')
       FROM cal GROUP BY uid;

DROP TABLE IF EXISTS attendees;
CREATE TABLE IF NOT EXISTS attendees (
       meeting_id text,
       person text,
       FOREIGN key(meeting_id) REFERENCES meeting(uid)
);

INSERT INTO attendees
       SELECT uid, c.value
       FROM cal, json_each(cal.json, '$.attendee') AS c;

DROP TABLE IF EXISTS ft;
CREATE VIRTUAL TABLE IF NOT EXISTS ft USING fts5(uid, description);
INSERT INTO ft SELECT uid, description from meeting;

COMMIT;


