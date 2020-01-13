$(this).ready(function () {
    search(0,1);
});

//function previousPage() {
//    var hf = document.getElementById("hf_filter").value;
//    var hf_pagecurrent = document.getElementById("hf_pagecurrent").value;

//    if(hf_pagecurrent=="1")
//    search(hf, page-1);
//}
function addToCart(value) {
    $.ajax({
        url: 'demo_ajax_shop.aspx/AddToCart',
        type: "post",
        data: "{id:'" + value + "'}",
        contentType: 'application/json;charset=utf-8',
        success: function (response) {
            var bindingdata = response.d;
            $('#lbl_bought').html('[' + bindingdata + ']');
        },
        error: function (error) {
            alert(error.d);

        }
    });
}

function search(key, page) {
    //var key = $('#Text1').val();
    var hf = document.getElementById("hf_filter");
    hf.value = key;
    //var hf_pagecurrent = document.getElementById("hf_pagecurrent");
    //hf_pagecurrent.value = page;
    $.ajax({
        url: 'demo_ajax_shop.aspx/SearchCode',
        type: "post",
        data: "{key:'"+ key +"',p_current:'" + page + "'}",
        contentType: 'application/json;charset=utf-8',
        success: function (response) {
            //alert(response.d);
            resetList(response);
        },
        error: function (error) {
            alert(error.d);

        }
    });
}


function resetList(data) {
    var key = $('#hf_filter').val();
    var lst_json = JSON.parse(data.d);
    var filter = lst_json["filter"];
    var bindindfilter = "";
    for (i = 0; i < filter.length; i++) {
        var active = filter[i].active;
        //alert(filter[i].active);
        if (active == "1") {
            //bindindfilter += "<li><a href='#' class='active' onclick='search(e," + filter[i].type_id + "," + 1 + ")' >" + filter[i].type_name + "</a></li>";
            bindindfilter += "<li><input style='cursor:pointer;margin:0px 5px;border-radius:5px;font-size:16px;outline:none;border:none;box-sizing:border-box;padding:1px 10px;background-color:#82ae46;color:#ffffff' type='button' " + "value='" + filter[i].type_name + "' onclick='search(" + filter[i].type_id + "," + 1 + ")'/></li>";
        }
        else {
            bindindfilter += "<li><input type='button' style='cursor:pointer;margin:0px 5px;background-color:#ffffff;border-radius:5px;font-size:16px;border:none;box-sizing:border-box;outline:none;padding:1px 10px;' " + "value='" + filter[i].type_name + "' onclick='search(" + filter[i].type_id + "," + 1 + ")'/></li>";
        }
    }
    $('#show-list-filter').html(bindindfilter);


    
    
    var obj = lst_json["obj"];
    //var so_item = obj.length;
    var bindingdata = "";
    for (i = 0; i < obj.length; i++) {
        bindingdata += "<div class='col-md-6 col-lg-3 '>";
        bindingdata += "<div class='product'>";
        bindingdata += "<a href='product-single.aspx?id=" + obj[i].id + "' class='img-prod'>";
        bindingdata += "<img class='img-fluid' style='width:253px;height:202px' src='/admin/img/" + obj[i].img + "' alt='Colorlib Template'>";
        bindingdata += "<div class='overlay'>";
        bindingdata += "</div>";
        bindingdata += " </a>";
        bindingdata += " &nbsp;<div class='text py-3 pb-4 px-3 text-center'>";
        bindingdata += " <h3><a href='product-single.aspx?id=" + obj[i].id + "'></a>" + obj[i].name + "</h3> ";
        bindingdata += "<div class='d-flex'> <div class='pricing'>";
        bindingdata += " <p class='price'><span class='price-sale'>$" + obj[i].price + ".00</span></p>";
        bindingdata += " </div> </div> <div class='bottom-area d-flex px-3'> <div class='m-auto d-flex'>";
        bindingdata += "<input type='button' value='+' class='add-to-cart' onclick='addToCart(" + obj[i].id + ")' />";
        bindingdata += "</div> </div> </div> </div> </div>";
    }
    $('#list-product').html(bindingdata);
    //$('#lbl_bought').html('[' + so_item + ']');
    //$('#result').html(table);
    var record = lst_json["record"];
    var result = "";
    //class="<%# (Eval("active").ToString()=="1"?"active":"haven't")%>" 
    //style=" background-color:<%# (Eval("active").ToString()=="1"?"#82ae46":"")%>;color:<%# (Eval("active").ToString()=="1"?"#ffffff":"")%>"
    //alert(record.length);
    //result += "<li><input type='button' value=&lt; onclick='previousPage()'/></li>";
    for (var i = 0; i < record.length; i++) {
        var stt = (Number(record[i].index));
        var active = record[i].active;
        if (active == "1")
        {
            result += "<li><input style='cursor:pointer;outline:none;margin:0px 5px;background-color:#82ae46;text-align: center;width: 40px;height: 40px;line-height: 40px;border-radius: 50%;border: 1px solid #e6e6e6;color: #ffffff;' type='button' " + "value='" + stt + "' onclick='search(" + key + "," + stt + ")'/></li>";
        }
        else{
            result += "<li><input type='button' style='cursor:pointer;outline:none;margin:0px 5px;background-color:#ffffff;text-align: center;width: 40px;height: 40px;line-height: 40px;border-radius: 50%;border: 1px solid #e6e6e6;color: #000000;' " + "value='" + stt + "' onclick='search(" + key + "," + stt + ")'/></li>";
        }
    }
    //result += "<li><input type='button' value=&lt; onclick='nextPage()'/></li>";

    $('#record').html(result);

}
