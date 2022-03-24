$(document).ready(function () {
    $("input:checkbox").change(function () {

        for (var i = 1; i <= 4, i++) {
            var cb = "#local" + i;
            if ($(cb).prop("checked")) {
                $("preco").val(($(cb).val()));
            }
        }
        var x = $("#local").val();
        var y = 0;
        if (x == "frente") {
            y += 100
        }

        if (x == "tras") {
            y += 80
        }

        if (x == "lado") {
            y += 50
        }

        if (x == "centro") {
            y += 65
        }

        $("preco").val(y);
    });

    $("#submitBtn").on("click", function () {
        var retVal = true;
        if($("#name").val().length  < 10 || $("#name").val().length  > 100) {
            $('#nomeError').removeClass('d-none');
            retVal = false;
        }

        if($("#morada").val().length  < 20 || $("#morada").val().length > 200) {
            $('#moradaError').removeClass('d-none');
            retVal = false;
        }

        if($("#email").val().length  < 10 || $("#email").val().length > 100 && $("#email").val().indexOf("@") != -1 ) {
            $('#emailError').removeClass('d-none');
            retVal = false;
        }

        return retVal

    });
}); 