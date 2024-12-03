﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="WebApp.AdminLogin" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
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
    <form id="form2" runat="server">
        <asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback-label"></asp:Label>

        <div class="login-container">
            <h2>Admin Login</h2>
            <label for="adminID">Admin ID:</label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="input" />

            <label for="password">Password:</label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="input" />
            
            <asp:Button ID="LoginButton" runat="server" Text="Login" CssClass="btn" OnClick="LoginButton_Click" />
        </div>

       
    </form>
</body>
</html>
