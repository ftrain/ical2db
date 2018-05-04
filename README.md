- Download your calendar, move it here to this folder, and rename it `basic.ics`

Do these things
- `npm install`
- `node ical2db.js|sqlite3 calendar.db`
- `cat calendar.sql|sqlite3 calendar.db`
- `cat hrs.sql|sqlite calendar3.db`
- `datasette calendar.db`

You may need to pip install datasette.
