<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%--Owens, Jesse. Database Assignment--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>Welcome to the site!</h2>
        <h3>This was done by the one true Jesse Owens!</h3>
        <nav>
            <ul>
                <li><a href ="PublishersTable.aspx">To Publisher Table</a></li>
                <li><a href ="BooksTable.aspx">To Books Table</a></li>
                <li><a href ="Authors.aspx">To Authors Table</a></li>
                <li><a href ="CustomSQL.aspx">To Custom SQL</a></li>
            </ul>
        </nav>
    </div>
    </form>
</body>
</html>
