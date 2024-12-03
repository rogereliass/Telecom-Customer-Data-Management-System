<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page1.aspx.cs" Inherits="WebApp.Page1" %>

<!DOCTYPE html>
<html>
<head>
    <title>Page 1</title>
    <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            .login-container, .plans-container {
                margin-bottom: 20px;
                border: 1px solid #ccc;
                padding: 20px;
                border-radius: 5px;
            }
            .login-container h2, .plans-container h2 {
                margin-bottom: 10px;
            }
            label {
                display: block;
                margin-top: 10px;
            }
            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .btn {
                padding: 10px 20px;
                color: white;
                background-color: #007bff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .btn:hover {
                background-color: #0056b3;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }
            table, th, td {
                border: 1px solid #ccc;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            .feedback-label {
                color: red;
                font-weight: bold;
                margin-bottom: 10px;
                display: block;
            }
    </style>
</head>
<body>
    <form id="formp1" runat="server">
    <div class="container">
        <h1>Page 1</h1>
        <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="UserDashboard.aspx" />
    </div>
    </form>
</body>
</html>