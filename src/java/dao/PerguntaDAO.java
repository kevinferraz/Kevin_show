/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import modelo.Conexao;
import modelo.Jogador;
import modelo.Pergunta;

/**
 *
 * @author kevin
 */
public class PerguntaDAO {
    EntityManager em;
    
    public PerguntaDAO() throws Exception {
        EntityManagerFactory emf;
        emf = Conexao.getConexao();
        em = emf.createEntityManager();
    }
    
    public void incluir(Pergunta obj) throws Exception {
        try {
            em.getTransaction().begin();
            em.persist(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } 
        
    }

    public List<Pergunta> listar() throws Exception {
        return em.createNamedQuery("Pergunta.findAll").getResultList();
    }
    
    public void alterar(Pergunta obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.merge(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } 
    }
    
    public void excluir(Pergunta obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.remove(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
        } 
    }
     public Pergunta buscarPorChavePrimaria(Integer id){
        return em.find (Pergunta.class, id);
        
    }

    public void fechaEmf() {
        em.close();
        Conexao.closeConexao();
    }
    

}
