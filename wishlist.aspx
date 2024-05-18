<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="wishlist.aspx.cs" Inherits="wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>The ArTiStS</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <br />

    <h1 class="text-center ">My Wishlist&nbsp;<span class="glyphicon glyphicon-heart" style="color: red; opacity: 50%;"></span></h1>
    <br />
    <%

        if (Session["useremail"] == null)
        {



    %>
    <p class="text-center">You Are Not Login In To System</p>
    <%
        }
        else
        {
    %>
    <asp:Label runat="server" ID="lblerror" />
    <div class="container">
        <table class="table align-middle mb-0 bg-white">
            <thead class="bg-light">
                <tr>
                    <th>Image</th>
                    <th>Product Name</th>
                    <th>Brand</th>
                    <th>Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                  <asp:Repeater ID="viewwishlist" runat="server">
      <ItemTemplate>
                <tr>
                    <td>
                        <a href="singleproduct.aspx?id=<%# Eval("pid") %>">
                        <span>
                            <img
                                src="../UPLOADS/<%# Eval("img") %>"
                                alt=""
                                style="width: 65px;"
                                class="rounded-circle" /></span></a>
                    </td>
                    <td><%# Eval("pname") %></td>
                    <td><%# Eval("brand") %></td>
                    <td>&#8377;
                       <%# Eval("price") %>
                        .00
                    </td>

                    <td>
                        <a href="<%# Eval("w_id", "wishlist.aspx?wishid={0}") %>" onclick="return confirm('Are you sure you want to Remove this Product?');" >
                            <span class="glyphicon glyphicon-trash"></span>
                        </a>

                    </td>
                </tr>
                    </ItemTemplate>

</asp:Repeater>
            </tbody>
            <tfoot id="footer">
    <tr>
        <td colspan="4"></td>
        <td>
            <asp:Button runat="server" ID="emtylist" OnClick="emtylist_Click" Text="Empty List" CssClass="btn btn-danger" /></td>
    </tr>
</tfoot>
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

