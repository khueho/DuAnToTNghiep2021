app = angular.module("admin-app",["ngRoute"]);

app.config(function($routeProvider){
    $routeProvider
    .when("/cinema" ,{
        templateUrl :"/assets/admin/cinema/index.html",
        
    })
    .when("/room" ,{
        templateUrl :"/assets/admin/room/index.html",
		controller:"room-ctrl"
        
    })
     .when("/movie" ,{
        templateUrl :"/assets/admin/movie/index.html",
     })
     .when("/show" ,{
        templateUrl :"/assets/admin/show/index.html",
         
     })
     .when("/account" ,{
        templateUrl :"/assets/admin/account/index.html",

     })
     .when("/authorize" ,{
        templateUrl :"/assets/admin/authority/index.html",
        controller: "authority-ctrl"
    })
      .when("/foods" ,{
        templateUrl :"/assets/admin/food/index.html",
    })
    .when("/sales" ,{
        templateUrl :"/assets/admin/sale/index.html",
    })
    .when("/orders" ,{
        templateUrl :"/assets/admin/order/index.html",
		controller: "order-ctrl"
    })
	.when("/tickets" ,{
        templateUrl :"/assets/admin/ticket/index.html",
    })
    .when("/censors" ,{
        templateUrl :"/assets/admin/censor/index.html",
    })
    .when("/prices" ,{
        templateUrl :"/assets/admin/price/index.html",
    })
	.when("/statistics" ,{
        templateUrl :"/assets/admin/statistics/index.html",
    })
    .otherwise({
        template :"<h1 class='text-center' ></h1>"
    });
})