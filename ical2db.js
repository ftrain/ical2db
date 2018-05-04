const ICAL_FILE = 'basic.ics';
var fs = require('fs');
var ical = require('ical.js');
fs.readFile(ICAL_FILE, "utf8", function(err, data) {
    console.log("BEGIN TRANSACTION;");
    console.log("CREATE TABLE IF NOT EXISTS cal (uid text, json JSON);");
        let jcal = ical.parse(data);
        let comp = new ical.Component(jcal);
        let vevents = comp.getAllSubcomponents("vevent");
        for (i in vevents) {
            let x = {};
            let ea = vevents[i]['jCal'][1];
            for (i in ea) {
                let key = ea[i][0];
                let val = ea[i][3];
                if (key == 'attendee') {
                    if (!x[key]) x[key] = new Array();                        
                    x[key].push(val);
                }
                else {
                    x[key]=val;
                }
            }
	    let j = JSON.stringify(x);
	    let jr = j.replace(/'/g, "''");
	    console.log(`INSERT INTO cal VALUES ('${x.uid}', '${jr}');\n`);
        }
    console.log("COMMIT;");    
});
