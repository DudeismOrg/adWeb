﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/Department/Hod/Hod.master" AutoEventWireup="true" CodeBehind="CancelUpdateUnallocatedDetails.aspx.cs" Inherits="LogicUniversityStore.View.Department.Hod.WebForm7" %>

<asp:Content ID="Content4" ContentPlaceHolderID="empMainCss" runat="server">
    <style type="text/css">
        tbody {
            display: table-row-group;
            vertical-align: middle;
            border-color: inherit;
            border-top-color: inherit;
            border-right-color: inherit;
            border-bottom-color: inherit;
            border-left-color: inherit;
        }

        table {
            border-spacing: 0;
            border-collapse: collapse;
        }

        tr {
            display: table-row;
            vertical-align: inherit;
            border-color: inherit;
        }

        .align-center {
            text-align: center;
        }

        .ml-5 {
            margin-left: 5px;
        }

        .mr-5 {
            margin-right: 5px;
        }

        .mrl-5 {
            margin-left: 5px;
            margin-right: 5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="empMainHeader" runat="server">
    <h1>Requisition Details</h1>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="empMainContentBlock" runat="server">
    <div class="row">
        <div class="col-md-12" style="height: 10px"></div>
        <div class="col-md-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Requested Items</h3>
                </div>
                <div class="box-body">
                    <div class="col-md-12">
                        <asp:GridView ID="gvRequisitionDetails" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" Width="100%" AllowPaging="true" OnRowDeleting="gvRequisitionDetails_RowDeleting">
                            <Columns>
                                <asp:BoundField DataField="ItemName" HeaderText="Item Name" ItemStyle-Height="50px" ReadOnly="true" />
                                <asp:TemplateField HeaderText="Quantity" ItemStyle-Height="50px">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" Text='<%# Bind("NeededQuantity") %>'>
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Quantity must be entered" Display="Dynamic" Text="*" ControlToValidate="txtQty" ForeColor="Red" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Quantity must be a integer" Text="*" Display="Dynamic" ControlToValidate="txtQty" Type="Integer" ForeColor="Red" Operator="DataTypeCheck" ValidationGroup="vg"></asp:CompareValidator>
                                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Quantity must be greater than 0" Text="*" Display="Dynamic" ControlToValidate="txtQty" Operator="GreaterThan" ValueToCompare="0" ForeColor="Red" ValidationGroup="vg"></asp:CompareValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="UOM" HeaderText="Unit Of Measure" ItemStyle-Height="50px" ReadOnly="true" />
                                <asp:CommandField ItemStyle-Height="50px" HeaderText="Delete" ButtonType="Button" ShowDeleteButton="true" ControlStyle-CssClass="btn btn-sm btn-danger" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="col-md-12">
                        <label>Remarks</label>
                        <asp:TextBox ID="txtRemark" TextMode="MultiLine" CssClass="box-body form-control pad" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="box-footer">
                    <asp:Button ID="btnClose" CssClass="btn btn-default pull-right mrl-5" runat="server" Text="Back" OnClick="btnClose_Click" />
                    <asp:Button ID="btnReject" CssClass="btn btn-danger pull-right mrl-5" runat="server" Text="Reject" OnClick="btnReject_Click" />
                    <asp:Button ID="btnApprove" CssClass="btn btn-success pull-right mrl-5" runat="server" Text="Approve" OnClick="btnApprove_Click" ValidationGroup="vg" />
                </div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true" DisplayMode="BulletList" ShowMessageBox="True" ForeColor="Red" />
            </div>
        </div>

    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="empMainJs" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("table").addClass("table table-condensed");
        });
    </script>
</asp:Content>
