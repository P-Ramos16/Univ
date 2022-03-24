var lado = 1;
var num1 = "";
var num2 = "";
var op = "";
var res = 0;
var clear = 1;
var erro = 0;

function addNumber() {
    var x = event.target.value;
    console.log(x);
    if (clear == 1) {
        clear = 0;
        res = String("");
        document.getElementById("res").innerText = "";
    }
    if (lado == 1) {
        num1 += x;
    }
    else if (lado == 2) {
        num2 += x;
    }
    document.getElementById("res").innerText += x;
}

function addOperation() {
    if (lado == 1) {    
        lado = 2;
        op = event.target.value;
        console.log(op);
        document.getElementById("res").innerText += op;
    }
    else {
        document.getElementById("res").innerText = "";
        op = event.target.value;
        document.getElementById("res").innerText += num1;
        document.getElementById("res").innerText += op;
        num2 = String("");
        lado = 2;

    }

}

function calculate() {
    num1 = parseFloat(num1);
    num2 = parseFloat(num2);
    console.log(op)
    switch (op) {
        case "+":
            res = num1 + num2;
            break;
        case "-":
            res = num1 - num2;
            break;
        case "*":
            res = num1 * num2;
            break;
        case "/":
            if (num2 != 0) {
                res = num1 / num2;
            }
            else {
                res = "Erro! Divisão por 0."
                
            }
            break;
        case "":
            res = "Erro! Não colocou nenhuma conta!"
            erro = 1;
            break;

        default:
            res = "Erro! Colocou mais do que um sinal!"
            erro = 1;
    }
    document.getElementById("res").innerText = res;
    console.log(num1);
    console.log(num2);
    console.log(res);
    if (erro == 0 && clear == 0) {
        num1 = res;
        res = String("");
        lado = 2;
    }
    num2 = String("");
    op = "";
    erro = 0;
    lado = 1;
    clear = 1;

}

function clearResult() {
    num1 = String("");
    num2 = String("");
    op = "";
    erro = 0;
    lado = 1;
    clear = 1;
    document.getElementById("res").innerText = "0";
}




