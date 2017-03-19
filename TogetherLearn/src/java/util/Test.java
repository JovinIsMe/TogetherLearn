/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import model.Answers;
import model.Questions;

/**
 *
 * @author Filipus
 */
public class Test {

    public static void main(String[] args) {
        DataAkses da = new DataAkses();
        String q_id = "1488984053715";
        //Questions q = da.getQuestions(Long.parseLong((String) q_id));
        for (Answers a : da.getAnswers()) {
            //System.out.println("Q_id ");
            System.out.println("Answer : " + a.getContent());
        }
    }
}
