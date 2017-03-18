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

  clientSocket.on('registration', function(email, password, name, surname, phone) {
    console.log(email + password + name + surname + phone);
    io.emit('registrationSuccess', 'OK');
  });

  clientSocket.on('getPlaces', function() {
    console.log("asked for places");

    var place = {name:"testName", address:"testAddress", phone:"testPhone"};
    io.emit('getPlacesSuccess', [place, place, place, place]);
  });

  clientSocket.on('getServices', function(category) {
    console.log(category);
    io.emit('getServicesSuccess', ["service1", "service2", "service3"]);
  });

  clientSocket.on('getEmployees', function(service) {
    console.log(service);
    io.emit('getEmployeesSuccess', ["employee1", "employee2", "employee3"]);
  });

  clientSocket.on('getDaysAndTimes', function(category, service, employee) {
    console.log("getDaysAndTimes " + category + service + employee);

    io.emit('getDaysAndTimesSuccess', [["21.03.2017", "19.03.2017"], [["1", "2"], ["3", "4"]]]);
  });

  clientSocket.on('book', function(day, time) {
    console.log("book " + day + time);

    io.emit('bookSuccess', "OK");
  });
});
