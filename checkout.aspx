<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>


    <style>
        /* General styling */
        body {
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
            background-color: #f4f4f4;
        }

        h1, h3 {
            color: mediumpurple;
            font-weight: bold;
        }

        /* Form styling */
        .form-control {
            border-radius: 0;
        }

        label {
            font-weight: bold;
        }

        #ContentPlaceHolder1_rdbCOD, #ContentPlaceHolder1_rdbNet {
            margin-left: 20px;
        }

        .btn-success {
            background-color: mediumpurple;
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            color: white;
            cursor: pointer;
        }

            .btn-success:hover {
                background-color: purple;
            }

        ul {
            list-style-type: none;
            padding-left: 0;
        }

        li {
            margin-bottom: 10px;
        }

        input[type="radio"] {
            margin-right: 10px;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {


            $('#form1').validate({
                rules: {
                    ctl00$ContentPlaceHolder1$txtfname: {
                        required: true,
                        regex: /^[a-zA-Z\s]+$/

                    },
                    ctl00$ContentPlaceHolder1$txtlname: {
                        required: true,
                        regex: /^[a-zA-Z\s]+$/


                    },
                    ctl00$ContentPlaceHolder1$txtemail: {
                        required: true,
                        email: true

                    },
                    ctl00$ContentPlaceHolder1$txtcontact: {
                        required: true,
                        minlength: 10,
                        maxlength: 10

                    },
                    ctl00$ContentPlaceHolder1$payment: {
                        required: true
                    },
                    ctl00$ContentPlaceHolder1$txtaddress: {
                        required: true,
                        minlength: 5
                    }
                },
                messages: {
                    ctl00$ContentPlaceHolder1$txtfname: {
                        required: "Please Enter Your First Name",
                        regex: "Please enter only letters"


                    },
                    ctl00$ContentPlaceHolder1$txtlname: {
                        required: "Please Enter Your Last Name",
                        regex: "Please enter only letters"


                    },
                    ctl00$ContentPlaceHolder1$txtemail: {
                        required: "Please Enter Your Email",
                        email: "Please enter a valid email address"
                    },
                    ctl00$ContentPlaceHolder1$txtcontact: {
                        required: "Please Enter Your Contact Number",
                        minlength: "Your Contact must be 10 Digits ",
                        maxlength: "Please Enter valid number !!"


                    },
                    ctl00$ContentPlaceHolder1$payment: "Please select a Payment Method",
                    ctl00$ContentPlaceHolder1$txtaddress: {
                        required: "Please Provide a Delivery Address",
                        minlength: "Your Address Should be Full Details!!"
                    }
                }
            });
        });
        $.validator.addMethod("regex", function (value, element, regexp) {
            return this.optional(element) || regexp.test(value);
        }, "Please check your input.");
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <h1 class="text-center text-md"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;<span style="color: green;">Check</span>out</h1>
    <br />
    <div class="container">
        <div class="row" style="background-color: whitesmoke;">
            <div class="col-sm-6">
                <h3 class="text-left text-md">Billing Details</h3>
                <br />
                <div class="row">


                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="fname">Full Name</label>
                            <asp:TextBox runat="server" ID="txtfname" CssClass="form-control" placeholder="Your First Name"  Enabled="false"/>
                        </div>
                    </div>
                   
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="text">E-mail Address</label>
                            <asp:TextBox runat="server" ID="txtemail" TextMode="Email" CssClass="form-control" placeholder="Payer Email"  Enabled="false"/>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="Phone">Contact Number</label>
                            <asp:TextBox runat="server" ID="txtcontact" TextMode="Phone" CssClass="form-control" placeholder="Enter Contact Number"  Enabled="false"/>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label for="message">Address :</label>
                            <asp:TextBox runat="server" ID="txtaddress" CssClass="form-control" TextMode="MultiLine" placeholder="Enter Your Full Delivery Address"></asp:TextBox>
                        </div>
                    </div>

                </div>

            </div>

            <div class="col-sm-6">
                <h3 class="text-center">Order Details</h3>
                <br />

                <div class="row">

                    <div class="col-md-12 text-center">
                        <ul>

                            <asp:Repeater runat="server" ID="viewcartlist">
                                <ItemTemplate>
                                    <li style="color: black;">
                                        <span>
                                            <img
                                                src="../UPLOADS/<%# Eval("img") %>"
                                                alt=""
                                                style="width: 85px;"
                                                class="product-thumbnail" />
                                        </span>
                                        <span><%# Eval("pname") %></span>&nbsp;&nbsp;&nbsp;<span><%# Eval("price") %></span>&nbsp;*
                                        <span style="text-align: center"><%# Eval("quantity") %></span>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                                        <span style="text-align: center"><%# string.Format("&#8377;{0}.00", Convert.ToDouble(Eval("price")) * Convert.ToInt32(Eval("quantity"))) %></span>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                            <br />
                            <li style="color: black; font-size: medium">
                                <span>Total Amount</span> <span>
                                    <asp:Label runat="server" ID="lbltotal" /></span>
                            </li>

                        </ul>
                    </div>

                    <div class="col-md-12 text-center">
                        <div class="form-group text-center">
                            <label for="message">Payment Method :</label><br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RadioButton runat="server" ID="rdbCOD" Text="Cash On Delivery" GroupName="payment" /><br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            <asp:RadioButton runat="server" ID="rdbNet" Text="Net Banking" GroupName="payment" />
                        </div>
                    </div>
                    <div class="col-md-12 text-center">
                        <div class="form-group">
                            <asp:Button runat="server" ID="btncheckout" OnClick="btncheckout_Click" CssClass="btn btn-success" Text="Place Order" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script type="text/javascript">
        function allowOnlyNumbers(evt) {
            // Get the key code of the pressed key
            var charCode = (evt.which) ? evt.which : evt.keyCode;

            // Ensure only numbers (0-9) are allowed
            if (charCode >= 48 && charCode <= 57) {
                // Check if the length of the text exceeds 10 characters
                if (evt.target.value.length < 10) {
                    return true; // Allow the input
                } else {
                    // Prevent further input if the maximum length is reached
                    evt.preventDefault();
                    return false;
                }
            } else {
                // Prevent input of characters other than numbers
                evt.preventDefault();
                return false;
            }
        }
    </script>

    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script>
        function OpenPaymentWindow(key, amountInSubunits, currency, name, descritpion, imageLogo, orderId, profileName, profileEmail, profileMobile, notes) {
            notes = $.parseJSON(notes);
            var options = {
                "key": key, // Enter the Key ID generated from the Dashboard
                "amount": amountInSubunits, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
                "currency": currency,
                "name": name,
                "description": descritpion,
                "image": imageLogo,
                "order_id": orderId, //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
                "handler": function (response) {
                    window.location.href = "done.aspx?orderId=" + response.razorpay_order_id + "&paymentId=" + response.razorpay_payment_id;
                    //alert(response.razorpay_payment_id);
                    //alert(response.razorpay_order_id);
                    //alert(response.razorpay_signature)
                },
                "prefill": {
                    "name": profileName,
                    "email": profileEmail,
                    "contact": profileMobile
                },
                "notes": notes,
                "theme": {
                    "color": "#CD853F"
                }
            };
            var rzp1 = new Razorpay(options);
            rzp1.open();
            rzp1.on('payment.failed', function (response) {
                console.log(response.error);
                alert("Oops, something went wrong and payment failed. Please try again later");
            });
        }

    </script>
</asp:Content>

