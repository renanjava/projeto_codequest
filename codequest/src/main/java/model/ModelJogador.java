package model;

import java.util.List;

public class ModelJogador {
	private String nome;
	private String email;
	private String genero;
	private int qtdPortasAbertas;
	private List<String> conquistas;
	private int qtdEstrelasGanhas;
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) {
		this.genero = genero;
	}

}
