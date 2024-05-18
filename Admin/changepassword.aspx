<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="Admin_changepassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
 $(document).ready(function () {
     $('#form1').validate({
         rules: {
             ctl00$ContentPlaceHolder1$txtoldpassword: {
                 required: true,
                 minlength:6
             },
             ctl00$ContentPlaceHolder1$txtnewpassword: {
                 required: true,
                 minlength: 6
             }
         },
         messages: {
             ctl00$ContentPlaceHolder1$txtoldpassword: {
                 required: "Please provide Current password",
                 minlength: "Your password must be at least 6 characters long"
                
             },
             ctl00$ContentPlaceHolder1$txtnewpassword: {
                 required: "Please provide New a password",
                 minlength: "Your password must be at least 6 characters long"
             }
         }
     });
 });

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

                          <h1 class="text-center">Change Password</h1>
<asp:Table runat="server" CssClass="w3-table">
    <asp:TableRow runat="server">
        <asp:TableCell runat="server">Email </asp:TableCell>
        <asp:TableCell runat="server"><%= Session["useremail"] %></asp:TableCell>
    </asp:TableRow>
    <asp:TableRow runat="server">
        <asp:TableCell runat="server">Current Password </asp:TableCell>
        <asp:TableCell runat="server">
            <asp:TextBox runat="server" TextMode="Password" CssClass="w3-input w3-border" ID="txtoldpassword"></asp:TextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow runat="server">
        <asp:TableCell runat="server">New Password </asp:TableCell>
        <asp:TableCell runat="server">
            <asp:TextBox runat="server" TextMode="Password" CssClass="w3-input w3-border" ID="txtnewpassword"></asp:TextBox>
        </asp:TableCell>
    </asp:TableRow>
               

    <asp:TableFooterRow runat="server">
        <asp:TableCell runat="server"></asp:TableCell>
        <asp:TableCell runat="server">
            <asp:Button runat="server" ID="btnchange" OnClick="btnchange_Click" Text="Change Password" ForeColor="White" Width="175px" Font-Size="Medium" BackColor="Black" Font-Bold="True" />
        </asp:TableCell>
    </asp:TableFooterRow>
</asp:Table>

<asp:Label runat="server" ID="lblpass" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
<asp:Label runat="server" ID="lblnew" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
<asp:Label runat="server" ID="Label1" Font-Bold="True" ForeColor="#CC0000"></asp:Label>



                  </div>
               </div>

     </div>

</asp:Content>

