<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="components/common_css_js.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Please Login</title>
</head>
<body>
    <%@include file="components/navbar.jsp" %>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <h3 class="text-center my-3">Login</h3>
                <div class="card">
                    <div class="card-body">
                        <form action="LoginServlet" method="post">

                            <div class="form-group">
                                <label for="username">User Name</label>
                                <input name="email" type="text" class="form-control" id="username" aria-describedby="usernameHelp" placeholder="Enter Name" required="">
                                <!--<small id="usernameHelp" class="form-text text-muted">We'll never share your username with anyone else.</small>-->
                            </div>

                            <div class="form-group">
                                <label for="password">Password</label>
                                <input name="password" type="password" class="form-control" id="password" aria-describedby="passwordHelp" placeholder="Enter Password" required="">
                                <!--<small id="passwordHelp" class="form-text text-muted">We'll never share your password with anyone else.</small>-->
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary">Login</button>
                                <a href="#" class="btn btn-link">Forgot Password?</a>
                                <a href="register.jsp" class="btn btn-link">Register</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
