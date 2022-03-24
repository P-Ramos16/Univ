//--- TODO
    var quantidade = document.getElementById("quantidades");
    var total = document.getElementById("total");

    var precoproduto1 = parseFloat(document.getElementById("precoproduto1").value);
    var precoproduto2 = parseFloat(document.getElementById("precoproduto2").value);
    var precoproduto3 = parseFloat(document.getElementById("precoproduto3").value);
    var precoproduto4 = parseFloat(document.getElementById("precoproduto4").value);

    var produto1 = parseFloat(document.getElementById("produto1").value);
    var produto2 = parseFloat(document.getElementById("produto2").value);
    var produto3 = parseFloat(document.getElementById("produto3").value);
    var produto4 = parseFloat(document.getElementById("produto4").value);

    var somaProdutos = produto1 + produto2 + produto3 + produto4;
    var precoTotalInicial = produto1*precoproduto1 + produto2*precoproduto2 + produto3*precoproduto3 + produto4*precoproduto4;

function calcular(){

    var precoproduto1 = parseFloat(document.getElementById("precoproduto1").value);
    var precoproduto2 = parseFloat(document.getElementById("precoproduto2").value);
    var precoproduto3 = parseFloat(document.getElementById("precoproduto3").value);
    var precoproduto4 = parseFloat(document.getElementById("precoproduto4").value);

    var produto1 = parseFloat(document.getElementById("produto1").value);
    var produto2 = parseFloat(document.getElementById("produto2").value);
    var produto3 = parseFloat(document.getElementById("produto3").value);
    var produto4 = parseFloat(document.getElementById("produto4").value);

    var somaProdutos = produto1 + produto2 + produto3 + produto4;
    var precoTotalInicial = produto1*precoproduto1 + produto2*precoproduto2 + produto3*precoproduto3 + produto4*precoproduto4;
    var precoTotal = 0;

    if (somaProdutos >= 5){
        var desconto1 = 0.05*precoTotalInicial;
        precoTotal = precoTotalInicial - desconto1;
    }else{
        precoTotal = precoTotalInicial;
    }

    if (precoTotalInicial>100){
        var desconto2 = 0.05*precoTotal;
        precoTotal = precoTotal - desconto2;
    }

    quantidade.innerText = somaProdutos;
    total.innerText = precoTotal.toFixed(2);

}


function comprar(number){
    var produto = document.getElementById("produto"+number);
    var x = parseFloat(produto.value) + 1;
    produto.value = x.toString();

    calcular();
}

function validar(){
    var retVal = true;
    
    var quantidade = parseFloat(document.getElementById("quantidades").innerHTML);


    if (quantidade==0){
        retVal = false;
        alert("Tem que comprar pelo menos um produto.")
    }

}

function limpar(){
    for (var i=1; i<=4; i++ ){
        var x = document.getElementById("produto"+i);
        x.value = "0";
    
    }


    quantidade.innerText = 0;
    total.innerText = "0.00";

}




~

























var quantidade = document.getElementById("quantidades");
var total = document.getElementById("total");

var precoproduto1 = parseFloat(document.getElementById("precoproduto1").value);
var precoproduto2 = parseFloat(document.getElementById("precoproduto2").value);
var precoproduto3 = parseFloat(document.getElementById("precoproduto3").value);
var precoproduto4 = parseFloat(document.getElementById("precoproduto4").value);
var precoproduto5 = parseFloat(document.getElementById("precoproduto5").value);
var precoproduto6 = parseFloat(document.getElementById("precoproduto6").value);

var produto1 = parseFloat(document.getElementById("produto1").value);
var produto2 = parseFloat(document.getElementById("produto2").value);
var produto3 = parseFloat(document.getElementById("produto3").value);
var produto4 = parseFloat(document.getElementById("produto4").value);
var produto5 = parseFloat(document.getElementById("produto5").value);
var produto6 = parseFloat(document.getElementById("produto6").value);
var somaProdutos = produto1 + produto2 + produto3 + produto4 + produto5 + produto6;
var precoTotalInicial = produto1*precoproduto1 + produto2*precoproduto2 + produto3*precoproduto3 + produto4*precoproduto4 + produto5*precoproduto5 + produto6*precoproduto6;

function calcular(){

var precoproduto1 = parseFloat(document.getElementById("precoproduto1").value);
var precoproduto2 = parseFloat(document.getElementById("precoproduto2").value);
var precoproduto3 = parseFloat(document.getElementById("precoproduto3").value);
var precoproduto4 = parseFloat(document.getElementById("precoproduto4").value);
var precoproduto5 = parseFloat(document.getElementById("precoproduto5").value);
var precoproduto6 = parseFloat(document.getElementById("precoproduto6").value);

var produto1 = parseFloat(document.getElementById("produto1").value);
var produto2 = parseFloat(document.getElementById("produto2").value);
var produto3 = parseFloat(document.getElementById("produto3").value);
var produto4 = parseFloat(document.getElementById("produto4").value);
var produto5 = parseFloat(document.getElementById("produto5").value);
var produto6 = parseFloat(document.getElementById("produto6").value);

var somaProdutos = produto1 + produto2 + produto3 + produto4 + produto5 + produto6;
var precoTotalInicial = produto1*precoproduto1 + produto2*precoproduto2 + produto3*precoproduto3 + produto4*precoproduto4 + produto5*precoproduto5 + produto6*precoproduto6;
var precoTotal = 0;

if (somaProdutos >= 5){
    var desconto1 = 0.05*precoTotalInicial;
    precoTotal = precoTotalInicial - desconto1;
}else{
    precoTotal = precoTotalInicial;
}

if (precoTotalInicial>100){
    var desconto2 = 0.05*precoTotal;
    precoTotal = precoTotal - desconto2;
}

quantidade.innerText = somaProdutos;
total.innerText = precoTotal.toFixed(2);

}


function comprar(number){
var produto = document.getElementById("produto"+number);
var x = parseFloat(produto.value) + 1;
produto.value = x.toString();

calcular();
}

function validar(){
var retVal = true;

var quantidade = parseFloat(document.getElementById("quantidades").innerHTML);


if (quantidade==0){
    retVal = false;
    alert("Tem que comprar pelo menos um produto.")
}

}

function limpar(){
for (var i=1; i<=4; i++ ){
    var x = document.getElementById("produto"+i);
    x.value = "0";

}


quantidade.innerText = 0;
total.innerText = "0.00";

}