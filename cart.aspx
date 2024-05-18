<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%@ Import Namespace="System.Data" %>
    <%@ Import Namespace="System.Web.UI.WebControls" %>
    <%@ Import Namespace="System.Linq" %>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/owl.theme.default.min.css">


    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


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

    <div class="site-wrap">

        <div class="bg-light py-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mb-0"><a href="Default.aspx">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Cart</strong></div>
                </div>
            </div>
        </div>

        <div class="site-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md-12">
                        <div class="site-blocks-table">
                            <table class="table ">
                                <thead>
                                    <tr>
                                        <th class="product-thumbnail">Image</th>
                                        <th class="product-name">Product</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-total">subtotal</th>
                                        <th class="product-remove">Remove</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <asp:Repeater ID="viewcartlist" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <a href="singleproduct.aspx?id=<%# Eval("pid") %>">
                                                        <span>
                                                            <img
                                                                src="../UPLOADS/<%# Eval("img") %>"
                                                                alt=""
                                                                style="width: 65px;"
                                                                class="product-thumbnail" />
                                                        </span>
                                                    </a>
                                                </td>
                                                <td><%# Eval("pname") %></td>
                                                <td>&#8377;<%# Eval("price") %>.00</td>

                                                <td>
                                                    <a href="<%# Eval("c_id", "cart.aspx?cartmid={0}") %>"><span class="glyphicon glyphicon-minus"></span></a>&nbsp;&nbsp;<%# Eval("quantity") %>&nbsp;&nbsp;<a href="<%# Eval("c_id", "cart.aspx?cartpid={0}") %>"><span class="glyphicon glyphicon-plus"></span></a></td>
                                                <td>
                                                    <%# string.Format("&#8377;{0}.00", Convert.ToDouble(Eval("price")) * Convert.ToInt32(Eval("quantity"))) %>
                                                </td>
                                                <td>
                                                    <a href="<%# Eval("c_id", "cart.aspx?cartid={0}") %>" onclick="return confirm('Are you sure you want to Remove this Product?');">
                                                        <span class="glyphicon glyphicon-trash"></span>
                                                    </a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>

                                    </asp:Repeater>
                                </tbody>
                            </table>


                            <%-- <div class="input-group mb-3" style="max-width: 120px;">
                                            <div class="input-group-prepend">
                                                <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
                                            </div>
                                            <input type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
                                            </div>
                                        </div>--%>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row mb-8">
                                <div class="col-md-5">
                                    <asp:Button runat="server" ID="emtycart" OnClick="emtycart_Click" Text="Empty Cart" CssClass="btn btn-outline-primary btn-sm btn-block" />

                                </div>
                                <div class="col-md-7">
                                    <asp:Button runat="server" ID="contineshop" OnClick="contineshop_Click" href="shop.aspx" Text="Continue Shopping" CssClass="btn btn-outline-primary btn-sm btn-block" />

                                    <%--<button class="btn btn-outline-primary btn-sm btn-block" href="shop.aspx">Continue Shopping</button>--%>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6 pl-5">
                        <div class="row justify-content-end">
                            <div class="col-md-7">
                                <div class="row">
                                    <div class="col-md-12 text-right border-bottom mb-5">
                                        <h3 class="text-black h4 text-uppercase">Cart Total</h3>
                                    </div>
                                </div>
                               
                                <div class="row mb-5">
                                    <div class="col-md-6">
                                        <span class="text-black">Total</span>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <h4>
                                            <asp:Label runat="server" ID="lbltotal" /></h4>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Button runat="server" ID="checkout" OnClick="checkout_Click" CssClass="btn btn-utline-primary btn-lg py-3 btn-block" Text="Proceed To Checkout" />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
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

