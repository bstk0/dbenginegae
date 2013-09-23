package br.com.dbe.acao.entity;

import java.util.Date;

import javax.persistence.Id;

import br.com.dbe.acao.dao.AcaoDAO;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.NotSaved;

public class AcaoSaldo {

	@Id
	private Long id;
	private Date ultimaMovimentacao;
	private MovimentacaoCode tipoMovimentacao;
	private String strData;
	private Double saldo;
	private int qtde;
	Key<Acao> acao;
	@NotSaved private Acao acaoObj;

	public MovimentacaoCode getTipoMovimentacao() {
		return tipoMovimentacao;
	}
	public void setTipoMovimentacao(MovimentacaoCode tipoMovimentacao) {
		this.tipoMovimentacao = tipoMovimentacao;
	}
	public String getStrData() {
		return strData;
	}
	public void setStrData(String strData) {
		this.strData = strData;
	}
	public Key<Acao> getAcao() {
		return acao;
	}
	public void setAcao(Key<Acao> acao) {
		this.acao = acao;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getUltimaMovimentacao() {
		return ultimaMovimentacao;
	}
	public void setUltimaMovimentacao(Date ultimaMovimentacao) {
		this.ultimaMovimentacao = ultimaMovimentacao;
	}
	public Double getSaldo() {
		return saldo;
	}
	public void setSaldo(Double saldo) {
		this.saldo = saldo;
	}
	public int getQtde() {
		return qtde;
	}
	public void setQtde(int qtde) {
		this.qtde = qtde;
	}
	public Acao getAcaoObj() {
		if (this.acaoObj == null && this.acao != null) {
			Acao acaoObj = new Acao();
			acaoObj.setId(acao.getId());
			this.acaoObj = new AcaoDAO().buscar(acao.getId());
		}
		return this.acaoObj;
	}
	public void setAcaoObj(Acao acaoObj) {
		this.acaoObj = acaoObj;
		if (acaoObj != null && acaoObj.getId() != null) {
			this.acao = new Key<Acao>(Acao.class, acaoObj.getId());
		}	
	}
	
}
