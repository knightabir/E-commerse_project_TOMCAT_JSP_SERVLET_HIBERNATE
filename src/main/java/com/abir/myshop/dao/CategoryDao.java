package com.abir.myshop.dao;

import com.abir.myshop.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {
    private final SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    public int saveCategory(Category cat) {
        try (Session session = factory.openSession()) {
            Transaction tx = session.beginTransaction();
            int catId = (int) session.save(cat);
            tx.commit();
            return catId;
        }
    }

    public List<Category> getCategories() {
        try (Session session = factory.openSession()) {
            Query<Category> query = session.createQuery("FROM Category", Category.class);
            return query.list();
        }
    }
    
    public Category getCategoryById(int cid){
        Category cat = null;
        try {
            Session session = this.factory.openSession();
            cat = session.get(Category.class,cid);
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }
}
