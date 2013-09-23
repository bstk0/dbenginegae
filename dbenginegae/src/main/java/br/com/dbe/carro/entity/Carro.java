package br.com.dbe.carro.entity;

import javax.persistence.Id;

public class Carro {

	@Id
	private Long id;
	private String marca;
	private String modelo;
	private String cor;
	private boolean licenciado;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	public String getCor() {
		return cor;
	}
	public void setCor(String cor) {
		this.cor = cor;
	}
	public boolean isLicenciado() {
		return licenciado;
	}
	public void setLicenciado(boolean licenciado) {
		this.licenciado = licenciado;
	}
		
}
