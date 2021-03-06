package model;
// Generated Feb 16, 2017 4:30:43 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Questions generated by hbm2java
 */
public class Questions  implements java.io.Serializable {


     private long questionId;
     private Users users;
     private String title;
     private String message;
     private Date time;
     private String tag;
     private Set<Answers> answerses = new HashSet<Answers>(0);
     private Set<VoteQuestion> voteQuestions = new HashSet<VoteQuestion>(0);

    public Questions() {
    }

	
    public Questions(long questionId, Date time) {
        this.questionId = questionId;
        this.time = time;
    }
    public Questions(long questionId, Users users, String title, String message, Date time, String tag, Set<Answers> answerses, Set<VoteQuestion> voteQuestions) {
       this.questionId = questionId;
       this.users = users;
       this.title = title;
       this.message = message;
       this.time = time;
       this.tag = tag;
       this.answerses = answerses;
       this.voteQuestions = voteQuestions;
    }
   
    public long getQuestionId() {
        return this.questionId;
    }
    
    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }
    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    public String getMessage() {
        return this.message;
    }
    
    public void setMessage(String message) {
        this.message = message;
    }
    public Date getTime() {
        return this.time;
    }
    
    public void setTime(Date time) {
        this.time = time;
    }
    public String getTag() {
        return this.tag;
    }
    
    public void setTag(String tag) {
        this.tag = tag;
    }
    public Set<Answers> getAnswerses() {
        return this.answerses;
    }
    
    public void setAnswerses(Set<Answers> answerses) {
        this.answerses = answerses;
    }
    public Set<VoteQuestion> getVoteQuestions() {
        return this.voteQuestions;
    }
    
    public void setVoteQuestions(Set<VoteQuestion> voteQuestions) {
        this.voteQuestions = voteQuestions;
    }




}


