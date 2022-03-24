var numProd1 = 0;
var numProd2 = 0;
var numProd3 = 0;
var numProd4 = 0;
var numProd5 = 0;
var numProd6 = 0;

var moreThanTwoProds = 0;

var product_price1 = document.getElementById("precoproduto1").value;
var product_price2 = document.getElementById("precoproduto2").value;
var product_price3 = document.getElementById("precoproduto3").value;
var product_price4 = document.getElementById("precoproduto4").value;
var product_price5 = document.getElementById("precoproduto5").value;
var product_price6 = document.getElementById("precoproduto6").value;


document.getElementById("produto1").value = 0;
document.getElementById("produto2").value = 0;
document.getElementById("produto3").value = 0;
document.getElementById("produto4").value = 0;
document.getElementById("produto5").value = 0;
document.getElementById("produto6").value = 0;

function comprar(number) {
    switch (number) {
        case 1: 
            numProd1 += 1;
            document.getElementById("produto1").value = numProd1;
            break;

        case 2: 
            numProd2 += 1;
            document.getElementById("produto2").value = numProd2;
            break;

        case 3: 
            numProd3 += 1;
            document.getElementById("produto3").value = numProd3;
            break;

        case 4: 
            numProd4 += 1;
            document.getElementById("produto4").value = numProd4;
            break;

        case 5: 
            numProd5 += 1;
            document.getElementById("produto5").value = numProd5;
            break;

        case 6: 
            numProd6 += 1;
            document.getElementById("produto6").value = numProd6;
            break;

    }

    calcular();
}

function calcular() {
    var total = numProd1 * product_price1 + numProd2 * product_price2 + numProd3 * product_price3 + numProd4 * product_price4 + numProd5 * product_price5 + numProd6 * product_price6;
    var num_prod = numProd1 + numProd2 + numProd3 + numProd4 + numProd5 + numProd6;

    if (num_prod >= 5) {
        total = total * 0.95;
    }

    if (total > 100) {
        total = total * 0.95;
    }


    document.getElementById("quantidades").innerText = num_prod;
    document.getElementById("total").innerText = total.toFixed(2);

}

function validar() {
    var retVal = true;

    if (numProd1 != 0) {
        moreThanTwoProds += 1;
    }
    if (numProd2 != 0) {
        moreThanTwoProds += 1;
    }

    if (numProd3 != 0) {
        moreThanTwoProds += 1;
    }

    if (numProd4 != 0) {
        moreThanTwoProds += 1;
    }

    if (numProd5 != 0) {
        moreThanTwoProds += 1;
    }

    if (numProd6 != 0) {
        moreThanTwoProds += 1;
    }


    if (moreThanTwoProds < 2) {
        retVal = false;
        alert("Precisa de comprar pelo menos dois produtos diferentes!");
    }

    return retVal;
}

function limpar() {

    numProd1 = 0;
    numProd2 = 0;
    numProd3 = 0;
    numProd4 = 0;
    numProd5 = 0;
    numProd6 = 0;

    
    document.getElementById("produto1").value = 0;
    document.getElementById("produto2").value = 0;
    document.getElementById("produto3").value = 0;
    document.getElementById("produto4").value = 0;
    document.getElementById("produto5").value = 0;
    document.getElementById("produto6").value = 0;

    moreThanTwoProds = 0;

    console.log(numProd1);
    console.log(numProd2);
    console.log(numProd3);
    console.log(numProd4);
    console.log(numProd5);
    console.log(numProd6);
    
    document.getElementById("quantidades").innerText = "0";
    document.getElementById("total").innerText = "0.00";

}