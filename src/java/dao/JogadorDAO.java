/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;
import modelo.Conexao;
import modelo.Jogador;

/**
 *
 * @author kevin
 */
public class JogadorDAO {
    EntityManager em;
    
    public JogadorDAO() throws Exception {
        EntityManagerFactory emf;
        emf = Conexao.getConexao();
        em = emf.createEntityManager();
    }
    
    public void incluir(Jogador obj) throws Exception {
        try {
            em.getTransaction().begin();
            em.persist(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } 
        
    }
    //método realizar login: Recebe como parâmetro o login e a senha, 
    //retornando o objeto do jogador logado, ou null se n encontrar
    public Jogador realizarLogin(String login, String senha){
        TypedQuery<Jogador>query=em.createNamedQuery("Jogador.realizarLogin", Jogador.class);
        //seto os parâmetros
        query.setParameter("login", login);
        query.setParameter("senha", senha);
        Jogador jogador;
        try{
            jogador = query.getSingleResult();
        }
        catch(Exception e){
            jogador = null;
        
        }
         return jogador;
    }

    public List<Jogador> listar() throws Exception {
        return em.createNamedQuery("Jogador.findAll").getResultList();
    }
    
    public void alterar(Jogador obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.merge(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } 
    }
    
    public void excluir(Jogador obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.remove(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
        } 
    }
    
    public Jogador buscarPorChavePrimaria(String login){
        return em.find (Jogador.class, login);
    }

    public void fechaEmf() {
        em.close();
        Conexao.closeConexao();
    }
    

    
}
