<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="changepassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <title>Change Password</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <link rel="stylesheet" href="/fonts/material-icon/css/material-design-iconic-font.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <!-- Main css -->
    <link rel="stylesheet" href="/css/logindemo.css" />


    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/js/main.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#form1').validate({
                rules: {

                    ctl00$ContentPlaceHolder1$txtoldpassword: {
                        required: true,
                        minlength: 6,
                    },
                    ctl00$ContentPlaceHolder1$txtnewpassword: {
                        required: true,
                        minlength: 6,
                    },
                    ctl00$ContentPlaceHolder1$txtrenewpassword: {
                        required: true,
                        minlength: 6,
                        equalTo: "#<%=txtnewpassword.ClientID%>"
                    }
                },
                messages: {

                    ctl00$ContentPlaceHolder1$txtoldpassword: {
                        required: "Please provide New password",
                        minlength: "Your password must be at least 6 characters long"
                    },
                    ctl00$ContentPlaceHolder1$txtnewpassword: {
                        required: "Please Re-enter new password",
                        minlength: "Your password must be at least 6 characters long",
                    },
                    ctl00$ContentPlaceHolder1$txtrenewpassword: {
                        required: "Please Re-enter new password",
                        minlength: "Your password must be at least 6 characters long",
                        equalTo: "Passwords do not match"
                    },
                }
            });
        });
    </script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <br />
    <br />
    <br />
    <div class="container d-flex justify-content-center align-items-center ">
        <div class="col-md-5 rounded-4 d-flex justify-content-center align-items-center flex-column left-box">
            <img src="../images/girl_paint.png" class="img-fluid" style="width: 400px;" />

        </div>
        <div class="col-md-5 right-box">
            <div class="row align-items-center">
                <div class="signin-form p-4">
                    <h3 class="form-title">The ArTiStS</h3>
                    <h4 class="form-title">Welcome!!!!</h4>
                    <h2 class="form-title">Change Password</h2>

                    <%--<div class="input-group mb-3 pb-1 ">
                        <i class="zmdi zmdi-account pr-5 pr" style="font-size: 3rem;"></i>

                        <asp:TextBox runat="server" ID="txtemail" CssClass="form-control form-control-lg bg-light fs-6"></asp:TextBox>

                    </div>--%>
                    <div class=" mb-3 pb-4  pl-4  text-center text-danger fs-5 ">
                        <asp:Label runat="server" ID="lblemail" for="your_name"> </asp:Label>
                    </div>

                    <div class="input-group mb-3 pb-1">
                        <i class="zmdi zmdi-lock pr-5 pr" style="font-size: 3rem;"></i>
                        <asp:TextBox runat="server" ID="txtoldpassword" TextMode="Password" CssClass="form-control form-control-lg bg-light fs-6" placeholder="current Password"></asp:TextBox>

                    </div>
                    <div class=" mb-3 pb-4  pl-4  text-center text-danger fs-5 ">
                        <asp:Label runat="server" ID="lbloldpass" for="old password"> </asp:Label>
                    </div>


                    <div class="input-group mb-3 pb-1">
                        <i class="zmdi zmdi-lock pr-5 pr" style="font-size: 3rem;"></i>
                        <asp:TextBox runat="server" ID="txtnewpassword" TextMode="Password" CssClass="form-control form-control-lg bg-light fs-6" placeholder="new Password"></asp:TextBox>

                    </div>

                    <div class=" mb-3 pb-4  pl-4  text-center text-danger fs-5 ">
                        <asp:Label runat="server" ID="lblnewpass" for="new password"> </asp:Label>
                    </div>

                    <div class="input-group mb-3 pb-1">
                        <i class="zmdi zmdi-lock pr-5 pr" style="font-size: 3rem;"></i>
                        <asp:TextBox runat="server" ID="txtrenewpassword" TextMode="Password" CssClass="form-control form-control-lg bg-light fs-6" placeholder="Re-Enter new Password"></asp:TextBox>

                        <div class=" mb-3 pb-4  pl-4  text-center text-danger fs-5 ">
                            <asp:Label runat="server" ID="lblrenewpass" for="re-enter new password"> </asp:Label>
                        </div>


                        <div class=" mb-3 pb-4  pl-4  text-center text-danger fs-5 ">
                            <asp:Label runat="server" ID="lblpass" for="your_pass"></asp:Label>
                        </div>
                        <br />
                        <br />
                        <br />
                    </div>

                    <div class="row">
                        <big>Already a User? <a href="login.aspx">Login</a></big>
                    </div>
                    <br />
                    

                    <div class="input-group mb-3">

                        <asp:Button runat="server" ID="btnchange" OnClick="btnchange_Click" Text="Change Password" CssClass="btn btn-lg btn-primary w-100 fs-6" Width="90px" Font-Size="Medium" BackColor="Black" Font-Bold="True" />
                    </div>
                    <asp:Label runat="server" ID="Label1" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

