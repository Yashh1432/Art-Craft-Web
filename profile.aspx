<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
  <script type="text/javascript">
      function preventBack() { window.history.forward(); }
      setTimeout("preventBack()", 0);
      window.onunload = function () { null };
  </script>
    <style>
        
        .form-control {
            border: none;

           
        }
    </style>
 <script>
     $(document).ready(function () {
         $('#form1').validate({
             rules: {
                 ctl00$ContentPlaceHolder1$txtname: {
                     regex: /^[a-zA-Z\s]+$/

                 },
                 ctl00$ContentPlaceHolder1$txtemail: {
                     email: true

                 },
                 ctl00$ContentPlaceHolder1$txtcontact:
                 {
                     minlength: 10,
                     maxlength: 10

                 },
               
                 
             },

             messages: {
                 ctl00$ContentPlaceHolder1$txtname: {
                     regex: "Please enter only letters"
                 }, 

                 ctl00$ContentPlaceHolder1$txtemail: {
                     email: "Please enter a valid email address"
                 },
                 ctl00$ContentPlaceHolder1$txtcontact:
                 {
                     minlength: "Please Enter valid number !!",
                     maxlength: "Please Enter valid number !!"

                 },

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


 <main>
     <div class="container ">
          <h3 style="font-size: larger; font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif; text-align:center; ">
     <%= Session["profilename"] %>'s Profile

 </h3>
         <br />


         <div class="row">
             <div class="col-sm-6">
                 <%--<h1 class="text-center"><%= Session["profilename"] %>'s Profile</h1>--%>


                 <table class="table">
                     
                     <tr>
                         <td> Name</td>
                         <td>
                             <asp:TextBox runat="server" ID="txtname" CssClass="form-control "></asp:TextBox></td>
                     </tr>
                     <tr>
                         <td>Email </td>
                         <td>
                             <asp:Label runat="server" CssClass="form-control " ID="txtemail"></asp:Label></td>
                     </tr>
                     <tr>
                         <td>Contact No</td>
                         <td>
                             <asp:TextBox runat="server" ID="txtcontact" TextMode="Number" CssClass="form-control "></asp:TextBox></td>
                     </tr>
                     <tr>
                         <td>Gender</td>
                         <td>
                             <asp:RadioButton ID="radiomale" runat="server" Text="Male" GroupName="gender" />&nbsp;&nbsp;
                              <asp:RadioButton ID="radiofemale" runat="server" Text="Female" GroupName="gender" />&nbsp;&nbsp;
                              <asp:RadioButton ID="radioother" runat="server" Text="Other" GroupName="gender" /></td>
                     </tr>
                    
                    
                    
                  
                     <tr>
                         <td><a href="changepassword.aspx" forecolor="White" width="150px" font-size="Medium" backcolor="Black" font-bold="true">Change Password ?</a></td>
                         <td>
                             <asp:Button runat="server" ID="btnupdate" Text="Update Profile" OnClick="btnupdate_Click" ForeColor="White" Width="130px" Font-Size="Medium" BackColor="Black" Font-Bold="True" /></td>
                     </tr>
                 </table>

                 <asp:Label runat="server" ID="lblemail"></asp:Label>
             </div>

             <br />
             <br />

             <div class="col-sm-6">
                 <br />
                 <img src="images/vecteezy_illustration-of-young-woman-back-view-painting-on-canvas_12654944.jpg" alt="CoverImage" width="500" style="background: no-repeat" />
             </div>
         </div>

     </div>
 </main>
</asp:Content>

