<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="bill.aspx.cs" Inherits="bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div runat="server" id="DivToPrint">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="row">
                        <div class="col-6">
                            <h2 class="text-uppercase text-center">Invoice</h2>
                        </div>
                        <div class="col-6">
                            <h4 class="text-left">ART AND CRAFT SHOP MANAGEMENT SYSTEM</h4>
                        </div>
                        <div class="col-12">
                            <h4>From</h4>
                            <address>
                                <strong>ThE ArTiStS SHOP</strong><br>
                                art and craft Shop ,<br>
                                203 b wing Digital Vally,<br>
                                Mota varacha, Surat, Gujrat,<br>
                                Phone: (949) 494-7695<br>
                                Email: artandcraft@gmail.com
                       
                            </address>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-6 col-md-8">
                            <h4>Bill To</h4>
                            <address>
                                <strong>
                                    <asp:Label runat="server" ID="lblcustomername" /></strong><br>
                                <asp:Label runat="server" ID="lbladdress" /><br>
                                India<br>
                                +91
                           
                                <asp:Label runat="server" ID="lblcontact" /><br>
                                <asp:Label runat="server" ID="lblemail" />
                            </address>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4">
                            <h4 class="row">
                                <span class="col-6">Invoice :</span>
                                <span class="col-6 text-sm-end">
                                    <asp:Label runat="server" ID="lblorder_id" /></span>
                            </h4>
                            <h4 class="row">
                                <span class="col-6">Date :</span>
                                <span class="col-6 text-sm-end">
                                    <asp:Label runat="server" ID="lbldate" /></span>
                            </h4>

                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-12">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="text-uppercase">No</th>
                                            <th scope="col" class="text-uppercase">Product</th>
                                            <th scope="col" class="text-uppercase text-end">Brand</th>
                                            <th scope="col" class="text-uppercase text-end">Price</th>
                                            <th scope="col" class="text-uppercase">Qty</th>
                                            <th scope="col" class="text-uppercase text-end">Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <asp:Repeater runat="server" ID="view_order_details">
                                            <ItemTemplate>


                                                <tr>
                                                    <th><%# Container.ItemIndex + 1 %></th>
                                                    <td><%# Eval("pname") %></td>

                                                    <td><%# Eval("brand") %></td>
                                                    <td class="text-end"><%# Eval("Price") %></td>
                                                    <td class="text-end"><%# Eval("quantity") %></td>
                                                    <td><%# string.Format("&#8377;{0}.00", Convert.ToDouble(Eval("price")) * Convert.ToInt32(Eval("quantity"))) %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <tr>
                                            <td colspan="5" class="text-end">Subtotal</td>  
                                            <td class="text-end">
                                                <asp:Label runat="server" ID="lblamount" /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="5" class="text-end">VAT (5%)</td>
                                            <td class="text-end">00.00%</td>
                                        </tr>
                                        <tr>
                                            <td colspan="5" class="text-end">Shipping</td>
                                            <td class="text-end">00.00</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" colspan="5" class="text-uppercase">Total</th>
                                            <td class="text-end">
                                                <asp:Label runat="server" ID="lblamount1" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <h3 class="text-center">&#128512; THANK YOU FOR VISITING US &#128512;</h3>
                </div>
            </div>
        </div>

    </div>
    <div class="text-center"><asp:Button runat="server" ID="btnprint" Text="Download Invoice" OnClick="btnprint_Click" /></div>
</asp:Content>

