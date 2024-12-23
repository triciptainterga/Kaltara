﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Apps/Uidesk.Master" CodeBehind="Tele_TrxHistory.aspx.vb" Inherits="UIDESK.Tele_TrxHistory" %>


<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-2">
                    <label>Start Date</label>
                    <dx:ASPxDateEdit ID="dt_strdate" runat="server" CssClass="form-control input-sm" Width="100%" EditFormatString="yyyy-MM-dd">
                        <ValidationSettings ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText" ValidationGroup="SMLvalidationGroup">
                            <RequiredField IsRequired="true" ErrorText="Must be filled" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </div>
                <div class="col-md-2">
                    <label>End Date</label>
                    <dx:ASPxDateEdit ID="dt_endate" runat="server" CssClass="form-control input-sm" Width="100%" EditFormatString="yyyy-MM-dd">
                        <ValidationSettings ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText" ValidationGroup="SMLvalidationGroup">
                            <RequiredField IsRequired="true" ErrorText="Must be filled" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </div>            
                <div class="col-md-2" style="margin-top: 5px;">
                    <br />
                    <dx:ASPxButton ID="btn_Submit" runat="server" Theme="Metropolis" AutoPostBack="False" Text="Submit" ValidationGroup="SMLvalidationGroup"
                        Height="36px" Width="100%">
                    </dx:ASPxButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                   <dx:ASPxGridView ID="ASPxGridView1" ClientInstanceName="ASPxGridView" runat="server" Width="100%" Styles-Header-HorizontalAlign="Center"
                            Theme="MetropolisBlue" DataSourceID="XtraHistoryTransaksi" Styles-Header-Font-Bold="true" Font-Size="X-Small">
                            <SettingsPager>
                                <AllButton Text="All">
                                </AllButton>
                                <NextPageButton Text="Next &gt;">
                                </NextPageButton>
                                <PrevPageButton Text="&lt; Prev">
                                </PrevPageButton>
                                <PageSizeItemSettings Visible="true" Items="10, 15, 20" ShowAllItem="true" />
                            </SettingsPager>
                            <Settings ShowFilterRow="true" ShowFilterRowMenu="false" ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowHorizontalScrollBar="true" />
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="No" FieldName="NoUrut" Width="40px" CellStyle-HorizontalAlign="Center"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Name" FieldName="Name" Width="200px"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Gender" FieldName="Gender" Width="200px"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Birth Date" FieldName="BirthDate" Width="200px"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Email" FieldName="Email" Width="200px"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Telepon" FieldName="Telepon" Width="200px"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Job Tittle" FieldName="JobTitle" Width="200px" CellStyle-HorizontalAlign="Left"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Address" FieldName="Address" Width="300px" CellStyle-HorizontalAlign="Left"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Upload ID" FieldName="UploadID" Width="200px" CellStyle-HorizontalAlign="Left"></dx:GridViewDataTextColumn>
                                <%--<dx:GridViewDataTextColumn Caption="Status" FieldName="Status" Width="200px" CellStyle-HorizontalAlign="Left"></dx:GridViewDataTextColumn>--%>
                                <dx:GridViewDataHyperLinkColumn VisibleIndex="1" Settings-FilterMode="DisplayText" Caption="ID" CellStyle-HorizontalAlign="Center"
                                    ShowInCustomizationForm="True" FieldName="ID" Width="40px">
                                    <DataItemTemplate>
                                       <dx:ASPxHyperLink ForeColor="#333333" Font-Underline="true" Font-Size="10px" ID="ASPxHyperLinkTest" Target="_blank" runat="server" Text='<%#Eval("ID") %>'
                                            NavigateUrl='<%#String.Format("Tele_TrxTransaksi.aspx?id={0}&name={1}&ph={2}&email={3}&script={4}", Eval("ID"), Eval("Name"), Eval("Telepon"), Eval("Email"), Eval("ProdukID"))%>'>
                                        </dx:ASPxHyperLink>
                                    </DataItemTemplate>
                                </dx:GridViewDataHyperLinkColumn>
                            </Columns>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="XtraHistoryTransaksi" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" runat="server"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>