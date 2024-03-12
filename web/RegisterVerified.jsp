<%-- 
    Document   : MyExam
    Created on : Nov 5, 2023, 3:24:19 PM
    Author     : lemti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Registration Form in HTML CSS</title>
        <!---Custom CSS File--->
        <link rel="stylesheet" href="style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap" rel="stylesheet">
    </head>
    <body>
        <section class="container">
            
            <header class="cfHeading"> We have sent an otp to email: ${requestScope.userEmail}</header>
            <form action="RegisterVerifiedController" method="post" class="form">

                <div class="input-box">
                    <label>OTP</label>
                    <input type="text" name="otp" placeholder="Enter OTP code" required />
                </div> 
                
                <button type="submit">Submit</button>
                <input type="hidden" name="username" value="${requestScope.username}">
                <input type="hidden" name="email" value="${requestScope.email}">
                <input type="hidden" name="pass" value="${requestScope.pass}">
                <input type="hidden" name="userEmail" value="${requestScope.userEmail}">
            </form>
           <h3 class="error" style="color: red;">${error} </h3>  
        </section>
    </body>
</html>

<style>
    /* Import Google font - Poppins */
    /*@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");*/
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Poppins", sans-serif;
    }
    body {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
        background: rgb(156, 224, 149);
        color: #def0bd;
        background-size: cover;
        background-repeat: no-repeat;
        background-image: url("https://chichchoedesign.com/wp-content/uploads/2023/04/thiet-ke-cua-hang-hoa-qua-tron-goi-min.jpeg");
        overflow: hidden;
        overflow-y: auto;
    }
    .container {
        position: relative;
        max-width: 700px;
        width: 100%;
        background: #ddead0;
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);

    }
    .cfHeading{
        font-size: 16px;
        color: black;
        font-family: 'Playfair Display', serif;

    }
    .container email{
        font-size: 1rem;
        color: #333;
        font-weight: 300;

    }
    .container header {
        font-size: 1.5rem;
        color: #333;
        font-weight: 500;
        text-align: center;
    }
    .container .form {
        margin-top: 30px;
    }
    .form .input-box {
        width: 100%;
        margin-top: 20px;
    }
    .input-box label {
        color: #333;
    }
    /*.form :where(.input-box input, .select-box) {
      position: relative;
      height: 50px;
      width: 100%;
      outline: none;
      font-size: 1rem;
      color: #707070;
      margin-top: 8px;
      border: 1px solid #ddd;
      border-radius: 6px;
      padding: 0 15px;
    }*/
    .form .input-box input,
    .form .select-box {
        position: relative;
        height: 50px;
        width: 100%;
        outline: none;
        font-size: 1rem;
        color: #707070;
        margin-top: 8px;
        border: 1px solid #ddd;
        border-radius: 6px;
        padding: 0 15px;
    }
    .input-box input:focus {
        box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
    }
    .form .column {
        display: flex;
        column-gap: 15px;
    }
    .form .gender-box {
        margin-top: 20px;
    }



    .address input,
    .address .select-box {
        margin-top: 15px;
    }

    .select-box select {
        height: 100%;
        width: 100%;
        outline: none;
        border: none;
        color: #707070;
        font-size: 1rem;
    }
    .form button {
        height: 55px;
        width: 100%;
        color: #fff;
        font-size: 1rem;
        font-weight: 400;
        margin-top: 30px;
        border: none;
        cursor: pointer;
        transition: all 0.2s ease;
        background: rgb(137, 216, 128);
    }
    .form button:hover {
        background: rgb(23, 112, 43);
    }
    /*Responsive*/
    @media screen and (max-width: 500px) {
        .form .column {
            flex-wrap: wrap;
        }
        .form .gender-option,
        .form .gender {
            row-gap: 15px;
        }

    }
    .input-box {
        margin-bottom: 15px;
    }

    .input-with-link {
        position: relative;
        display: flex;
        align-items: center;
    }

    .input-with-link input {
        flex: 1;
        margin-right: 10px;
    }

    .send-code-link {
        position: absolute;
        right: 20px;
        top: 53%;
        transform: translateY(-50%);
        text-decoration: none ;
        color: #007bff; /* Màu sắc của liên kết */
        cursor: pointer;
    }
</style>
