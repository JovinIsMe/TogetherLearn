package model;
// Generated Feb 16, 2017 4:30:43 PM by Hibernate Tools 4.3.1



/**
 * VoteQuestionId generated by hbm2java
 */
public class VoteQuestionId  implements java.io.Serializable {


     private long userId;
     private long questionId;

    public VoteQuestionId() {
    }

    public VoteQuestionId(long userId, long questionId) {
       this.userId = userId;
       this.questionId = questionId;
    }
   
    public long getUserId() {
        return this.userId;
    }
    
    public void setUserId(long userId) {
        this.userId = userId;
    }
    public long getQuestionId() {
        return this.questionId;
    }
    
    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof VoteQuestionId) ) return false;
		 VoteQuestionId castOther = ( VoteQuestionId ) other; 
         
		 return (this.getUserId()==castOther.getUserId())
 && (this.getQuestionId()==castOther.getQuestionId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + (int) this.getUserId();
         result = 37 * result + (int) this.getQuestionId();
         return result;
   }   


}

