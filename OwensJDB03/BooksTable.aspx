<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BooksTable.aspx.vb" Inherits="BooksTable" %>

<%--Owens, Jesse. Database Assignment--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Books Table</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <h2>Welcome to the site!</h2>
        <h3>This was done by the one true Jesse Owens!</h3>
        <asp:DropDownList ID="ddlPublisher" runat="server" AutoPostBack="True" DataSourceID="dsDDLPublisher" DataTextField="Name" DataValueField="PubID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="dsDDLPublisher" runat="server" ConnectionString="<%$ ConnectionStrings:constringDBBooks %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Name], [PubID] FROM [Publisher] ORDER BY [Name]">
        </asp:SqlDataSource>
        <asp:GridView ID="gvBooks" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ISBN" DataSourceID="dsBooks" GridLines="Vertical" EmptyDataText="There is no publisher data to show" AllowPaging="True">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN" >
                <ControlStyle Font-Bold="True" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PubDate" HeaderText="Publish Date" SortExpression="PubDate" DataFormatString="{0:d}" >
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="PubID" HeaderText="PubID" SortExpression="PubID" Visible="False" />
                <asp:BoundField DataField="Cost" HeaderText="Wholesale" SortExpression="Cost" DataFormatString="{0:c}" >
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="Retail" HeaderText="Retail" SortExpression="Retail" DataFormatString="{0:c}" >
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
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
        <asp:SqlDataSource ID="dsBooks" runat="server" ConnectionString="<%$ ConnectionStrings:constringDBBooks %>" SelectCommand="SELECT [ISBN], [Title], [PubDate], [PubID], [Cost], [Retail], [Category] FROM [Books] WHERE ([PubID] = @PubID) ORDER BY [Title]" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlPublisher" DefaultValue="1" Name="PubID" PropertyName="SelectedValue" Type="Double" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="dvBooks" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ISBN" DataSourceID="dsBooksDV" GridLines="Vertical" Height="50px" Width="600px">
            <AlternatingRowStyle BackColor="Gainsboro" />
            <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
                    <EditItemTemplate>
                        <asp:Label ID="LablEvalISBN" runat="server" Text='<%# Eval("ISBN") %>' BackColor="#CCCCCC"></asp:Label>
                        <asp:Label ID="LblISBN" runat="server" Text="You may not edit this field"></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TxtBoxISBN" runat="server" Text='<%# Bind("ISBN", "{0}")%>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegExISBN" runat="server" ErrorMessage="You must enter 10 digits for ISBN" ValidationExpression="\d{10}" ControlToValidate="TxtBoxISBN"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LblISBN2" runat="server" Text='<%# Bind("ISBN") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PubDate" SortExpression="PubDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtBoxEditPubDate" runat="server" Text='<%# Bind("PubDate", "{0:d}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqFieldValEditPubDate" runat="server" ControlToValidate="TxtBoxEditPubDate" Display="Dynamic" ErrorMessage="You must enter the publish date"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompValPubDate" runat="server" ControlToValidate="TxtBoxEditPubDate" ErrorMessage="You must enter a valid publish date" Operator="DataTypeCheck" Type="Date" Display="Dynamic"></asp:CompareValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TxtBoxInsertPubDate" runat="server" Text='<%# Bind("PubDate")%>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqFieldValInsertPubDate" runat="server" ControlToValidate="TxtBoxInsertPubDate" Display="Dynamic" ErrorMessage="You must enter the publish date"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompValInsertPubDate" runat="server" ControlToValidate="TxtBoxInsertPubDate" ErrorMessage="You must enter a valid publish date" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LblPubDate" runat="server" Text='<%# Bind("PubDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Title" SortExpression="Title">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtBoxEditTitle" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqFieldValEditTitle" runat="server" ErrorMessage="You must enter the title" ControlToValidate="TxtBoxEditTitle" Display="Dynamic"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TxtBoxInsertTitle" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqFieldValInsertTitle" runat="server" ErrorMessage="You must enter the title" ControlToValidate="TxtBoxInsertTitle" Display="Dynamic"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LblTitle" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Publisher" SortExpression="PubID">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="ReqFieldValEditPublisher" runat="server" ControlToValidate="DDLeditPublisher" ErrorMessage="You must enter the publisher" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="DDLeditPublisher" runat="server" DataSourceID="dsDDLPublisher" DataTextField="Name" DataValueField="PubID" SelectedValue='<%# Bind("PubID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:RequiredFieldValidator ID="ReqFieldValInsertPublisher" runat="server" ControlToValidate="DDLinsertPublisher" ErrorMessage="You must enter the publisher" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="DDLinsertPublisher" runat="server" DataSourceID="dsDDLPublisher" DataTextField="Name" DataValueField="PubID" SelectedValue='<%# Bind("PubID") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LblPubID" runat="server" Text='<%# Bind("PubID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cost" SortExpression="Cost">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtBoxEditCost" runat="server" Text='<%# Bind("Cost", "{0:n}")%>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqFieldValEditCost" runat="server" ErrorMessage="You must enter the cost" ControlToValidate="TxtBoxEditCost" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompValEditCost" runat="server" ControlToValidate="TxtBoxEditCost" Display="Dynamic" ErrorMessage="You must enter a cost greater than $4.99" Operator="GreaterThan" Type="Double" ValueToCompare="4.99"></asp:CompareValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TxtBoxInsertCost" runat="server" Text='<%# Bind("Cost", "{0:n}")%>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqFieldValInsertCost" runat="server" ErrorMessage="You must enter the cost" ControlToValidate="TxtBoxInsertCost" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompValInsertCost" runat="server" ControlToValidate="TxtBoxInsertCost" Display="Dynamic" ErrorMessage="You must enter a cost greater than $4.99" Operator="GreaterThan" Type="Double" ValueToCompare="4.99"></asp:CompareValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LblCost" runat="server" Text='<%# Bind("Cost", "{0:c}")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Retail" SortExpression="Retail">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtBoxEditRetail" runat="server" Text='<%# Bind("Retail", "{0:n}")%>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqFieldValEditRetail" runat="server" ErrorMessage="You must enter the retail" ControlToValidate="TxtBoxEditRetail" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompVal2EditRetail" runat="server" ControlToCompare="TxtBoxEditCost" ControlToValidate="TxtBoxEditRetail" Display="Dynamic" ErrorMessage="You must enter a retail amount greater than cost" Operator="GreaterThan" Type="Double"></asp:CompareValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TxtBoxInsertRetail" runat="server" Text='<%# Bind("Retail", "{0:n}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqFieldValEditRetail" runat="server" ErrorMessage="You must enter the retail" ControlToValidate="TxtBoxInsertRetail" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompVal2InsertRetail" runat="server" ControlToCompare="TxtBoxInsertCost" ControlToValidate="TxtBoxInsertRetail" Display="Dynamic" ErrorMessage="You must enter a retail amount greater than cost" Operator="GreaterThan" Type="Double"></asp:CompareValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LblRetail" runat="server" Text='<%# Bind("Retail", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category" SortExpression="Category">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtBoxCategory1" runat="server" Text='<%# Bind("Category") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TxtBoxCategory2" runat="server" Text='<%# Bind("Category") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LblCategory" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsBooksDV" runat="server" ConnectionString="<%$ ConnectionStrings:constringDBBooks %>" DeleteCommand="DELETE FROM [Books] WHERE [ISBN] = @original_ISBN" InsertCommand="INSERT INTO [Books] ([ISBN], [PubDate], [Title], [PubID], [Cost], [Retail], [Category]) VALUES (@ISBN, @PubDate, @Title, @PubID, @Cost, @Retail, @Category)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ISBN], [PubDate], [Title], [PubID], [Cost], [Retail], [Category] FROM [Books]" UpdateCommand="UPDATE [Books] SET [PubDate] = @PubDate, [Title] = @Title, [PubID] = @PubID, [Cost] = @Cost, [Retail] = @Retail, [Category] = @Category WHERE [ISBN] = @original_ISBN">
            <DeleteParameters>
                <asp:Parameter Name="original_ISBN" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ISBN" Type="String" />
                <asp:Parameter Name="PubDate" Type="DateTime" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="PubID" Type="Double" />
                <asp:Parameter Name="Cost" Type="Double" />
                <asp:Parameter Name="Retail" Type="Double" />
                <asp:Parameter Name="Category" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PubDate" Type="DateTime" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="PubID" Type="Double" />
                <asp:Parameter Name="Cost" Type="Double" />
                <asp:Parameter Name="Retail" Type="Double" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="original_ISBN" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    <footer><a href ="Default.aspx">Back to Home</a></footer>
    </body>
</html>
