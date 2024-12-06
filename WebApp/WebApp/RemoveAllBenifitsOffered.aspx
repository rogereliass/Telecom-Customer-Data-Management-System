<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveAllBenifitsOffered.aspx.cs" Inherits="WebApp.RemoveAllBenifitsOffered" %>

<!DOCTYPE html>
<html>
<head>
    <title>Remove All Benefits Offered</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(to bottom right, #004080, #e6f2ff); /* Background with gradient */
            color: #333;
            overflow-y: auto;
        }

        .container {
            text-align: center;
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 1200px;
            display: flex;
            flex-direction: column;
            gap: 20px;
            height: auto;
            flex-grow: 1;
        }

        h1 {
            font-size: 2.2em;
            margin-bottom: 15px;
            color: #004080; /* Deep blue for title */
        }

        label {
            font-size: 1.1em;
            color: #333;
            margin-bottom: 5px;
        }

        .input-text {
            width: 90%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1em;
            box-sizing: border-box;
        }

        .btn {
            padding: 15px 30px;
            background-color: #004080;
            color: white;
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
            background-color: #0066cc;
            transform: translateY(-3px);
        }

        .btn:active {
            background-color: #003366;
            transform: translateY(3px);
        }

        .grid-container {
            flex-grow: 1;
            overflow-y: auto;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            padding: 10px;
            height: 100%;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
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
            margin-top: 30px;
        }

        footer a {
            color: #004080;
            text-decoration: none;
            font-weight: bold;
        }

        footer a:hover {
            text-decoration: underline;
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

        @media (max-width: 480px) {
            .input-text {
                width: 100%;
                padding: 10px;
            }

            .btn {
                width: 100%;
                font-size: 1em;
                padding: 12px 0;
            }

            .container {
                width: 100%;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <form id="form25" runat="server">
        <div class="container">
            <h1>Remove All Benefits Offered</h1>

            <!-- Mobile Number Input -->
            <label for="mobileInput">Enter a Mobile Number:</label>
            <asp:TextBox ID="mobileNo" runat="server" CssClass="input-text" />

            <!-- Plan ID Input -->
            <label for="Planid">Enter a Plan ID:</label>
            <asp:TextBox ID="Planid" runat="server" CssClass="input-text" />

            <!-- Search Button -->
            <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn" OnClick="SearchButton_Click" />

            <!-- Grid Container for Results -->
            <div class="grid-container">
                <asp:GridView ID="ResultGrid" runat="server" CssClass="gridview" Visible="true" />
            </div>

            <!-- Return Button -->
            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="AdminDashboard.aspx" />
        </div>

        <footer>
            © Winter 2024 Telecom Team 14 | <a href="mailto:roger.elias669@gmail.com">Contact</a>
        </footer>
    </form>
</body>
</html>
