$(document).ready(function () {
    loadUserLoginData(); // Initial load for "User Login"
});

function loadUserLoginData(type) {
    const messageDiv = $('#divCountingDataUser');
    console.log("Initiating loadUserLoginData with type:", type);

    $.ajax({
        type: "POST",
        url: "asmx/Crm_Trx_Monitoring.asmx/BRA_LoginMonitoring",
        data: JSON.stringify({ UserName: $("#hd_sessionLogin").val(), Type: type }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            console.log("AJAX success response:", response);

            const data = JSON.parse(response.d || "[]");
            messageDiv.empty();

            data.forEach(item => {
                const cardHtml = `
                    <div class="card box box-link-shadow text-left card-item" 
                         data-type="${item.Type}" 
                         style="cursor:pointer; padding: 10px; width: 370px; margin: 0 7.5px;">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="flex-grow-1 text-start">
                                    <p class="mb-1 text-truncate text-muted" style="font-size: 22px;">${item.Type}</p>
                                </div>
                                <div class="text-center me-3">
                                    <div class="avatar">
                                        <div class="avatar-title bg-soft-${item.Color} text-${item.Color} rounded-circle font-size-30">
                                            <i class="${item.Icon}" style="font-size: 20px;"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-end">
                                    <h5 class="mb-0" style="font-size: 20px;">${item.AgentCounting}</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
                messageDiv.append(cardHtml);
            });

            // Set state untuk menghindari resubmission saat refresh
            history.replaceState(null, '', window.location.href);

            // Event listener untuk menghandle klik pada card
            $('.card-item').on('click', function () {
                const type = $(this).data('type');
                LoadingUser(type);
            });
        },
        error: function (xhr) {
            console.error(`Error loading data for ${type}:`, xhr.responseText);
        }
    });
}

let currentType = 'Total User'; // Variabel global untuk menyimpan tipe yang aktif

function LoadingUser(type) {
    // Set type ke currentType agar input search bekerja
    currentType = type;

    // Tampilkan search box
    $('#searchContainer').show();

    const divUserNotification = $('#divUserNotification');
    divUserNotification.empty();

    // Ambil nilai search term
    const searchTerm = $('#searchUser').val().toLowerCase();

    $.ajax({
        type: "POST",
        url: "asmx/Crm_Trx_Monitoring.asmx/BRA_UserMonitoring",
        data: JSON.stringify({
            UserID: '0',
            UserName: $("#hd_sessionLogin").val(),
            Type: '1',
            Action: 'SELECT'
        }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            const users = JSON.parse(response.d);

            users.forEach(user => {
                // Filter berdasarkan nama user jika ada search term
                if (user.NAME.toLowerCase().includes(searchTerm)) {
                    const statusBadge = user.LOGIN === 1
                        ? "<span class='badge rounded-pill badge-soft-success font-size-12'>Login</span>"
                        : "<span class='badge rounded-pill badge-soft-danger font-size-12'>Not Login</span>";

                    const descAuxText = user.LOGIN === 1 && user.DescAUX
                        ? `<span class='badge rounded-pill badge-soft-info font-size-12'>${user.DescAUX}</span>`
                        : '';

                    const userCardHtml = `
                        <div class="col-xl-3 col-sm-6 mb-3">
                            <div class="card border shadow-none">
                                <div class="card-body p-4">
                                    <div class="d-flex align-items-start">
                                        <div class="flex-shrink-0 avatar rounded-circle me-3">
                                            <img src="${user.FotoAgent || 'assets/images/users/user.png'}"
                                                 alt="" class="rounded-circle img-thumbnail">
                                        </div>
                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="font-size-15 mb-1 text-truncate">
                                                <a href="#" class="text-dark">${user.NAME}</a>
                                            </h5>
                                            <p class="text-muted text-truncate mb-0">${user.USERNAME}</p>
                                        </div>
                                        <div class="flex-shrink-0 dropdown">
                                            <a class="text-body dropdown-toggle font-size-16" href="#" role="button" data-bs-toggle="dropdown">
                                                <i class=""></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end">
                                                <a class="dropdown-item" href="#" onclick="ButtonEpic('${user.USERID}')">Release</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer bg-transparent border-top d-flex justify-content-between">
                                    <div class="font-size-13 text-muted">
                                        ${statusBadge} ${descAuxText}
                                    </div>
                                    <span class="badge rounded-pill badge-soft-primary font-size-12">${user.SiteName}</span>
                                </div>
                            </div>
                        </div>`;

                    // Filter user berdasarkan type
                    if (type === "Total User") {
                        divUserNotification.append(userCardHtml);
                    } else {
                        if ((type === "User Login" && user.LOGIN === 1) ||
                            (type === "User Not Login" && user.LOGIN !== 1) ||
                            (type === "User Aux" && user.LOGIN === 1 && user.DescAUX !== "Ready")) {
                            divUserNotification.append(userCardHtml);
                        }
                    }
                }
            });
        },
        error: function (xhr) {
            console.error("Error loading users:", xhr.responseText);
        }
    });
}

// Menambahkan event listener untuk menangkap event keydown pada search box
$(document).ready(function () {
    $('#searchUser').keydown(function (event) {
        if (event.key === 'Enter') {
            event.preventDefault(); // Mencegah form untuk melakukan submit
        }
    });
});

function ButtonEpic(UserID) {
    swal({
        title: "Do you want to process?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {

                var form_data = JSON.stringify({ UserID: UserID, UserName: $("#hd_sessionLogin").val(), Type: "1", Action:"RELEASE" });
                $.ajax({
                    url: "asmx/Crm_Trx_Monitoring.asmx/BRA_UserMonitoringRelease",
                    method: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: form_data,
                    success: function (data) {
                        console.log(form_data)

                        var jsonX = JSON.parse(data.d);
                        var i, x = "";
                        var result = "";

                        for (i = 0; i < jsonX.length; i++) {
                            if (jsonX[i].Result == "True") {
                                swal(
                                    '',
                                    'Release Data Has Been Success',
                                    'success'
                                ).then(function () {
                                    window.location.href = "Crm_Trx_Monitoring.aspx?"
                                });
                            } else {
                                swal(
                                    '',
                                    'Release Data Has Been Failed !',
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




