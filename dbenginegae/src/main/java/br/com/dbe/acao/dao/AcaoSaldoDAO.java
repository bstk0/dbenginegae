package br.com.dbe.acao.dao;

import java.util.List;

import br.com.caelum.vraptor.ioc.Component;
import br.com.dbe.acao.entity.AcaoSaldo;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;

@Component
public class AcaoSaldoDAO {

	Objectify datastore;
	
	static { ObjectifyService.register(AcaoSaldo.class); }
	
	public AcaoSaldoDAO() {
		datastore = ObjectifyService.begin();
	}
	
	public void  salvar(AcaoSaldo acao) {
		datastore.put(acao);
	}
	
	public void  update(AcaoSaldo acao) {
		datastore.put(acao);
	}

	public AcaoSaldo edit(Long Id) {
		return new AcaoSaldo();
	}
	
	public void insert(AcaoSaldo acao) {
		salvar(acao);
	}
	
	public AcaoSaldo buscar(Long Id) {
		return datastore.get(AcaoSaldo.class, Id);
	}
	
	public void delete(AcaoSaldo acao) {
		datastore.delete(acao);
	}
	
	public void delete(Long Id) {
		
	}
	
	public List<AcaoSaldo> buscaTodos(){
		System.out.println("AcaoSaldoDAO.buscaTodos...");
		return datastore.query(AcaoSaldo.class).list();
	}

	public List<AcaoSaldo> list(Integer mes){
		//return datastore.query(Niver.class).filter("mes", mes).order("dia").list();
		return datastore.query(AcaoSaldo.class).list();
	}
	
}
