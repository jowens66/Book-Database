<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Authors.aspx.vb" Inherits="Authors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Authors</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>Welcome to the site!</h2>
        <h3>This was done by the one true Jesse Owens!</h3>
    </div>
    
        <asp:GridView ID="GVAuthors" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="AuthorID" DataSourceID="dsAuthors" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="AuthorID" HeaderText="AuthorID" ReadOnly="True" SortExpression="AuthorID" />
                <asp:BoundField DataField="Lname" HeaderText="Lname" SortExpression="Lname" />
                <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
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
        <asp:SqlDataSource ID="dsAuthors" runat="server" ConnectionString="<%$ ConnectionStrings:constringDBBooks %>" SelectCommand="SELECT [AuthorID], [Lname], [Fname] FROM [Author] ORDER BY [AuthorID]">
        </asp:SqlDataSource>
        <asp:FormView ID="FVAuthors" runat="server" DataKeyNames="AuthorID" DataSourceID="dsAuthorFV" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <EditItemTemplate>
                AuthorID:
                <asp:Label ID="AuthorIDLabel1" runat="server" Text='<%# Eval("AuthorID") %>' BackColor="Lime" />
                <asp:Label ID="LblAuthorIDLbl" runat="server" ForeColor="Red" Text="You cannot edit the Author ID"></asp:Label>
                <br />
                Lname:
                <asp:RequiredFieldValidator ID="ReqFieldvalLnameEdit" runat="server" ControlToValidate="LnameTextBox" Display="Dynamic" ErrorMessage="You must enter a last name"></asp:RequiredFieldValidator>
                <asp:TextBox ID="LnameTextBox" runat="server" Text='<%# Bind("Lname") %>' />
                <br />
                Fname:
                <asp:RequiredFieldValidator ID="ReqFieldValFnameEdit" runat="server" ControlToValidate="FnameTextBox" Display="Dynamic" ErrorMessage="You must enter a first name"></asp:RequiredFieldValidator>
                <asp:TextBox ID="FnameTextBox" runat="server" Text='<%# Bind("Fname") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                AuthorID:
                <asp:RequiredFieldValidator ID="ReqFieldValAuthorID" runat="server" ErrorMessage="You must enter a AuthorID" ControlToValidate="AuthorIDTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegExpressValAuthorID" runat="server" ErrorMessage="The AuthorID must be an uppercase letter followed by three numbers" ValidationExpression="[A-Z]\d{3}" ControlToValidate="AuthorIDTextBox" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:TextBox ID="AuthorIDTextBox" runat="server" Text='<%# Bind("AuthorID") %>' />
                <br />
                Lname:
                <asp:RequiredFieldValidator ID="ReqFieldValLname" runat="server" ControlToValidate="LnameTextBox" Display="Dynamic" ErrorMessage="You must enter a last name"></asp:RequiredFieldValidator>
                <asp:TextBox ID="LnameTextBox" runat="server" Text='<%# Bind("Lname") %>' />
                <br />
                Fname:
                <asp:RequiredFieldValidator ID="ReqFieldValFname" runat="server" ControlToValidate="FnameTextBox" Display="Dynamic" ErrorMessage="You must enter a first name"></asp:RequiredFieldValidator>
                <asp:TextBox ID="FnameTextBox" runat="server" Text='<%# Bind("Fname") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                AuthorID:
                <asp:Label ID="AuthorIDLabel" runat="server" Text='<%# Eval("AuthorID") %>' />
                <br />
                Lname:
                <asp:Label ID="LnameLabel" runat="server" Text='<%# Bind("Lname") %>' />
                <br />
                Fname:
                <asp:Label ID="FnameLabel" runat="server" Text='<%# Bind("Fname") %>' />
                <br />

                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />

            </ItemTemplate>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        </asp:FormView>
        <asp:SqlDataSource ID="dsAuthorFV" runat="server" ConnectionString="<%$ ConnectionStrings:constringDBBooks %>" DeleteCommand="DELETE FROM [Author] WHERE [AuthorID] = @AuthorID" InsertCommand="INSERT INTO [Author] ([AuthorID], [Lname], [Fname]) VALUES (@AuthorID, @Lname, @Fname)" SelectCommand="SELECT [AuthorID], [Lname], [Fname] FROM [Author] WHERE ([AuthorID] = @AuthorID)" UpdateCommand="UPDATE [Author] SET [Lname] = @Lname, [Fname] = @Fname WHERE [AuthorID] = @AuthorID">
            <DeleteParameters>
                <asp:Parameter Name="AuthorID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AuthorID" Type="String" />
                <asp:Parameter Name="Lname" Type="String" />
                <asp:Parameter Name="Fname" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GVAuthors" Name="AuthorID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Lname" Type="String" />
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="AuthorID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
        <footer><a href ="Default.aspx">Back to Home</a></footer>
    </body>
</html>


