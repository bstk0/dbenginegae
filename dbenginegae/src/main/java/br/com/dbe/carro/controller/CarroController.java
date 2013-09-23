package br.com.dbe.carro.controller;

import java.util.List;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.dbe.carro.dao.CarroDAO;
import br.com.dbe.carro.entity.Carro;

@Resource
public class CarroController {
	
	private CarroDAO dao;
	private Result result;
	
	public CarroController(CarroDAO dao,Result result) {
		this.dao = dao;
		this.result = result;
	}
	
	@Path(value="/carro/form")
	public void form() {
		
	}
	
	@Path(value="/carro/adiciona")
	public void adiciona(Carro carro) {
		dao.salvar(carro);
		//this.result.use(Results.page()).forward("/carro/lista.jsp");
		System.out.println(" adiciona ...");
		this.result.redirectTo(CarroController.class).lista();
	}
	
	@Path(value="/carro/lista")
	public List<Carro> lista() {
		return dao.buscaTodos();
	}
}
