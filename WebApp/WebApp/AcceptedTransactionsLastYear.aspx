<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcceptedTransactionsLastYear.aspx.cs" Inherits="WebApp.AcceptedTransactionsLastYear" %>

<!DOCTYPE html>
<html>
<head>
    <title>Accepted Transactions Last Year</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            height: 100vh;
            background: linear-gradient(to bottom right, #004080, #e6f2ff); /* Adjusted background color */
            overflow-y: auto; /* Allowing the page to scroll if needed */
        }

        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 600px;
            display: flex;
            flex-direction: column;
            gap: 15px; /* Reduced gap between elements */
            height: 80vh;
        }

        h1 {
            margin-bottom: 15px; /* Reduced margin */
            font-size: 2.5em;
            color: #004080;
        }

        label {
            display: block;
            margin-top: 10px;
            font-size: 1.2em;
            color: #333;
        }

        .input {
            width: 90%;
            padding: 10px;
            margin: 5px 0; /* Reduced margin */
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1em;
        }

        .btn {
            padding: 15px 30px;
            background-color: #004080;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            font-size: 1.2em;
            transition: background-color 0.3s ease, transform 0.2s ease;
            width: 100%;
        }

        .btn:hover {
            background-color: #0066cc;
            transform: scale(1.05);
        }

        .btn:active {
            background-color: #003366;
            transform: scale(0.95);
        }

        .grid-container {
            flex: 1;
            overflow-y: auto;
            overflow-x: auto;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            padding: 10px;
            margin-top: 20px;
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
            font-size: 14px;
        }

        footer {
            text-align: center;
            font-size: 0.9em;
            color: #666;
            margin-top: 20px;
        }

        @media (max-width: 768px) {
            .btn {
                padding: 12px 25px;
                font-size: 1.1em;
            }

            .container {
                padding: 20px;
            }

            h1 {
                font-size: 1.8em;
            }
        }

        @media (max-width: 480px) {
            .container {
                width: 100%;
                padding: 15px;
            }

            h1 {
                font-size: 1.5em;
            }
        }
    </style>
</head>
<body>
    <form id="form33" runat="server">
        <div class="container">
            <h1>Accepted Transactions Last Year</h1>

            <label for="MobileNoTextBox">Mobile No:</label>
            <asp:TextBox ID="MobileNoTextBox" runat="server" CssClass="input" TextMode="Number" />

            <div>
                <asp:Label ID="ResultLabel" runat="server" CssClass="result-label" Text="" />
            </div>

            <div>
                <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn" OnClick="SearchButton_Click" />
            </div>

           

            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="AdminDashboard.aspx" />
        </div>
    </form>
</body>
</html>
