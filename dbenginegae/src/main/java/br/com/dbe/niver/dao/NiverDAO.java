package br.com.dbe.niver.dao;

import java.util.List;

import br.com.caelum.vraptor.ioc.Component;
import br.com.dbe.niver.entity.Niver;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.Query;

@Component
public class NiverDAO {

	Objectify datastore;
	
	static { ObjectifyService.register(Niver.class); }
	
	public NiverDAO() {
		datastore = ObjectifyService.begin();
	}
	
	public void  salvar(Niver niver) {
		datastore.put(niver);
	}
	
	public void  update(Niver niver) {
		datastore.put(niver);
	}

	public Niver edit(Long Id) {
		return new Niver();
	}
	
	public void insert(Niver niver) {
		salvar(niver);
	}
	
	public Niver buscar(Long Id) {
		return datastore.get(Niver.class, Id);
	}
	
	public void delete(Niver niver) {
		datastore.delete(niver);
	}
	
	public void delete(Long Id) {
		
	}
	
	public List<Niver> buscaTodos(){
		return datastore.query(Niver.class).list();
	}

	public List<Niver> list(Integer mes){
		return datastore.query(Niver.class).filter("mes", mes).order("dia").list();
	}

}
