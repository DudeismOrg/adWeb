﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/Department/Employee/Employee.master" AutoEventWireup="true" CodeBehind="CancelUpdatePendingDetails.aspx.cs" Inherits="LogicUniversityStore.View.Department.Employee.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="empMainHeader" runat="server">
    <h1>Requisition Details</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="empMainContentBlock" runat="server">
    
                                    <div class="col-md-12">

                                        <div class="box">

                                            <div class="box-header">

                                                <h3 class="box-title">Requested Items</h3>

                                            </div>

                                            <!-- /.box-header -->

                                            <div class="box-body no-padding">

                                                <asp:GridView ID="gvRequisitionDetails" AutoGenerateColumns="false"  runat="server" CellPadding="10" ForeColor="#333333" GridLines="None" CellSpacing="5" Height="300px" Width="665px" OnRowDeleting="gvRequisitionDetails_RowDeleting">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <EditRowStyle BackColor="#999999" />
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                    <Columns>
                                                       <asp:BoundField DataField="ItemName" HeaderText="Item Name" ReadOnly="true" />                                                 
                                                        <asp:TemplateField HeaderText="Quantity">
                                                        <ItemTemplate >
                                                        <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("NeededQuantity") %>' BorderStyle="Groove">
                                                        </asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Quantity must be entered" Display="Dynamic" Text="*" ControlToValidate="txtQty" ForeColor="Red" ValidationGroup="vg"></asp:RequiredFieldValidator> 
                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Quantity must be a integer" Text="*" Display="Dynamic" ControlToValidate="txtQty" Type="Integer" ForeColor="Red" Operator="DataTypeCheck" ValidationGroup="vg"></asp:CompareValidator> 
                                                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Quantity must be greater than 0" Operator="GreaterThan" ValueToCompare=0 Text="*" Display="Dynamic" ControlToValidate="txtQty" ForeColor="Red"  ValidationGroup="vg"></asp:CompareValidator>                               
                                                        </ItemTemplate>                            
                                                        </asp:TemplateField>                      
                                                       <asp:BoundField DataField="UOM" HeaderText="Unit Of Measure" ReadOnly="true" />                                 
                                                       <asp:CommandField HeaderText="Delete" ButtonType="Button" ShowDeleteButton="true" ControlStyle-CssClass="btn btn-sm btn-danger"  />                                                                                                              
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                            <div>
                                                <b>Remark</b><br />
                                                <asp:TextBox ID="txtRemark" TextMode="MultiLine" CssClass="box-body pad"  runat="server" Height="123px" Width="656px"></asp:TextBox>
                                            </div>

                                            <!-- /.box-body -->

                                        </div>

                                    </div>
                                    
                                    <div class="modal-footer">

                                <%--<button type="button" class="btn btn-success">Approve</button>--%>

                                <%--<button type="button" class="btn btn-danger">Reject</button>--%>

                                <%--<button type="button" class="btn btn-default">Close</button>--%>
                                        <asp:Button ID="btnUpdate" CssClass="btn btn-success" runat="server" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="vg" />
                                        
                                        <asp:Button ID="btnClose" CssClass="btn btn-default" runat="server" Text="Back" OnClick="btnClose_Click"/>
                                       
        
                                        

                            </div>
     <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true" DisplayMode="BulletList" ShowMessageBox="True" ForeColor="Red" ValidationGroup="vg"/> 

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="empMainJs" runat="server">
</asp:Content>
