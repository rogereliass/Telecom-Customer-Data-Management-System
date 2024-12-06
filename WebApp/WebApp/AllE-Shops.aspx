<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllE-Shops.aspx.cs" Inherits="WebApp.AllE_Shops" %>

<!DOCTYPE html>
<html>
<head>
    <title>All E-Shops</title>
    <style>
        /* Overall Body Styling */
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(to bottom right, #004080, #e6f2ff);
            color: #333;
        }

        /* Main Container Styling */
        .container {
            text-align: center;
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 85%; /* Suitable for larger screens */
            max-width: 1800px;
            display: flex;
            flex-direction: column;
            gap: 20px;
            height: 85vh; /* Ensures proportionate height */
            margin: 0 auto; /* Horizontally centers the container */
        }

        /* Header Styling */
        h1 {
            font-size: 2.5em;
            margin-bottom: 15px;
            color: #004080;
        }

        /* Grid Container Styling */
        .grid-container {
            flex: 1;
            overflow-y: auto; /* Vertical scrolling */
            overflow-x: auto; /* Horizontal scrolling */
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            padding: 10px;
            max-height: 65vh; /* Prevent vertical overflow */
        }

        /* GridView Table Styling */
        .gridview {
            width: 100%;
            min-width: 1200px; /* Ensures usability on larger screens */
            max-width: 1700px;
            border-collapse: collapse;
            table-layout: auto;
        }

        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
            word-wrap: break-word; /* Prevents overflow */
        }

        .gridview th {
            background-color: #004080;
            color: white;
            font-size: 1em;
        }

        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .gridview tr:hover {
            background-color: #ddd;
        }

        .gridview td {
            font-size: 16px;
        }

        /* Button Styling */
        .btn {
            padding: 15px 30px;
            background-color: #004080;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 1.2em;
            font-weight: bold;
            cursor: pointer;
            text-transform: uppercase;
            margin-top: 20px;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0066cc;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <form id="form29" runat="server">
        <div class="container">
            <h1>All E-Shops Details</h1>
            
            <!-- GridView Container -->
            <div class="grid-container">
                <asp:GridView ID="ResultGrid" runat="server" CssClass="gridview" Visible="true" />
            </div>

            <!-- Return Button -->
            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="AdminDashboard.aspx" />
        </div>
    </form>
</body>
</html>
