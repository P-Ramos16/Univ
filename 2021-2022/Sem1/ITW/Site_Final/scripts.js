window.onload = function() {
    changeColour()
};
  

function myFunction() {  // navbar responsiva
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
} 

var r = document.querySelector(':root');

function changeColour() {  // Mudar a cor do tema

    var y = event.target.value;
    console.log(y)


    if (y == undefined) { // Veio da window.onload e nao de um butao
        var y = sessionStorage.getItem("y"); // Ver se a variavel ja tinha sido "escolhida" noutra window
        console.log(y)
        if (y == undefined) { // Se a variavel nao tiver sido guardada na storage, pre definir o tema para o 1 (mercedes)
            y = 1;
        }
    }

    if (y == "0") { // Tema da Ferrari
        r.style.setProperty('--main_color', '#F7d31d');
        r.style.setProperty('--sec_color', '#F7d31d');
        r.style.setProperty('--trd_color', '#1A1715');
        r.style.setProperty('--bg_color', '#F60000');
    }

    else if (y == "1") { // Tema da Mercedes
        r.style.setProperty('--main_color', '#004146');
        r.style.setProperty('--sec_color', '#eff5f9');
        r.style.setProperty('--trd_color', '#004146');
        r.style.setProperty('--bg_color', '#03bfb5');
    }

    else if (y == "2") { // Tema da McLaren
        r.style.setProperty('--main_color', '#005fd8');
        r.style.setProperty('--sec_color', '#fcfefe');
        r.style.setProperty('--trd_color', '#050505');
        r.style.setProperty('--bg_color', '#FF9700');
    }

    else if (y == "3") { // Tema da Red Bull
        r.style.setProperty('--main_color', '#1B2B5A');
        r.style.setProperty('--sec_color', '#B2B9D1');
        r.style.setProperty('--trd_color', '#12142d');
        r.style.setProperty('--bg_color', '#FF0026');
    }
    
    sessionStorage.setItem("y", y);
    divtest();
} 


// Gerador de backgrounds triangulares https://github.com/qrohlf/trianglify

function divtest(){

    // Background do body

    var themes = getComputedStyle(document.body);

    var pattern = Trianglify({
        width: 2000,
        height: 3000,
        cell_size: 300 + Math.random() * 100,
        y_colors: [themes.getPropertyValue('--bg_color'), themes.getPropertyValue('--bg_color'), themes.getPropertyValue('--main_color'), themes.getPropertyValue('--main_color')],
        x_colors: [themes.getPropertyValue('--bg_color'), themes.getPropertyValue('--bg_color'), themes.getPropertyValue('--main_color'), themes.getPropertyValue('--main_color')],
        stroke_width: 0.00001
    }).png();

    var pattern64 = pattern.substr(pattern.indexOf('base64') + 7);

    var sheet = (function() {
        var style = document.createElement("style");

        style.appendChild(document.createTextNode(""));

        document.head.appendChild(style);

        return style.sheet;
    })();

    sheet.insertRule("body { background: transparent url(data:image/png;base64,"+pattern64+"); }", 0.5);


    // Background do main
    
    var pattern = Trianglify({
        width: 1920,
        height: 2000,
        cell_size: 300 + Math.random() * 100,
        x_colors: ['#555', '#111', '#000'],
        y_colors: ['#444', '#666', '#222'],
        stroke_width: 0.00001
    }).png();

    var pattern64 = pattern.substr(pattern.indexOf('base64') + 7);

    var sheet = (function() {
        var style = document.createElement("style");

        style.appendChild(document.createTextNode(""));

        document.head.appendChild(style);

        return style.sheet;
    })();

    sheet.insertRule("main { background: transparent url(data:image/png;base64,"+pattern64+"); }", 0.5);
    sheet.insertRule(".footer { background: transparent url(data:image/png;base64,"+pattern64+"); }", 0.5);

}

