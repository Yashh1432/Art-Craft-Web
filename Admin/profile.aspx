<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="Admin_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
     $(document).ready(function () {
         $('#form1').validate({
             rules: {
                 ctl00$ContentPlaceHolder1$txtname: {
                     regex: /^[a-zA-Z\s]+$/

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
         <div class="w3-container">
     <h3 style="font-size: larger; font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;">
         <%= Session["profilename"] %>'s Profile

     </h3>

         <div class="w3-row">

              <div class="w3-col s4"></div>
              <div class="w3-col s8">

                                  <asp:Label ID="lblerror" runat="server"></asp:Label>

                <h2 class="w3-center">Update Profile Details Here</h2>
               
                  <table id="tblprofile" class="w3-table">
   
    <tr>
        <td> Name</td>
        <td>
            <asp:TextBox runat="server" ID="txtname" CssClass="w3-input "></asp:TextBox></td>
    </tr>
    <tr>
        <td>Email </td>
        <td>
            <asp:TextBox runat="server" ID="txtemail" CssClass="w3-input"></asp:TextBox>

        </td>
    </tr>
    <tr>
        <td>Contact No</td>
        <td>
            <asp:TextBox runat="server" ID="txtcontact" TextMode="Number" CssClass="w3-input "></asp:TextBox></td>
    </tr>
    <tr>
        <td>Gender</td>
        <td class="w3-center">
            <asp:RadioButton ID="radiomale" runat="server" Text="Male" GroupName="gender" />&nbsp;&nbsp;
             <asp:RadioButton ID="radiofemale" runat="server" Text="Female" GroupName="gender" />&nbsp;&nbsp;
             <asp:RadioButton ID="radioother" runat="server" Text="Other" GroupName="gender" /></td>
    </tr>
   
    
    
 
    <tr>
        <td><a href="changepassword.aspx" forecolor="White" width="150px" font-size="Medium" backcolor="Black" font-bold="true">Change Password ?</a></td>
        <td>
            <asp:Button runat="server" ID="btnupdate" Text="Update Profile" OnClick="btnupdate_Click"  ForeColor="White" Width="150px" Font-Size="Medium" BackColor="Black" Font-Bold="True" /></td>
    </tr>
</table>
              </div>

         </div>
 </div>
</asp:Content>

