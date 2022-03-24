
/* Comentário */
function calcula() {
    var oper = document.getElementById("op").value;
    var x = parseFloat(document.getElementById("op1").value);
    var y = parseFloat(document.getElementById("op2").value);
    var res = "1"

    if (oper === "*") {
        res = x * y;
    }
    else if (oper === "+") {
        res = x + y;
    } 
    else if (oper === "-") {
        res = x - y;
    } 
    else if (oper === "/") {
        if (y != 0){
            res = x / y;
        }
        else {
            res = "Erro! Divisão por 0";
        }
    } 
    else if (oper === "%") {
        res = x % y;
    } 
    else if (oper === "!") {

        if (x > 0){

            for (i = 1; i <= x; i++) {
                res = res * i;
            }
        }
        else {
            res = "Erro! Não existe fatorial de números menores que zero";
        }

    } 
    else {
        res = "Não introduzio um operador";
    }
    document.getElementById("res").value = res;
    return
}    


function lamp0() {
    document.getElementById("image").src = "https://media.istockphoto.com/vectors/light-bulb-outline-icon-elements-of-ecology-in-neon-style-icons-icon-vector-id1131318256?k=20&m=1131318256&s=170667a&w=0&h=K09pXS4w9Vmgi_dPxaUEvSlcEKcNYivwQz-yvP3G81k=";
}


function lamp1() {
    document.getElementById("image").src = "https://i.pinimg.com/474x/af/6b/c9/af6bc929af2025ba542753c833f9f606.jpg";
}

function randomize() {

    var z = document.getElementsByClassName("block")
    Array.prototype.forEach.call(z, function(rekt) {

        rekt.style.width = Math.random() * 25 + 'vw';
        rekt.style.height = rekt.style.width;


        rekt.style.top = Math.random() * 5 + 'vh';
        rekt.style.left = Math.random() * 75 + 'vw';

        x = Math.floor(Math.random() * 4)
        
        switch (x) {
            case 0:
                rekt.style.background = "#FF0000";
                break;

            case 1:
                rekt.style.background = "#00FF00";
                break;

            case 2:
                rekt.style.background = "#0000FF";
                break;

            case 3:
                rekt.style.background = "#00FFFF";
                break;
            
            default:
                rekt.style.background = "#FFFFFF";
        }
    });
}


function stats() {
    document.getElementById("width").value = object.width;
    document.getElementById("height").value = object.width;
    document.getElementById("colour").value = object.width;
}


/*    Array.prototype.forEach.call(z, function(rekt) {

        document.getElementsByClassName("block").style.width = Math.random() * 25 + 'vw';
        document.getElementsByClassName("block").style.height = document.getElementsByClassName("block").style.width;

        x = Math.random(4)

        switch (x) {
            case "0":
                document.getElementsByClassName("block").style.backgroundColor = '#FF0000';
                break;

            case "1":
                document.getElementsByClassName("block").style.backgroundColor = '#00FF00';
                break;

            case "2":
                document.getElementsByClassName("block").style.backgroundColor = '#0000FF';
                break;

            case "3":
                document.getElementsByClassName("block").style.backgroundColor = '#00FFFF';
                break;
        }
    });*/