<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Apps/Uidesk.Master" CodeBehind="QA_Trx_DataBucket.aspx.vb" Inherits="UIDESK.QA_Trx_DataBucket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/QA_TrxDataBucket.js"></script>
    <script src="js/sweetalert.min.js"></script>
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                <h4 class="mb-0">Data Bucket Penilaian</h4>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
         <%--               <div class="col-md-11">
                        </div>--%>
                        <div class="text-end">
                            <div class="btn-group me-2 mb-2 mb-sm-0">
                                <button type="button" class="btn btn-soft-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-folder"></i>&nbsp;Action<i class="mdi mdi-chevron-down ms-1"></i>
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#" onclick="AddManual()">Add Data Manual</a>
                                    <a class="dropdown-item" href="#" onclick="GetIncoming()">Add Get Data Manual</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table align-middle table-nowrap table-check" id="TableBucketIncoming">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 50px;">ID</th>
                                            <th scope="col" style="width: 250px;">Channel</th>
                                            <th scope="col" style="width: 250px;">TicketNumber</th>
                                            <th scope="col" style="width: 250px;">Periode</th>
                                            <th scope="col" style="width: 250px;">Account</th>
                                            <th scope="col" style="width: 250px;">Status</th>
                                            <th scope="col" style="width: 250px;">Date Distribute</th>
                                            <th scope="col" style="width: 50px;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="addContactModalScreenCall" tabindex="-1" aria-labelledby="addContactModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addContactModalCustomer">Preview</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <iframe id="FrameAudio" title="description" style="width: 100%; height: 400px;"></iframe>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade bs-example-modal-xl" tabindex="-1" role="dialog" id="addContactModalScreenNonCall"
        aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content" style="width: 1100px;">
                <div class="modal-header">
                    <h5 class="modal-title" id="addContactModalLabelHistory">Preview</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <iframe id="FrameNonCall" title="description" style="width: 100%; height: 750px;"></iframe>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light w-sm" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade bs-example-modal-xl" tabindex="-1" role="dialog" id="addContactModal"
        aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addContactModalLabel">Form Penilaian Manual</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="addcontact-designation-input" class="form-label">Site</label>
                                        <select id="ComboSite" class="form-select">
                                            <option value="">Select</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="addcontact-designation-input" class="form-label">Channel</label>
                                        <select id="ComboChannel" class="form-select">
                                            <option value="">Select</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="addcontact-designation-input" class="form-label">Agent</label>
                                        <select id="ComboAgent" class="form-select">
                                            <option value="">Select</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="addcontact-designation-input" class="form-label">Waktu Interaksi</label>
                                        <input type="date" class="form-control" id="WaktuInteraksi">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="addcontact-designation-input" class="form-label">Periode Bulan</label>
                                        <select id="ComboBulan" class="form-select">
                                            <option value="">Select</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="addcontact-designation-input" class="form-label">Periode Tahun</label>
                                        <select id="ComboTahun" class="form-select">
                                            <option value="">Select</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label for="addcontact-designation-input" class="form-label">Nama/PIC</label>
                                        <input type="text" class="form-control" id="Nama_PIC" placeholder="Nama/PIC">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="addcontact-designation-input" class="form-label">Account X</label>
                                        <input type="text" class="form-control" id="QA_Account">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="addcontact-name-input" class="form-label">Tipe <span class="text-danger">*</span></label>
                                        <select id="AddCustomer_Type" class="form-select" onchange="ComboTypePerusahaan('1')">
                                            <option value="">Select</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="addcontact-designation-input" class="form-label">Link</label>
                                        <input type="text" class="form-control" id="QA_Link">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light w-sm" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary w-sm" onclick="ActionSubmitPenilaianManual()" id="Simpan">Submit</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade bs-example-modal-xl" tabindex="-1" role="dialog" id="addContactModalTable"
        aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addContactModalTableNya">Form Get Data Manual</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="mb-3">
                                        <label for="addcontact-designation-input" class="form-label">Channel</label>
                                        <select id="ComboChannelNya" class="form-select">
                                            <option value="">Select</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="mb-3">
                                        <label for="startdate" class="form-label">Start Date</label>
                                        <input type="date" class="form-control" id="startdate" placeholder="startdate" required>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="mb-3">
                                        <label for="enddate" class="form-label">End Date</label>
                                        <input type="date" class="form-control" id="enddate" placeholder="enddate" required>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="mb-3">
                                        <br />
                                        <a class="btn btn-primary w-sm" onclick="ActionGetDataManual()" id="ActionGetDataManual">Submit</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card" id="DivTableNya">
                        <div class="card-body">
                            <div class="row">
                                <div class="table-responsive">
                                    <table class="table align-middle table-nowrap table-check" id="TableBucket">
                                        <thead>
                                            <tr>
                                                <th scope="col" style="width: 50px;">ID</th>
                                                <th scope="col" style="width: 250px;">Account</th>
                                                <th scope="col" style="width: 250px;">Customer Name</th>
                                                <%--  <th scope="col" style="width: 250px;">AgentName</th>
                                        <th scope="col" style="width: 250px;">Subject</th>--%>
                                                <th scope="col" style="width: 250px;">Ticket Number</th>
                                                <th scope="col" style="width: 250px;">Date Transaksi</th>
                                                <th scope="col" style="width: 50px;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light w-sm" data-bs-dismiss="modal">Close</button>
                    <a class="btn btn-primary w-sm" onclick="ActionGetDataSelesai()" id="ActionGetDataSelesai">Done</a>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
