<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="auth_login.aspx.vb" Inherits="UIDESK.auth_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Bravo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- swiper Css -->
    <!-- swiper Css -->
    <link href="Apps/assets/libs/swiper/swiper-bundle.min.css" rel="stylesheet" type="text/css" />


    <style>
        body, html {
            height: 100%;
            margin: 0;
            /*display: flex;*/
            justify-content: flex-end; /* Aligns the content to the right */
            align-items: center;
            background-size: cover;
            background-position: center;
            overflow-x: hidden;
        }

        body {
            /*background: url('material/bg.png') no-repeat bottom center;
            background-size: cover;*/
            background-image: url('material/bg.jpg');
           background-size: 100% 100%;
    background-position: center;
    background-repeat: no-repeat;
        }
        .login-slider {
            background: url('material/bglogin.png') no-repeat bottom center;
            background-size: cover;
           
           
            margin-right: 20px; /* Adds some space from the right edge */
        }
        .outer-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Pastikan container utama mengambil tinggi penuh dari viewport */
        }

        .login-container {
            background: url('material/bglogin.png') no-repeat bottom center;
            background-size: cover;
            max-width: 400px;
            padding: 10px;
            height: 100%; /* Pertahankan tinggi 100% sesuai kebutuhan */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-right: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .form-container {
            max-width: 300px; /* Sesuaikan dengan kebutuhan */
            margin: 0 auto; /* Agar form berada di tengah layar */
            width: 100%; /* Lebar form 100% dari parent-nya */
        }
        .logo {
            display: flex;
            justify-content: center;
            margin-bottom: 10px;
            margin-top: 0px;
        }

        .login-container h3 {
            text-align: center;
            margin-bottom: 0px;
        }

        .btn-login {
            background-color: #ffcc00;
            border: none;
            color: #fff;
            width: 100%;
            margin-top:20px;
        }

            .btn-login:hover {
                background-color: #ffbb00;
            }

    </style>
</head>
<body>
    <br /><br /><br /><br />
    <div class="row">
        <div class="col-lg-1">

        </div>
        <div class="col-lg-7">
            <div class="login-slider">
                <div class="card">
                    <div class="card-body">
                        <div class="swiper-container pagination-swiper" dir="ltr">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    
                                </div><!-- end swiper-slide -->

                            </div><!-- end swiper wrapper -->
                            <div class="swiper-pagination"></div>
                        </div><!-- end swiper container -->
                    </div><!-- end card body -->
                </div><!-- end card -->
            </div>
            </div>
        <div class="col-lg-4">
            <div class="login-container">
                <div class="logo">
                    <img src="material/logo.png" alt="Logo" width="180" />
                </div>
                <p>
                    Welcome Back!<br />
                    Log in to continue to Bravo Omnichannel
                </p>
                <div class="form-container">
                    <form runat="server">
                        <div class="mb-3">
                            <input type="text" class="form-control" id="Login_Username" placeholder="Username" runat="server" />
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" id="Login_Password" placeholder="Password" runat="server" />
                        </div>
                        <div class="mt-3">
                            <a class="btn btn-login w-100" onclick="loginApplikasi()" id="Login_ButtonSubmit" runat="server">Log In</a>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="Apps/assets/libs/swiper/swiper-bundle.min.js"></script>
    <script src="Apps/js/jquery-1.9.1.min.js"></script>
    <script src="Apps/js/auth_login.js"></script>
</body>


</html>
