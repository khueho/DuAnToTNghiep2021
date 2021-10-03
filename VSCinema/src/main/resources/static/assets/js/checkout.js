var h = null;
var m = 0;
var s = 0;
function start()
{
    
    /*BƯỚC 1: LẤY GIÁ TRỊ BAN ĐẦU*/
    if (h === null)
    {
        h = 0;
        m = 5;
        s = 0;
    }
 
    /*BƯỚC 1: CHUYỂN ĐỔI DỮ LIỆU*/
    // Nếu số giây = -1 tức là đã chạy ngược hết số giây, lúc này:
    //  - giảm số phút xuống 1 đơn vị
    //  - thiết lập số giây lại 59
    if (s === -1){
        m -= 1;
        s = 59;
    }
 
    // Nếu số phút = -1 tức là đã chạy ngược hết số phút, lúc này:
    //  - giảm số giờ xuống 1 đơn vị
    //  - thiết lập số phút lại 59
    if (m === -1){
        h -= 1;
        m = 59;
    }
 
    // Nếu số giờ = -1 tức là đã hết giờ, lúc này:
    //  - Dừng chương trình
    if (h == -1){
        clearTimeout(timeout);
        alert('Hết thời gian đặt vé');
        window.location.href = "/datve.html";
        return false;
    }
 
    /*BƯỚC 1: HIỂN THỊ ĐỒNG HỒ*/
    $('#phut').val(m+ " phút");
    $('#s').val(s + " giây");
 
    /*BƯỚC 1: GIẢM PHÚT XUỐNG 1 GIÂY VÀ GỌI LẠI SAU 1 GIÂY */
    timeout = setTimeout(function(){
        s--;
        start();
    }, 1000);
   
}
function prev(){
    window.location.href = "/chondoan.html";
}