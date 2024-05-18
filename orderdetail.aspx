<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="orderdetail.aspx.cs" Inherits="orderdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
    .page-title {
        font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        text-align: center;
    }
    .not-logged-in-message {
        text-align: center;
    }
    .container {
        margin-top: 20px;
    }
    .order-details-table {
        width: 100%;
        border-collapse: collapse;
        background-color: #fff;
    }
    .order-details-table th, .order-details-table td {
        border: 1px solid #ccc;
        padding: 8px;
        text-align: left;
    }
    .order-details-table th {
        background-color: #f2f2f2;
    }
    .product-image {
        width: 65px;
        border-radius: 50%;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br /><br /><br />

<h1 class="page-title">My Orders Details</h1>

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
        <div class="container">
            <table class="order-details-table">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Product Name</th>
                        <th>Brand</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="vieworderproductlist" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <a href="product_details.aspx?id=<%# Eval("p_id") %>">
                                        <img src="../UPLOADS/<%# Eval("img") %>" alt="" class="product-image" />
                                    </a>
                                </td>
                                <td><%# Eval("pname") %></td>
                                <td><%# Eval("brand") %></td>
                                
                                <td>&#8377;<%# Eval("price") %>.00</td>
                                <td><%# Eval("quantity") %></td>
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

