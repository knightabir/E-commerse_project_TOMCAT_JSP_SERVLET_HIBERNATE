package com.abir.myshop.dao;

import com.abir.myshop.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String query = "from User where userEmail = :e and userPassword = :p";
            Session session = this.factory.openSession();
            Query<User> q = session.createQuery(query, User.class);

            q.setParameter("e", email);
            q.setParameter("p", password);

            user = q.uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
