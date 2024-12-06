<!DOCTYPE html>
<html>
<head>
    <title>Highest Value Voucher</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(to bottom right, #004080, #e6f2ff); /* Professional blue gradient */
            color: #333;
        }

        .container {
            text-align: center;
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 600px;
        }

        h1 {
            font-size: 2.2em;
            margin-bottom: 15px;
            color: #004080; /* Deep blue for telecom branding */
        }

        .result-label {
            font-size: 1.2em;
            margin: 20px 0;
            color: #009933; /* Green for success and connection */
        }

        .btn {
            padding: 15px 30px;
            background-color: #004080; /* Same deep blue for consistency */
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
            background-color: #0066cc; /* Slightly brighter blue for hover effect */
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
    <form id="form12" runat="server">
        <div class="container">
            <h1>This is Your Highest Valued Voucher</h1>
            <div class="result-label">
                <asp:Label ID="ResultLabel" runat="server" CssClass="result-label" Text="Value of Highest Voucher: 1" />
            </div>
            <asp:Button ID="ReturnButton" runat="server" Text="Return to Dashboard" CssClass="btn" PostBackUrl="UserDashboard.aspx" />
        </div>
    </form>
</body>
</html>
