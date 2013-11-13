package br.com.dbe.acao.entity;

import javax.persistence.Id;

public class Acao {

	@Id
	private Long id;
	private String sigla;
	private String nome;
	private String descricao;
	//private Double saldo;
	private String saldo;
	
public String getSaldo() {
		return saldo;
	}
	public void setSaldo(String saldo) {
		this.saldo = saldo;
	}
	//	public Double getSaldo() {
//		return saldo;
//	}
//	public void setSaldo(Double saldo) {
//		this.saldo = saldo;
//	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getSigla() {
		return sigla;
	}
	public void setSigla(String sigla) {
		this.sigla = sigla;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	

}
