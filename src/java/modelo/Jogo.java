/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.PerguntaDAO;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kevin
 */
public class Jogo {
     private List<Pergunta> listapergunta;
     private Integer pontuacao;
     private Integer pulos ;
     
     public Jogo(){
     pulos = 3;
     pontuacao = 0;
     this.listapergunta = new ArrayList<Pergunta>();
     }

    public List<Pergunta> getListapergunta() {
        return listapergunta;
    }

    public void setListapergunta(List<Pergunta> listapergunta) {
        this.listapergunta = listapergunta;
    }

    public Integer getPontuacao() {
        return pontuacao;
    }

    public void setPontuacao(Integer pontuacao) {
        this.pontuacao = pontuacao;
    }

    public Integer getPulos() {
        return pulos;
    }

    public void setPulos(Integer pulos) {
        this.pulos = pulos;
    }
    
    public Integer getAcerto(){
        Integer acerto = 0;
        if(this.pontuacao == 0){
        acerto = 1000;
        }
        else if(this.pontuacao >= 1000){
            acerto= pontuacao  + 1000;
            if(this.pontuacao  >= 50000){
              acerto=this.pontuacao * 2;          
            }
        }
        return acerto;
    }
    
    public Integer getErro(){
         Integer erro = 0;
        if(pontuacao == 0 || pontuacao == 1000000){
            return erro;
        }
        else if(pontuacao != 0){
            erro = pontuacao / 2;
        }
    return erro;
    }
    public void iniciar(){
         try {
             //carrega as perguntas
             PerguntaDAO dao = new PerguntaDAO();
             this.setListapergunta(dao.listar());
         } catch (Exception ex) {
             Logger.getLogger(Jogo.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
    
    public boolean confirmar(String opcaomarcada){
     if(opcaomarcada.equals(this.getListapergunta().get(0).getCerta())){
         //excluo a pergunta atual
         this.getListapergunta().remove(0);
         this.setPontuacao(this.getAcerto());
         return true;
     }
     else
         this.setPontuacao(this.getErro());
         return false;
    }
    
    public boolean pular(){
        if(this.pulos != 0){
           this.pulos --;  
           this.getListapergunta().remove(0);
            return true;  
        }
        else 
            return false;
    }
}