var child = require('child_process').exec('sudo python scan_pi.py');
child.stdout.removeAllListeners("data");
child.stderr.removeAllListeners("data");
child.stdout.pipe(process.stdout);
child.stderr.pipe(process.stderr);