<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="shop.aspx.cs" Inherits="shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>The ArTiStS</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700" />
    <link rel="stylesheet" href="fonts/icomoon/style.css" />

    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/magnific-popup.css" />
    <link rel="stylesheet" href="css/jquery-ui.css" />
    <link rel="stylesheet" href="css/owl.carousel.min.css" />
    <link rel="stylesheet" href="css/owl.theme.default.min.css" />

    <link rel="stylesheet" href="css/aos.css" />

    <link rel="stylesheet" href="css/style.css" />

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/aos.js"></script>

    <script src="js/main.js"></script>

</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="site-wrap">

        <div class="site-section">
            <div class="container">

                <div class="row mb-8">
                    <div class="col-md-12 order-2">


                        <div class="row mb-5">

                                                         <asp:Repeater ID="ProductRepeater" runat="server">
                                <ItemTemplate>
          <div class="col-sm-6 col-lg-4 mb-4">
    <div class="block-4 text-center border">
        <figure class="block-4-image">
            <a href="singleproduct.aspx?id=<%# Eval("pid") %>">
                <img src="../UPLOADS/<%# Eval("img") %>" alt="Image placeholder"  class=" card-img-top" height="300"></a>
        </figure>
        <div class="text-md" style="font-size: 1.5rem;">
            <h3><a href="singleproduct.aspx?id=<%# Eval("pid") %>"><%# Eval("pname") %></a></h3>
            <h2 class="text-md"><%# Eval("description") %></h2>
            <p class="text-primary font-weight-bold"><i class="fas fa-rupee-sign"></i>&nbsp;<%# string.Format("{0:0.00}", Eval("price")) %>/-</p>
        </div>
    </div>
</div>
    </ItemTemplate>
</asp:Repeater>
                           
                        </div>

                       
                    </div>
                </div>
            </div>


        </div>
    </div>


</asp:Content>

