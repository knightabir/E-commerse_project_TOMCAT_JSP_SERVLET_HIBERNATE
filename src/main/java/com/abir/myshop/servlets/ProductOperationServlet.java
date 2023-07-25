package com.abir.myshop.servlets;

import com.abir.myshop.dao.CategoryDao;
import com.abir.myshop.dao.ProductDao;
import com.abir.myshop.entities.Category;
import com.abir.myshop.entities.Product;
import com.abir.myshop.helper.FactoryProvider;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String operation = request.getParameter("operation");
            if (operation == null || operation.isEmpty()) {
                out.println("Invalid operation.");
                return;
            }

            if (operation.equals("addcategory")) {
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");

                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);

                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getfFactory());
                int catId = categoryDao.saveCategory(category);

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category added successfully.");
                response.sendRedirect("admin.jsp");
                return;
            } else if (operation.equals("addproduct")) {
                String pName = request.getParameter("pName");
                String pdesc = request.getParameter("pDescription");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("pPic");

                Product p = new Product();
                p.setPdesc(pdesc);
                p.setpDiscount(pDiscount);
                p.setpId(catId);
                p.setpName(pName);
                p.setpPrice(pPrice);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());

                // Get category by id
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getfFactory());
                Category category = categoryDao.getCategoryById(catId);
                p.setCategory(category);

                // Save product
                ProductDao productDao = new ProductDao(FactoryProvider.getfFactory());
                productDao.saveProduct(p);

                // Upload picture
                //C:\Users\asabi\OneDrive\Documents\mystore\myshop\src\main\webapp\components\image\products
                String uploadDir = getServletContext().getRealPath("/webapp/components/image/products");
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs();
                }

                String fileName = System.currentTimeMillis() + "_" + part.getSubmittedFileName();
                String filePath = uploadDir + File.separator + fileName;
                try (InputStream inputStream = part.getInputStream()) {
                    java.nio.file.Files.copy(inputStream, new java.io.File(filePath).toPath());
                }catch(Exception e){
                    e.printStackTrace();
                }

                HttpSession session = request.getSession();
                session.setAttribute("message", "Product added successfully.");
                response.sendRedirect("admin.jsp");
                return;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Product Operation Servlet";
    }
}
