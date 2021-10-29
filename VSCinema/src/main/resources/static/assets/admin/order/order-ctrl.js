app.controller("order-ctrl", function($scope, $http, $location) {
	$scope.items=[]
	$scope.orderDetail=[]
	$scope.order={}
	$scope.edited=false
	$scope.initialize=function(){
		$http.get("/rest/orders").then(resp=>{
			$scope.items=resp.data
			console.log($scope.items)
		}).catch(error=>{
			console.log(error)
		})
	}
	$scope.initialize()
	$scope.edit=function(item){
		$scope.edited=true
		$scope.order=angular.copy(item)
		$http.get(`/rest/orders/${item.id}`).then(resp=>{
			$scope.orderDetail=resp.data
			console.log($scope.orderDetail)
		}).catch(error=>{
			console.log(error)
		})
		$(".nav-tabs a:eq(0)").tab('show');
	}
	$scope.reset=function(){
		$scope.order={}
		$scope.edited=false
	}
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
})