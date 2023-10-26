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
    
    private List<String> perguntasDiscipEstrutura = new ArrayList<>
    	(Arrays.asList(
            "Qual é o operador usado para obter o valor de uma variável apontada por um ponteiro em C?",
            "Como você verifica se uma sequência de parênteses em uma expressão é balanceada usando uma pilha em C?",
            "Como você inverte uma pilha em C usando apenas operações de pilha?",
            "Como uma fila é geralmente implementada em C?",
            "Qual é a diferença principal entre malloc() e calloc() em C?",
            "Qual é a principal vantagem das listas encadeadas em relação aos arrays em C?",
            "Qual é a principal vantagem das listas duplamente encadeadas em relação às listas encadeadas simples em C?",
            "Qual é a principal vantagem de uma lista circular sobre uma lista encadeada simples em C?",
            "Qual é a principal vantagem da alocação dinâmica de memória em C?",
            "O que acontece se você usar realloc() para reduzir o tamanho de um bloco de memória?"
    	));
    
    private String[] respostas1 = {"*","&","$","%","sizeof"};
    
    private String[] respostas2 = {"Comparando os números de parênteses abertos e fechados.",
    							   "Verificando se há um número ímpar de parênteses.",
    							   "Usando uma pilha para rastrear os parênteses abertos e fechados.",
    							   "Contando os parênteses à direita e à esquerda.",
    							   "Não é possível verificar usando uma pilha."};
    
    private String[] respostas3 = {"Remover todos os elementos e inserir novamente na ordem inversa.",
    							   "Criar uma pilha auxiliar, transferir os elementos e transferir de volta para a pilha original.",
    							   "Multiplicar todos os elementos por -1.",
    							   "Adicionar um elemento de controle no topo da pilha e inverter todos os elementos.",
    							   "Não é possível inverter uma pilha usando apenas operações de pilha."};
    
    private String[] respostas4 = {"Usando uma lista encadeada.",
    							   "Usando um array.",
    							   "Usando um vetor dinâmico.",
    							   "Usando uma pilha.",
    							   "Usando uma matriz bidimensional."};
    
    private String[] respostas5 = {"malloc() aloca memória contígua, enquanto calloc() aloca memória não contígua.",
    							   "malloc() não inicializa a memória alocada, enquanto calloc() a inicializa com zero.",
    							   "malloc() só pode alocar um bloco de memória por vez, enquanto calloc() pode alocar múltiplos blocos de memória.",
    							   "calloc() aloca memória contígua, enquanto malloc() aloca memória não contígua.",
    							   "Não há diferença entre malloc() e calloc()."};
    
    private String[] respostas6 = {"Melhor desempenho em operações de busca.",
    							   "Consumo de memória menor.",
    							   "Facilidade de acesso a elementos aleatórios.",
    							   "Capacidade dinâmica de crescimento.",
    							   "Melhor desempenho em operações de ordenação."};
    
    private String[] respostas7 = {"Consumo de memória menor.",
    							   "Melhor desempenho em operações de busca.",
    							   "Facilidade de implementação.",
    							   "Capacidade dinâmica de crescimento.",
    							   "Facilidade em acessar elementos na ordem inversa."};
    
    private String[] respostas8 = {"Melhor desempenho em operações de busca.",
    							   "Facilidade de implementação.",
    							   "Possibilidade de percorrer a lista indefinidamente sem encontrar um nó NULL.",
    							   "Capacidade dinâmica de crescimento.",
    							   "Facilidade em inserir ou remover elementos no meio da lista."};
    
    private String[] respostas9 = {"Maior velocidade de execução.",
    							   "Menor consumo de memória.",
    							   "Maior facilidade de implementação.",
    							   "Capacidade de alocar memória conforme necessário durante a execução.",
    							   "Maior segurança na manipulação de dados."};
    
    private String[] respostas10 = {"A função gera um erro de compilação.",
    								"A função reduz o tamanho do bloco de memória para o valor especificado.",
    								"A função cria um novo bloco de memória com o tamanho desejado e copia os dados do bloco original para o novo bloco.",
    								"A função retorna NULL.",
    								"A função não pode ser usada para reduzir o tamanho de um bloco de memória."};
    
    
    private List<String[]> respostasDiscipEstrutura = new ArrayList<>
    	(Arrays.asList(
    		respostas1,respostas2,respostas3,respostas4,respostas5,
    		respostas6,respostas7,respostas8,respostas9,respostas10
    	));
    
    public PreparaSalas() {
    	escolherPosicoes();
    	atribuirEnderecos();
    }

    
    public void escolherPosicoes() {
        int cont = 0;
        int posicaoSorteada;
        
        while(cont != 4) {
        	do
            	posicaoSorteada = random.nextInt(4);
            while(posicoesSorteadas.contains(posicaoSorteada));
            
        	posicoesSorteadas.add(posicaoSorteada);
        	
        	int[] idPortas = new int[11];
        	
        	for(int o = 0; o < 11; o++){
				boolean numeroExistente;
				do{
					posicaoSorteada = random.nextInt(40) + 1;
				    numeroExistente = false;
				    for(int i = 0; i < 11; i++){
						if(idPortas[i] == posicaoSorteada)
							numeroExistente = true;
				   	}
			   }while(numeroExistente);
				idPortas[o] = posicaoSorteada;	   
			}
        	switch(cont) {
        	case 0: idPortaDesafio1 = idPortas[random.nextInt(11)]; break;
        	case 1: idPortaDesafio2 = idPortas[random.nextInt(11)]; break;
        	case 2: idPortaDesafio3 = idPortas[random.nextInt(11)]; break;
        	case 3: idPortaDesafio4 = idPortas[random.nextInt(11)]; break;
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
	
	public List<String> getPerguntasDiscipEstrutura(){
		return perguntasDiscipEstrutura;
	}
	
	public List<String[]> getRespostasDiscipEstrutura(){
		return respostasDiscipEstrutura;
	}
   
}
