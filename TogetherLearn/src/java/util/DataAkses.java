package util;

import java.util.ArrayList;
import model.Answers;
import model.Questions;
import model.Users;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class DataAkses {

    public static SessionFactory factory;

    public DataAkses() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {
            System.err.println("[ERROR] Gagal membuat session factory");
            e.printStackTrace();
        }
    }

    public Users login(String email, String password) {
        Session session = factory.openSession();
        Users hasil = null;
        Transaction tx = session.beginTransaction();

        Query q = session.createQuery("from Users u where u.email = :em and u.password = :pwd");
        q.setParameter("em", email);
        q.setParameter("pwd", password);
        hasil = (Users) q.uniqueResult();

        tx.commit();
        session.close();

        return hasil;
    }

    public boolean register(Users u) {
        boolean res = true;
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.save(u);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            res = false;
        }
        session.close();
        return res;
    }
    
    public ArrayList<Questions> getSearched(String search){
        Session session = factory.openSession();
        ArrayList<Questions> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Questions q where q.title like :keyword or q.tag like :keyword");
        q.setParameter("keyword", "%" + search + "%");
        hasil = (ArrayList<Questions>) q.list();
        tx.commit();
        session.close();
        return hasil;
    }

    public ArrayList<Questions> getAllQuestions() {
        Session session = factory.openSession();
        ArrayList<Questions> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Questions order by _time desc");
        hasil = (ArrayList<Questions>) q.list();
        tx.commit();
        session.close();
        return hasil;
    }
    
    public Questions getQuestions(long questionId){
        Session session = factory.openSession();
        Questions t = null;
        Transaction tx = session.beginTransaction();

        System.out.println("QUESTION ID : "+questionId);
        Query q = session.createQuery("from Questions where question_id = :em");
        q.setParameter("em",questionId);
        t = (Questions) q.uniqueResult();
        tx.commit();
        System.out.println("QUESTION ID : "+questionId);
        session.close();
        return t;
    }
    
    public ArrayList<Answers> getAnswers() {
        Session session = factory.openSession();
        ArrayList<Answers> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Answers a");
        //q.setParameter("q_id", que);
        hasil = (ArrayList<Answers>) q.list();
        tx.commit();
        session.close();
        return hasil;
    }
    
    public ArrayList<Answers> getAnswers(Long q_id) {
        Session session = factory.openSession();
        ArrayList<Answers> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Answers where question_id = :que");
        //q.setLong(0, q_id);
        q.setParameter("que", q_id);
        hasil = (ArrayList<Answers>) q.list();
        tx.commit();
        session.close();
        return hasil;
    }
    public Users getUser(String email){
        Session session = factory.openSession();
        Users u = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Users u where u.email = :em");
        q.setParameter("em", email);
        u = (Users) q.uniqueResult();
        tx.commit();
        session.close();
        
        return u;
    }
    
    public Users getUser(Long uid){
        Session session = factory.openSession();
        Users u = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Users u where u.userId = :uid");
        q.setParameter("uid", uid);
        u = (Users) q.uniqueResult();
        tx.commit();
        session.close();
        
        return u;
    }
    
    public boolean newQuestion(Questions q){
        boolean res = true;
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.save(q);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            res = false;
        }
        session.close();
        return res;
    }
    
    public boolean newAnswer(Answers a){
        boolean res = true;
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.save(a);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            res = false;
        }
        session.close();
        return res;
    }
    
    public boolean updateProfile(Users u) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Users user = (Users) session.get(Users.class, u.getUserId());
        System.out.println("UPDATE = "+user);
        user.setName(u.getName());
        user.setEmail(u.getEmail());
        user.setPassword(u.getPassword());
        user.setAvatar(u.getAvatar());
        tx.commit();
        session.close();
        return true;
    }
}
