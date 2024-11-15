$(document).ready(function () {
    if ($("#TrxLoginTypeAngka").val() != "1") {
        $("#PageCreateTicket").hide();
        $("#PageFollowTicket").hide();
    } else {
        $("#PageCreateTicket").show();
        $("#PageFollowTicket").show();
    }
    SummaryTaskboard();
    DataTableTaskboard();
});
function getParameterByName(name, url = window.location.href) {
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}
function SummaryTaskboard() {
    var ValUserID = $("#hd_sessionLogin").val();
    var ValLayerID = $("#TrxLoginTypeAngka").val();
    var ValSpv = $("#TrxLayerUser").val();
    var result = "";
    var messageDiv = $('#divCountingDataCall');
    $.ajax({
        type: "POST",
        url: "asmx/ServiceTaskboard.asmx/ws_2_taskboard",
        data: "{UserID: '" + ValUserID + "',LayerID: '" + ValLayerID + "',Spv: '" + ValSpv + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var json = JSON.parse(data.d);
            var i, x = "";

            messageDiv.empty();
            for (i = 0; i < json.length; i++) {

                result = '<div class="col-xl-3 col-sm-6" style="cursor:pointer;"> ' +
                    '<a class="box box-link-shadow text-left" href="Crm_Trx_Taskboard.aspx?status=' + json[i].StatusData + '&mid=' + getParameterByName("mid") + '&smid=' + getParameterByName("smid") + '"> ' +
                    '<div class="card">' +
                    '<div class="card-body">' +
                    '<div class="d-flex align-items-left">' +
                    '<div class="flex-shrink-0 me-3">' +
                    '<div class="avatar-sm">' +
                    '<div class="avatar-title bg-soft-' + json[i].statusColor + ' text-' + json[i].statusColor + ' rounded-circle font-size-18">' +
                    '<i class="uil uil-list-ul"></i>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<div class="flex-grow-1 overflow-hidden">' +
                    '<p class="mb-1 text-truncate text-muted">' + json[i].StatusData + '</p>' +
                    '<h5 class="font-size-16 mb-0">' + json[i].JumlahData + '</h5>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</a> ' +
                    '</div>'
                messageDiv.append(result);

            }

        },
        error: function (xmlHttpRequest, textStatus, errorThrown) {
            console.log(xmlHttpRequest.responseText);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
}
//function DataTableTaskboard() {
//    //$("#LoaderPageCounting").show();
//    var TrxUserName = $("#hd_sessionLogin").val();
//    var TrxLoginTypeAngka = $("#TrxLoginTypeAngka").val();
//    var TrxDivisi = $("#TrxDivisi").val();
//    var TrxStatus = getParameterByName("status");
//    var result = "";
//    var myTaskboardTicket = $('#TaskboardTicket').DataTable(
//        {
//            "order": [[0, "desc"]]
//        },
//        {
//            "processing": true,
//            "language": {
//                processing: '<i class="spinner-border text-warning"></i><span>Loading...</span> '
//            },
//        });
//    $.fn.dataTable.ext.errMode = 'none';
//    $.ajax({
//        type: "POST",
//        url: "asmx/ServiceTaskboard.asmx/DataTableTaskboard",
//        data: "{TrxUserName: '" + TrxUserName + "',TrxLoginTypeAngka: '" + TrxLoginTypeAngka + "',TrxDivisi: '" + TrxDivisi + "',TrxStatus: '" + TrxStatus + "'}",
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (data) {
//            var json = JSON.parse(data.d);
//            var i, x = "";

//            //messageDiv.empty();
//            myTaskboardTicket.clear().draw();
//            if (json.length == 0) {
//                console.log("Data not found " + i);
//            } else {
//                for (i = 0; i < json.length; i++) {

//                    //var urlAction = "<div class='dropdown'>" +
//                    //    "<a data-toggle='dropdown' href='#'><i class='ti-more-alt rotate-90 text-black'></i></a>" +
//                    //    "<div class='dropdown-menu dropdown-menu-right'>" +
//                    //    "<a class='dropdown-item' href='#' onclick=showInternalNote('" + json[i].TicketNumber + "')><i class='fa fa-plus'></i> Internal Note</a>" +
//                    //    "<div class='dropdown-divider'></div>" +
//                    //    "<a class='dropdown-item' href='1_journey.aspx?ticketid=" + json[i].TicketNumber + "&numberid=0&threadid=0&status=" + json[i].Status + "'><i class='si-arrow-right-circle si'></i> Follow up</a>" +
//                    //    "</div>" +
//                    //    "</div>"

//                    var urlAction = '<div class="flex-shrink - 0 dropdown"> ' +
//                        '<a class="text-body dropdown-toggle font-size-16" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true"><i class="mdi mdi-dots-vertical ms-2"></i></a> ' +
//                        '<div class="dropdown-menu dropdown-menu-end"> ' +
//                        //'<a class="dropdown-item" href="#" onclick=InternalNote("' + json[i].TicketNumber + '")>Internal Note</a> ' +
//                        '<a class="dropdown-item" href="Crm_Trx_TicketJourneySystem.aspx?ticketid=' + json[i].TicketNumber + '&numberid=0&threadid=0&status=' + json[i].Status + '">Follow up</a> ' +
//                        '</div> ' +
//                        '</div> '

//                    var d = new Date(json[i].datecreate);
//                    var milisegundos = parseInt(json[i].datecreate.replace("/Date(", "").replace(")/", ""));
//                    var newDate = new Date(milisegundos).toLocaleDateString("en-UE");
//                    var newTime = new Date(milisegundos).toLocaleTimeString("en-UE");
//                    var ConverTanggal = newDate + ' ' + newTime
                    
//                    if (json[i].Status == "Open") {
//                        var TrxParam = "<span class='badge rounded-pill badge-soft-primary font-size-12'>" + json[i].Status + "</span>"
//                    } else if (json[i].Status == "Pending") {
//                        var TrxParam = "<span class='badge rounded-pill badge-soft-warning font-size-12'>" + json[i].Status + "</span>"
//                    } else if (json[i].Status == "Solved") {
//                        var TrxParam = "<span class='badge rounded-pill badge-soft-success font-size-12'>" + json[i].Status + "</span>"
//                    } else if (json[i].Status == "Closed") {
//                        var TrxParam = "<span class='badge rounded-pill badge-soft-danger font-size-12'>" + json[i].Status + "</span>"
//                    }

//                    if (json[i].TicketPosition == "1") {
//                        var TrxPosition = "Layer 1"
//                    } else if (json[i].TicketPosition == "2") {
//                        var TrxPosition = "Dynamic"
//                    } else if (json[i].TicketPosition == "3") {
//                        var TrxPosition = "Layer 3"
//                    } else if (json[i].TicketPosition == "4") {
//                        var TrxPosition = "Eksternal/Vendor"
//                    }

//                    myTaskboardTicket.row.add([json[i].TicketNumber, json[i].NamePIC, json[i].CategoryName, json[i].SubCategory1Name, TrxPosition, TrxParam, ConverTanggal, urlAction]).draw(false);

//                }

//            }

//        },
//        error: function (xmlHttpRequest, textStatus, errorThrown) {
//            console.log(xmlHttpRequest.responseText);
//            console.log(textStatus);
//            console.log(errorThrown);
//        },
//        complete: function () {
//            //$("#LoaderPageCounting").hide();
//        }
//    })
//}
function DataTableTaskboard() {
    var TrxUserName = $("#hd_sessionLogin").val();
    var TrxLoginTypeAngka = $("#TrxLoginTypeAngka").val();
    var TrxDivisi = $("#TrxDivisi").val();
    var TrxStatus = getParameterByName("status");
    var myTaskboardTicket = $('#TaskboardTicket').DataTable({
        "order": [[7, "desc"]],
        "processing": true,
        "language": {
            processing: '<i class="spinner-border text-warning"></i><span>Loading...</span> '
        },
    });
    $.fn.dataTable.ext.errMode = 'none';

    $.ajax({
        type: "POST",
        url: "asmx/ServiceTaskboard.asmx/DataTableTaskboard",
        data: JSON.stringify({
            TrxUserName: TrxUserName,
            TrxLoginTypeAngka: TrxLoginTypeAngka,
            TrxDivisi: TrxDivisi,
            TrxStatus: TrxStatus
        }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var json = JSON.parse(data.d);

            // Sort data by 'datecreate' in descending order
            json.sort(function (a, b) {
                return new Date(b.datecreate) - new Date(a.datecreate);
            });

            myTaskboardTicket.clear().draw();

            if (json.length === 0) {
                console.log("Data not found");
            } else {
                for (var i = 0; i < json.length; i++) {
                    var urlAction = '<div class="dropdown">' +
                        '<a class="text-body dropdown-toggle font-size-16" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true"><i class="mdi mdi-dots-vertical ms-2"></i></a>' +
                        '<div class="dropdown-menu dropdown-menu-end">' +
                        '<a class="dropdown-item" href="Crm_Trx_TicketJourneySystem.aspx?ticketid=' + json[i].TicketNumber + '&numberid=0&threadid=0&status=' + json[i].Status + '">Follow up</a>' +
                        '</div>' +
                        '</div>';

                    var miliseconds = parseInt(json[i].datecreate.replace("/Date(", "").replace(")/", ""));
                    var dateObject = new Date(miliseconds);
                    var formattedDate = ('0' + dateObject.getDate()).slice(-2) + '-' +
                        ('0' + (dateObject.getMonth() + 1)).slice(-2) + '-' +
                        dateObject.getFullYear();
                    var formattedTime = dateObject.toLocaleTimeString("en-UE", {
                        hour: '2-digit',
                        minute: '2-digit',
                        second: '2-digit',
                        hour12: false
                    });
                    var ConverTanggal = formattedDate + ' ' + formattedTime;

                    var TrxParam;
                    switch (json[i].Status) {
                        case "Open":
                            TrxParam = "<span class='badge rounded-pill badge-soft-primary font-size-12'>" + json[i].Status + "</span>";
                            break;
                        case "Pending":
                            TrxParam = "<span class='badge rounded-pill badge-soft-warning font-size-12'>" + json[i].Status + "</span>";
                            break;
                        case "Solved":
                            TrxParam = "<span class='badge rounded-pill badge-soft-success font-size-12'>" + json[i].Status + "</span>";
                            break;
                        case "Closed":
                            TrxParam = "<span class='badge rounded-pill badge-soft-danger font-size-12'>" + json[i].Status + "</span>";
                            break;
                    }

                    var TrxPosition;
                    switch (json[i].TicketPosition) {
                        case "1":
                            TrxPosition = "Layer 1";
                            break;
                        case "2":
                            TrxPosition = "Dynamic";
                            break;
                        case "3":
                            TrxPosition = "Layer 3";
                            break;
                        case "4":
                            TrxPosition = "Eksternal/Vendor";
                            break;
                    }

                    myTaskboardTicket.row.add([
                        json[i].TicketNumber,
                        json[i].NamePIC,
                        json[i].CategoryName,
                        json[i].SubCategory1Name,
                        json[i].AgentNya,
                        TrxPosition,
                        TrxParam,
                        ConverTanggal,
                        urlAction
                    ]).draw(false);
                }
            }
        },
        error: function (xmlHttpRequest, textStatus, errorThrown) {
            console.log(xmlHttpRequest.responseText);
            console.log(textStatus);
            console.log(errorThrown);
        }
    });
}
function InternalNote(id) {
    //$("#InternalNote").val("");
    $("#ContentPlaceHolder1_TrxID").val(id);
    $("#modal-note").modal('show');
    console.log("session : " + $("#hd_sessionLogin").val());
    console.log("TrxTicketNumber : " + id);
}
function FU() {
    $("#modal-followup").modal('show');
}
function ActionFollow() {
    location.href = "Crm_Trx_Ticket_System.aspx?account=" + $("#Form_Channel").val() +"&channel=Call"
}