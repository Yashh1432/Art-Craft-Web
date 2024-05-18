<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="customer.aspx.cs" Inherits="Admin_customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
     $(document).ready(function () {
         $('#tblcustomer').DataTable({
             "paging": true,
             "searching": true,
             "ordering": true,
             "info": true
         });
     });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="w3-container">
      <p style="font-size: larger; font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;">
          Customer Details<span style="float: right;">
              <asp:button runat="server" cssclass="w3-button w3-black" id="btnprint" onclick="btnprint_Click" Text="Report" />
          </span>
      </p>
  </div>
  <br />
  <div id="print" runat="server">

      <table class="w3-table w3-striped w3-centered" id="tblcustomer">
          <thead>
              <tr>
                  <th>No</th>
                  <th> Name</th>
                  <th>Email</th>
                  <th>Contact No</th>
                  <th>Gender</th>
                  <th>Action</th>
              </tr>
          </thead>
          <tbody>
              <asp:Repeater ID="viewcustomer" runat="server">
                  <ItemTemplate>
                      <tr>

                          <td><%# Container.ItemIndex + 1 %></td>
                          <td><%#Eval("name") %></td>
                          <td><%#Eval("email") %></td>
                          <td><%#Eval("contact") %></td>
                          <td><%#Eval("gender") %></td>
                          <td>
                              <a href="<%# Eval("id", "customer.aspx?userid={0}") %>" onclick="return confirm('Are you sure you want to delete this User Profile?');">
                                  <i class="fa fa-trash"></i></a>
                          </td>
                      </tr>
                  </ItemTemplate>

              </asp:Repeater>
          </tbody>
      </table>
  </div>
</asp:Content>

