This lets you load your calendar into a SQLite database. It is very crappy and for demo purposes.

- Download your calendar, move it here to this folder, and rename it `basic.ics`

Do these things
- `npm install`
- `node ical2db.js|sqlite3 calendar.db`
- `cat calendar.sql|sqlite3 calendar.db`
- `cat hrs.sql|sqlite3 calendar.db`
- `datasette calendar.db`

You may need to `pip install datasette`.
