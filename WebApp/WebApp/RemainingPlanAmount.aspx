<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemainingPlanAmount.aspx.cs" Inherits="WebApp.RemainingPlanAmount" %>

<!DOCTYPE html>
<html>
<head>
    <title>Remaining Plan Amount</title>
    <style>
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

        .container {
            text-align: center;
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 900px;
            display: flex;
            flex-direction: column;
            gap: 20px;
            height: 80vh;
        }

        h1 {
            font-size: 2.2em;
            margin-bottom: 20px;
            color: #004080;
        }

        .result-label {
            font-size: 1.2em;
            margin: 20px 0;
            color: #009933;
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
            background-color: #0066cc;
            transform: translateY(-3px);
        }

        .input-text {
            width: 90%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
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
    <form id="form12" runat="server">
        <div class="container">
            <h1>This is Your Remaining Plan Amount</h1>
            <div class="login-container">
                <label for="planName">Plan Name:</label>
                <asp:TextBox ID="planN" runat="server" CssClass="input-text" />
                <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn" OnClick="SearchButton_Click" />
            </div>
            <div>
                <asp:Label ID="ResultLabel" runat="server" CssClass="result-label" Text="" />
            </div>
            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="UserDashboard.aspx" />
        </div>
    </form>
</body>
</html>
