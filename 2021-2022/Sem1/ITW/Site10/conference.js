$(document).ready(function () {
    //--- Variáveis globais

    //--- Funções globais
    $("#exampleInputBirthDate1").datepicker({       //--- datepicker: JqueryUI
        changeYear: true,
        changeMonth: true,
        dateFormat: 'yy/mm/dd',
        yearRange: "-100:-18"
    });
    $("#exampleInputBirthDate2").datepicker({       
        changeYear: true,
        changeMonth: true,
        dateFormat: 'yy/mm/dd',
        yearRange: "-100:-18"
    });
    //--- viewmodel - métodos e dados
    function MyViewModel() {
        //--- Variáveis do viewmodel
        //---
        //-- Fazemos sempre a cópia da variável 'this' para outra variável, pois o 'this' varia consoante o contexto
        var self = this;        
        //--- Variável contendo um Participante tmp. Usado nas operações de EDIT
        self.tmp = null;
        //--- Array de Observáveis contendo a LISTA de participantes
        self.participants = ko.observableArray();
        //--- Variável computada que nos indica se a LISTA possui/não possui elementos
        self.hasParticipants = ko.computed(function () {
            var retVal = (self.participants().length > 0);
            console.log('hasParticipants: ' + retVal);
            return retVal;
        }, self);
        //--- Métodos do viewmodel
        //---
        //--- Método de atualização da LISTA recolhidos na Modal CREATE
        self.createParticipant = function () {
            var participant = { 'name': '', 'email': '', 'address': '', 'birthDate': '', 'sex': '', 'course': { 'id': '', 'name': '' } };
            console.log('createParticipant');
            //--- carrega um novo participante na lista
            participant.name = $("#exampleInputName1").val();
            participant.email = $("#exampleInputEmail1").val();
            participant.address = $("#exampleInputAddress1").val();
            participant.birthDate = $("#exampleInputBirthDate1").val();
            participant.sex = $("#createParticipantModal input[type=radio]:checked").val();
            participant.course.id = $('#exampleInputCourse1').val();
            participant.course.name = $('#exampleInputCourse1 :selected').text();
            //--- insere novo participante na lista
            self.participants.push(participant);
            console.log(participant);
            //--- ordena a lista alfabeticamente pelo nome
            self.participants.sort(
                function (left, right) {
                    return left.name == right.name ? 0 : (left.name < right.name ? -1 : 1);
                });
            $("#createParticipantModal").modal('toggle');
        };
        //--- Método de carregamento de dados na Modal EDIT
        self.readParticipant = function (participant) {
            self.tmp = participant;
            console.log('readParticipant', "[" + participant.name + "]");
            $("#exampleInputName2").val(participant.name);
            $("#exampleInputEmail2").val(participant.email);
            $("#exampleInputAddress2").val(participant.address);
            $("#exampleInputBirthDate2").val(participant.birthDate);
            if (participant.sex != '') {
                $("#readParticipantModal [name = exampleInputSex2][value=" + participant.sex + "]").prop('checked', true);
            }
            else {
                $("#readParticipantModal [name = exampleInputSex2]").prop('checked', false);
            }
            $('#exampleInputCourse2').val(participant.course.id);
        };
        //--- Método de carregamento de dados na LISTA
        self.readParticipants = function () {
            console.log('init');
            //--- carrega a lista com um conjunto de participantes
            self.participants([
                { 'name': 'Noé Elisabete Ferreiro', 'email': '', 'address': '', 'birthDate': '', 'sex': 'Male', 'course': { 'id': '', 'name': '' } },
                { 'name': 'Marta Matias Lucas', 'email': 'marta.lucas@teste.com', 'address': '', 'birthDate': '', 'sex': '', 'course': { 'id': '', 'name': '' } },
                { 'name': 'Ezequiel Augusto Melo', 'email': '', 'address': 'Rua de Cima, n.º 8\nAveiro\nPORTUGAL', 'birthDate': '1998/11/17', 'sex': 'Male', 'course': { 'id': '', 'name': '' } },
                { 'name': 'Mariana Cravo', 'email': '', 'address': '', 'birthDate': '', 'sex': 'Female', 'course': { 'id': '', 'name': '' } },
                { 'name': 'Albino Nico Armando', 'email': '', 'address': '', 'birthDate': '', 'sex': '', 'course': { 'id': '', 'name': '' } },
                { 'name': 'Alexandra Eufêmia Torres', 'email': '', 'address': '', 'birthDate': '', 'sex': '', 'course': { 'id': '', 'name': '' } }
            ]);
            //--- ordena a lista alfabeticamente pelo nome
            self.participants.sort(
                function (left, right) {
                    return left.name === right.name ? 0 : (left.name < right.name ? -1 : 1)
                });
        };
        //--- Método de atualização de dados na LISTA recolhidos na Modal EDIT
        self.updateParticipant = function (participant) {
            console.log('updateParticipant', participant);
            //--- remove o item selecionado para edição da lista
            self.participants.remove(self.tmp);
            //--- altera o item temporário
            self.tmp.name = $("#exampleInputName2").val();
            self.tmp.email = $("#exampleInputEmail2").val();
            self.tmp.address = $("#exampleInputAddress2").val();
            self.tmp.birthDate = $("#exampleInputBirthDate2").val();
            self.tmp.sex = $("#readParticipantModal input[type=radio]:checked").val();
            self.tmp.course.id = $('#exampleInputCourse2').val();
            self.tmp.course.name = $('#exampleInputCourse2 :selected').text();
            //--- coloca novo elemento na lista
            self.participants.push(self.tmp);
            //--- limpa o objeto tmp
            self.tmp = null;
            //--- ordena a lista alfabeticamente pelo nome
            self.participants.sort(
                function (left, right) {
                    return left.name == right.name ? 0 : (left.name < right.name ? -1 : 1)
                });
            //--- apaga a modal
            $("#readParticipantModal").modal('toggle');
            //--- debug
            console.log(self.participants());
        };
        //--- Método para apagar todos os participantes da LISTA
        self.deleteParticipants = function () {
            console.log('deleteParticipants');
            //--- apaga todos os participantes da lista
            self.participants.removeAll();
        };
        //--- Método para apagar uma pariticipante da LISTA
        self.deleteParticipant = function (participant) {
            console.log('deleteParticipant');
            //--- apaga um participante da lista 
            self.participants.remove(participant);
            console.log(this);
        };
    }

    //--- Inicialização do ViewModel
    ko.applyBindings(new MyViewModel());
});