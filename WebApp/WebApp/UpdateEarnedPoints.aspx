<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateEarnedPoints.aspx.cs" Inherits="WebApp.UpdateEarnedPoints" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Earned Points</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(to bottom right, #004080, #e6f2ff); /* Matching background */
            overflow-y: auto;
        }

        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 600px;
            display: flex;
            flex-direction: column;
            gap: 10px; /* Reduced gap between elements */
        }

        h1 {
            font-size: 2em;
            margin-bottom: 10px; /* Reduced margin below title */
            color: #004080;
        }

        label {
            display: block;
            margin-top: 5px; /* Reduced margin above labels */
            font-size: 1.1em; /* Slightly smaller font size for labels */
            color: #333;
        }

        .input {
            width: 100%;
            padding: 8px; /* Reduced padding */
            margin: 5px 0; /* Reduced margin between inputs */
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1em;
        }

        .btn {
            padding: 12px 25px; /* Reduced padding for buttons */
            background-color: #004080;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            font-size: 1.1em; /* Slightly smaller font size */
            transition: background-color 0.3s ease, transform 0.2s ease;
            width: 100%;
            margin-top: 10px; /* Reduced margin between buttons */
        }

        .btn:hover {
            background-color: #0066cc;
            transform: scale(1.05);
        }

        .btn:active {
            background-color: #003366;
            transform: scale(0.95);
        }

        footer {
            text-align: center;
            font-size: 0.9em;
            color: #666;
            margin-top: 20px;
        }

        @media (max-width: 768px) {
            .btn {
                padding: 10px 20px;
                font-size: 1em;
            }

            .container {
                padding: 15px; /* Reduced padding for smaller screens */
            }

            h1 {
                font-size: 1.8em;
            }
        }

        @media (max-width: 480px) {
            .container {
                width: 100%;
                padding: 12px;
            }

            h1 {
                font-size: 1.5em;
            }
        }
    </style>
</head>
<body>
    <form id="form37" runat="server">
        <div class="container">
            <h1>Update Earned Points</h1>

            <label for="MobileNoTextBox">Mobile Number:</label>
            <asp:TextBox ID="MobileNoTextBox" runat="server" CssClass="input" TextMode="Number" />

            <div>
                <asp:Label ID="ResultLabel" runat="server" CssClass="result-label" Text="" />
            </div>

            <div>
                <asp:Button ID="SearchButton" runat="server" Text="Update" CssClass="btn" OnClick="SearchButton_Click" />
            </div>

            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="AdminDashboard.aspx" />
        </div>
    </form>
</body>
</html>
