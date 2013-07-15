<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" ViewStateMode="Disabled" %>

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
        <h1>Vehicle Info</h1>
        <asp:Label ID="Label1" runat="server" Text="Enter License Plate"></asp:Label>&nbsp;<asp:TextBox ID="txtLicense" runat="server"></asp:TextBox><br/>
        <asp:Button ID="btnGetVehicle" runat="server" Text="Get Vehicle Info" OnClick="btnGetVehicle_Click" /><br /><br />
        <asp:Label ID="lblResult" runat="server" Text=""></asp:Label><br />
        <asp:Button ID="btnRegisterVehicl" runat="server" Text="Register"  OnClick="btnRegisterVehicl_Click"/>
       
        <hr />
        <h2>Vehicle and Owner</h2>

        <!--these datalist controls have some applied formatting. That will be rendered as in-line styles
            when the program is running. The important thing to note is the Item Template section.
            When you are connecting a data source in code you have to manually set this up.
            You determine how you want it display. The Eval sections parse the fields out of
            the data source-->

        <asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333" >
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#EFF3FB" />
            <ItemTemplate>
                <p><strong><%#Eval("LastName") %>, <%#Eval("FirstName") %></strong></p>
                <p><%#Eval("LicenseNumber") %>,  <%#Eval("VehicleMake") %>,  <%#Eval("VehicleYear") %> 
                    <asp:Label ID="lblVehicleID" runat="server" Text='<%#Eval("VehicleID") %>'></asp:Label>
                </p>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
        <hr />
        <h2>Service Dates and Locations</h2>
        <ul>
        <asp:DataList ID="DataList2" runat="server" CellPadding="4" ForeColor="#333333">
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#EFF3FB" />
            <ItemTemplate>
                <li><%#Eval("LocationName") %>, <%#Eval("ServiceDate") %>, <%#Eval("ServiceTime") %></li>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
         </ul>
        <hr />
        <h2>Last Services Rendered</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
           <Columns>
               <asp:BoundField HeaderText="Service Name" DataField="ServiceName" />
               <asp:BoundField HeaderText="Discount Percent" DataField="DiscountPercent" />
               <asp:BoundField HeaderText="Tax Percent" DataField="TaxPercent" />
           </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <p>&nbsp;</p>
         <asp:Button ID="btnNewService" runat="server" Text="Today's Service" OnClick="btnNewService_Click" />
    </div>
    </form>
        </div>
</body>
</html>
