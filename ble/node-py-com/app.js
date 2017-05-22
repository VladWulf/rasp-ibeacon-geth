//start.js
var spawn = require('child_process').spawn;
var py = spawn('python2', ['app.py']);
var data = [];

py.stdout.on('data', function(_data){
  if(parseInt(_data) == 8){
    console.log('success!')
  }
});

py.stdout.on('end', function(){
  console.log('Child process ended');
});


// py.stdin.write(JSON.stringify(data));
py.stdin.end();