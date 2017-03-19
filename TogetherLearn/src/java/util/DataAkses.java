package util;

import java.util.ArrayList;
import model.Answers;
import model.Questions;
import model.Users;
import model.VoteAnswer;
import model.VoteQuestion;
import model.VoteQuestionId;
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

    public ArrayList<Questions> getMyQuestions(Long uid){
        Session session = factory.openSession();
        ArrayList<Questions> hasil = null;
        Query q = session.createQuery("from Questions where user_id = :userId");
        q.setParameter("userId", uid);
        hasil = (ArrayList<Questions>) q.list();
        session.close();
        return hasil;
    }
    
    public ArrayList<Questions> getUnanswered(){
        Session session = factory.openSession();
        ArrayList<Answers> temp = null;
        Query q = session.createQuery("from Answers where count(*) = 0 group by question_id");
        temp = (ArrayList<Answers>) q.list();
        
        ArrayList<Questions> hasil = null;
        for (Answers answer : temp) {
            Query b = session.createQuery("from Questions where questionId = :q_id");
            b.setParameter("q_id", answer.getQuestions().getQuestionId());
            hasil = (ArrayList<Questions>) b.list();
            hasil.addAll(hasil);
        }
        
        session.close();
        return hasil;
    }
    
    public ArrayList<Questions> getMyAnswers(Long uid){
        Session session = factory.openSession();
        ArrayList<Answers> temp = null;
        Query a = session.createQuery("from Answers where user_id = :userId");
        a.setParameter("userId", uid);
        temp = (ArrayList<Answers>) a.list();
        
        ArrayList<Questions> hasil = null;
        for (Answers answer : temp) {
            Query b = session.createQuery("from Questions where questionId = :q_id");
            b.setParameter("q_id", answer.getQuestions().getQuestionId());
            hasil = (ArrayList<Questions>) b.list();
            hasil.addAll(hasil);
        }
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
    
    public Questions getQuestion(long questionId){
        Session session = factory.openSession();
        Questions t = null;
        Transaction tx = session.beginTransaction();

        Query q = session.createQuery("from Questions where question_id = :em");
        q.setParameter("em",questionId);
        t = (Questions) q.uniqueResult();
        tx.commit();
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
        user.setName(u.getName());
        user.setEmail(u.getEmail());
        user.setPassword(u.getPassword());
        user.setAvatar(u.getAvatar());
        tx.commit();
        session.close();
        return true;
    }
    
    public boolean cekQuestionVote(Long qid, Long uid){
        boolean h = true;
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        VoteQuestion vq2 = null;
        vq2 = (VoteQuestion) session.get(VoteQuestion.class, new VoteQuestionId(uid, qid));
        
        tx.commit();
        session.close();
        
        if (vq2==null) {
            h=false;
        }
        return h;
    }
    
    public long getSumQuestionVote(Long qid){
        Long l = Long.parseLong("0");
        ArrayList<VoteQuestion> vq = null;
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from VoteQuestion where question_Id = :qid");
        q.setParameter("qid", qid);
        
        vq = (ArrayList<VoteQuestion>) q.list();
        
        for (VoteQuestion a : vq) {
            l+=a.getVote();
        }
        
        tx.commit();
        session.close();
        return l;
    }
    
    public void voteQuestion(Long qid, Long uid, String vote) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        
        VoteQuestion vq2 = (VoteQuestion) session.get(VoteQuestion.class, new VoteQuestionId(uid,qid));
        Long v = vq2.getVote();
        if (vote.equals("up") && v < 1){
            v++;
            vq2.setVote(v);
        } else if (vote.equals("down") && v > -1){
            v--;
            vq2.setVote(v);
        }
        tx.commit();
        session.close();
    }
    
    public void NewvoteQuestion(Long qid, Long uid, String vote) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        Questions q = getQuestion(qid);
        Users u = getUser(uid);
        System.out.println(u);
//        session.saveOrUpdate(q);
//        session.saveOrUpdate(u);
        VoteQuestion vq = new VoteQuestion();
        vq.setId(new VoteQuestionId(u.getUserId(), q.getQuestionId()));
        vq.setQuestions(q);
        vq.setUsers(u);
        if (vote.equals("up")){
            vq.setVote(Long.parseLong("+1"));
        } else if (vote.equals("down")){
            vq.setVote(Long.parseLong("-1"));
        }
//        VoteQuestion vq2 = (VoteQuestion) session.get(VoteQuestion.class, new VoteQuestionId(q.getQuestionId(), u.getUserId()));
//        Long v = vq2.getVote();
//        if (vote.equals("up") && v < 1){
//            v++;
//            vq.setVote(v);
//        } else if (vote.equals("down") && v > -1){
//            v--;
//            vq.setVote(v);
//        }
        session.save(vq);
        tx.commit();
        session.close();
    }
}
