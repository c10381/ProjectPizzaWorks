let cartTest = {
  "deliverType": "takeout",

  "detail": [
    {
      "productId": 1,
      "prductName": "炭火肉食披薩",
      "size": "lg",
      "price": 329,
      "qtty": 2
    },
    {
      "productId": 10,
      "prductName": "總匯披薩",
      "size": "sm",
      "price": 229,
      "qtty": 1,
    }
  ]
};

var cart = JSON.parse(localStorage.getItem('dataList')) || {};
$(function () {
  $("#addCart").click(function () {
    if (cart.deliverType == undefined) {
      checkDeliver();
    } else {
      checkPizza();
    }
  })
});


// 外帶方式確認
function checkDeliver() {
  $("#delieverModal").modal("show");
  $("#delieverModal a").click(function () {
    cart.deliverType = $("#delieverModal select").val();
    checkPizza();
  })
}

// pizza規格確認

function checkPizza() {
  $("#pizzaModal").modal("show");
}


