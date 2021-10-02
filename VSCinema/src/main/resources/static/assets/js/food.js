var chair = [];
var cate = 'Thuong';
var chairid = "";
var tongtien = 0;
 function load(){
  chair =  JSON.parse(localStorage.getItem('chair'));
    $('#nameDisplay').val( localStorage.getItem('username'));
     $('#NumberDisplay').val( localStorage.getItem('number'));
     $('#seatsDisplay').val(chair);
     console.log(localStorage.getItem('username')  + " | " + localStorage.getItem('number') + " | "+ localStorage.getItem('chair'));
     document.getElementById('i1').setAttribute('value', 0);
     var chairstring = ""; 
     for(let c of chair){
            console.log(c.slice(0,1));
              if(c.slice(0,1) != 'A' && c.slice(0,1) != 'B' && c.slice(0,1) != 'C'){
                cate = 'VIP';
            }   
            chairid =  chairid + c + ",  ";  
        }
        chairid = chairid.slice(0, chairid.length-3);
        document.getElementById('cate_chair').innerHTML = cate;
        document.getElementById('chair_id').innerHTML = chairid;
        tinhtongtien();
        document.getElementById('tongtien').innerHTML = tongtien;
}

function tinhtongtien(){
   var giaphim = $("#giaphim").val();
   var giacombo = $("#giacombo").val();
    giaphim = Number(giaphim);
    giacombo  = Number(giacombo);
    console.log(giaphim + giacombo);
    tongtien = giaphim+giacombo;
}
var slsp = [
    {
        "id": 0,    
        "sl": 0
    }
];
var sl = 0;
function tangsl(id){
    var tim = slsp.find(a => a.id == id);
    if(tim == undefined){
    sl = 1;
        var temp = {
        "id": id,
        "sl": sl
    }
    slsp.push(temp);
    document.getElementById(id).setAttribute('value', sl);
}else{
    if(tim.sl >= 99){
        alert("Bạn không thể đặt số lượng lớn hơn 99")
    }else{
      console.log("TSoluong: "+tim.sl);
    sl = tim.sl;
    sl++;
    console.log("Soluong: "+sl);
    var temp = {
        "id": id,
        "sl": sl
    }
    slsp.splice(tim);
    slsp.push(temp);
    document.getElementById(id).setAttribute('value', sl);
}
}
}
function prev(){
    window.location.href='/datve.html';
}
function giamsl(id){
   var tim = slsp.find(a => a.id == id);
    if(tim == undefined){
        sl = 0;
        var temp = {
            "id": id,
            "sl": sl
        }
        slsp.push(temp);
        alert("Số lượng không thể nhỏ hơn 0")
    }else{
         sl = tim.sl;
        if(tim.sl <= 0 ){
            alert("Số lượng không thể nhỏ hơn 0");
        }else{
            sl--;
        var temp = {
            "id": id,
            "sl": sl
        }
        slsp.splice(tim);
        slsp.push(temp);
        document.getElementById(id).setAttribute('value', sl);
    }
    }
}
load();