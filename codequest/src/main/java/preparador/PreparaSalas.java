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
    private Random random = new Random();
    private int idPortaDesafio1;
    private int idPortaDesafio2;
    private int idPortaDesafio3;
    private int idPortaDesafio4;
    private PreparaDisciplinas disciplinas = new PreparaDisciplinas(); 
    
    
    public PreparaSalas() {
    	escolherPosicoes();
    	atribuirEnderecos();
    }

    
    private void escolherPosicoes() {
        int cont = 0;
        int posicaoSorteada;
        
        while(cont != 4) {
        	do
            	posicaoSorteada = random.nextInt(4);
            while(posicoesSorteadas.contains(posicaoSorteada));
            
        	posicoesSorteadas.add(posicaoSorteada);
        	
        	int[] idPortas = new int[10];
        	int portaDesafio = random.nextInt(40) + 1;
        	
        	for(int o = 0; o < 10; o++){
				boolean numeroExistente;
				do{
					posicaoSorteada = random.nextInt(40) + 1;
				    numeroExistente = false;
				    for(int i = 0; i < 10; i++){
						if(idPortas[i] == posicaoSorteada || posicaoSorteada == portaDesafio)
							numeroExistente = true;
				   	}
			   }while(numeroExistente);
				idPortas[o] = posicaoSorteada;	   
			}
        	
        	
        	switch(cont) {
        	case 0: idPortaDesafio1 = portaDesafio; break;
        	case 1: idPortaDesafio2 = portaDesafio; break;
        	case 2: idPortaDesafio3 = portaDesafio; break;
        	case 3: idPortaDesafio4 = portaDesafio; break;
        	}
        	EventosIdPortasSalas.add(idPortas);
            cont++;
        }
    }
    
    public int getIdPortaDesafio(int sala) {
		
		switch(sala) {
		case 1: return idPortaDesafio1;
		case 2: return idPortaDesafio2;
		case 3: return idPortaDesafio3;
		case 4: return idPortaDesafio4;	
		}
		return 888888888;
	}
    
    private void atribuirEnderecos() {
    	for(int i = 0; i < 4; i++) 
    		enderecos[i] = salasExistentes.get(posicoesSorteadas.get(i));
    }
    
    
    public PreparaDisciplinas getDisciplinas() {
		return disciplinas;
	}


	public void setDisciplinas(PreparaDisciplinas disciplinas) {
		this.disciplinas = disciplinas;
	}


	public int getIdPortaDesafio1() {
		return idPortaDesafio1;
	}


	public int getIdPortaDesafio2() {
		return idPortaDesafio2;
	}


	public int getIdPortaDesafio3() {
		return idPortaDesafio3;
	}


	public int getIdPortaDesafio4() {
		return idPortaDesafio4;
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
