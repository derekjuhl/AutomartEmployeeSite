<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="EmployeeStyle.css" rel="stylesheet" />
</head>
<body>
    <div id="main">
    <form id="form1" runat="server">
        <h1>Today's Service</h1>
    <div>
         <asp:Button ID="btnBegin" runat="server" Text="Begin Service" OnClick="btnBegin_Click" />
        <p>Select the services to be perfomed</p>
        <!--I used the wizard here because I forgot to add the view to the Entities. But it uses the 
            same connection string-->  
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ServiceName" DataValueField="AutoServiceID"></asp:RadioButtonList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AutomartConnectionString %>" SelectCommand="SELECT [ServiceName], [AutoServiceID] FROM [vw_Services]"></asp:SqlDataSource>
        <p>Discount Percent <asp:TextBox ID="txtDiscount" runat="server"></asp:TextBox></p>
        <p>Notes:  <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine"></asp:TextBox></p>
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
        </p>&nbsp;</p>
        <asp:Button ID="btnEnd" runat="server" Text="End Service" OnClick="btnEnd_Click" />

    </div>
    </form>
 </div>
</body>
</html>
