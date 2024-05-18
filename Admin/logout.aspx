<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="logout.aspx.cs" Inherits="Admin_logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
             <script type="text/javascript">
                 function preventBack() { window.history.forward(); }
                 setTimeout("preventBack()", 0);
                 window.onunload = function () { null };
             </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

