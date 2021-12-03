// var app = angular.module("phim", []);
// var controller = app.controller("datve", function($scope){
//     console.log("Vào game nè!");
//     $scope.chair = [];
//     for(var i = 1; i <= 116; i++){
//         var char = angular.copy($scope.chair);
//         $scope.temp = {
//             id: i,
//             name: "A"+i
//         }
//         $scope.chair.push($scope.temp);
//     }
//     console.log($scope.chair[0].id);
// });

var Username = "Huy Nguyen Thanh";
localStorage.setItem('chair', "");
function onLoaderFunc() {

	$(".seatsStructure *").prop("disabled", false);
	$(".displayerBoxes *").prop("disabled", false);
}
function takeData() {
	if ((Username.length == 0) || (Numseats.length == 0)) {
		alert("Please Enter your Name and Number of Seats");
	}
	else {
		$(".inputForm *").prop("disabled", true);
		$(".seatsStructure *").prop("disabled", false);
		document.getElementById("notification").innerHTML = "<b style='margin-bottom:0px;background:yellow;'>Please Select your Seats NOW!</b>";
	}
}

function updateTextArea() {
	var price = 50000;
	localStorage.setItem("price", price);
	if ($("input:checked").length != 0) {
		$(".seatsStructure *").prop("disabled", true);

		var allNameVals = [];
		//  var allNumberVals = [];
		var allSeatsVals = [];

		//Storing in Array
		allNameVals.push(Username);
		//  allNumberVals.push(Numseats);
		$('#seatsBlock :checked').each(function() {
			allSeatsVals.push($(this).val());
			// var seattemp = {
			//   "Name": $(this).val()
			// }
			// allSeatsVals.push(seattemp);
		});
		//Displaying 
		$('#nameDisplay').val(allNameVals);
		$('#NumberDisplay').val(allSeatsVals.length);
		$('#seatsDisplay').val(allSeatsVals);
		localStorage.setItem('chair', "");
		localStorage.setItem('chair', JSON.stringify(allSeatsVals));
		localStorage.setItem('number', allSeatsVals.length);
		localStorage.setItem('username', allNameVals);

	}
	else {
		alert("Vui lòng chọn ghế!");
	}

}
function nextdoan() {

	updateTextArea();

	var c = localStorage.getItem('chair'); console.log("Chọn đồ ăn: " + c.length)
	if (c.length > 0) {
		window.location.href = "/ticket/bookfood";
	}
}
function myFunction() {
	alert($("input:checked").length);
}
function next() {
	window.location.href = "/ticket/bookfood";
}

/*
function getCookie(cname) {
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for(var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') {
			c = c.substring(1);
		}
		if (c.indexOf(name) == 0) {
			return c.substring(name.length, c.length);
		}
	}
	return "";
}
*/


// $(":checkbox").click(function() {
//   if ($("input:checked").length == (Numseats)) {
//     $(":checkbox").prop('disabled', true);
//     $(':checked').prop('disabled', false);
//   }
//   else
//     {
//       $(":checkbox").prop('disabled', false);
//     }
// });