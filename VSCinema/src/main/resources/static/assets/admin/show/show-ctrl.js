/**
 * 
 */
app.controller('show-ctrl', function($scope, $http) {
	$scope.items = []
	$scope.itemstemp = []
	$scope.fill = [];
	$scope.cinemas = []
	$scope.movies = []
	$scope.rooms = []
	$scope.price_show = []
	$scope.cities = []
	var date = new Date();
	date.setDate(date.getDate()+7)
	$scope.reset = function(){

		$scope.form = {
		startTime: new Date("1974-03-12T08:30:00"),
		endTime: new Date("1974-03-12T10:30:00"),
		showDate: date,
		movie: {
			id: 1
		},
		room: {
			id: 1,
			cinema: {
				city: {
					id: "0"
				}
			}			
		},
		user: {
			username: "huyntpc00617"
		},
		priceShow: {
			id: 1
		},
		activity: true
	}
	}
	$scope.reset();
		
	//Tu them thoi gian cho endtime khi thay doi starttime
	$scope.starttimechange = function(){
		var st = new Date($scope.form.startTime)
		/*var h = st.getHours().toString()
		var m = st.getMinutes().toString()
*/
		console.log(st.getHours()+":"+st.getMinutes()+":"+st.getUTCHours())
		var et = new Date("1974-03-12T"+st.getHours()+":"+st.getMinutes()+":00")
		
		/*et.setHours(st.getHours())
		et.setMinutes(st.getMinutes())
		et.setUTCHours(st.getUTCHours());
		if((et.getHours().toString()).length == 1){
			et.setHours(01)
		}*/
		$scope.form.endTime = et;
		console.log(et.getHours()+":"+et.getMinutes()+":"+et.getUTCHours())
		
	}
	
	$scope.time = function(){
		$scope.hours = [1,2,3,4,5,6,7,8,9,10,11,12];
		$scope.minues = [];
		for(let i=0;i <=59; i++){	
			$scope.minues.push(i);
		}
	}
	$scope.time();
	$scope.init = function() {
		
		$scope.reset();
		$http.get('/rest/show').then(resp => {
			$scope.items = resp.data
			//console.log("Load data success!",$scope.items)
		}).catch(error => {
			console.log('Load data error!', error)
		});
		
		//load cinema
		$http.get('/rest/cinema').then(resp => {
			//$scope.cinemas = resp.data
		}).catch(error => {
			console.log("Error!")
		})
		//load movie
		$http.get('/rest/movie').then(resp => {
			$scope.movies = resp.data
		}).catch(error => {
			console.log("Error!")
		})
		
		//load room
		$http.get('/rest/room').then(resp => {
			$scope.roomss = resp.data
		}).catch(error => {
			console.log("Error!")
		})
		//load price_show
		$http.get('/rest/price_show').then(resp => {
			$scope.price_show = resp.data
		}).catch(error => {
			console.log("Error!")
		})
		
		//load City
		$http.get('/rest/city').then(resp => {
			$scope.cities = resp.data
		//	console.log($scope.cities)
		}).catch(error => {
			console.log("Error!")
		})
	}
	
	//fillmovie()
	$scope.fillmovies = function(movieid){
		//console.log(movieid);
		 for(var i = 0; i < $scope.items.length; i++){
			if($scope.items[i].movie.id == movieid){
				$scope.fill.push($scope.items[i])
			}	
		}
	}
	//fillmovie()
	$scope.fillroom = function(roomid){
		//console.log(movieid);
		 for(var i = 0; i < $scope.items.length; i++){
			
			if($scope.items[i].room.name == roomid){
				$scope.fill.push($scope.items[i])
			}	
		}
	}
	$scope.fills = function(){
		$scope.All()
		$scope.allSave();
		$scope.fill = [];
		var roomid = document.getElementById('room').value;
		roomid = roomid.replace(":","");
		roomid = roomid.replace("string","");
		roomid = roomid.replace("? ","");
		roomid = roomid.replace(" ?","");
		var movieid = document.getElementById('movie').value;
		movieid = movieid.replace(":","");
		movieid = movieid.replace("number","");
		movieid = movieid.replace("? ","");
		movieid = movieid.replace(" ?","");
		console.log(movieid+ "|"+roomid);
		if(roomid != 'undefinedundefined' && movieid != 'undefinedundefined'){
			$scope.fill = [];
			for(var i = 0; i < $scope.items.length; i++){
				if($scope.items[i].movie.id == movieid && $scope.items[i].room.name == roomid){	
						$scope.fill.push($scope.items[i])				
				}	
			}
			return $scope.items = $scope.fill;
		}
		if(roomid != 'undefinedundefined')
		{
			$scope.fill = [];
			 $scope.fillroom(roomid)
		return $scope.items = $scope.fill;
		}
		if(movieid != 'undefinedundefined'){
			$scope.fill = [];
			console.log("Movie")
			$scope.fillmovies(movieid)
			return $scope.items = $scope.fill;
		}
	}
	//Loc tang dan giam dan
	let thuoctinh = undefined;
	$scope.fillUpAndDown = function(column){
			if(thuoctinh == column){
				$scope.items.sort((a, b) => ("b."+thuoctinh > "a."+thuoctinh) ? 1 : -1)
			}
			if(thuoctinh != column){
				$scope.items.sort((a, b) => ("a."+column > "b."+column) ? 1 : -1)
			}
			thuoctinh == column		
		
	}
	
	
	//Luu tat ca show vao bien temp
	$scope.allSave = function(){
		if($scope.itemstemp.length == 0){
			$scope.itemstemp = $scope.items;
		}
	}
	
	//Hien lai tat ca show
	$scope.All = function(){
			if($scope.itemstemp.length != 0){
				$scope.items = angular.copy($scope.itemstemp);
			}
	}
	
	//Tim list rap from city
	$scope.findRapFromCity = function(){
	var cityid = document.getElementById('city').value;
	
	if(cityid == '? string:0 ?'){
		cityid = $scope.form.room.cinema.city.id;
	}
		$http.post(`/rest/cinema/findByCity/`+cityid).then(resps => {
			$scope.cinemas = resps.data
			//console.log(resps.data)
		}).catch(error => {
			console.log("Error!", error)
		})
	}
	
	//Tim room from Cinema
	$scope.findByCinema = function(){
		var cinemaid = $scope.form.room.cinema.id;
		$http.get(`/rest/room/findByCinema/`+cinemaid).then(resp => {
			$scope.rooms = resp.data
			//console.log($scope.rooms)
		}).catch(error => {
			console.log("Error!", $scope.form)
		})
	}
	
	
	
		$scope.edit = function(item){
			$scope.init();
			var showDate = new Date(item.showDate);
			item.startTime =  new Date("1974-03-12T"+item.startTime)
			item.endTime =  new Date("1974-03-12T"+item.endTime)
			console.log(item.showDate)
		$scope.form = angular.copy(item);
		$scope.form.showDate = showDate;
			$scope.findRapFromCity();
			$scope.findByCinema();
		//console.log($scope.form)
		
		$(".nav-tabs a:eq(0)").tab('show')
	}
	
	//Kiem tra chọn ngày cho showDate
		$scope.showDates = function(){	
			var showdate = new Date($scope.form.showDate);
			var newdate = new Date();
			newdate.setDate(newdate.getDate()+7)
			//console.log(showdate.getDate()+"/"+showdate.getMonth()+"/"+showdate.getFullYear()+" | "+newdate.getDate()+"/"+newdate.getMonth()+"/"+newdate.getFullYear())
			if(showdate <= newdate){
				$scope.form.showDate = date;
				alert("Chỉ được chọn ngày lớn hơn ngày "+newdate.getDate()+"/"+newdate.getMonth()+"/"+newdate.getFullYear()+" so với ngày hiện tại!")
			}
			newdate.setDate(newdate.getDate()+7)
			if(showdate > newdate){
				alert("Chỉ được chọn ngày nhỏ hơn ngày "+newdate.getDate()+"/"+newdate.getMonth()+"/"+newdate.getFullYear()+" so với ngày hiện tại!")
			$scope.form.showDate = newdate;
			}
		}
	
	//Thao tác csdl
	//thêm csdl
		$scope.create = function(){
			var data = angular.copy($scope.form)
		console.log(data)
				$http.post(`/rest/show`, data).then(resp => {
					$scope.items.push(resp.data)
					alert("Thêm show thành công!")
					$scope.init()
			}).catch(error =>{
				var datae = error.data
				$http.post('/rest/show/error', datae).then(resp => {
					$scope.error = resp.data
				})
				console.log("error", error)
				$scope.reset();
				alert("Thêm show thất bại!")
			});
		}
		//update 
		$scope.update = function(){
			var data = angular.copy($scope.form)
			var entime = new Date("Thu Jan 01 1970 "+data.endTime)
			data.movie.runningTime = new Date("1974-03-12T"+$scope.form.movie.runningTime)
			data.priceShow.timeSlot = new Date("1974-03-12T"+$scope.form.priceShow.timeSlot)
			data.priceShow.createDate = new Date($scope.form.priceShow.createDate)
			data.priceShow.expiry = new Date($scope.form.priceShow.expiry)
			if(data.room.cinema.city.id == '0'){
				alert("Khong");
				$scope.reset()
				return
			}
			
				$http.post(`/rest/show`, data).then(resp => {
					$scope.items.push(resp.data)
					alert("Cập nhật show thành công!")
					$scope.init()
			}).catch(error =>{
				console.log("error", error)
				$scope.reset();
				alert("Cập nhật show thất bại!")
			});
		}
	//xoa csdl
		$scope.delete = function(id){
			var c = confirm("Bạn có muốn xóa show có mã là "+id);
			if(c == true){
				$http.delete(`/rest/show/`+id).then(resp => {
				alert("Xóa show có mã " +id+" thành công!")
				$scope.init()
			}).catch(error =>{
				console.log("error", error)
				alert("Xóa show có mã " +id+" thất bại!")
			})
			}
		}
	$scope.pager = {
		page: 0,
		size: 10,
		get items(){
			var start = this.page * this.size;
			return $scope.items.slice(start, start + this.size);
		},
		get count(){
			//console.log("ItemL: "+ $scope.items.length/this.size);
			return Math.ceil(1.0 * ($scope.items.length/this.size));
		},
		first(){
			this.page = 0
		},
		prev(){
			this.page--;
			if(this.page < 0){
				this.last();
			}
		},
		next(){
			this.page++;
			if(this.page >= this.count){	
				this.first();
			}
		},
		last(){
			this.page = this.count - 1;
		}
	}
	
	$scope.init()

	
})
