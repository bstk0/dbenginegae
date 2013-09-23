package br.com.dbe.acao.entity;

import java.util.Date;

import javax.persistence.Id;

import com.googlecode.objectify.Key;

public class AcaoMovimentacao {
	
	@Id
	private Long id;
	Key<Acao> acao;
	private Date data;
	private double valor;
	private int qtde;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Key<Acao> getAcao() {
		return acao;
	}
	public void setAcao(Key<Acao> acao) {
		this.acao = acao;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	public int getQtde() {
		return qtde;
	}
	public void setQtde(int qtde) {
		this.qtde = qtde;
	}
	
}
