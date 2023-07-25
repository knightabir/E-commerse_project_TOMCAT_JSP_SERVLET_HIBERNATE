<%@page import="com.abir.myshop.entities.Category"%>
<%@page import="com.abir.myshop.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.abir.myshop.entities.Product"%>
<%@page import="com.abir.myshop.helper.Helper"%>
<%@page import="com.abir.myshop.dao.ProductDao"%>
<%@page import="com.abir.myshop.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@include file="components/image/products/1690274239518_71Blj59DzzL._SL1500_.jpg" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="components/common_css_js.jsp" %>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Shop - Home</title>
</head>
<body>
    <!-- Include navbar.jsp -->
    <%@include file="components/navbar.jsp" %>

    <!-- Main content -->
    <div class="row mt-3 mx-2">

        <%
            ProductDao dao = new ProductDao(FactoryProvider.getfFactory());
            List<Product> list = dao.getAllProducts();
            CategoryDao cdao = new CategoryDao(FactoryProvider.getfFactory());
            List<Category> clist = cdao.getCategories();
        %>

        <!-- Show categories in the sidebar -->
        <div class="col-md-2">
            <div class="list-group mt-4">
                <a href="#" class="list-group-item list-group-item-action active">
                    All Products
                </a>

                <% for (Category c : clist) { %>
                    <a href="#" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
                <% } %>
            </div>
        </div>

        <!-- Show products in the main content area -->
        <div class="col-md-10">
            <div class="row mt-4">
                <!-- Traversing products -->
                <% for (Product p : list) {
                %>
                <div class="col-md-4 mb-4">
                    
                    <div class="card">
                        <!--<img src="components/image/products/1690274239518_71Blj59DzzL._SL1500_.jpg" class="card-img-top">-->
                        
<!--                        <h1><%="components/image/products/"+p.getpPhoto()%></h1>-->
                        <%String src = "components/image/products/"+p.getpPhoto();%>
                        <!--<p><%=src%></p>-->
                        <img class="card-img-top" src="<%=src%>" >
                        
                        
                        
                        <div class="card-body">
                            <h5 class="card-title"><%=p.getpName()%></h5>
                            <p class="card-text"><%=Helper.get10Words(p.getPdesc())%></p>
                        </div>
                        <div class="card-footer">
                            <button class="btn btn-success">Add to cart</button>
                            <button class="btn btn-success">₹ <%= p.getpPrice()%></button>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>
