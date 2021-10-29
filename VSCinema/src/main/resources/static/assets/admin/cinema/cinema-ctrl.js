
app.controller("cinema-ctrl", function($scope, $http) {
	$scope.items = [];
	$scope.form = {};

	$scope.initialize = function() {
		// load cinema
		$http.get("/rest/cinemas").then(resp => {
			$scope.items = resp.data;
		});
		$scope.isLoad = true;
	}

	// start
	$scope.initialize();

	// load city
	$http.get("/rest/city").then(resp => {
		$scope.city = resp.data;
	});

	$scope.isEdit = undefined;
	$scope.isLoad = undefined;

	// refresh form
	$scope.reset = function() {
		$scope.form = {
		}
		$scope.isEdit = false;
		$scope.isLoad = true;
	}

	// fill to form cinema

	$scope.edit = function(item) {
		$scope.form = angular.copy(item);
		$(".nav-tabs a:eq(0)").tab('show');
		$scope.isEdit = true;
		$scope.isLoad = false;
	}


	// create cinema
	$scope.create = function() {
		var item = angular.copy($scope.form); // Lấy thông tin của cinema
		var x = document.getElementById("name").value;
		var y = document.getElementById("address").value;
		var z = document.getElementById("city").value;
		if (x == "" || x == null) {
			alert("Vui lòng nhập tên rạp !");
		} else if (y == "" || y == null) {
			alert("Vui lòng nhập địa chỉ !");
		} else if (z == "" || z == null) {
			alert("Vui lòng chọn thành phố !");
		}else {
			$http.post(`/rest/cinemas`, item).then(resp => {
				$scope.items.push(resp.data);
				$scope.reset();
				alert("Thêm mới rạp phim thành công !");
				$scope.initialize();
			}).catch(error => {
				alert("Error", error);
				console.log("Không thể thêm mới rạp phim !");
			});
		}
	}

	// update cinema
	$scope.update = function() {
		var item = angular.copy($scope.form); // Lấy thông tin của cinema
		var x = document.getElementById("name").value;
		var y = document.getElementById("address").value;
		var z = document.getElementById("city").value;
		if (x == "" || x == null) {
			alert("Vui lòng nhập tên rạp !");
		} else if (y == "" || y == null) {
			alert("Vui lòng nhập địa chỉ !");
		} else if (z == "" || z == null) {
			alert("Vui lòng chọn thành phố !");
		}else {
			$http.put(`/rest/cinemas`, item).then(resp => {
				var index = $scope.items.findIndex(p => p.id == item.id); // tìm cinema trong csdl và thay đổi thông tin
				//resp.data.createDate = new Date(resp.data.createDate) sau khi server trả dữ liệu về -> chuyển ngày sang javascript 
				$scope.items[index] = item;
				alert("Cập nhật rạp phim thành công !");
			}).catch(error => {
				alert("Không thể cập nhật rạp phim");
				console.log("Error", error);
			});
		}
	}


	// remove cinema
	$scope.delete = function(item) {
		$http.delete(`/rest/cinemas/${item.id}`).then(resp => {
			var index = $scope.items.findIndex(p => p.id == item.id); // tìm cinema trong csdl và thay đổi thông tin
			$scope.items.splice(index, 1); // xóa phần tử tại index - xóa 1 phần tử
			$scope.reset();
			alert("Xóa rạp phim thành công !");
		}).catch(error => {
			alert("Không thể xóa rạp phim");
			console.log("Error", error);
		});
	}

	$scope.pager = {
		page: 0,
		size: 10,
		get items() {
			var start = this.page * this.size; // vị trí cinema bắt đầu lấy
			return $scope.items.slice(start, start + this.size); // Tách những cinema đang xem
		},

		get count() {
			return Math.ceil(1.0 * $scope.items.length / this.size);
		},

		first() {
			this.page = 0;
		},

		prev() {
			this.page--;
			if (this.page < 0) {
				this.last();
			}
		},

		next() {
			this.page++;
			if (this.page >= this.count) {
				this.first();
			}
		},

		last() {
			this.page = this.count - 1;
		},
	}
});