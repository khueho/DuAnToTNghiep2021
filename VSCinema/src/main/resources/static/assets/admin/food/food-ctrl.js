/**
 * 
 */

app.controller("food-ctrl", function($scope, $http) {
	$scope.items = [];
	$scope.form = {};
	$scope.isEdit = undefined;
	$scope.isLoad = undefined;

	$scope.initialize = function() {
		// load food
		$http.get("/rest/food").then(resp => {
			$scope.items = resp.data;
			$scope.items.forEach(item => {
				item.createdate = new Date(item.createdate)
			});
		});

		// load city
		$http.get("/rest/city").then(resp => {
			$scope.city = resp.data;
		});



		// load cinema
		$http.get("/rest/cinema").then(resp => {
			$scope.cinema = resp.data;
		});

		$scope.isLoad = true;

	}

	// Khởi đầu
	$scope.initialize();


	// Xóa form
	$scope.reset = function() {
		$scope.form = {
			createdate: new Date(),
			image: 'upload.png',
			active: true
		}
		$scope.isEdit = false;
		$scope.isLoad = true;
	}

	$scope.reset();

	// Hiển thị lên form
	$scope.edit = function(item) {
		$scope.form = angular.copy(item);
		$(".nav-tabs a:eq(0)").tab('show');
		$scope.isEdit = true;
		$scope.isLoad = false;
	}

	// Load Cinema theo City
	$scope.findRapFromCity = function() {
		var cityid = document.getElementById('city').value;
		$http.post(`/rest/cinema/findByCity/` + cityid).then(resps => {
			$scope.cinema = resps.data
			console.log(resps.data)
		}).catch(error => {
			console.log("Error!")
		})
	}

	// Thêm food mới
	$scope.create = function() {
		var item = angular.copy($scope.form); // Lấy thông tin của food
		var x = document.getElementById("name").value;
		var y = document.getElementById('city').value;
		var z = document.getElementById("cinema").value;
		var o = document.getElementById("price").value;
		var t = document.getElementById("description").value;

		if (x == "" || x == null) {
			alert("Vui lòng nhập tên sản phẩm !");
		} else if (y == "" || y == null) {
			alert("Vui lòng chọn thành phố !");
		} else if (z == "" || z == null) {
			alert("Vui lòng chọn rạp !");
		} else if (o == "" || o == null) {
			alert("Vui lòng nhập giá !");
		} else if (t == "" || t == null) {
			alert("Vui lòng mô tả !");
		} else {
			$http.post(`/rest/food`, item).then(resp => {
				resp.data.createdate = new Date(resp.data.createdate); // sau khi server trả dữ liệu về -> chuyển ngày sang javascript
				$scope.items.push(resp.data);
				$scope.reset();
				alert("Thêm mới sản phẩm thành công !");
			}).catch(error => {
				alert("Lỗi thêm mới sản phẩm");
				console.log("Error", error);
			});
		}
	}

	// Cập nhật sản phẩm mới
	$scope.update = function() {
		var item = angular.copy($scope.form); // Lấy thông tin của sp
		$http.put(`/rest/food`, item).then(resp => {
			var index = $scope.items.findIndex(p => p.id == item.id); // tìm sp trong csdl và thay đổi thông tin
			resp.data.createdate = new Date(resp.data.createdate)
			$scope.items[index] = item;
			alert("Cập nhật sản phẩm thành công !");
		}).catch(error => {
			alert("Lỗi cập nhật sản phẩm");
			console.log("Error", error);
		});
	}


	// Xóa sản phẩm
	$scope.delete = function(item) {
		$http.delete(`/rest/food/${item.id}`).then(resp => {
			var index = $scope.items.findIndex(p => p.id == item.id); // tìm sp trong csdl và thay đổi thông tin
			$scope.items.splice(index, 1); // xóa phần tử tại index - xóa 1 phần tử
			$scope.reset();
			alert("Xóa sản phẩm thành công !");
		}).catch(error => {
			alert("Không thể xóa sản phẩm");
			console.log("Error", error);
		});
	}

	// Upload hình
	$scope.imageChanged = function(files) {
		var data = new FormData(); // tạo form data để chứa ảnh đã chọn
		data.append('file', files[0]); // bỏ ảnh vào form data
		$http.post('/rest/upload/foods', data, {
			transformRequest: angular.identity, headers: { 'Content-Type': undefined }
		}).then(resp => {
			$scope.form.image = resp.data.name;
		}).catch(error => {
			alert("Lỗi upload hình ảnh ");
			console.log("Error", error);
		});
	}

	$scope.pager = {
		page: 0,
		size: 10,
		get items() {
			var start = this.page * this.size; // vị trí sản phẩm bắt đầu lấy
			return $scope.items.slice(start, start + this.size); // Tách những sản phẩm đang xem
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