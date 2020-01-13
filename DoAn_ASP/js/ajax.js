$(this).ready(function () {
    layDanhSach();
});

function layDanhSach() {
    $.ajax({
        url: 'cart.aspx/ShowCart',
        type: "post",
        data: "{}",
        contentType: 'application/json;charset=utf-8',
        success: function (response) {
            var check = JSON.parse(response.d);
            if (check == null) {
                    var a = "<tr class='text-center'> <td><h1>Not things</h1></td><tr>";
                    $('#cart-data').html(a);
                    $('#lbl_Subtotal').html('$0.00');
                    $('#lbl_Total').html('$0.00');
                    $('#lbl_bought').html('[0]');
            }
            else
                {
            resetList(response);
            }
        },
        error: function (error) {
            alert(error.d);

        }
    });
}
function delItemCart(value) {
    $.ajax({
        url: 'cart.aspx/DeleteItemCart',
        type: "post",
        data: "{stt:'" + value + "'}",
        contentType: 'application/json;charset=utf-8',
        success: function (response) {
            layDanhSach();
        },
        error: function (error) {
            alert(error.d);

        }
    });
}

function resetList(data) {
    var lst_json = JSON.parse(data.d);
    var obj = lst_json["obj"];
    
    
    var table = "";
    var real_total = 0;
    var so_item = obj.length;
    for (i = 0; i < obj.length; i++) {
        
        totall = 0;
        totall = obj[i].price * obj[i].soluong;
        real_total += totall;
        table += "<tr class='text-center'>"
        table += "<td class='product-remove'>"
        table += "<input type='button' value = X onclick='delItemCart(" + obj[i].stt + ")' /> </td>";
        table += "<td class='image-prod'>"
        table += "<div class='img' ><img src='/admin/img/" + obj[i].thumb + "' width='100px' height='100px'/></div> </td>"
        table += "<td class='product-name'><h3>" + obj[i].name + "</h3><p>" + obj[i].des + "</p></td>";
        table += "<td class='price'>$" + obj[i].price + ".00</td>";
        table += "<td class='quantity'><div class='input-group mb-3'><input type='text' name='quantity' readonly='True' class='quantity form-control input-number' value='" + obj[i].soluong + "' min='1' max='100'></div></td>";
        table += "<td class='total'>$"+ totall +".00</td>"
        table += "</tr>"
    }

    $('#cart-data').html(table);
    $('#lbl_Subtotal').html('$' + real_total + '.00');
    $('#lbl_Total').html('$' + real_total + '.00');
    $('#lbl_bought').html('['+ so_item +']');
    

    //var record = lst_json["record"];
    //var result = "";
    //for (var i = 0; i < record.length; i++) {
    //    var stt = (Number(record[i]) + 1);
    //    result += "<input type='button'" + "style='background-color:yellow' " + "value='" + stt + "' onclick='search(" + stt + ")' /> | ";
    //}

    //$('#record').html(result);

}