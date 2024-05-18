<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="stock.aspx.cs" Inherits="Admin_stock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script>
        $(document).ready(function () {
            $('#tblstock').DataTable({
                "paging": true,
                "searching": true,
                "ordering": true,
                "info": true
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <div class="w3-container">
        <p style="font-size: larger; font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;">
            Stock Details<span style="float: right;">

                <a href="addstock.aspx" class="w3-button w3-black">Add Stock</a>
            </span>
        </p>
    </div>

    <table class="w3-table w3-striped w3-centered" id="tblstock">
        <thead>
            <tr>
                <th>No</th>
                <th>Image</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="viewstock" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Container.ItemIndex + 1 %></td>
                        <td>
                            <img src="../UPLOADS/<%# Eval("img") %>" alt="Product Image" width="50" /></td>
                        <td><%#Eval("pname") %></td>

                        <td>
                            <%#Eval("quantity") %>

                        </td>
                        <td><a href="<%# Eval("sid", "stock.aspx?sid={0}") %>" onclick="return confirm('Are you sure you want to delete this Category?');">
                            <i class="fa fa-trash"></i></a></td>



                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>

</asp:Content>

