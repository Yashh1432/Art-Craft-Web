<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="addstock.aspx.cs" Inherits="Admin_addstock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

      <script>
      $(document).ready(function () {
          $('#form1').validate({
              rules: {
                  ctl00$ContentPlaceHolder1$DropDownproduct: {
                      required: true

                  }

              },
              messages: {
                  ctl00$ContentPlaceHolder1$DropDownproduct: {
                      required: "Select Your Product Name"

                  }

              }
          });
      });
      </script>
 <style>
     .container {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    max-width: 1000px;
    margin: 20px auto;
    background-color: #f4f4f4;
    padding: 20px;
    
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.title {
    font-size: 28px;
    margin-bottom: 20px;
    color: #333;
}

.button {
    display: inline-block;
    padding: 8px 16px; /* Reduced padding */
    background-color: mediumpurple;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
    font-size: 14px; /* Reduced font size */
}

.button:hover {
    background-color: purple;
}

.row {
    display: flex;
    justify-content: space-between;
}

.col-4, .col-8, .col-2 {
    flex: 1;
    padding: 0 15px;
}

.heading {
    font-size: 24px;
    margin-bottom: 20px;
    color: #444;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table td {
    padding: 10px;}

.input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.panel {
    border: 1px solid #ccc;
    padding: 20px;
    margin-bottom: 20px;
    background-color: #fff;
}

.button.success {
    background-color: #28a745;
    color: #fff;
    border: none;
    padding: 10px 20px; /* Kept the padding same as before */
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px; /* Increased font size for the success button */
}


.success-message {
    color: #28a745;
    margin-top: 20px;
    font-weight: bold;
}

 </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
    <p class="title">
        Stock Details
        <a href="stock.aspx" class="button">Show Stock</a>
    </p>
    <div class="row">
        <div class="col-4"></div>
        <div class="col-8">
            <h2 class="heading">Add Stock Details Here</h2>
             <table id="tblstock" class="w3-table">

      <tr>
          <td runat="server" class="w3-center">Product Name</td>
          <td>
              <asp:DropDownList runat="server" ID="DropDownproduct" Class="w3-input w3-border">
              </asp:DropDownList>
          </td>
      </tr>
      <tr>
          <td>
          </td>
          </tr>
  </table>
  <table class="w3-center">
      <tr>
         <td>

              <asp:Panel runat="server" ID="panel1" CssClass="">

                  <asp:PlaceHolder runat="server" ID="placeholderTextBoxSets"></asp:PlaceHolder>

              </asp:Panel>
         </td>
      </tr>

  </table>

             
         <table class="w3-table">
             <tr>
                 <td></td>   <td></td>   <td></td>
                 <td> <asp:Button runat="server" ID="btnadd" Text="+ Add More" OnClick="btnadd_Click" CssClass="w3-button w3-black" /></td>
             </tr>
             <tr>
                 <td></td>   <td></td>   <td></td>
                 <td>

             <asp:Button runat="server" ID="btnsave" Text="Save" OnClick="btnsave_Click" CssClass="btn btn-success " />
                 </td>

             </tr>

         </table>
          


<asp:Label runat="server" ID="Label3" CssClass="text-success mt-3"></asp:Label>


        </div>
        <div class="col-2"></div>
    </div>
</div>

</asp:Content>

