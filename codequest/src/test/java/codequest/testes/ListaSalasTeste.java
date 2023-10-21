package codequest.testes;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;

import listas.ListaSalas;

public class ListaSalasTeste {
	
	@Test
	public void deveMudarOsEnderecos() {
		ListaSalas lista = new ListaSalas();
		String[] enderecos = {"", "", "", ""};
		
		assertNotEquals(enderecos, lista.getEnderecos());
	}
	
	@Test
	public void deveMudarAsPosicoesSorteadas(){
		ListaSalas lista = new ListaSalas();
		int[] posicoesSorteadas = {99, 99, 99, 99};
		
		assertNotEquals(posicoesSorteadas, lista.getPosicoesSorteadas());
		
	}
	
	@Test
	public void deveSerUmaListDeSalas(){
		ListaSalas listaSala = new ListaSalas();
		List<String> listaCopy = new ArrayList<String>();
		listaCopy.add("estrutura-de-dados-i");
		listaCopy.add("programacao-orientada-a-objetos");
		listaCopy.add("banco-de-dados-ii");
		listaCopy.add("teste-e-qualidade-de-software");
		
		assertEquals(listaCopy, listaSala.getSalasExistentes());
	}
}
