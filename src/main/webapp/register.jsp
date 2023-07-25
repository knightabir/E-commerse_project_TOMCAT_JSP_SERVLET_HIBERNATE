<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>New User</title>
    <%@include file="components/common_css_js.jsp" %>
</head>
<body>
    <%@include file="components/navbar.jsp" %>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <h3 class="text-center my-3">Sign up here</h3>
                <div class="card">
                    
                    <%@include file="components/message.jsp" %>
                    <div class="card-body">
                        <form action="RegisterServlet" method="post">
                            <div class="form-group">
                                <label for="username">User Name</label>
                                <input name="uesr_name" type="text" class="form-control" id="username" aria-describedby="usernameHelp" placeholder="Enter Name" required="">
                            </div>

                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email" required="">
                                
                            </div>

                            <div class="form-group">
                                <label for="password">User Password</label>
                                <input name="user_password" type="password" class="form-control" id="password" aria-describedby="passwordHelp" placeholder="Enter Password" required="">
                              
                            </div>

                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input name="user_phone" type="number" class="form-control" id="phone" aria-describedby="phoneHelp" placeholder="Enter Phone Number" required="">
                             
                            </div>

                            <div class="form-group">
                                <label for="address">Full Address</label>
                                <textarea name="user_address" class="form-control" id="address" placeholder="Enter full address" required=""></textarea>
                               
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Register</button>
                                <button class="btn btn-outline-warning">Reset</button>
                            </div>
                        </form>

                        <div class="container text-center mt-3">
                            <p>Already registered? <a href="login.jsp">Please login here</a>.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
