<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="addproduct.aspx.cs" Inherits="Admin_addproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>Admin panel</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
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
             $('#tblproduct').DataTable({
                 "paging": true,
                 "searching": true,
                 "ordering": true,
                 "info": true
             });
         });
     </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

   
       
       <script>
        $(document).ready(function () {

            $('#form1').validate({
                rules: {
                    ctl00$ContentPlaceHolder1$txtproductname: {
                        required: true

                    },
                   
                    ctl00$ContentPlaceHolder1$txtdescription: {
                        required: true
                    },
                    ctl00$ContentPlaceHolder1$txtprice: {
                        required: true

                    },
                    ctl00$ContentPlaceHolder1$Dropdowncategory: {
                        required: true
                    },
                    ctl00$ContentPlaceHolder1$Dropdownsubcategory: {
                        required: true
                    },
                    ctl00$ContentPlaceHolder1$Dropdownbrand: {
                        required: true
                    },
                    ctl00$ContentPlaceHolder1$pimage: {
                        required: true,
                        extension: "png|jpg|jpeg|gif",
                        filesize: 1048576
                    }

                },
                messages: {
                    ctl00$ContentPlaceHolder1$txtproductname: {
                        required: "Please Enter Your Product Name"

                    },
                    ctl00$ContentPlaceHolder1$txtmodel: {
                        required: "Please Enter Your Product Model"
                    },
                    ctl00$ContentPlaceHolder1$txtdescription: {
                        required: "Please Enter Your Product Description"
                    },
                    ctl00$ContentPlaceHolder1$txtprice: {
                        required: "Please Enter Your Product Price"
                    },

                    ctl00$ContentPlaceHolder1$Dropdowncategory: {
                        required: "Please Select Your Product Category"
                    },
                    ctl00$ContentPlaceHolder1$Dropdownsubcategory: {
                        required: "Please Select Your Product Sub-Category"
                    },
                    ctl00$ContentPlaceHolder1$Dropdownbrand: {
                        required: "Please Select Your Product Brand"
                    },
                    ctl00$ContentPlaceHolder1$pimage: {
                        required: "Please select a file to upload",
                        extension: "Please upload a file with a valid extension (png, jpg, jpeg, or gif)",
                        filesize: "Please upload a file with a maximum size of 1MB"
                    }

                }
            });
        });
         
       </script>



    <br>
    <br>
    <h1 class="text-center">Product</h1>
    <div class="content-wrapper">
        <div class="container-xxl flex-grow-1 container-p-y">
            <div class="content-body">

                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Add Product</h5>
                        <!-- <small class="text-muted float-end">Merged input group</small> -->
                    </div>
                    <div class="card-body">
                        <div class="form-row">
                            <div class="col-md-8 mb-3">

                                <label for="cat" cssclass=" form-control">Category:</label>
                                <br />
                                <asp:DropDownList runat="server" AutoPostBack="true" CssClass="w3-input w3-border form-control" ID="Dropdowncategory" OnSelectedIndexChanged="Dropdownsubcategory_SelectedIndexChanged"></asp:DropDownList>
                            </div>

                            <br />
                            <div class="col-md-8 mb-3">
                                <label for="subcat" cssclass=" form-control">Sub Category:</label>
                                <br />
                                <asp:DropDownList runat="server" CssClass="w3-input w3-border form-control" ID="Dropdownsubcategory" AutoPostBack="true"></asp:DropDownList>
                            </div>

                            <div class="col-md-8 mb-3">
                                <label for="brand" cssclass=" form-control">Brand:</label>
                                <br />
                                <asp:DropDownList runat="server" CssClass="w3-input w3-border form-control" ID="Dropdownbrand"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-8 mb-3">
                            <label for="pname" class="col-form-label">product Name:</label>
                            <asp:TextBox runat="server" ID="txtproductname" CssClass="w3-input w3-border form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-8 mb-3">
                            <label for="productdescription">product description:</label>
                            <asp:TextBox runat="server" ID="txtdescription" CssClass="w3-input w3-border form-control" Rows="3" TextMode="MultiLine"></asp:TextBox>

                        </div>

                        <div class="col-md-8 mb-3">
                            <label for="price" class="col-form-label">product price:</label>
                            <asp:TextBox runat="server" TextMode="Number" ID="txtprice" CssClass="w3-input w3-border form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-8 mb-3">
                            <label for="size" class="col-form-label">product size:</label>
                            <asp:TextBox runat="server" ID="txtsize" CssClass="w3-input w3-border form-control"></asp:TextBox>
                        </div>


                        <div class="col-md-8 mb-5">
                            <label for="pimage" class="col-form-label">Image-1 Upload Here:</label>
                            <asp:FileUpload runat="server" ID="pimage" CssClass="w3-input w3-border" />
                        </div>

                        <div class="modal-footer">
                            <asp:Button ID="btnaddproduct" OnClick="btnaddproduct_Click" runat="server" Text="Add Product" CssClass="btn btn-primary" />
                            <%--OnClick="addproduct_Click"--%>
                        </div>
                        <asp:Label ID="lblerror" runat="server"></asp:Label>

                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <h5 class="card-header "><strong>Product List</strong></h5>
            <div class="table-responsive text-nowrap p-2">

                <table class="w3-table w3-striped w3-centered" id="tblproduct">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Image</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>size</th>
                            <th>Brand</th>
                            <th>Subcategory</th>
                            <th>Category</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="viewproduct" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Container.ItemIndex + 1 %></td>
                                    <td>
                                        <img src="../UPLOADS/<%# Eval("img") %>" alt="Product Image" width="50" /></td>
                                    <td><%#Eval("pname") %></td>
                                    <td><%#Eval("price") %></td>
                                    <td><%#Eval("size") %></td>
                                    <td><%#Eval("brand") %></td>
                                    <td><%#Eval("sc_name") %></td>
                                    <td><%#Eval("c_name") %></td>
                                    <td>
                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>' />
                                        <a href='<%# Eval("pid", "addproduct.aspx?statusid={0}") %>' onclick="return confirm('Are you sure you want to update the status?');">
                                            <i class="fa fa-toggle-on" style="color: green"></i>
                                        </a>
                                    </td>

                                    <td>

                                        <a href="<%# Eval("pid", "updateproduct.aspx?catid={0}") %>">
                                            <i class="fa fa-edit"></i></a>&nbsp;
                            <a href="<%# Eval("pid", "addproduct.aspx?deleteid={0}") %>" onclick="return confirm('Are you sure you want to delete this product?');">
                                <i class="fa fa-trash"></i></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>

            </div>



        </div>


    </div>



    <!-- Bootstrap JS and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</asp:Content>

