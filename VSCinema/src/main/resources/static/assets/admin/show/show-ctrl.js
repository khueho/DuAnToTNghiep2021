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
		user: {
			username: "huyntpc00617"
		},
		priceShow: {
			id: 1
		},
		activity: true
	}
	$scope.endtime = $scope.form.endTime;
				$scope.errors = {
					movie: "",
					room: "",
					cinema: "",
					city: ""
				};
	}

	$scope.reset();

//chuyen giờ thành getTime
$scope.changeTimeTogetTime = function(time){
//		console.log(time)
	var datess = new Date("1974-03-12T"+time)
	let h = datess.getHours();
	let m = datess.getMinutes();
	h = h * 60;
	m = h + m;
	m = m*60000;
	return m;
}
		
	//Tu them thoi gian cho endtime khi thay doi starttime
	$scope.starttimechange = function(){
		if($scope.form.movie == undefined){
			Swal.fire('Bạn vui lòng chọn phim để có thể thay đổi thời gian')
			$scope.form.startTime = new Date("1974-03-12T08:30:00")
			return;
		}
		var st = new Date($scope.form.startTime)
		console.log($scope.form.startTime.getTime())
		st.setTime(st.getTime()+$scope.changeTimeTogetTime($scope.chonfim()))
	//	console.log(st.getTime())
			 $scope.form.endTime = st;
			$scope.endtime = st;
	}
	
	$scope.chonfim = function(){
		var idphim = $scope.form.movie.id;
		console.log(idphim)
		for(let i=0; i < $scope.movies.length;i++){
			console.log($scope.movies[i].id + " | "+idphim)
			if($scope.movies[i].id == idphim){
				
				return $scope.movies[i].runningTime;
			}
		}
		console.log($scope.form)
	}
	$scope.SeachList = $scope.listshowdate;
	$scope.replace = function(userData){
		userData = userData.replace("+","")
		userData = userData.replace(".","")
		userData = userData.replace(":","")
		userData = userData.replace(";","")
		userData = userData.replace(",","")
		userData = userData.replace("?","")
		userData = userData.replace("|","")
		userData = userData.replace("/","")
		userData = userData.replace("'","")
		userData = userData.replace("+","")
		userData = userData.replace(".","")
		userData = userData.replace(":","")
		userData = userData.replace(";","")
		userData = userData.replace(",","")
		userData = userData.replace("?","")
		userData = userData.replace("|","")
		userData = userData.replace("/","")
		userData = userData.replace("'","")
		userData = userData.replace("!","")
		userData = userData.replace("@","")
		userData = userData.replace("#","")
		userData = userData.replace("$","")
		userData = userData.replace("%","")
		userData = userData.replace("^","")
		userData = userData.replace("&","")
		userData = userData.replace("*","")
		userData = userData.replace("(","")
		userData = userData.replace(")","")
		userData = userData.replace("_","")
        userData = userData.replace("{","")
        userData = userData.replace("}","")
        userData = userData.replace("}","")
        userData = userData.replace("[","")
        userData = userData.replace("]","")
        userData = userData.replace(">","")
        userData = userData.replace("<","")
        userData = userData.replace(" ","")
		userData = userData.replace("-","")
		userData = userData.replace(/[a-zA-Z]{1,100}/,"")
		return userData;
	}
	$scope.Search = function(){
		const searchWrapper = document.querySelector(".excame");
		const inputBox = searchWrapper.querySelector("input");
		const suggBox = searchWrapper.querySelector(".autocom-box");
		let userData = document.getElementById('inputsearch').value; //cho userData bằng giá trị nhập vào input
		//let userData = $scope.inputsearch;
		let emptyArray = [];
		//console.log(searchWrapper)
	var tr = '';	 
	for(let i=0; i < userData.length;i++){  
            tr += $scope.replace(userData[i]); 
          }
	userData = tr;
//		console.log(userData)
		 var str = '';
		if(userData){
            for(let i=0;i<userData.length;i++){
                str += userData[i];
                if(i == 7){
					str = str.slice(0,8)+ str.slice(8,11)
					//console.log(userData[i])
                }
                if(i == 6){
                    if(userData[i] != 0){
					str = str.slice(0,7) +"-0"+str.slice(7,10)
						}
					if(userData[i] == 0){
					str = str.slice(0,7)+"-"+str.slice(7,10)
						}
                }
                if(i == 5){
                  //  str.splice(5, 1)
                  str =  str.slice(0,5) + str.slice(6,10);
                }
                if(i == 4){
                    str = str.slice(0,4)+"-0"+str.slice(4,5);
                }    
            }
			if(userData.length == 8){
				$scope.fills();
				return searchWrapper.classList.remove("active");		
			}
			emptyArray = []
			userData = str
			if(userData.length < 10){
				emptyArray.push("Có phải ý bạn là: "+str)
			}
			
			$scope.listshowdate.filter(function(value){
				var exites = '';
				for(var i = 0; i < value.length;i++){
		//			console.log(value)
					exites += value[i];
				//	console.log(exites)
					if(userData == exites){
		//				console.log(userData+"|"+exites)
						emptyArray.push(value)
					}
				}
				
			})
		//	console.log("emptyArray.length: "+emptyArray.length,emptyArray)
		$scope.SeachList = emptyArray;
			emptyArray = emptyArray.map((data) =>{		
				data = '<li>'+data+'</li>'
				//console.log(data)
				return data;
			});
			
			if(emptyArray.length == 0){
				//alert("Đúng")
				document.querySelector(".excame").classList.remove("active")
				return;
			}
			//console.log(emptyArray);
			searchWrapper.classList.add("active"); //show autocom box
			
			//showSuggestions(emptyArray,inputBox);
			searchWrapper.classList.add("active");
		}else{
			console.log(userData)
			searchWrapper.classList.remove("active") //hide autocombox
		}
		
	}
	
		$scope.select = function(element){
		let selectUserData = element.lsd;
		selectUserData = selectUserData.replace("Có phải ý bạn là: ","")
		let searchWrapper = document.querySelector(".excame");
		searchWrapper.querySelector("input").value = selectUserData;
		document.querySelector(".excame").classList.remove("active") //hide autocombox
	}
	
	function showSuggestions(list,inputBox){
		let listData;
		if(!list.length){
			let userValue = inputBox.value;
			listData = '<li>'+userValue+'</li>'
		}else{
			listData = list.join('')
		}
	}

	//set form nhập date thành rỗng
	$scope.setinputformdate = function(){
		document.getElementById('inputsearch').value = "";
		document.querySelector('.excame').classList.remove("active");
	}

	$scope.init = function() {
		$scope.items = []
		$scope.reset();
		$scope.listshowdates()
	//	console.log($scope.listshowdate)
		$http.get('/rest/show').then(resp => {
			$scope.items = resp.data
	//		console.log("Load data success!",$scope.items)
		}).catch(error => {
			console.log('Load data error!', error)
		});
		
		//load cinema
		$http.get('/rest/cinemas').then(resp => {
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
		$http.get('/rest/rooms/name').then(resp => {
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
	$scope.listshowdate = []
	//Lay tat ca cac ngay
	$scope.listshowdates = function(){	
		$scope.listshowdaterutgon = [];
		$http.get("/rest/show/listshowdate").then(resp => {
			$scope.listshowdate = resp.data;
			var now = new Date();
			$scope.listshowdate.filter(function(element){
				
			 var d = new Date(element+"T08:00:00")
				//	console.log(element	)
				//console.log(d.getDate()+">="+now.getDate()+"\n"+d.getMonth()+">="+now.getMonth()+"\n"+d.getFullYear()+">="+now.getFullYear())
				if(d.getDate()>=now.getDate()&&d.getMonth()>=now.getMonth()&&d.getFullYear()>=now.getFullYear()){
				//	console.log(element)
					$scope.listshowdaterutgon.push(element)
				}
			})
			
		})
		//console.log($scope.listshowdaterutgon.length)
	}
	
	//fillmovie()
	$scope.fillmovies = function(movieid){
		//console.log(movieid);
		 for(var i = 0; i < $scope.items.length; i++){
			if($scope.items[i].movie.id == movieid){
				$scope.fill.push($scope.items[i])
			}	
		}
		$scope.items = $scope.fill;
		return;	
	}
	//fillshowdate
	$scope.fillshowdate = function(showdate){
	//	alert(showdate.length)
	var tr = '';	 
	for(let i=0; i < showdate.length;i++){  
            tr += $scope.replace(showdate[i]); 
          }
	showdate = tr;
	if(showdate.length>=8){
		showdate = showdate.slice(0,8)
	}
	var str = '';
		for(let i=0;i<showdate.length;i++){
                str += showdate[i];
                if(i == 7){
					str = str.slice(0,8)+ str.slice(8,10)
					//console.log(userData[i])
                }
                if(i == 6){
                    if(showdate[i] != 0){
					str = str.slice(0,7) +"-0"+str.slice(7,10)
						}
					if(showdate[i] == 0){
					str = str.slice(0,7)+"-"+str.slice(7,10)
						}
                }
                if(i == 5){
                  //  str.splice(5, 1)
                  str =  str.slice(0,5) + str.slice(6,10);
                }
                if(i == 4){
                    str = str.slice(0,4)+"-0"+str.slice(4,5);
                }    
            }
	showdate = str;
	alert(showdate)
		if(showdate.length == 4){
			 for(var i = 0; i < $scope.items.length; i++){
			if(new Date($scope.items[i].showDate).getFullYear() == showdate){
				$scope.fill.push($scope.items[i])
			}	
		}
		$scope.items = $scope.fill;
		return;
		}
		if(showdate.length == 7){
			
			 for(var i = 0; i < $scope.items.length; i++){
				var d = new Date($scope.items[i].showDate)
				d.setMonth(d.getMonth()+1)
				//console.log(d.getFullYear() +"=="+ showdate.slice(0,4) +"\n&&"+ d.getMonth() +"=="+ showdate.slice(5,7))
			if(d.getFullYear() == showdate.slice(0,4) && d.getMonth() == showdate.slice(5,7)){	
				$scope.fill.push($scope.items[i])
			}	
		}
		$scope.items = $scope.fill;
//		console.log($scope.items)
		return;
		}
		if(showdate.length != 7 && showdate.length != 4){
			for(var i = 0; i < $scope.items.length; i++){
			if($scope.items[i].showDate == showdate){
				$scope.fill.push($scope.items[i])
			}
		}
		$scope.items = $scope.fill;
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
	//Replace string
	$scope.replaceString = function(value){
		value = value.replace(":","");
		value = value.replace("string","");
		value = value.replace("? ","");
		value = value.replace(" ?","");
		//console.log(value)
		return value
	}
	$scope.replaceNumber = function(value){
		value = value.replace(":","");
		value = value.replace("number","");
		value = value.replace("? ","");
		value = value.replace(" ?","");
		//console.log(value)
		return value
	}
	//fill khi ng-change option
	$scope.fills = function(){
		$scope.All()
		$scope.allSave();
		$scope.fill = [];
		$scope.pager.page = 0;
		
		var roomid = document.getElementById('room').value;
		roomid = $scope.replaceString(roomid)
		var movieid = document.getElementById('movie').value;
		movieid = $scope.replaceNumber(movieid)
		var listshowdate = document.getElementById('showdate').value;
		listshowdate = $scope.replaceString(listshowdate)
	//	console.log(movieid+ "|"+roomid+listshowdate);
		if(document.getElementById('inputsearch').value){
			listshowdate = document.getElementById('inputsearch').value;
	//		console.log(listshowdate)
		}
		if(roomid != '' && movieid != '' && listshowdate != ''){
			$scope.fill = [];
			for(var i = 0; i < $scope.items.length; i++){
				if($scope.items[i].movie.id == movieid && $scope.items[i].room.name == roomid && $scope.items[i].showDate == listshowdate){	
						$scope.fill.push($scope.items[i])				
				}	
			}
			return $scope.items = $scope.fill;
		}
		if(roomid != '' && movieid != ''){
			$scope.fill = [];
			for(var i = 0; i < $scope.items.length; i++){
				if($scope.items[i].movie.id == movieid && $scope.items[i].room.name == roomid){	
						$scope.fill.push($scope.items[i])				
				}	
			}
			return $scope.items = $scope.fill;
		}
		if(roomid != '' && listshowdate != ''){
			$scope.fill = [];
			for(var i = 0; i < $scope.items.length; i++){
				if($scope.items[i].showDate == listshowdate && $scope.items[i].room.name == roomid){	
						$scope.fill.push($scope.items[i])				
				}	
			}
			return $scope.items = $scope.fill;
		}
		
		if(movieid != '' && listshowdate != ''){
			$scope.fill = [];
			if(listshowdate.length == 4){
				alert("==4")
				for(var i = 0; i < $scope.items.length; i++){
				if($scope.items[i].movie.id == movieid && new Date($scope.items[i].showDate).getFullYear() == listshowdate){	
						$scope.fill.push($scope.items[i])				
				}	
			}
			}
			if(listshowdate.length != 4){
				alert("!=4")
			for(var i = 0; i < $scope.items.length; i++){
				if($scope.items[i].movie.id == movieid && $scope.items[i].showDate == listshowdate){	
						$scope.fill.push($scope.items[i])				
				}	
			}
			}
			return $scope.items = $scope.fill;
		}
		
		
		if(roomid != '')
		{
			$scope.fill = [];
			 $scope.fillroom(roomid)
		return $scope.items = $scope.fill;
		}
		
		if(movieid != ''){
			$scope.fill = [];
			//console.log("Movie")
			$scope.fillmovies(movieid)
			return $scope.items = $scope.fill;
		}
		if(listshowdate != '')
		{
			$scope.fill = [];
			 $scope.fillshowdate(listshowdate)
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
	
	$scope.changedate = function(datec){
		var d = datec.getDate().toString()
		var m = (datec.getMonth()+1).toString();
		//console.log(d,m,datec.getDate())
		if(d.length==1){
			d = "0"+d
		}
		if(m.length==1){
			m = "0"+m
		}
		var d = datec.getFullYear()+"-"+m+"-"+d;
		//console.log(d)
		return d
	}
	$scope.changetime = function(times){
		var h = times.getHours().toString();
		var m = times.getMinutes().toString();
		if(h.length==1){
			h = "0"+h
		}
		if(m.length==1){
			m = "0"+h
		}
		return h+":"+m+":00"
	}
	$scope.changeTimeFromStringtoTime = function(time){
		//console.log(time)
		var datess = new Date("1974-03-12T"+time)
	//	console.log(datess.getTime())
		return datess.getTime();
	}
	
	//Loc trùng truoc khi create
	$scope.fillCoincide = function(item){
		$scope.errors = {
					movie: "",
					room: "",
					cinema: "",
					city: ""
				};
				$scope.errors.room = "";
				$scope.errors.movie = "";
				$scope.errors.cinema = "";
				$scope.errors.city = "";
		if($scope.form.room == undefined){
				 $scope.errors.room =  "Không được để trống phòng!"
				$scope.errors.cinema =  "Không được để trống rạp!"
				$scope.errors.city =  "Không được để trống thành phố!"
		}
		if($scope.form.movie == undefined){
			$scope.errors.movie =  "Không được để trống phim!"
		}
		if($scope.form.room != undefined){
			if($scope.form.room.id == undefined){
				$scope.errors.room = "Không được để trống phòng";	
			}
		}
		if($scope.form.movie != undefined){
				if($scope.form.movie.id == undefined){
					$scope.errors.movie =  "Không được để trống phim!"
				}
			}
		if($scope.form.room != undefined){
		if($scope.form.room.cinema == undefined){
			$scope.errors.cinema =  "Không được để trống rạp!"
		}
		}
		if($scope.form.room != undefined){
			if($scope.form.room.cinema != undefined){
			if($scope.form.room.cinema.id == undefined){
			$scope.errors.cinema =  "Không được để trống rạp!"
		}
		}
		}
		if($scope.form.room != undefined){
		if($scope.form.room.cinema != undefined){
		if($scope.form.room.cinema.city == undefined){
			$scope.errors.city =  "Không được để trống thành phố!"
			$scope.errors.push(item);	
		}
		}
		}
		if($scope.form.room != undefined){
		if($scope.form.room.cinema.city != undefined){
			if($scope.form.room.cinema.city.id == undefined){
			$scope.errors.city =  "Không được để trống thành phố!"	
		}
		}
		}
		if($scope.errors.room != "" || $scope.errors.cinema != "" || $scope.errors.city != ""){
			console.log($scope.errors)
			return 'loi';
		}
		$scope.itemss = angular.copy($scope.items);
		//console.log($scope.changedate(dates))
		for(let i=0; i < $scope.itemss.length; i++){	
			//console.log($scope.itemss[i].room.id +"=="+ item.room.id +" \n&&"+ $scope.itemss[i].showDate +"=="+ $scope.changedate(item.showDate))
			if($scope.itemss[i].room.id == item.room.id && $scope.itemss[i].showDate == $scope.changedate(item.showDate)){
				console.log($scope.changeTimeTogetTime($scope.itemss[i].startTime) +">="+ item.startTime.getTime() +"\n&&"+ $scope.changeTimeTogetTime($scope.itemss[i].startTime) +"<="+ item.endTime.getTime() +"\n||"+ $scope.changeTimeTogetTime($scope.itemss[i].endTime) +">="+ item.startTime.getTime() +"\n&&"+ $scope.changeTimeTogetTime($scope.itemss[i].endTime) +"<="+ item.endTime.getTime())
				//console.log(item.startTime.getTime() +">="+ $scope.changeTimeTogetTime($scope.itemss[i].startTime) +"\n&&"+ item.startTime.getTime() +">="+ $scope.changeTimeTogetTime($scope.itemss[i].endTime) +"\n||"+ item.endTime.getTime() +">="+ $scope.changeTimeTogetTime($scope.itemss[i].startTime) +"\n&&"+ item.endTime.getTime() +">="+ $scope.changeTimeTogetTime($scope.itemss[i].endTime))
						
				if($scope.changeTimeFromStringtoTime($scope.itemss[i].startTime) >= item.startTime.getTime() && $scope.changeTimeFromStringtoTime($scope.itemss[i].startTime) <= item.endTime.getTime() || $scope.changeTimeFromStringtoTime($scope.itemss[i].endTime) >= item.startTime.getTime() && $scope.changeTimeFromStringtoTime($scope.itemss[i].endTime) <= item.endTime.getTime())
				//alert("$scope.itemss[i].room.id:P "+$scope.itemss[i].room.id+"\n"+"$scope.changedate(item.showDate): "+$scope.changedate(item.showDate))
				{
					console.log($scope.changeTimeFromStringtoTime($scope.itemss[i].startTime) +">="+ item.startTime.getTime() +"\n&&"+ $scope.changeTimeFromStringtoTime($scope.itemss[i].startTime) +"<="+ item.endTime.getTime() +"\n||"+ $scope.changeTimeFromStringtoTime($scope.itemss[i].endTime) +">="+ item.startTime.getTime() +"\n&&"+ $scope.changeTimeFromStringtoTime($scope.itemss[i].endTime) +"<="+ item.endTime.getTime())
					return 'trung'
				}
				if(item.startTime.getTime() >= $scope.changeTimeFromStringtoTime($scope.itemss[i].startTime) && item.startTime.getTime() <= $scope.changeTimeFromStringtoTime($scope.itemss[i].endTime) || item.endTime.getTime() >= $scope.changeTimeFromStringtoTime($scope.itemss[i].startTime) && item.endTime.getTime() <= $scope.changeTimeTogetTime($scope.itemss[i].endTime))
				{
					console.log(item.startTime.getTime() +">="+ $scope.changeTimeFromStringtoTime($scope.itemss[i].startTime) +"\n&&"+ item.startTime.getTime() +">="+ $scope.changeTimeFromStringtoTime($scope.itemss[i].endTime) +"\n||"+ item.endTime.getTime() +">="+ $scope.changeTimeFromStringtoTime($scope.itemss[i].startTime) +"\n&&"+ item.endTime.getTime() +">="+ $scope.changeTimeFromStringtoTime($scope.itemss[i].endTime))
					return 'trung'
				}
			}
			if($scope.itemss[i].room.id == item.room.id && $scope.itemss[i].showDate == $scope.changedate(item.showDate) && item.startTime.getTime()-$scope.changeTimeFromStringtoTime($scope.itemss[i].startTime) >= -900000 && item.startTime.getTime() - $scope.changeTimeFromStringtoTime($scope.itemss[i].endTime) < 900000){
				console.log($scope.changeTimeFromStringtoTime($scope.itemss[i].startTime))
				return 'dunggio' //đụng giờ
				//thời gian bắt đầu cách kết thúc trước 15p
			}
	}
	return null;
	}
	$scope.tinhtrungtime = function(form){
    let ite = [];    	
	for(var i=0; i < $scope.items.length;i++){
			console.log($scope.items[i].showDate+"|"+$scope.changedate(form.showDate))
			/*	if($scope.items[i].showDate == $scope.changetime(form.showDate)){
					ite.push(items[i]);
				}*/
}
console.log(ite)
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
		var cityid = undefined;
		if($scope.form.room == undefined){
			cityid = document.getElementById('city').value;
		}
		if(cityid == '? string:0 ?' || cityid == null || cityid == '? undefined:undefined ?'){
			cityid = $scope.form.room.cinema.city.id;
		}
		if(cityid == "" || cityid == null){
			cityid = $scope.form.room.cinema.city.id;
		}
		console.log($scope.form.room.cinema.city.id + " | " +cityid)
			$http.post(`/rest/cinemas/findByCity/`+cityid).then(resps => {
				$scope.cinemas = resps.data
				//console.log(resps.data)
			}).catch(error => {
				console.log("Error!", error)
			})
	}
	
	//Tim room from Cinema
	$scope.findByCinema = function(){
		var cinemaid = $scope.form.room.cinema.id;
		$http.get(`/rest/rooms/findByCinema/`+cinemaid).then(resp => {
			$scope.rooms = resp.data
			//console.log($scope.rooms)
		}).catch(error => {
			console.log("Error!", $scope.form)
		})
	}
		$scope.edit = function(item){
			var showDate = new Date(item.showDate);
//			console.log(item.showDate)
		
		$scope.reset();
		$scope.init();
		$scope.form = angular.copy(item);
			$scope.form.startTime =  new Date("1974-03-12T"+$scope.form.startTime)			
			$scope.endtime = new Date("1974-03-12T"+$scope.form.endTime)
		$scope.form.showDate = showDate;
			$scope.findRapFromCity();
			$scope.findByCinema();
		//console.log($scope.form)
		
		$(".nav-tabs a:eq(0)").tab('show')
	//	console.log($scope.form)
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
			var date = new Date();
			date.setDate(date.getDate()+7);
			console.log($scope.form.showDate)
			$scope.form.showDate = date;	
			var data = angular.copy($scope.form)
			
		//	console.log($scope.fillCoincide(data))
	//	console.log($scope.changedate(data.showDate))
		var test = $scope.fillCoincide(data);
		console.log(test)
			if(test == 'trung'){
				Swal.fire({
				  icon: 'error',
				  title: 'Đụng giờ đang chiếu phim!',
				  showConfirmButton: false,
				  timer: 1500
				})
				return
				}
				
			if(test == 'dunggio'){
				Swal.fire({
					  icon: 'error',
					  title: 'Giờ chuyển phim',
					  text: 'Giờ bắt đầu phải cách giờ kết thúc của show khác trong ngày từ 15p! \nGiờ kết thúc phải cách giờ bắt đầu của show khác trong ngày từ 15p!!',
					//  footer: '<a href="">Why do I have this issue?</a>'
					})
				return
			}
			if(test == 'loi'){
				Swal.fire({
					  icon: 'error',
					  title: 'Lỗi nhập',
					  text: 'Vui lòng kiểm tra lại các trường bạn đã nhập!',
					//  footer: '<a href="">Why do I have this issue?</a>'
					})
				return
			}
			data.movie.runningTime = new Date("1974-03-12T"+$scope.form.movie.runningTime)
			data.priceShow.timeSlot = new Date("1974-03-12T"+$scope.form.priceShow.timeSlot)
			data.priceShow.createDate = new Date($scope.form.priceShow.createDate)
			$http.post(`/rest/show`, data).then(resp => {
//					console.log(resp.data)
					$scope.items.push(resp.data);
					$scope.init();
					Swal.fire({
						  icon: 'success',
						  title: 'Thêm show thành công!',
						  showConfirmButton: false,
						  timer: 1500
						})
					$scope.init()
			}).catch(error =>{
				console.log(error)
				Swal.fire({
					  icon: 'error',
					  title: 'Thêm show thất bại!',
					  showConfirmButton: false,
					  timer: 1500
					})
				});
		}
		//update 
		$scope.update = function(){
			var data = angular.copy($scope.form)
			if(data.id == undefined){
				Swal.fire({
				  icon: 'error',
				  title: 'Không thể cập nhật show khi không có dữ liệu \n    Vui lòng kiểm tra lại thông tin!',
				  showConfirmButton: false,
				  timer: 1500
				})
				return
			}
			var dateform = new Date(data.showDate);
			console.log(dateform.getDate()+"<="+date.getDate()+"\n"+dateform.getMonth()+"<="+date.getMonth()+"\n"+dateform.getFullYear()+"<="+date.getFullYear())
			if(dateform.getDate()<=date.getDate()&&dateform.getMonth()<=date.getMonth()&&dateform.getFullYear()<=date.getFullYear()){
				date.setDate(date.getDate()-5)
				Swal.fire({
				  icon: 'error',
				  title: 'Không thể cập nhật show có ngày tạo trước ngày '+date.getDate()+"/"+date.getMonth()+"/"+date.getFullYear()+'!',
				  showConfirmButton: false,
				  timer: 1500
				})
				return
			}
			var test = $scope.fillCoincide(data);
		console.log(test)
			if(test == 'trung'){
				Swal.fire({
				  icon: 'error',
				  title: 'Đụng giờ đang chiếu phim!',
				  showConfirmButton: false,
				  timer: 1500
				})
				return
				}
				
			if(test == 'dunggio'){
				Swal.fire({
					  icon: 'error',
					  title: 'Giờ chuyển phim',
					  text: 'Giờ bắt đầu phải cách giờ kết thúc của show khác trong ngày từ 15p! \nGiờ kết thúc phải cách giờ bắt đầu của show khác trong ngày từ 15p!!',
					//  footer: '<a href="">Why do I have this issue?</a>'
					})
				return
			}
			if(test == 'loi'){
				Swal.fire({
					  icon: 'error',
					  title: 'Lỗi nhập',
					  text: 'Vui lòng kiểm tra lại các trường bạn đã nhập!',
					//  footer: '<a href="">Why do I have this issue?</a>'
					})
				return
			}
			data.movie.runningTime = new Date("1974-03-12T"+$scope.form.movie.runningTime)
			data.priceShow.timeSlot = new Date("1974-03-12T"+$scope.form.priceShow.timeSlot)
			data.endTime = new Date("1974-03-12T"+$scope.form.endTime)
			data.priceShow.createDate = new Date($scope.form.priceShow.createDate)
				console.log(data.endTime)
				$http.post(`/rest/show`, data).then(resp => {
					$scope.items.push(resp.data);
					$scope.init();
					Swal.fire({
						  icon: 'success',
						  title: 'Cập nhật show thành công!',
						  showConfirmButton: false,
						  timer: 1500
						})
					$scope.init()
			}).catch(error =>{
				console.log("error", error)
				Swal.fire({
					  icon: 'error',
					  title: 'Cập nhật show thất bại!',
					  showConfirmButton: false,
					  timer: 1500
					})
			});
		}
	//xoa csdl
		$scope.delete = function(id){
				Swal.fire({
					  title: 'Bạn có muốn xóa show có id là '+id+' ?',
					  text: "Xóa là không thể lấy lại!",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'Show, được xóa!'
				}).then((result) => {
					  if (result.isConfirmed) {
					    $http.delete(`/rest/show/`+id).then(resp => {
									$scope.init()
									 Swal.fire(
					      'Đã xóa!',
					      'File của bạn đã được xóa!',
					      'Thành công!')
					$scope.init();
			}).catch(error =>{
				console.log("error", error)			
			})
  }
})			
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
	$scope.button = 'false'
	/*$scope.statusButon = function(status){
		if(status == 'create'){
			$scope.button = true;
		}
		if(status != 'create'){
			$scope.button = false;
		}
	}*/
	
	$scope.init()
	
	
})