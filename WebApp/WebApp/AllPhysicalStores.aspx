<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllPhysicalStores.aspx.cs" Inherits="WebApp.AllPhysicalStores" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Physical Stores Vouchers</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(to bottom right, #004080, #e6f2ff); /* Consistent gradient */
            color: #333;
        }

        .container {
            text-align: center;
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 95%;
            max-width: 1400px; /* Wider layout for large data */
            display: flex;
            flex-direction: column;
            gap: 20px;
            height: auto; /* Adjust height dynamically */
        }

        h1 {
            font-size: 2.2em;
            margin-bottom: 15px;
            color: #004080; /* Consistent header color */
        }

        .grid-container {
            flex: 1;
            overflow-y: auto; /* Scrollable for large data */
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            padding: 10px;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            table-layout: auto;
        }

        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
            word-wrap: break-word; /* Prevents overflow in narrow columns */
        }

        .gridview th {
            background-color: #004080; /* Deep blue for headers */
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
            font-size: 14px;
        }

        .btn {
            padding: 15px 30px;
            background-color: #004080;
            color: #ffffff;
            border: none;
            border-radius: 25px;
            font-size: 1.1em;
            font-weight: bold;
            cursor: pointer;
            text-transform: uppercase;
            margin-top: 20px;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0066cc; /* Hover effect with lighter blue */
            transform: translateY(-3px);
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 1.8em;
            }

            .btn {
                padding: 10px 20px;
                font-size: 1em;
            }

            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form18" runat="server">
        <div class="container">
            <h1>All Physical Stores Vouchers</h1>
            
            <div class="grid-container">
                <asp:GridView ID="ResultGrid" runat="server" CssClass="gridview" Visible="true" />
            </div>

            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="AdminDashboard.aspx" />
        </div>
    </form>
</body>
</html>
