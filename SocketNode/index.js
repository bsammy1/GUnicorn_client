var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

app.get('/', function(req, res){
  res.send('');
});

http.listen(3000, function(){
  console.log('Listening on *:3000');
});

io.on('connection', function(clientSocket){
  console.log('a user connected');

  clientSocket.on('registration', function(email, password) {
    console.log(email + password);
    io.emit('registrationSuccess', 'OK');
  });

  clientSocket.on('getPlaces', function() {
    console.log("asked for places");

    var place = {name:"testName", address:"testAddress", phone:"testPhone"};
    io.emit('getPlacesSuccess', [place, place, place, place]);
  });
});
