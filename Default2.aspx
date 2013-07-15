<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="EmployeeStyle.css" rel="stylesheet" />
</head>

<body>
    <div id="main">
    <form id="form1" runat="server">
    <div>
    <h1>Register Vehicle</h1>
        <table>
            <tr>
                <td>Last Name</td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>

                </td>
            </tr>
             <tr>
                <td>First Name</td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>

                </td>
            </tr>
             <tr>
                <td>License Plate</td>
                <td>
                    <asp:TextBox ID="txtLicense" runat="server"></asp:TextBox>

                </td>
            </tr>
             <tr>
                <td>Make</td>
                <td>
                    <asp:TextBox ID="txtMake" runat="server"></asp:TextBox>

                </td>
            </tr>
             <tr>
                <td>Year</td>
                <td>
                    <asp:TextBox ID="txtYear" runat="server"></asp:TextBox>

                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="lblResult" runat="server" Text=""></asp:Label></td>
                <td>
                    
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
        <p>&nbsp;</p>
        <asp:Button ID="btnTodaysService" runat="server" Text="Today's Service" OnClick="btnTodaysService_Click" />
    </div>
    </form>
        </div>
</body>
</html>
