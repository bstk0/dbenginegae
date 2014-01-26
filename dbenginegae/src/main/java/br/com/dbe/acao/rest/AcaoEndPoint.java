package br.com.dbe.acao.rest;

import java.util.List;

import br.com.dbe.acao.dao.AcaoDAO;
import br.com.dbe.acao.entity.Acao;

import com.google.api.server.spi.config.Api;
import com.google.api.server.spi.config.ApiMethod;

@Api(name = "stock")
public class AcaoEndPoint {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	@ApiMethod(name = "listAll")
	public List<Acao> buscaTodos(){
		AcaoDAO dao = new AcaoDAO();
		return dao.buscaTodos();
	}
	
}
