<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Apps/Uidesk.Master" CodeBehind="Crm_Trm_Inbox_EmailSystemSpv.aspx.vb" Inherits="UIDESK.Crm_Trm_Inbox_EmailSystemSpv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/Crm_Trm_Inbox_EmailSystemSpv.js"></script>
    <script src="js/sweetalert.min.js"></script>
    <script src="js/alertify.min.js"></script>
    <script src="js/alertify.js"></script>
    <link href="css/alertify.css" rel="stylesheet" />
    <link href="css/alertify.min.css" rel="stylesheet" />
    <link href="assets/libs/choices.js/public/assets/styles/choices.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet">
    <asp:HiddenField ID="TrxID" runat="server" />
    <asp:HiddenField ID="TrxUserName" runat="server" />
    <asp:HiddenField ID="TrxEmailID" runat="server" />
    <asp:HiddenField ID="TrxGenerateEmailID" runat="server" />
    <asp:HiddenField ID="Hd_StartDate" runat="server" />
    <asp:HiddenField ID="Hd_FinishDate" runat="server" />
    <asp:HiddenField ID="DraftID" runat="server" />
    <asp:HiddenField ID="HDSignature" runat="server" />
    <asp:HiddenField ID="CustomerID" runat="server" />
    <asp:HiddenField ID="TrxCustomerID" runat="server" />
    <asp:HiddenField ID="TrxEmailAccount" runat="server" />
    <asp:HiddenField ID="TrxTicketNumber" runat="server" />
    <style>
        .tooltip-container {
            position: relative;
            display: inline-block;
        }

            .tooltip-container .tooltip {
                display: none;
                position: absolute;
                background-color: #333;
                color: #fff;
                padding: 5px;
                border-radius: 3px;
                font-size: 12px;
                white-space: nowrap;
                z-index: 1;
                bottom: 100%; /* Position the tooltip above the trigger element */
                left: 50%;
                transform: translateX(-50%);
            }

            .tooltip-container:hover .tooltip {
                display: block;
            }

        .mail-list a {
            color: #6c757d; /* Warna teks default */
        }

            .mail-list a i {
                color: #6c757d; /* Warna icon default */
            }

            .mail-list a.active {
                color: #FF4433; /* Warna teks saat aktif */
                font-weight: bold;
            }

                .mail-list a.active i {
                    color: #FF4433; /* Warna icon saat aktif */
                }
    </style>
    <style>
        .bodyemailread {
            height: 100%; /* Make the child element take full height of the parent */
            min-height: 300px; /* Set the minimum height */
            overflow-y: auto; /* Add scrollbars if content exceeds max height */
        }
    </style>
    <div class="row">
        <div class="col-12">
            <div class="email-leftbar card">
                <div class="row">
                    <button type="button" class="btn btn-danger w-100 fw-semibold" data-bs-toggle="modal" data-bs-target="#composemodal" onclick="Compose_Add()">
                        Compose                                   
                    </button>
                   <div class="mail-list mt-4">
                            <i class="bx bx-mail-send font-size-16 align-middle me-2"></i>
                        <a href="javascript:void(0)" class="active" onclick="OnclickInbox();" id="InboxClass">
                            <i class="bx bxs-inbox font-size-16 align-middle me-2"></i>
                            Inbox 
                            <span class="ms-1 float-end">
                                <p id="InboxCount" style="text-align: center;"></p>
                            </span>
                        </a>
                        <a href="javascript:void(0)" onclick="OnclickDraft()" id="FolderDraft">
                            <i class="bx bx-file font-size-16 align-middle me-2"></i>
                            Draft
                            <span class="ms-1 float-end">
                                <p id="DraftCount" style="text-align: center;"></p>
                            </span>
                        </a>
                        <a href="javascript:void(0)" onclick="OnclickSendLeader()" id="FolderSendTeamLeader">
                            <i class="bx bx-user-circle font-size-16 align-middle me-2"></i>
                            Send To Leader
                            <span class="ms-1 float-end">
                                <p id="SentLeaderCount" style="text-align: center;"></p>
                            </span>
                        </a>
                        <a href="javascript:void(0)" onclick="OnclickSendMail()" id="FolderSendEmail">
                            Sent Mail
                            <span class="ms-1 float-end">
                                <p id="SentMailCount" style="text-align: center;"></p>
                            </span>
                        </a>
                        <a href="javascript:void(0)" onclick="OnclickCase()" id="FolderCase">
                            <i class="bx bx-briefcase-alt font-size-16 align-middle me-2"></i>
                            Case
                            <span class="ms-1 float-end">
                                <p id="CaseCount" style="text-align: center;"></p>
                            </span>
                        </a>
                        <a href="javascript:void(0)" onclick="OnclickArchieve()" id="FolderArchieve">
                            <i class="bx bx-archive-in font-size-16 align-middle me-2"></i>
                            Archive
                            <span class="ms-1 float-end">
                                <p id="ArchiveCount" style="text-align: center;"></p>
                            </span>
                        </a>
                    </div>
                    <h6 class="mt-4">List Data Agent</h6>
                    <div class="mail-list mt-1" id="divLisAgent" style="height:300px;overflow:auto;">
                    </div>
                    <h6 class="mt-4">List Data Team Leader</h6>
                    <div class="mail-list mt-1" id="divLisTeamLeader">
                    </div>
                </div>
                <div class="row" id="DivJourneyReject">
                    <div class="mail-list mt-1" id="RejectTeamLeader">
                    </div>
                </div>
            </div>
            <div class="email-rightbar mb-3">
                <div class="card" id="DivTableIncomingEmail">
                    <div class="card-body">
                        <table id="TableIncomingEmail" class="table table-hover" style="width: 100%;">
                            <thead>
                                <tr>
                                    <th style="width: 250px;">From</th>
                                    <th>Subject</th>
                                    <th style="width: 200px;">Owner</th>
                                    <th style="width: 200px;">Date Create</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card" id="DivTableOutgoingEmail">
                    <div class="card-body">
                        <table id="TableOutgoingEmail" class="table table-hover" style="width: 100%;">
                            <thead>
                                <tr>
                                    <th style="width: 250px;">To</th>
                                    <th>Subject</th>
                                    <th style="width: 200px;">Owner</th>
                                    <th style="width: 200px;">Date Create</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="DivObjectCompose">
                    <div class="card">
                        <div class="card-body">
                            <div class="mb-3">
                                <input type="text" class="form-control" id="ComposeETO" placeholder="To">
                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" id="ComposeESUBJECT" placeholder="Subject">
                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" id="ComposeECC" placeholder="Ccc">
                            </div>
                            <div class="mb-3">
                                <textarea id="Compose_Body" name="Compose_Body" class="form-control" rows="25" placeholder="Jawaban.."></textarea>
                            </div>
                            <div class="mt-3" id="Div_ComposeTicketAttachmentExisting">
                                <div id="ComposeTicketAttachmentExisting" style="width: 100%;"></div>
                            </div>
                            <div class="row" id="ComposeDivAttachmentTicketEmail">
                                <div class="col-lg-12">
                                    <input type="file" name="composefiles" class="form-control">
                                </div>
                            </div>
                            <div class="mt-3">
                                <div id="ComposeTicketAttachment" style="width: 100%;"></div>
                            </div>
                            <div class="mt-3">
                                <a class="btn btn-soft-primary w-sm float-end" onclick="Proses_ComposeEmail()" id="ButtonProsesCompose"><i class="fab fa-telegram-plane ms-1"></i>&nbsp;Send</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="DivObjectTicket">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        <label for="contact-info-name" class="form-label">Agent Name</label>
                                        <input type="text" class="form-control" placeholder="Enter Name" id="Form_Ticket_Agent_Name" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        <label for="contact-info-email-input" class="form-label">Priority</label>
                                        <select id="Form_Ticket_Priority" class="form-select" readonly="readonly">
                                            <option value="">Select</option>
                                            <option value="High">High</option>
                                            <option value="Medium">Medium</option>
                                            <option value="Low">Low</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        <label for="contact-info-phone-input" class="form-label">Status</label>
                                        <input type="text" class="form-control" id="Form_Ticket_Status" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        <label for="workexperience-category-input">Subject</label>
                                        <input type="text" class="form-control" id="Form_Ticket_Subject" placeholder="Subject" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        <label for="workexperience-category-input">Category</label>
                                        <select id="Form_Ticket_Kategori" class="form-select" onchange="Dropdown_SubCategory(1);" readonly="readonly">
                                            <option value="">Select</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        <label for="workexperience-category-input">No. Aju</label><label class="float-end" id="errorNoAjo" style="color: red;"></label>
                                        <input type="text" class="form-control" id="Form_Ticket_NoAju" placeholder="No. Aju" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        <label for="workexperience-category-input">Kantor</label>
                                        <input type="text" class="form-control" id="Form_Ticket_Kantor" placeholder="Kantor">
                                        <div id="Div_KantorSearching" class="search-results" style="margin-left: 10px; margin-right: 10px; margin-top: -15px; width: 420px;" readonly="readonly"></div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        <label for="workexperience-category-input">Sub Category</label>
                                        <select id="Form_Ticket_SubKategori" class="form-select" readonly="readonly">
                                            <option value="">Select</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        <label for="workexperience-category-input">Nilai Transaksi</label>
                                        <input type="text" class="form-control" id="Form_Ticket_NilaiTransaksi" placeholder="Nilai Transaksi" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                            <div class="row" id="ActionTeamLeader" style="display: none;">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label for="contact-info-phone-input" class="form-label">Action</label>
                                        <select id="Form_Ticket_Action" class="form-select" onchange="Dropdown_ChangeAction('1')">
                                            <option value="">Select</option>
                                            <option value="1">Send To Team Leader</option>
                                            <option value="2">Save & Close</option>
                                            <option value="3">Convert To Case</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row" id="ObjectEmail">
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        <label for="workexperience-category-input">To</label>
                                        <input type="text" class="form-control" id="Form_Ticket_Email_Tujuan" placeholder="To" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        <label for="workexperience-category-input">Subject</label>
                                        <input type="text" class="form-control" id="Form_Ticket_Email_Subject" placeholder="Subject" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        <label for="workexperience-category-input">To</label>
                                        <input type="text" class="form-control" id="Form_Ticket_Email_CC" placeholder="Ccc" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <iframe id="Preview_FrameHTML2" title="description" style="width: 100%;" class="bodyemailread"></iframe>
                                        <div id="Div_Inbox_AttachmentEmail" style="width: 100%; height: 100%; overflow-x: hidden; overflow-y: scroll;"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <textarea id="Ticket_NoteAgent" name="Ticket_NoteAgent" class="form-control" rows="20" placeholder="Jawaban.." readonly="readonly"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="mt-3">
                                        <div id="Div_TicketAttachment" style="width: 100%;"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" id="DivAttachmentTicketEmail" style="display: none;">
                                <div class="col-lg-12">
                                    <input type="file" name="files" class="form-control">
                                </div>
                            </div>
                            <div class="mt-3" style="display:none;">
                                <div class="text-end">
                                    <a class="btn btn-soft-danger w-sm" data-bs-toggle="modal" data-bs-target="#addEmailReject" id="ButtonReject"><i class="far fa-times-circle"></i>&nbsp;Reject</a>
                                    <a class="btn btn-soft-primary w-sm" onclick="Proses_ButtonApprove()" id="ButtonProsessApprove"><i class="fa fa-save"></i>&nbsp;Approve</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card" id="DivBodyEmail">
                    <div class="card-body">
                        <div class="d-flex align-items-start mb-4">
                            <div class="flex-shrink-0 me-3">
                                <img class="rounded-circle avatar-sm" src="assets/images/users/avatar-2.jpg" alt="Generic placeholder image">
                            </div>
                            <div class="flex-grow-1">
                                <h5 class="font-size-14 my-1" id="Profile_NamaCustomer"></h5>
                                <small class="text-muted" id="Profile_EmailCustomer"></small>
                            </div>
                        </div>
                        <iframe id="Preview_FrameHTML1" title="description" style="width: 100%;" class="bodyemailread"></iframe>
                        <div id="Div_Inbox_Attachment" style="width: 100%; height: 100%; overflow-x: hidden; overflow-y: scroll;"></div>
                        <%-- <a href="#" id="ButtonReply" class="btn btn-light mt-4" onclick="Action_Reply()"><i class="mdi mdi-reply"></i>Reply</a>
                        <a href="#" id="ButtonForward" class="btn btn-light mt-4" onclick="Action_Forward()"><i class="mdi mdi-forward"></i>Forward</a>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <script src="js/ckeditor/ckeditor.js"></script>
    <script>
        var Ticket_NoteAgent = CKEDITOR.replace('Ticket_NoteAgent');
        Ticket_NoteAgent.config.height = 500;
        Ticket_NoteAgent.config.toolbar = 'Basic';
        Ticket_NoteAgent.config.toolbar_Basic =
            [
                ['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-']
            ];
    </script>
</asp:Content>
