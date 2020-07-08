<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PublishersTable.aspx.vb" Inherits="PublishersTable" %>

<%--Owens, Jesse. Database Assignment--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Publisher Table</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
            
    </div>
        <h2>Welcome to the site!</h2>
        <h3>This was done by the one true Jesse Owens!</h3>
        <asp:DetailsView ID="DViewPublisher" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="PubID" DataSourceID="dsPublisher" GridLines="Vertical" Height="50px" Width="300px">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="PubID" HeaderText="PubID" ReadOnly="True" SortExpression="PubID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" ButtonType="Button" />
            </Fields>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsPublisher" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:constringDBBooks %>" DeleteCommand="DELETE FROM [Publisher] WHERE [PubID] = @original_PubID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Contact] = @original_Contact) OR ([Contact] IS NULL AND @original_Contact IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL))" InsertCommand="INSERT INTO [Publisher] ([PubID], [Name], [Contact], [Phone]) VALUES (@PubID, @Name, @Contact, @Phone)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [PubID], [Name], [Contact], [Phone] FROM [Publisher] ORDER BY [PubID]" UpdateCommand="UPDATE [Publisher] SET [Name] = @Name, [Contact] = @Contact, [Phone] = @Phone WHERE [PubID] = @original_PubID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Contact] = @original_Contact) OR ([Contact] IS NULL AND @original_Contact IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_PubID" Type="Double" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Contact" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PubID" Type="Double" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="original_PubID" Type="Double" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Contact" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    <footer><a href ="Default.aspx">Back to Home</a></footer>
</body>
</html>
