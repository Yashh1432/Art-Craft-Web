<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <style>
        .page-title {
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
            text-align: center;
        }
        .not-logged-in-message {
            text-align: center;
        }
        .table-container {
            margin-top: 20px;
        }
        .table-styled {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
        }
        .table-styled th, .table-styled td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        .table-styled th {
            background-color: #f2f2f2;
        }
        .order-link {
            color: #333;
            text-decoration: none;
        }
        .order-link:hover {
            text-decoration: underline;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <br /><br /><br />

    <h1 class="page-title">My Orders</h1>

    <br />

    <%
        if (Session["useremail"] == null)
        {
    %>
            <p class="not-logged-in-message">You Are Not Logged In To System</p>
    <%
        }
        else
        {
    %>
            <asp:Label runat="server" ID="lblerror" />
            <div class="container table-container">
                <table class="table-styled">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Customer Name</th>
                            <th>Contact No</th>
                            <th>Amount</th>
                            <th>Payment Type</th>
                            <th>More Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="vieworderlist" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Container.ItemIndex + 1 %></td>
                                    <td><%# Eval("fname") %></td>
                                    <td><%# Eval("contact") %></td>
                                    <td>&#8377;<%# Eval("amount") %>.00</td>
                                    <td><%# Eval("pay_type") %></td>
                                    <td><a href="orderdetail.aspx?order_id=<%# Eval("order_id") %>" class="order-link"><span class="glyphicon glyphicon-eye-open"></span></a></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
    <%
        }
    %>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <script>
        function showToast(message) {
            toastr.success(message);
        }
        function showToastdanget(message) {
            toastr.error(message);
        }
    </script>
</asp:Content>

