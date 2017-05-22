var child = require('child_process').execFile(__dirname+'/app.py', 
function(err, stdout, stderr) { 
    // Node.js will invoke this callback when the 
    console.log(err);
});  