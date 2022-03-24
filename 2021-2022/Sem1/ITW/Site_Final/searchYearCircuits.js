function go(destination){
    if (destination != ''){
        
        document.getElementById("btn0").setAttribute("href", "circuitsSeasons.html?year=" + destination )
    }
}

var sel2 = document.getElementById('select0');
for (var i = 2020; i >= 1950; i--) {
  var opt = document.createElement('option');
  opt.text = i;
  opt.value = i;
  sel2.appendChild(opt);
}