<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CustomSQL.aspx.vb" Inherits="CustomSQL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Custom SQL</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>Welcome to the site!</h2>
        <h3>This was done by the one true Jesse Owens!</h3>
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="dsCustomSQL" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="Last Name" HeaderText="Last Name" SortExpression="Last Name" />
                <asp:BoundField DataField="First Name" HeaderText="First Name" SortExpression="First Name" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Order Date" HeaderText="Order Date" ReadOnly="True" SortExpression="Order Date" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Retail" HeaderText="Retail" ReadOnly="True" SortExpression="Retail" />
                <asp:BoundField DataField="Extended Price" HeaderText="Extended Price" ReadOnly="True" SortExpression="Extended Price" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsCustomSQL" runat="server" ConnectionString="<%$ ConnectionStrings:constringDBBooks %>" SelectCommand="SELECT LastName as &quot;Last Name&quot;, FirstName as &quot;First Name&quot;, Title, FORMAT(OrderDate, 'MM-dd-yyyy') as &quot;Order Date&quot;, Quantity, FORMAT(Retail, 'C') as &quot;Retail&quot;, FORMAT(SUM(Retail*Quantity), 'C') as &quot;Extended Price&quot; 
FROM customers INNER JOIN orders ON customers.customernum = orders.customernum INNER JOIN orderitems ON orders.ordernum = orderitems.ordernum INNER JOIN books ON orderitems.ISBN = books.ISBN 
GROUP BY LastName, FirstName, Title, OrderDate, Quantity, retail
ORDER BY Lastname;"></asp:SqlDataSource>
    </form>
    <footer><a href ="Default.aspx">Back to Home</a></footer>
</body>
</html>
