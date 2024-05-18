<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

 <script>
     $(document).ready(function () {
         $('#form1').validate({
             rules: {
                 ctl00$ContentPlaceHolder1$txtname: {
                     required: true,
                     regex: /^[a-zA-Z\s]+$/

                 },
                 ctl00$ContentPlaceHolder1$txtemail: {
                     required: true,
                     email: true

                 },
                 ctl00$ContentPlaceHolder1$txtpassword: {
                     required: true,
                     minlength: 6

                 },
                 ctl00$ContentPlaceHolder1$txtconfpass: {
                     required: true,
                     equalTo: "#<%=txtpassword.ClientID%>"
                 },
                 ctl00$ContentPlaceHolder1$txtcontact:
                 {
                     required: true,
                     minlength: 10,
                     maxlength: 10

                 },
                 ctl00$ContentPlaceHolder1$gender: "required",
                
             },
             messages: {
                 ctl00$ContentPlaceHolder1$txtname: {
                     required: "Please Enter Your First Name ",
                     regex: "Please enter only letters"
                 }, 
                 ctl00$ContentPlaceHolder1$txtemail: {
                     required: "Please Enter Your Email",
                     email: "Please enter a valid email address!!"
                 },
                 ctl00$ContentPlaceHolder1$txtpassword: {
                     required: "Please provide a password",
                     minlength: "Your password must be at least 6 characters long !!"
                 },
                 ctl00$ContentPlaceHolder1$txtconfpass: {
                     required: "Please Re-Enter Password",
                     equalTo: "Passwords do not match"
                 },
                 ctl00$ContentPlaceHolder1$txtcontact:
                 {
                     required: "Please Enter number!",
                     minlength: "Please Enter valid number !!",
                     maxlength: "Please Enter valid number !!"

                 },

                 ctl00$ContentPlaceHolder1$gender: "Please select a Gender",
                
             }
         });
     });
     $.validator.addMethod("regex", function (value, element, regexp) {
         return this.optional(element) || regexp.test(value);
     }, "Please check your input.");
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <br />
   <br />
   <main><br />
       <div class="container text-center">
           <h1 class="text-center">The ArTiStS</h1>
           <div class="row">
               <div class="col-sm-6">
                   <h1 class="text-center">Registration</h1>


                   <asp:Table runat="server" CssClass="table">
                       <asp:TableRow runat="server">
                           <asp:TableCell runat="server"> Name </asp:TableCell>
                           <asp:TableCell runat="server">
                               <asp:TextBox runat="server" ID="txtname" CssClass="form-control"></asp:TextBox>
                           </asp:TableCell>
                       </asp:TableRow>
                       <asp:TableRow runat="server">
                           <asp:TableCell runat="server">Email </asp:TableCell>
                           <asp:TableCell runat="server">
                               <asp:TextBox runat="server" TextMode="Email" CssClass="form-control" ID="txtemail"></asp:TextBox>
                           </asp:TableCell>
                       </asp:TableRow>
                       <asp:TableRow runat="server">
                           <asp:TableCell runat="server">Contact No</asp:TableCell>
                           <asp:TableCell runat="server">
                               <asp:TextBox runat="server" ID="txtcontact" TextMode="Number" CssClass="form-control"></asp:TextBox>
                           </asp:TableCell>
                       </asp:TableRow>
                       <asp:TableRow runat="server">
                           <asp:TableCell runat="server">Gender</asp:TableCell>
                           <asp:TableCell runat="server">

                               <asp:RadioButton ID="radiomale" runat="server" Text="Male" GroupName="gender" />
                               &nbsp;&nbsp;
                       <asp:RadioButton ID="radiofemale" runat="server" Text="Female" GroupName="gender" />
                               &nbsp;&nbsp;
                       <asp:RadioButton ID="radioother" runat="server" Text="Other" GroupName="gender" />
                               <br />

                           </asp:TableCell>
                       </asp:TableRow>
                      
                       <asp:TableRow runat="server">
                           <asp:TableCell runat="server">Password</asp:TableCell>
                           <asp:TableCell runat="server">
                               <asp:TextBox runat="server" TextMode="Password" ID="txtpassword" CssClass="form-control"></asp:TextBox>

                           </asp:TableCell>
                       </asp:TableRow>

                       <asp:TableRow runat="server">
                           <asp:TableCell runat="server">Confirm Password</asp:TableCell>
                           <asp:TableCell runat="server">
                               <asp:TextBox runat="server" ID="txtconfpass" TextMode="Password" CssClass="form-control"></asp:TextBox>
                           </asp:TableCell>
                       </asp:TableRow>

                       <asp:TableRow runat="server">
                           <asp:TableCell runat="server"><a href="login.aspx">Already Register?</a></asp:TableCell>
                           <asp:TableCell runat="server">
                               <asp:Button runat="server" ID="btnregister" OnClick="btnregister_Click" Text="Register" CssClass="btn btn-lg btn-primary w-100 fs-6"  Width="90px" Font-Size="Medium" BackColor="Black" Font-Bold="True" />
                           </asp:TableCell>
                       </asp:TableRow>
                   </asp:Table>

                   <asp:Label runat="server" ID="lblemail" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
               </div>

               <br />
               <br />

               <div class="col-sm-6">
                   <br />
                   <img src="../images/girl_paint.png" alt="CoverImage" width="400" style="background: no-repeat" />
               </div>
           </div>
       </div>
   </main>
  <br /><br />
    


</asp:Content>

