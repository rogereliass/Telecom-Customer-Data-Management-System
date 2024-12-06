﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllSmsOffers.aspx.cs" Inherits="WebApp.AllSmsOffers" %>

<!DOCTYPE html>
<html>
<head>
    <title> All SMS offers </title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            min-height: 100vh; 
            background-color: #f4f4f4;
        }
        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 90%;  
             max-width: 1200px; 
            display: flex;
            flex-direction: column;
            gap: 20px;
            height: 80vh;
        }
        h1 {
            margin-bottom: 20px;
        }
        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
         border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            text-align: center;
            margin-top: 20px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
       
        .grid-container{
             flex: 1; 
            overflow-y: auto; 
            overflow-x: auto; 
            border: 1px solid #ddd;
        }
        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            table-layout: auto; 
        }
        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
    
        }
        .gridview th {
            background-color: #007bff;
            color: white;
        }
        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .gridview tr:hover {
            background-color: #ddd;
        }
        .gridview td {
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form26" runat="server">
    <div class="container">
        <h1>Get all sms offers</h1>

        
        <label for="mobileInput">Enter a Mobile Number:</label>
        <asp:TextBox ID="mobileNo" runat="server" CssClass="input-text" />

        <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn" OnClick="SearchButton_Click" />

        <div class="grid-container">
        <asp:GridView ID="ResultGrid" runat="server" CssClass="gridview" Visible="true" />
            </div>

        <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="AdminDashboard.aspx" />
    </div>
    </form>
</body>
</html>
