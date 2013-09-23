package br.com.dbe.carro.dao;

import java.util.List;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;

import br.com.caelum.vraptor.ioc.Component;
import br.com.dbe.carro.entity.Carro;

@Component
public class CarroDAO {

	Objectify datastore;
	
	static { ObjectifyService.register(Carro.class); }
	
	public CarroDAO() {
		datastore = ObjectifyService.begin();
	}
	
	public void  salvar(Carro carro) {
		datastore.put(carro);
	}
	
	public Carro buscar(Long Id) {
		return datastore.get(Carro.class, Id);
	}
	
	public void deleta(Carro carro) {
		datastore.delete(carro);
	}
	
	public List<Carro>buscaTodos(){
		return datastore.query(Carro.class).list();
	}
	
}
