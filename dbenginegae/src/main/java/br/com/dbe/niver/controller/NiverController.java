package br.com.dbe.niver.controller;

import java.sql.Date;
import java.util.List;

import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.com.dbe.niver.dao.NiverDAO;
import br.com.dbe.niver.entity.Niver;

@Resource
public class NiverController {

	private NiverDAO dao;
	private final Result result;
		
	public NiverController(NiverDAO dao, Result result) {
		this.dao = dao;
		this.result = result;
	}

	// form
	public void form(Integer mes) {
		System.out.println("-> NiversController.form");
		//List<Mes> listMeses = new MesDAO().lista();
		//result.include("mesList", listMeses);
		if ((mes != null) && (mes != 0)) {
			System.out.println(mes + "-> mes nao nulo.");
			//List<Nivers> nivers = new NiversDAO().list(mes);
			List<Niver> nivers = dao.list(mes);
			result.include("niversList", nivers);
			result.include("mesSelected", mes);
		}
	}
	
	//form
	public Niver edit(String id) {
		System.out.println(" --> edit:" + id);
		//Niver niver = dao.edit(Long.parseLong(id.trim()));
		//return niver;
		return dao.buscar(new Long(id));
	}
	
	//form
	public void insert(){
	}
	
	// data
	@SuppressWarnings("deprecation")
	public void add(Niver niver) {
		System.out.println("Nome:" + niver.getNome());
		System.out.println("Data:" + niver.getData());
		System.out.println("strData:" + niver.getStrData());
		//parse do strData para o formato Date.
		niver.setData(Date.valueOf(niver.getStrData()));
		niver.setMes(new Integer(niver.getStrData().substring(5, 7)));
		niver.setDia(new Integer(niver.getStrData().substring(8, 10)));
		System.out.println("Mes:" + niver.getMes());
		System.out.println("Dia:" + niver.getDia());
		//new NiversDAO().insert(niver);
		dao.insert(niver);
		result.use(Results.page()).forward("/WEB-INF/jsp/niver/atualiza.jsp");
	}
	
	// data
	public void atualiza(Niver niver) {
		System.out.println("Atualizando...");
		System.out.println("tel->" + niver.getTel());
		System.out.println("data->" + niver.getData());
		System.out.println("strData->" + niver.getStrData());
		//parse do strData para o formato Date.
		niver.setData(Date.valueOf(niver.getStrData()));
		niver.setMes(new Integer(niver.getStrData().substring(5, 7)));
		niver.setDia(new Integer(niver.getStrData().substring(8, 10)));
		System.out.println("após parse: data->" + niver.getData());
		//new NiversDAO().update(niver);
		dao.update(niver);
		System.out.println("Atualizado");
	}
	
	// data
	public void exclui(Long id, Integer mes) {
		System.out.println(" --> excluir:" + id);
		//new NiversDAO().delete(id);
		dao.delete(id);
		//Nivers niver = new NiversDAO().edit(Long.parseLong(id.trim()));
		result.use(Results.logic()).redirectTo(NiverController.class).form(mes);
	}
}
