<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="Admin_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $('#tblorder').DataTable({
                "paging": true,
                "searching": true,
                "ordering": true,
                "info": true
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p style="font-size: larger; font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;">
        Order Details 
    </p>
    <table class="w3-table w3-striped w3-centered" id="tblorder">
        <thead>
            <tr>
                <th>No</th>
                <th>Order No</th>
                <th>Full Name</th>
                <th>Amount</th>
                <th>Payment Type</th>
                <th>Patment Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="vieworder" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Container.ItemIndex + 1 %></td>
                        <td><%#Eval("order_id") %></td>
                        <td>
                            <%# Eval("fname") %></td>
                        <td><%#Eval("amount") %></td>

                        <td><%#Eval("pay_type") %></td>
                        <td><%#Eval("order_status") %></td>
                       <%-- <td><i class="fa fa-trash"></i></td>--%>
                        <td><a href="order.aspx?order_id=<%# Eval("order_id") %>"><i class="fa fa-trash"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="bill.aspx?order_id=<%# Eval("order_id") %>"><i class="fa fa-eye"></i></a></td>

                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>

</asp:Content>

