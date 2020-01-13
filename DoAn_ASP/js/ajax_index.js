$(this).ready(function () {
    layDanhSach();
});

function layDanhSach() {
    $.ajax({
        url: 'index.aspx/ShowTop8Product',
        type: "post",
        data: "{}",
        contentType: 'application/json;charset=utf-8',
        success: function (response) {
            resetList(response);
            //alert(response.d);
        },
        error: function (error) {
            alert(error.d);

        }
    });
}

function addToCart(value) {
    $.ajax({
        url: 'index.aspx/AddToCart',
        type: "post",
        data: "{id:'" + value + "'}",
        contentType: 'application/json;charset=utf-8',
        success: function (response) {
            var bindingdata = response.d;
            $('#lbl_bought').html('['+ bindingdata +']');
        },
        error: function (error) {
            alert(error.d);

        }
    });
}

function resetList(data) {
    var lst_json = JSON.parse(data.d);
    var obj = lst_json["obj"];


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

    $('#list-product').append(bindingdata);
}