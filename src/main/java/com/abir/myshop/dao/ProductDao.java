package com.abir.myshop.dao;

import com.abir.myshop.entities.Product;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class ProductDao {

    private final SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Product product) {
        boolean success = false;
        try (Session session = factory.openSession()) {
            Transaction tx = session.beginTransaction();
            session.save(product);
            tx.commit();
            success = true;
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
        }
        return success;
    }

    // Get all the products
    
    public List<Product> getAllProducts(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product");
        List<Product> list = query.getResultList();
            
        return list;
    }


}
