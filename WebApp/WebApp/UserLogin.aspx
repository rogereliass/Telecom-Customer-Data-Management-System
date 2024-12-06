<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="WebApp.UserLogin" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(to bottom right, #004080, #e6f2ff);
        }

        .container {
            background: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 95%;
            max-width: 900px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        h1 {
            font-size: 2.5em;
            color: #004080;
            margin-bottom: 20px;
        }

        h2 {
            font-size: 1.8em;
            color: #004080;
            margin-bottom: 20px;
        }

        .login-container, .plans-container {
            margin-bottom: 20px;
            padding: 20px;
            border-radius: 10px;
            background: #f4f4f4;
        }

        label {
            display: block;
            margin-top: 10px;
            color: #333;
        }

        input[type="text"], input[type="password"] {
            width: 90%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            padding: 15px 30px;
            color: white;
            background-color: #004080;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
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

        .feedback-label {
            color: red;
            font-weight: bold;
            margin-top: 10px; 
            margin-bottom: 10px;
            display: block;
        }

        /* Grid Styling */
        .grid-container {
            overflow-y: auto;
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
            .container {
                width: 100%;
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       

        <div class="container">
            <h1>User Login</h1>

            <div class="login-container">
                <h2>Login to Your Account</h2>
                <label for="mobile">Mobile Number:</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="input" />

                <label for="password">Password:</label>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="input" />
                
                
                 <asp:Label ID="FeedbackLabel" runat="server" CssClass="feedback-label"></asp:Label>

                <asp:Button ID="LoginButton" runat="server" Text="Login" CssClass="btn" OnClick="LoginButton_Click" />
            </div>

            <div class="plans-container">
                <h2>Service Plans</h2>
                <asp:Button ID="ViewPlansButton" runat="server" Text="View All Service Plans" CssClass="btn" OnClick="ViewPlansButton_Click" />

                <div class="grid-container">
                    <asp:GridView ID="ServicePlansGrid" runat="server" AutoGenerateColumns="True" CssClass="gridview" Visible="false"></asp:GridView>
                </div>
            </div>
        </div>

        <footer>
            © Winter 2024 Telecom Team 14 | <a href="mailto:roger.elias669@gmail.com">Contact</a>
        </footer>
    </form>
</body>
</html>
