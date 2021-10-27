app.controller("room-ctrl", function($scope, $http, $location) {
	$scope.items = []
	$scope.form = {}
	$scope.cinemas = []
	$scope.seats=[]
	$scope.error={}
	$scope.initialize = function() {
		$http.get("/rest/rooms").then(resp => {
			$scope.items = resp.data
			console.log(resp.data)
		}).catch(error => {
			console.log(error)
		})
		$http.get("/rest/cinemas").then(resp => {
			$scope.cinemas = resp.data
		}).catch(error => {
			console.log(error)
		})
	}
	$scope.edit = function(item) {
		$scope.form = angular.copy(item);
		$http.get(`/rest/seats/${item.id}`).then(resp => {
			$scope.seats = resp.data
			console.log($scope.seats)
		}).catch(error => {
			console.log(error)
		})
		$(".nav-tabs a:eq(0)").tab('show');
	}
	$scope.reset = function() {
		$scope.form = {activity:true}
		$scope.seats=[]
		$scope.initialize()
		$scope.error={}
	}
	$scope.filter=function(){
		var cinemaid=$scope.form.cinema.id
		$http.get(`/rest/rooms/${cinemaid}`).then(resp => {
			$scope.items = resp.data
		}).catch(error => {
			console.log(error)
		})
	}
	$scope.create = function() {
		var item = angular.copy($scope.form);
		$http.post(`/rest/rooms`, item).then(resp => {
			$scope.items.push(resp.data)
			$scope.reset()
			$scope.initialize()
			Swal.fire({
				icon: 'success',
				title: 'Thành công',
				text: 'Thêm mới thành công',
				width: '500px',
				heightAuto: true
			})
		}).catch(error => {
			$scope.error = error.data;
			console.log(error)
			Swal.fire({
				icon: 'error',
				title: 'Thất bại',
				text: 'Lỗi thêm mới sản phẩm',
				width: '500px',
				heightAuto: true
			})
		})
	}
	$scope.update=function(){
		var item=angular.copy($scope.form);
		$http.put(`/rest/rooms/${item.id}`,item).then(resp=>{
			var index=$scope.items.findIndex(r=> r.id==item.id);
			$scope.items[index]=item
			$scope.error={}
			Swal.fire({
				  icon: 'success',
				  title: 'Thành công',
				  text: 'Cập nhật thành công',			  
				  width:'500px',
				  heightAuto:true
				})
		}).catch(error=>{
			$scope.error = error.data;
			Swal.fire({
				  icon: 'error',
				  title: 'Thất bại',
				  text: 'Cập nhật thất bại',			  
				  width:'500px',
				  heightAuto:true
				})
				console.log("Error",error);
		})
		
	}
	$scope.delete = function(id) {
		Swal.fire({
			title: 'Are you sure?',
			text: "You won't be able to revert this!",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
			if (result.isConfirmed) {
				var item = angular.copy($scope.form);
				$http.delete(`/rest/rooms/${id}`).then(resp => {
					var index = $scope.items.findIndex(r => r.id == id);
					$scope.items.splice(index, 1);
					$scope.reset();
					Swal.fire({
						icon: 'success',
						title: 'Thành công',
						text: 'Xóa thành công',
						width: '500px',
						heightAuto: true
					})
				}).catch(error => {
					console.log(error)
				})
			}
		})

	}
	$scope.reset()
	$scope.initialize()

	$scope.pager={
			page:0,
			size:6,
			get items(){
				var start=this.page*this.size;
				return $scope.items.slice(start,start+this.size);
			},
			get count(){
				return Math.ceil(1.0*$scope.items.length/this.size);
			},
			first(){
				this.page=0;
			},
			prev(){
				this.page--;
				if(this.page<0){
					this.last();
				}
			},
			next(){
				this.page++;
				if(this.page>=this.count){
					this.first();
				}
			},
			last(){
				this.page=this.count-1;
			}		
	}
	$scope.seatpager={
			page:0,
			size:6,
			get seats(){
				var start=this.page*this.size;
				return $scope.seats.slice(start,start+this.size);
			},
			get count(){
				return Math.ceil(1.0*$scope.seats.length/this.size);
			},
			first(){
				this.page=0;
			},
			prev(){
				this.page--;
				if(this.page<0){
					this.last();
				}
			},
			next(){
				this.page++;
				if(this.page>=this.count){
					this.first();
				}
			},
			last(){
				this.page=this.count-1;
			}		
	}
})
