<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    

 <script type="text/javascript">
     $(document).ready(function () {


        $('#form1').validate({
            rules: {
                ctl00$ContentPlaceHolder1$txtusername: {
                    required: true,
                    email: true

                },
                ctl00$ContentPlaceHolder1$txtpassword: {
                    required: true,
                    minlength: 6
                }
            },
            messages: {
                ctl00$ContentPlaceHolder1$txtusername: {
                    required: "Please Enter Your Email",
                    email: "Please enter a valid email address"
                },
                ctl00$ContentPlaceHolder1$txtpassword: {
                    required: "Please provide a password",
                    minlength: "Your password must be at least 6 characters long"
                }
            }
        });
    });
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <br />
  <main><br />
      <div class="container text-center">
          <h1 class="text-center">The ArTiStS</h1>
          <div class="row">
              <div class="col-sm-6">
                  <br /><br />
                  <h1 class="text-center">Sign in</h1>
                  <asp:Table runat="server" CssClass="table border-light-info">
                      <asp:TableRow runat="server">
                          <asp:TableCell runat="server">Email </asp:TableCell>
                          <asp:TableCell runat="server">
                              <asp:TextBox runat="server" TextMode="Email" CssClass="form-control  " ID="txtusername"></asp:TextBox>
                          </asp:TableCell>
                      </asp:TableRow>
                      <asp:TableRow runat="server">
                          <asp:TableCell runat="server">Password</asp:TableCell>
                          <asp:TableCell runat="server">
                              <asp:TextBox runat="server" TextMode="Password" ID="txtpassword" CssClass="form-control"></asp:TextBox>
                          </asp:TableCell>
                      </asp:TableRow>

                      <asp:TableRow runat="server">
                          <asp:TableCell runat="server"><a href="forgotpass.aspx">Forgot Password?</a></asp:TableCell>
                          <asp:TableCell runat="server">
                              <asp:CheckBox runat="server" ID="chekremember" Text="Remember Me" Font-Size="Medium" />
                          </asp:TableCell>
                      </asp:TableRow>

                      <asp:TableFooterRow runat="server">
                          <asp:TableCell runat="server"><a href="registration.aspx">Don't have account? </a></asp:TableCell>
                          <asp:TableCell runat="server">
                              <asp:Button runat="server" ID="btnlogin" OnClick="btnlogin_Click" Text="Login" CssClass="btn btn-lg btn-primary w-100 fs-6"  Width="90px" Font-Size="Medium" BackColor="Black" Font-Bold="True"/>
                          </asp:TableCell>
                      </asp:TableFooterRow>
                  </asp:Table>


                  <asp:Label runat="server" ID="lblemail" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
              </div>
              <div class="col-sm-6">
                  <br />
                  <img src="../images/girl_paint.png" alt="CoverImage" width="400" style="background: no-repeat" />
              </div>
          </div>
      </div>
  </main>
</asp:Content>

