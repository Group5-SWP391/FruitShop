
var role, stt, gen, txt, column, order;
const path = window.location.pathname;

let getFil = function () {
    role = document.getElementById("role-filter").value;
    stt = document.getElementById("status-filter").value;
    gen = document.getElementById("gender-filter").value;
    txt = document.getElementById("search").value;
    console.log(role, stt, gen, txt);
    $.ajax({
        url: "/Fruitshop/userlist",
        type: "post",
        data: {
            role: role,
            stt: stt,
            gen: gen,
            txt: txt
        },
        success: function (resp) {
            $("tbody").html(resp.split("divi")[0]);
            $(".paging").html(resp.split("divi")[1]);
        }
    });
};

$(document).on("click", ".onclick", function () {
    var id = $(this).children("p").attr('index');
    console.log(id);
    $.ajax({
        url: "/Fruitshop/userlist",
        type: "post",
        data: {
            role: role,
            stt: stt,
            gen: gen,
            txt: txt,
            col: column,
            or: order,
            index: id
        },
        success: function (resp) {
            $("tbody").html(resp.split("divi")[0]);
            $(".paging").html(resp.split("divi")[1]);
        }
    });
});

$(document).on("click", ".so", function () {
    column = $(this).data('column');
    order = $(this).data('order');
    var text = $(this).html();
    const head = $(".so");
    for (const ele of head) {
        var tet = $(ele).html();
        tet = tet.substring(0, tet.length - 1);
        tet += "&#11109";
        $(ele).html(tet);
    }
    text = text.substring(0, text.length - 1);
    console.log("column: ", column, order);
    if (order === 'desc') {
        $(this).data('order', "asc");
        text += "&#11105";
    } else {
        $(this).data('order', "desc");
        text += "&#11107";
    }
    $(this).html(text);
    $.ajax({
        url: "/Fruitshop/userlist",
        type: "post",
        data: {
            role: role,
            stt: stt,
            gen: gen,
            txt: txt,
            col: column,
            or: order
        },
        success: function (resp) {
            $("tbody").html(resp.split("divi")[0]);
            $(".paging").html(resp.split("divi")[1]);
        }
    });
});