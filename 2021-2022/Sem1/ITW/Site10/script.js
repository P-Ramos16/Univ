$(document).ready(function () {
    function MyViewModel() {

        viewModel.selectedValue = ko.observable();
        viewModel.selectedText = ko.computed(function () {
            var elem = document.querySelector("select option[value=" + viewModel.selectedValue() + "]");
            return elem && elem.innerHTML;
        });

        var data = $.ajax({
            url: "http://api.openweathermap.org/data/2.5/weather",
            data: {
                q: $("#citySelector").val(),
                APPID: 'b2b1df463182c3cca5276e9d3267cc95'
        }});

        console.log(data)
        
        self.readData = function () {
            if (data.name){
                $('table').removeClass('d-none');
                $("#cityName").html(data.name + ' / ' + data.sys.country);
                $("#coordinates").html('Lon (º): ' + data.coord.lon + ' / Lat (º):' + data.coord.lat);
                $("#weather").html(data.weather[0].description);
                $("#temp").html(data.main.temp.toString() + 'ºK / ' + (data.main.temp - 273.15).toString() + 'ºC');
                $("#pressure").html(data.main.pressure);
                $("#allData").html(JSON.stringify(data, null, 4).replace(/\n/g, "<br>"));
            }

            else {
                $('table').addClass('d-none');
                alert(data.message);
            }
        };
    };
    ko.applyBindings(new MyViewModel());
}); 
