package br.com.dbe.acao.controller;

import java.util.List;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.com.dbe.acao.dao.AcaoDAO;
import br.com.dbe.acao.entity.Acao;

@Resource
public class AcaoController {

	private AcaoDAO dao;
	private final Result result;
		
	public AcaoController(AcaoDAO dao, Result result) {
		this.dao = dao;
		this.result = result;
	}

	public void incluir() {
	}
	
	@SuppressWarnings("deprecation")
	public void adicionar(Acao acao) {
		dao.insert(acao);
		result.use(Results.page()).forward("/WEB-INF/jsp/acao/sucesso.jsp");		
	}
	
	@Path(value="/acao/lista")
	public List<Acao> lista() {
		return dao.buscaTodos();
	}

}
