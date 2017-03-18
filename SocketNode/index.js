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

    setTimeout(function() {
      io.emit('registrationSuccess', 'OK');
    }, 2000);


    //io.emit('requetFail', 'OK');
  });

  clientSocket.on('getPlaces', function() {
    console.log("asked for places");

    var place1 = {name:"18|8 Anaheim Hills", address:"5773 E Santa Ana Canyon Rd Suite B Anaheim CA 92807 United States", phone:"(714) 591-8188"};
    var place2 = {name:"18|8 Brea Gateway Center", address:"207 West Imperial Highway Suite A Brea CA 92821 United States", phone:"(714) 784-0188"};
    var place3 = {name:"18|8 Campbell", address:"513 East Hamilton Ave Campbell CA 95008 United States", phone:"(408) 872-6401"};
    var place4 = {name:"18|8 Costa Mesa on Anton", address:"650 Anton Blvd #F Costa Mesa CA 92626 United States", phone:"(714) 435-1888"};
    var place5 = {name:"18|8 Costa Mesa on Newport Blvd", address:"1835 Newport Blvd Suite D-150 Costa Mesa CA 92627 United States", phone:"(949) 274-4018"};

    setTimeout(function() {
      io.emit('getPlacesSuccess', [place1, place2, place3, place4, place4]);
    }, 2000);


    //io.emit('requetFail', 'OK');
  });

  clientSocket.on('getServices', function(category) {
    console.log(category);


    setTimeout(function() {
      io.emit('getServicesSuccess', ["Buzz cut", "Executive haircut", "Beard trim", "Classic haircut"]);
    }, 2000);


    //io.emit('requetFail', 'OK');
  });

  clientSocket.on('getEmployees', function(service) {
    console.log(service);

    setTimeout(function() {
      io.emit('getEmployeesSuccess', ["male", "female", "Samat"]);
    }, 2000);


    //io.emit('requetFail', 'OK');
  });

  clientSocket.on('getDaysAndTimes', function(category, service, employee) {
    console.log("getDaysAndTimes " + category + service + employee);

    setTimeout(function() {
      io.emit('getDaysAndTimesSuccess', [["19.03.2017", "21.03.2017"], [["9:00", "12:00"], ["15:00", "16:00"]]]);
    }, 2000);

    //io.emit('requetFail', 'OK');
  });

  clientSocket.on('book', function(day, time) {
    console.log("book " + day + time);

    setTimeout(function() {
      io.emit('bookSuccess', "OK");
    }, 2000);


    //io.emit('requetFail', 'OK');
  });
});
