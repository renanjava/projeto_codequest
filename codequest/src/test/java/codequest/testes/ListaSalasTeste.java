package codequest.testes;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;

import preparador.PreparaSalas;

public class ListaSalasTeste {
	
	@Test
	public void deveMudarOsEnderecos() {
		PreparaSalas lista = new PreparaSalas();
		String[] enderecos = {"", "", "", ""};
		
		assertNotEquals(enderecos, lista.getEnderecos());
	}
	
	@Test
	public void deveMudarAsPosicoesSorteadas(){
		PreparaSalas lista = new PreparaSalas();
		int[] posicoesSorteadas = {99, 99, 99, 99};
		
		assertNotEquals(posicoesSorteadas, lista.getPosicoesSorteadas());
		
	}
	
	@Test
	public void deveSerUmaListDeSalas(){
		PreparaSalas listaSala = new PreparaSalas();
		List<String> listaCopy = new ArrayList<String>();
		listaCopy.add("estrutura-de-dados-i");
		listaCopy.add("programacao-orientada-a-objetos");
		listaCopy.add("banco-de-dados-ii");
		listaCopy.add("teste-e-qualidade-de-software");
		
		assertEquals(listaCopy, listaSala.getSalasExistentes());
	}
}
