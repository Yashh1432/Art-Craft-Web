<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="forgotpass.aspx.cs" Inherits="forgotpass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


    
       <title>Forgot password</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />

      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

  <!-- Main css -->
  <link rel="stylesheet" href="/css/logindemo.css" />

     <link rel="stylesheet" href="/fonts/material-icon/css/material-design-iconic-font.min.css">



        <script src="/vendor/jquery/jquery.min.js"></script>
<script src="/js/main.js"></script>

 <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
         <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#form1').validate({
                rules: {
                    ctl00$ContentPlaceHolder1$txtemail: {
                        required: true,
                        email: true

                    },
                    ctl00$ContentPlaceHolder1$txtpassword: "required"
                },
                messages: {
                    ctl00$ContentPlaceHolder1$txtemail: {
                        required: "Please Enter Registered Your Email",
                        email: "Please enter a valid email address"
                    },
                    ctl00$ContentPlaceHolder1$txtpassword: {
                        required: "Please provide New a password",
                        minlength: "Your password must be at least 5 characters long"
                    }
                }
            });
        });
       
    </script>



</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br /><br />
       <div class="container d-flex justify-content-center align-items-center ">
     <div class="col-md-5 rounded-4 d-flex justify-content-center align-items-center flex-column left-box">
         <img src="images/woman.png" class="img-fluid" style="width: 400px;" />

     </div>
     <div class="col-md-5 right-box">
         <div class="row align-items-center">
             <div class="signin-form">
             <h3 class="form-title">The ArTiStS</h3>
             <h4 class="form-title">Forgot Password</h4>
             <%--<h2 class="form-title">Sign IN</h2>--%>
                 <br />
             <div class="input-group mb-3 pb-5">
                  <asp:Label runat="server" ID="lblemail" for="your_name"><i class="zmdi zmdi-account pr-5 pr " style="font-size: 3rem;"></i></asp:Label>
               <br />  <asp:TextBox runat="server" ID="txtemail" CssClass="form-control form-control-lg bg-light fs-6" placeholder="Email address"></asp:TextBox>
             </div>
            <%-- <div class="input-group mb-3 pb-5">
                  <asp:Label runat="server"  ID="lblpass" for="your_pass"><i class="zmdi zmdi-lock pr-5 material-icons-name" style="font-size: 3.2rem;"></i></asp:Label><br/>
                 <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control form-control-lg bg-light fs-6" placeholder="Enter New Password"></asp:TextBox>
             </div>--%>
             <div class="input-group mb-5 d-flex justify-content-between">
                 <%--<div class="form-check">
                     <asp:CheckBox runat="server" ID="chekremember" CssClass="form-check-input" />
                     <label for="formCheck" class="form-check-label text-secondary"><small>Remember Me</small></label>
                 </div>--%>
               <%--  <div class="forgot">
                     <small><a href="#">Forgot Password?</a></small>
                 </div>
             </div>--%><br />
                 <br /><br />
             <div class="input-group mb-3">
                 <asp:Button runat="server" ID="btnsendotp"  Text="Send OTP"  OnClick="btnsendotp_Click" CssClass="btn btn-lg btn-primary w-100 fs-6" Width="90px" Font-Size="Medium" BackColor="Black" Font-Bold="True"/>
             </div>
             <div class="input-group mb-3">
                 <%--<asp:Button runat="server" ID="btnGoogleSignIn" Text='<small>Sign In with Google</small>' CssClass="btn btn-lg btn-light w-100 fs-6" OnClick="btnGoogleSignIn_Click" />--%>
             </div>
             <div class="row">
                 <big>Already a User? <a href="login.aspx">Login</a></big>

             </div>
                             <asp:Label runat="server" ID="Label1" Font-Bold="True" ForeColor="#CC0000"></asp:Label>

         </div>
     </div>
         </div>
         </div>
 </div>

    <br /><br /><br />
</asp:Content>

