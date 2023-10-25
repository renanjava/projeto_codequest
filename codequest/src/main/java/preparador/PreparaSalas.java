package preparador;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

public class PreparaSalas {
	
    private List<String> salasExistentes = new ArrayList<>
    (Arrays.asList(
            "estrutura-de-dados-i",
            "programacao-orientada-a-objetos",
            "banco-de-dados-ii",
            "teste-e-qualidade-de-software"
    ));
    
    private List<Integer> posicoesSorteadas =  new ArrayList<>();
    private List<int[]> EventosIdPortasSalas =  new ArrayList<>();
    private String[] enderecos = {"", "", "", ""};
    
    public PreparaSalas() {
    	escolherPosicoes();
    	atribuirEnderecos();
    }

    
    public void escolherPosicoes() {
        Random random = new Random();
        int cont = 0;
        int posicaoSorteada;
        
        while(cont != 4) {
        	do
            	posicaoSorteada = random.nextInt(4);
            while(posicoesSorteadas.contains(posicaoSorteada));
            
        	posicoesSorteadas.add(posicaoSorteada);
        	
        	int[] idPortas = new int[11];
        	
        	for(var o = 0; o < 11; o++){
				boolean numeroExistente;
				do{
					posicaoSorteada = random.nextInt(40) + 1;
				    numeroExistente = false;
				    for(var i = 0; i < 11; i++){
						if(idPortas[i] == posicaoSorteada)
							numeroExistente = true;
				   	}
			   }while(numeroExistente);
				idPortas[o] = posicaoSorteada;	   
			}
        	EventosIdPortasSalas.add(idPortas);
            cont++;
        }
    }
    
    public void atribuirEnderecos() {
    	for(int i = 0; i < 4; i++) 
    		enderecos[i] = salasExistentes.get(posicoesSorteadas.get(i));
    }
    
    public String[] getEnderecos() {
    	return enderecos;
    }


	public List<String> getSalasExistentes() {
		return salasExistentes;
	}


	public List<Integer> getPosicoesSorteadas() {
		return posicoesSorteadas;
	}


	public List<int[]> getEventosIdPortasSalas() {
		return EventosIdPortasSalas;
	}
    
}
