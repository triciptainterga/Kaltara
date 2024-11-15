$(document).ready(function () {
    DataTableBucket()
    DropdownSite();
    DropdownChannel();
    DropdownChannelNya();
    DropdownAgent();
    DropdownBulan();
    DropdownTahun();
    $("#ActionGetDataSelesai").hide();
    DropdownCustomerType();
});
function DataTableBucket() {
    var myTable = $('#TableBucketIncoming').DataTable(
        {
            "order": [[6, "asc"]]
        },
    );
    $.fn.dataTable.ext.errMode = 'none';
    $.ajax({
        type: "POST",
        url: "asmx/QA_Form.asmx/QM_TrxDropdown",
        data: "{TrxID:'0', TrxUserName: '" + $('#hd_sessionLogin').val() + "', TrxStatus: '0', TrxAction: 'UIDESK013'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var json = JSON.parse(data.d);
            var i = "";

            myTable.clear().draw();
            for (i = 0; i < json.length; i++) {

                var miliseconds = parseInt(json[i].QADateDistribution.replace("/Date(", "").replace(")/", ""));
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

                var urlclick = '<div class="flex-shrink - 0 dropdown"> ' +
                    '<a class="text-body dropdown-toggle font-size-16" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true"><i class="mdi mdi-dots-vertical ms-2"></i></a> ' +
                    '<div class="dropdown-menu dropdown-menu-end"> ' +
                    //'<a class="dropdown-item" href="#" onclick=Reject(' + json[i].AcraID + ')>Reject</a> ' +
                    '<a class="dropdown-item" href="#" onclick=PreviewScreen(' + json[i].AcraID + ')>Preview</a> ' +
                    '<a class="dropdown-item" href="QA_Form.aspx?qaid=' + json[i].Kode + '&type=' + json[i].Channel + '&UserType=' + json[i].Site + '&act=fu&ticketid=' + json[i].TicketNumber + '&acraid=' + json[i].AcraID + '">Follow up</a> ' +
                    //'<a class="dropdown-item" href="#" onclick=AddManual(' + json[i].AcraID + ')>Add Manual</a> ' +
                    //'<a class="dropdown-item" href="#" onclick=GetIncoming(' + json[i].AcraID + ')>Get Manual</a> ' +
                    '</div> ' +
                    '</div> '
                //var urlclick = "<i class='bx bxs-edit-alt text-primary' onclick=UpdateKlik(" + json[i].AcraID + ") style='cursor:pointer;'></i>&nbsp;<i class='bx bxs-user-detail text-primary' onclick=PreviewKlik('" + json[i].AcraID + "') style='cursor:pointer;'></i>"
                myTable.row.add([json[i].AcraID, json[i].Channel, json[i].TicketNumber, json[i].Bulan, json[i].NoTelpon, json[i].StatusData, ConverTanggal, urlclick]).draw(false);

            }

        },
        error: function (xmlHttpRequest, textStatus, errorThrown) {
            console.log(xmlHttpRequest.responseText);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
}
function PreviewScreen(AcraID) {
    $.ajax({
        type: "POST",
        url: "asmx/QA_Form.asmx/QM_TrxDropdown",
        data: "{TrxID:'" + AcraID + "', TrxUserName: '" + $("#hd_sessionLogin").val() + "', TrxStatus: '0', TrxAction: 'UIDESK015'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            var json = JSON.parse(data.d);
            var i, x, result = "";

            for (i = 0; i < json.length; i++) {

                if (json[i].FileExist == null || json[i].FileExist == "") {
                    var FileExits = "0"
                } else {
                    var FileExits = "True"
                }
                if (FileExits == "True") {
                    if (json[i].Channel == "Call") {
                        $("#addContactModalScreenCall").modal('show');
                        document.getElementById("FrameAudio").src = "https://bravo.beacukai.go.id/omni/apps/js/voice/Clean-Audio-Player-jQuery/index.html?id=" + json[i].FilePath + ""
                    } else if (json[i].Channel == "Email" || json[i].Channel == "EMAIL") {
                        $("#addContactModalScreenNonCall").modal('show');
                        document.getElementById("FrameNonCall").src = "" + json[i].FilePath + ""
                    } else {
                        $("#addContactModalScreenNonCall").modal('show');
                        document.getElementById("FrameNonCall").src = "" + json[i].FilePath + ""
                    }
                } else {
                    swal(
                        '',
                        'File Not Exits',
                        'error'
                    ).then(function () {
                        $("#modal-audio").modal('hide');
                    });

                }
                ////alert("1")
                ////QM_PlayAudio.href = "http://localhost/BriqiStream/js/voice/Clean-Audio-Player-jQuery/index.html?id=" + json[i].FilePath + ""
                //window.open("http://localhost/BriqiStream/js/voice/Clean-Audio-Player-jQuery/index.html?id=" + json[i].FilePath + "", '_blank');
            }

        },
        error: function (xmlHttpRequest, textStatus, errorThrown) {
            console.log(xmlHttpRequest.responseText);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
    //$("#addContactModalScreenCall").modal('show');
    //document.getElementById("FrameAudio").src = "http://localhost/Bravo/apps/js/voice/Clean-Audio-Player-jQuery/index.html?id=" + AcraID + ""
}
function GetData() {
    $.ajax({
        type: "POST",
        url: "asmx/QA_Form.asmx/QM_TrxDropdown",
        data: "{TrxID:'0', TrxUserName: '" + $('#hd_sessionLogin').val() + "', TrxStatus: '0', TrxAction: 'UIDESK013'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var json = JSON.parse(data.d);
            var i = "";

            for (i = 0; i < json.length; i++) {



            }

        },
        error: function (xmlHttpRequest, textStatus, errorThrown) {
            console.log(xmlHttpRequest.responseText);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
}
function AddManual() {
    $("#addContactModal").modal('show');
    $("#div_manual").show();
    $("#div_upload").hide();
}
function GetIncoming() {
    $("#addContactModalTable").modal('show');
    $("#DivTableNya").hide()
}
function DropdownSite() {
    var ComboSite = $('#ComboSite');
    $.ajax({
        type: "POST",
        url: "asmx/TrmUserManagement.asmx/UIDESK_TrmMasterCombo",
        data: "{TrxID:'UideskIndonesia', TrxUserName: '" + $("#hd_sessionLogin").val() + "', TrxAction: 'UIDESK108'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var json = JSON.parse(data.d);
            var i, x, resultSite = "";

            ComboSite.empty();
            ComboSite.append('<option value="">Select</option>');
            for (i = 0; i < json.length; i++) {
                resultSite = '<option value="' + json[i].ID + '">' + json[i].Site + '</option>';
                ComboSite.append(resultSite);
            }

        },
        error: function (xmlHttpRequest, textStatus, errorThrown) {
            console.log(xmlHttpRequest.responseText);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
}
function DropdownChannel() {
    var ComboChannel = $('#ComboChannel');
    $.ajax({
        type: "POST",
        url: "asmx/TrmUserManagement.asmx/UIDESK_TrmMasterCombo",
        data: "{TrxID:'0', TrxUserName: '" + $("#hd_sessionLogin").val() + "', TrxAction: 'UIDESK232'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var json = JSON.parse(data.d);
            var i, x, resultChannel = "";

            ComboChannel.empty();
            ComboChannel.append('<option value="">Select</option>');
            for (i = 0; i < json.length; i++) {
                resultChannel = '<option value="' + json[i].ChannelName + '">' + json[i].ChannelName + '</option>';
                ComboChannel.append(resultChannel);
            }

        },
        error: function (xmlHttpRequest, textStatus, errorThrown) {
            console.log(xmlHttpRequest.responseText);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
}
function DropdownChannelNya() {
    var ComboChannelNya = $('#ComboChannelNya');
    $.ajax({
        type: "POST",
        url: "asmx/TrmUserManagement.asmx/UIDESK_TrmMasterCombo",
        data: "{TrxID:'0', TrxUserName: '" + $("#hd_sessionLogin").val() + "', TrxAction: 'UIDESK230'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var json = JSON.parse(data.d);
            var i, x, resultChannel = "";

            ComboChannelNya.empty();
            ComboChannelNya.append('<option value="">Select</option>');
            for (i = 0; i < json.length; i++) {
                resultChannel = '<option value="' + json[i].ChannelName + '">' + json[i].ChannelName + '</option>';
                ComboChannelNya.append(resultChannel);
            }

        },
        error: function (xmlHttpRequest, textStatus, errorThrown) {
            console.log(xmlHttpRequest.responseText);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
}
function DropdownAgent() {
    var ComboAgent = $('#ComboAgent');
    $.ajax({
        type: "POST",
        url: "asmx/QA_Form.asmx/QM_TrxDropdown",
        data: "{TrxID:'0', TrxUserName: '" + $('#hd_sessionLogin').val() + "', TrxStatus: '0', TrxAction: 'UIDESK021'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var json = JSON.parse(data.d);
            var i, x, resultAgent = "";

            ComboAgent.empty();
            ComboAgent.append('<option value="">Select</option>');
            for (i = 0; i < json.length; i++) {
                resultAgent = '<option value="' + json[i].USERNAME + '">' + json[i].NAME + '</option>';
                ComboAgent.append(resultAgent);
            }

        },
        error: function (xmlHttpRequest, textStatus, errorThrown) {
            console.log(xmlHttpRequest.responseText);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
}
function DropdownBulan() {
    var ComboBulan = $('#ComboBulan');
    $.ajax({
        type: "POST",
        url: "asmx/QA_Form.asmx/QM_TrxDropdown",
        data: "{TrxID:'0', TrxUserName: '" + $('#hd_sessionLogin').val() + "', TrxStatus: '0', TrxAction: 'UIDESK022'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var json = JSON.parse(data.d);
            var i, x, resultBulan = "";

            ComboBulan.empty();
            ComboBulan.append('<option value="">Select</option>');
            for (i = 0; i < json.length; i++) {
                resultBulan = '<option value="' + json[i].NamaBulan + '">' + json[i].NamaBulan + '</option>';
                ComboBulan.append(resultBulan);
            }

        },
        error: function (xmlHttpRequest, textStatus, errorThrown) {
            console.log(xmlHttpRequest.responseText);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
}
function DropdownTahun() {
    var ComboTahun = $('#ComboTahun');
    $.ajax({
        type: "POST",
        url: "asmx/QA_Form.asmx/QM_TrxDropdown",
        data: "{TrxID:'0', TrxUserName: '" + $('#hd_sessionLogin').val() + "', TrxStatus: '0', TrxAction: 'UIDESK023'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var json = JSON.parse(data.d);
            var i, x, resultTahun = "";

            ComboTahun.empty();
            ComboTahun.append('<option value="">Select</option>');
            for (i = 0; i < json.length; i++) {
                resultTahun = '<option value="' + json[i].Tahun + '">' + json[i].Tahun + '</option>';
                ComboTahun.append(resultTahun);
            }

        },
        error: function (xmlHttpRequest, textStatus, errorThrown) {
            console.log(xmlHttpRequest.responseText);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
}
function ActionSubmitPenilaianManual() {
    if ($("#hd_sessionLogin").val() == "") {
        swal(
            '',
            'Username is empty',
            'info'
        ).then(function () {
            return false;
        });
        return false;
    }
    if ($("#ComboSite").val() == "") {
        swal(
            '',
            'Site is empty',
            'info'
        ).then(function () {
            return false;
        });
        return false;
    }
    if ($("#ComboChannel").val() == "") {
        swal(
            '',
            'Channel is empty',
            'info'
        ).then(function () {
            return false;
        });
        return false;
    }
    if ($("#ComboAgent").val() == "") {
        swal(
            '',
            'Agent is empty',
            'info'
        ).then(function () {
            return false;
        });
        return false;
    }
    if ($("#WaktuInteraksi").val() == "") {
        swal(
            '',
            'Waktu interaksi is empty',
            'info'
        ).then(function () {
            return false;
        });
        return false;
    }
    if ($("#ComboBulan").val() == "") {
        swal(
            '',
            'Bulan is empty',
            'info'
        ).then(function () {
            return false;
        });
        return false;
    }
    if ($("#ComboTahun").val() == "") {
        swal(
            '',
            'Tahun is empty',
            'info'
        ).then(function () {
            return false;
        });
        return false;
    }
    if ($("#Nama_PIC").val() == "") {
        swal(
            '',
            'Nama PIC is empty',
            'info'
        ).then(function () {
            return false;
        });
        return false;
    }
    if ($("#QA_Account").val() == "") {
        swal(
            '',
            'Account is empty',
            'info'
        ).then(function () {
            return false;
        });
        return false;
    }
    if ($("#AddCustomer_Type").val() == "") {
        swal(
            '',
            'Type is empty',
            'info'
        ).then(function () {
            return false;
        });
        return false;
    }
    if ($("#QA_Link").val() == "") {
        swal(
            '',
            'Link is empty',
            'info'
        ).then(function () {
            return false;
        });
        return false;
    }
    swal({
        title: "Do you want to process?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {

                var form_data = JSON.stringify({
                    ID: "0", Site: $("#ComboSite").val(), Channel: $("#ComboChannel").val(),
                    Agent: $("#ComboAgent").val(), Waktu: $("#WaktuInteraksi").val(), Bulan: $("#ComboBulan").val(), Tahun: $("#ComboTahun").val(),
                    Account: $("#QA_Account").val(), Link: $("#QA_Link").val(), UserName: $("#hd_sessionLogin").val(), Name: $("#Nama_PIC").val(),
                    Type: $("#AddCustomer_Type").val(), Action: "INSERT"
                });

                $.ajax({
                    url: "asmx/QA_Trx_DataBucket.asmx/SimpanTransaksi",
                    method: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: form_data,
                    success: function (data) {
                        console.log(form_data)

                        var json = JSON.parse(data.d);
                        var i = "";
                        for (i = 0; i < json.length; i++) {
                            if (json[i].Result == "True") {
                                swal(
                                    '',
                                    'Insert Data Has Been Success',
                                    'success'
                                ).then(function () {
                                    window.location.href = "QA_Trx_DataBucket.aspx?"
                                });
                            } else {
                                swal(
                                    '',
                                    'Insert Data Has Been Failed !',
                                    'error'
                                ).then(function () {
                                    return false
                                });
                                return false
                            }

                        }

                    },
                    error: function (xmlHttpRequest, textStatus, errorThrown) {
                        console.log(xmlHttpRequest.responseText);
                        console.log(textStatus);
                        console.log(errorThrown);
                    },
                    complete: function () {

                    }
                });

            }
        });
}
function ActionGetDataManual() {
    if ($("#hd_sessionLogin").val() == "") {
        swal(
            '',
            'Username is empty',
            'info'
        ).then(function () {
            return false;
        });
        return false;
    }
    if ($("#ComboChannelNya").val() == "") {
        swal(
            '',
            'Channel is empty',
            'info'
        ).then(function () {
            return false;
        });
        return false;
    }
    if ($("#startdate").val() == "") {
        swal(
            '',
            'Start Date is empty',
            'info'
        ).then(function () {
            return false;
        });
        return false;
    }
    if ($("#enddate").val() == "") {
        swal(
            '',
            'End Date is empty',
            'info'
        ).then(function () {
            return false;
        });
        return false;
    }
    swal({
        title: "Do you want to process?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {

                var myTable = $('#TableBucket').DataTable(
                    {
                        "order": [[0, "asc"]]
                    },
                );
                $.fn.dataTable.ext.errMode = 'none';
                $.ajax({
                    type: "POST",
                    url: "asmx/QA_Trx_DataBucket.asmx/BRA_QA_GetDataTransaction",
                    data: "{Channel:'" + $('#ComboChannelNya').val() + "', StarDate: '" + $('#startdate').val() + "', EndDate: '" + $('#enddate').val() + "', Action: 'SELECT', UserName:'" + $('#hd_sessionLogin').val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var json = JSON.parse(data.d);
                        var i = "";

                        myTable.clear().draw();
                        for (i = 0; i < json.length; i++) {

                            if (json[i].DateCreate != null) {
                                var d = new Date(json[i].DateCreate);
                                var milisegundos = parseInt(json[i].DateCreate.replace("/Date(", "").replace(")/", ""));
                                var newDate = new Date(milisegundos).toLocaleDateString("en-UE");
                                var newTime = new Date(milisegundos).toLocaleTimeString("en-UE");
                                var ConverTanggal = newDate + ' ' + newTime
                            } else {
                                var ConverTanggal = "-"
                            }
                            //var urlclick = '<div class="flex-shrink - 0 dropdown"> ' +
                            //    '<a class="text-body dropdown-toggle font-size-16" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true"><i class="mdi mdi-dots-vertical ms-2"></i></a> ' +
                            //    '<div class="dropdown-menu dropdown-menu-end"> ' +
                            //    '<a class="dropdown-item" href="#" onclick=Proses(' + json[i].GenesysNumber + ')><span class="badge rounded-pill badge-soft-primary font-size-12">Submit</span></a> ' +
                            //    //'<a class="dropdown-item" href="#" onclick=PreviewScreen(' + json[i].AcraID + ')>Preview</a> ' +
                            //    //'<a class="dropdown-item" href="QA_Form.aspx?qaid=' + json[i].Kode + '&type=' + json[i].Channel + '&UserType=' + json[i].Site + '&act=fu&ticketid=' + json[i].TicketNumber + '&acraid=' + json[i].AcraID + '">Follow up</a> ' +
                            //    //'<a class="dropdown-item" href="#" onclick=AddManual(' + json[i].AcraID + ')>Add Manual</a> ' +
                            //    //'<a class="dropdown-item" href="#" onclick=GetIncoming(' + json[i].AcraID + ')>Get Manual</a> ' +
                            //    '</div> ' +
                            //    '</div> '
                            var urlclick = '<a class="dropdown-item" href="#" onclick=Proses(' + json[i].GenesysNumber + ')><span class="badge rounded-pill badge-soft-primary font-size-12">Get</span></a>'
                            myTable.row.add([json[i].GenesysNumber, json[i].Account, json[i].CustomerName, json[i].TicketNumber, ConverTanggal, urlclick]).draw(false);
                            //myTable.row.add([json[i].GenesysNumber, json[i].Account, json[i].CustomerName, json[i].AgentName, json[i].Subject, json[i].TicketNumber, ConverTanggal, urlclick]).draw(false);

                        }

                       

                    },
                    error: function (xmlHttpRequest, textStatus, errorThrown) {
                        console.log(xmlHttpRequest.responseText);
                        console.log(textStatus);
                        console.log(errorThrown);
                    }
                })
                $("#DivTableNya").show()
                $("#TableBucket").show()
            }
        });
}
function Proses(GenesysNumber) {
    var form_data = JSON.stringify({
        ID: GenesysNumber, UserName: $("#hd_sessionLogin").val(), Action: "INSERT"
    });
    $.ajax({
        url: "asmx/QA_Trx_DataBucket.asmx/ProsesTransaksi",
        method: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: form_data,
        success: function (data) {
            console.log(form_data)

            var json = JSON.parse(data.d);
            var i = "";
            for (i = 0; i < json.length; i++) {
                if (json[i].Result == "True") {
                    swal(
                        '',
                        'Proses Data Has Been Success',
                        'success'
                    ).then(function () {
                        DataTableBucketManual();
                        DataTableBucket();
                        $("#ActionGetDataSelesai").show();
                    });
                } else {
                    swal(
                        '',
                        'Proses Data Has Been Failed !',
                        'error'
                    ).then(function () {
                        return false
                    });
                    return false
                }

            }

        },
        error: function (xmlHttpRequest, textStatus, errorThrown) {
            console.log(xmlHttpRequest.responseText);
            console.log(textStatus);
            console.log(errorThrown);
        },
        complete: function () {

        }
    });
   
}
function ActionGetDataSelesai() {
    //$("#addContactModalTable").modal('hide');
    //$("#TableBucket").hide()
    window.location.href = "QA_Trx_DataBucket.aspx?"
}
function DataTableBucketManual() {
    var myTable = $('#TableBucket').DataTable(
        {
            "order": [[0, "asc"]]
        },
    );
    $.fn.dataTable.ext.errMode = 'none';
    $.ajax({
        type: "POST",
        url: "asmx/QA_Trx_DataBucket.asmx/BRA_QA_GetDataTransaction",
        data: "{Channel:'" + $('#ComboChannelNya').val() + "', StarDate: '" + $('#startdate').val() + "', EndDate: '" + $('#enddate').val() + "', Action: 'SELECT', UserName:'" + $('#hd_sessionLogin').val() + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var json = JSON.parse(data.d);
            var i = "";

            myTable.clear().draw();
            for (i = 0; i < json.length; i++) {

                if (json[i].DateCreate != null) {
                    var d = new Date(json[i].DateCreate);
                    var milisegundos = parseInt(json[i].DateCreate.replace("/Date(", "").replace(")/", ""));
                    var newDate = new Date(milisegundos).toLocaleDateString("en-UE");
                    var newTime = new Date(milisegundos).toLocaleTimeString("en-UE");
                    var ConverTanggal = newDate + ' ' + newTime
                } else {
                    var ConverTanggal = "-"
                }

                var urlclick = '<a class="dropdown-item" href="#" onclick=Proses(' + json[i].GenesysNumber + ')><span class="badge rounded-pill badge-soft-primary font-size-12">Get</span></a>'
                myTable.row.add([json[i].GenesysNumber, json[i].Account, json[i].CustomerName, json[i].TicketNumber, ConverTanggal, urlclick]).draw(false);
                //myTable.row.add([json[i].GenesysNumber, json[i].Account, json[i].CustomerName, json[i].AgentName, json[i].Subject, json[i].TicketNumber, ConverTanggal, urlclick]).draw(false);

            }



        },
        error: function (xmlHttpRequest, textStatus, errorThrown) {
            console.log(xmlHttpRequest.responseText);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
}
function DropdownCustomerType() {
    var cmbDataSourceCustomerType = $('#AddCustomer_Type');
    $.ajax({
        type: "POST",
        url: "WebServiceGetDataMaster.asmx/UIDESK_TrmMasterCombo",
        data: "{TrxID:'0', TrxUserName: '" + $("#hd_sessionLogin").val() + "', TrxAction: 'UIDESK180'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            var json = JSON.parse(data.d);
            var i, x, resultCustomerType = "";

            var StatusNya
            for (i = 0; i < json.length; i++) {

                resultCustomerType = '<option value="' + json[i].ID + '">' + json[i].Type + '</option>';
                cmbDataSourceCustomerType.append(resultCustomerType);

            }

        },
        error: function (xmlHttpRequest, textStatus, errorThrown) {
            console.log(xmlHttpRequest.responseText);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
}