<%-- 
    Document   : admin
    Created on : 24-Jul-2023, 11:25:46 pm
    Author     : asabi
--%>
<%@page import="com.abir.myshop.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.abir.myshop.helper.FactoryProvider"%>
<%@page import="com.abir.myshop.entities.Category"%>
<%@page import="com.abir.myshop.entities.User"%>
<%
// Check if a user is logged in or not
User currentUser = (User) session.getAttribute("currentuser");
if (currentUser == null) {
    session.setAttribute("message", "You are not logged in");
    response.sendRedirect("login.jsp");
    return;
} else {
    // If user is logged in, check if the user is an admin
    if (!currentUser.getUserType().equals("admin")) {
        session.setAttribute("message", "You are not authorized");
        response.sendRedirect("login.jsp");
        return;
    }
}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="components/common_css_js.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Dashboard</title>
</head>
<body>
    <%@include file="components/navbar.jsp" %>
    <!--<h1>Hello Admin</h1>-->
    
    <div class="container admin">
        
        <div class="container-fluid"><%@include file="components/message.jsp" %></div>
        <div class="row mt-3">
            <!--First col-->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 150px" src="components/image/add-user.png">
                        </div>
                        <h1>2133</h1>
                        <h1>Users</h1>
                    </div>
                </div>
            </div>
            
            <!--Second Col-->
            
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 150px" src="components/image/received.png">
                        </div>
                        <h1>2133</h1>
                        <h1>Categories</h1>
                    </div>
                </div>
            </div>

            <!--Third col-->
            
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 150px" src="components/image/list.png">
                        </div>
                        <h1>2133</h1>
                        <h1>Products</h1>
                    </div>
                </div>
            </div>
            
        </div>
        <!--second row-->
        
        
        <div class="row">
            <div class="col-md-6" data-toggle="modal" data-target="#add-category-modal">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 150px" src="components/image/received.png">
                        </div>
                        <p class="mt-2">Click to add category</p>
                        <h1>Add Category</h1>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6" data-toggle="modal" data-target="#add-product-modal">
                
                <div class="card" >
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 150px" src="components/image/team.png">
                        </div>
                        <p class="mt-2">Click to add Product</p>
                        <h1>Add Product</h1>
                    </div>
                </div>
                
            </div>
            
        </div>
        
    </div>
    
    <!-- Add Category Modal -->
    <%-- Modal --%>
    <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required>
                            </div>
                            <div class="form-group">
                                <textarea style="height: 300px" type="text" class="form-control" name="catDescription" placeholder="Enter Description" required></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%-- End of Add Category Modal --%>

    <!-- Add Product Modal -->
    <%-- Modal --%>
    <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                        
                        <input type="hidden" name="operation" value="addproduct">
                        <!-- Product name -->
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Enter product Title" name="pName" required>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Enter Actual Price" name="pPrice" required>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" placeholder="Product Description" name="pDescription" required></textarea>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Enter Discounted Price" name="pDiscount" required>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Quantity" name="pQuantity" required>
                        </div>
                        <%
                            CategoryDao cdao = new CategoryDao(FactoryProvider.getfFactory());
                            List<Category> list = cdao.getCategories();
                        %>
                        <!-- Product category -->
                        <div class="form-group">
                            <select name="catId" class="form-control" id="id">
                                <%
                                    for (Category c : list) {
                                %>
                                    <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                                <% } %>
                            </select>
                        </div>
                        <!-- Product file -->
                        <div class="form-group">
                            <label class="form-control" for="pPic">Select Picture</label>
                            <br>
                            <input type="file" id="pPic" name="pPic" required>
                        </div>
                        <!-- Submit button -->
                        <div class="container text-center">
                            <button class="btn btn-outline-success">Add Product</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%-- End of Add Product Modal --%>
</body>
</html>
