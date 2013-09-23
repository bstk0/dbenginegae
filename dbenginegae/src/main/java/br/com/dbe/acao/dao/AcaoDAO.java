package br.com.dbe.acao.dao;

import java.util.List;

import br.com.caelum.vraptor.ioc.Component;
import br.com.dbe.acao.entity.Acao;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;

@Component
public class AcaoDAO {

	Objectify datastore;
	
	static { ObjectifyService.register(Acao.class); }
	
	public AcaoDAO() {
		datastore = ObjectifyService.begin();
	}
	
	public void  salvar(Acao acao) {
		datastore.put(acao);
	}
	
	public void  update(Acao acao) {
		datastore.put(acao);
	}

	public Acao edit(Long Id) {
		return new Acao();
	}
	
	public void insert(Acao acao) {
		salvar(acao);
	}
	
	public Acao buscar(Long Id) {
		return datastore.get(Acao.class, Id);
	}
	
	public void delete(Acao acao) {
		datastore.delete(acao);
	}
	
	public void delete(Long Id) {
		
	}
	
	public List<Acao> buscaTodos(){
		return datastore.query(Acao.class).list();
	}

	public List<Acao> list(Integer mes){
		//return datastore.query(Niver.class).filter("mes", mes).order("dia").list();
		return datastore.query(Acao.class).list();
	}
	
}
