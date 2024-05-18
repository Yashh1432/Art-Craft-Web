<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="addcategory.aspx.cs" Inherits="Admin_addcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Admin panel</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">



    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- jQiery Validation -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js" integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">




     <script>
     $(document).ready(function () {
         $('#form1').validate({
             rules: {
                 ctl00$ContentPlaceHolder1$txtcategoryname: {
                     required: true,
                     regex: /^[a-zA-Z\s]+$/


                 }

             },
             messages: {
                 ctl00$ContentPlaceHolder1$txtcategoryname: {
                     required: "Please Enter Your Category Name"
                     regex: "Please enter only letters"

                 }

             }
         });
     });
         $.validator.addMethod("regex", function (value, element, regexp) {
             return this.optional(element) || regexp.test(value);
         }, "Please check your input.");

     </script>


            <script>
                $(document).ready(function () {
                    $('#tblcategory').DataTable({
                        "paging": true,
                        "searching": true,
                        "ordering": true,
                        "info": true
                    });
                });
            </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <%--category--%>
    <br />
    <br />


    <h1 class="text-center">Category</h1>
    <br />

    <div class="content-wrapper">
        <div class="container-xxl flex-grow-1 container-p-y">
            <div class="content-body">
                <div class="row">
                        <div class="col-xl">
                            <div class="card mb-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h5 class="mb-0">Add Category</h5>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="cname" class="col-form-label">Category Name:</label>
                                        <asp:TextBox ID="txtcategoryname" runat="server" CssClass="form-control" Required="true"></asp:TextBox>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button ID="addcategory" runat="server" Text="Add Category" OnClick="btnaddcategory_Click" CssClass="btn btn-primary" />
                                    </div>
                                    <asp:Label runat="server" ID="lblcategory"></asp:Label>

                                </div>
                            </div>
                        </div>
                    </div>
                        <div class="card">
                            <h5 class="card-header"><strong>category List</strong></h5>
                            <div class="table-responsive text-nowrap p-2">
                                <table class="w3-table w3-striped w3-centered" id="tblcategory">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Category Name</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="viewcategory" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Container.ItemIndex + 1 %></td>
                                                    <td><%#Eval("c_name") %></td>
                                                    <td>
                                                        <a href="#">
                                                            <i class="fa fa-edit"></i></a>&nbsp;
                         <a href="<%# Eval("cid", "addcategory.aspx?catid={0}") %>" onclick="return confirm('Are you sure you want to delete this Category?');">
                             <i class="fa fa-trash"></i></a>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>

                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                            <asp:Label runat="server" ID="lblcerror"></asp:Label>

                        </div>
                    </div>

                </div>
            </div>
       
</asp:Content>

