package br.com.dbe.acao.controller;

import java.sql.Date;
import java.util.List;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.com.dbe.acao.dao.AcaoSaldoDAO;
import br.com.dbe.acao.entity.Acao;
import br.com.dbe.acao.entity.AcaoSaldo;

import com.googlecode.objectify.Key;

@Resource
public class AcaoSaldoController {
	
	private AcaoSaldoDAO dao;
	private final Result result;
		
	public AcaoSaldoController(AcaoSaldoDAO dao, Result result) {
		this.dao = dao;
		this.result = result;
	}

	@Path("/acaosaldo/incluir")
	public void incluir() {
	}

	@SuppressWarnings("deprecation")
	@Path("/acaosaldo/adicionar")
	public void adicionar(AcaoSaldo acaosaldo, String acaoId) {
		//System.out.println("=> acaoSaldo.acao.id:" + acaoId);
		//Acao acao = acaoDao.buscar(Long.parseLong(acaoId));
		//System.out.println("=> acao.sigla:" + acao.getSigla() );
		//acaosaldo.setAcao( (new Key<Acao>(Acao.class,acao.getId())) );
		acaosaldo.setAcao( (new Key<Acao>(Acao.class,Long.parseLong(acaoId))) );
		acaosaldo.setUltimaMovimentacao(Date.valueOf(acaosaldo.getStrData()));
		//acaosaldo.setAcaoObj(acao);
		dao.insert(acaosaldo);
		result.use(Results.page()).forward("/WEB-INF/jsp/acaoSaldo/sucesso.jsp");		
	}
	
	@Path(value="/acaosaldo/lista")
	public List<AcaoSaldo> lista() {
		return dao.buscaTodos();
	}
	
	
}
