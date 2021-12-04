app.controller("admin-ctrl", function($scope,$http){
	$scope.user = {};
	$http.get("/rest/users/getUser").then(resp => {
		$scope.user = resp.data;
		let image = $scope.user.image;
		$http.get(`/rest/test/image`).then(resp => {
			$scope.user.image = "default-user.jpg";
		});
	}).catch(e => {
		console.log("e",e);
	});
})