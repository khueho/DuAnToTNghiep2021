app = angular.module("admin-app",["ngRoute"]);

app.config(function($routeProvider){
    $routeProvider
    .when("/cinema" ,{
        templateUrl :"/assets/admin/cinema/index.html",
        
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
        
    })
    .otherwise({
        template :"<h1 class='text-center' ></h1>"
    });
})