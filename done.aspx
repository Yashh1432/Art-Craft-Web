<%@ Page Language="C#" Async="true"  AutoEventWireup="true" CodeFile="done.aspx.cs" Inherits="done" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <table>
            <asp:Label runat="server" ID="lblsuccess" />
            <asp:Repeater ID="viewcartlist" runat="server">
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="p_idLabel" Text='<%# Eval("pid") %>' />
                        </td>
                       
                        <td>
                            <asp:Label runat="server" ID="quantityLabel" Text='<%# Eval("quantity") %>' />
                        </td>
                        <td>
                            <%# string.Format("&#8377;{0}.00", Convert.ToDouble(Eval("price")) * Convert.ToInt32(Eval("quantity"))) %>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        </div>
    </form>

    <asp:Label runat="server" ID="lbl1" />
        <asp:Label runat="server" ID="Label2" />
        <asp:Label runat="server" ID="Label3" />
        <asp:Label runat="server" ID="Label4" />
     <asp:Label runat="server" ID="Label1" />
 <asp:Label runat="server" ID="Label5" />
 <asp:Label runat="server" ID="Label6" />

</body>
</html>
