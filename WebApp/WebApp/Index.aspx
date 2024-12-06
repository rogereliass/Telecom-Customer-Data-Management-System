<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApp.Index" %>

<!DOCTYPE html>
<html>
<head>
    <title>GUC Telecom Services</title>
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
            text-align: center;
            background: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 600px;
        }

        h1 {
            font-size: 2.5em;
            color: #004080;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            margin: 10px;
            padding: 15px 30px;
            font-size: 1.1em;
            color: #fff;
            background-color: #004080;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background-color: #0066cc;
            transform: scale(1.05);
        }

        .btn:active {
            background-color: #003366;
            transform: scale(0.95);
        }

        .header-img {
            width: 150px;
            margin-bottom: 20px;
        }

        footer {
            text-align: center;
            font-size: 0.9em;
            color: #666;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="Images/GUC.png" alt="GUC Telecom Logo" class="header-img" />

        <h1>GUC Telecom Services</h1>
        
        <a class="btn" href="UserLogin.aspx">User Login</a>
        <a class="btn" href="AdminLogin.aspx">Admin Login</a>
        
        <footer>
            © Winter 2024 Telecom Team 14 | <a href="mailto:roger.elias669@gmail.com">Contact</a>
        </footer>
    </div>
</body>
</html>
