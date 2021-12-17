app.controller("authority-ctrl", function($scope, $http, $location){
	
	$scope.roles = [];
	$scope.users = [];
	$scope.authorities = [];
	$scope.authority =[];
	
	$scope.initialize = function(){
		$http.get("/rest/roles").then(resp => {
			$scope.roles = resp.data;
		})
		
		$http.get("/rest/users").then(resp => {
			$scope.users = resp.data;
		})
		
		$http.get("/rest/authorities").then(resp => {
			$scope.authorities=resp.data;
		}).catch(error => {
			$location.path("/unauthorized");
		})
	}
	
	$scope.search = function(username){
		var user = $scope.users.find(ur => ur.username == username);
		if(user == null){
			Swal.fire({
				  icon: 'success',
				  title: 'Thành công',
				  text: 'Tài khoản không tồn tại !',			  
				  width:'500px',
				  heightAuto:true
				})
			$scope.initialize();
		} else {
			$scope.users = [];
			$scope.users.push(user);
		}
	}
	
	$scope.authority_changed = function(acc, role){
		var authority = $scope.authority_of(acc, role);
		if(authority){
			$scope.revoke_authority(authority);
		} else {
			authority = {user:acc, role:role};
			$scope.grant_authority(authority);
		}
	}
	
	$scope.authority_of = function(acc,role){
		if($scope.authorities){
			return $scope.authorities
				.find(ur => ur.user.username==acc.username && ur.role.id==role.id);
		}
	}
	
	$scope.grant_authority = function(authority){
		$http.post('/rest/authorities/', authority).then(resp => {
			$scope.authorities.push(resp.data)
			Swal.fire({
				  icon: 'success',
				  title: 'Thành công',
				  text: 'Cấp quyền sử dụng thành công !',			  
				  width:'500px',
				  heightAuto:true
				})
		}).catch(error => {
			Swal.fire({
				  icon: 'error',
				  title: 'Thành công',
				  text: 'Cấp quyền sử dụng thất bại !',			  
				  width:'500px',
				  heightAuto:true
				})
			console.log("Error", error)
		});
	}
	
	$scope.revoke_authority = function(authority){
		$http.delete(`/rest/authorities/${authority.id}`).then(resp => {
			var index = $scope.authorities.findIndex(a => a.id == authority.id);
			$scope.authorities.splice(index, 1)
			Swal.fire({
				  icon: 'success',
				  title: 'Thành công',
				  text: 'Thu hồi quyền thành công !',			  
				  width:'500px',
				  heightAuto:true
				})
		}).catch(error => {
			Swal.fire({
				  icon: 'error',
				  title: 'Thành công',
				  text: 'Thu hồi quyền thất bại !',			  
				  width:'500px',
				  heightAuto:true
				})
			console.log("Error", error)
		});
	}
	
	$scope.initialize();
	
})