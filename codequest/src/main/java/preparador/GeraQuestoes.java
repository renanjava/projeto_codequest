package preparador;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class GeraQuestoes {
	
	List<String> perguntasEstrutura = new ArrayList(Arrays.asList(
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
		
	List<String[]> respostasEstrutura = new ArrayList(Arrays.asList(
			new String[]{
						"*",
						"&",
						"$",
						"%",
						"sizeof"},
			new String[]{
						"Usando uma pilha para rastrear os parênteses abertos e fechados.",
					   "Verificando se há um número ímpar de parênteses.",
					   "Comparando os números de parênteses abertos e fechados.",
					   "Contando os parênteses à direita e à esquerda.",
					   "Não é possível verificar usando uma pilha."},
			new String[]{"Criar uma pilha auxiliar, transferir os elementos e transferir de volta para a pilha original.",
					   "Remover todos os elementos e inserir novamente na ordem inversa.",
					   "Multiplicar todos os elementos por -1.",
					   "Adicionar um elemento de controle no topo da pilha e inverter todos os elementos.",
					   "Não é possível inverter uma pilha usando apenas operações de pilha."},
			new String[]{"Usando uma lista encadeada.",
					   "Usando um array.",
					   "Usando um vetor dinâmico.",
					   "Usando uma pilha.",
					   "Usando uma matriz bidimensional."},
			new String[]{"malloc() não inicializa a memória alocada, enquanto calloc() a inicializa com zero.",
					   "malloc() aloca memória contígua, enquanto calloc() aloca memória não contígua.",
					   "malloc() só pode alocar um bloco de memória por vez, enquanto calloc() pode alocar múltiplos blocos de memória.",
					   "calloc() aloca memória contígua, enquanto malloc() aloca memória não contígua.",
					   "Não há diferença entre malloc() e calloc()."},
			new String[]{"Capacidade dinâmica de crescimento.",
					   "Consumo de memória menor.",
					   "Facilidade de acesso a elementos aleatórios.",
					   "Melhor desempenho em operações de busca.",
					   "Melhor desempenho em operações de ordenação."},
			new String[]{"Facilidade em acessar elementos na ordem inversa.",
					   "Melhor desempenho em operações de busca.",
					   "Facilidade de implementação.",
					   "Capacidade dinâmica de crescimento.",
					   "Consumo de memória menor."},
			new String[]{"Possibilidade de percorrer a lista indefinidamente sem encontrar um nó NULL.",
					   "Facilidade de implementação.",
					   "Melhor desempenho em operações de busca.",
					   "Capacidade dinâmica de crescimento.",
					   "Facilidade em inserir ou remover elementos no meio da lista."},
			new String[]{"Capacidade de alocar memória conforme necessário durante a execução.",
					   "Menor consumo de memória.",
					   "Maior facilidade de implementação.",
					   "Maior velocidade de execução.",
					   "Maior segurança na manipulação de dados."},
			new String[]{
						"A função cria um novo bloco de memória com o tamanho desejado e copia os dados do bloco original para o novo bloco.",
						"A função reduz o tamanho do bloco de memória para o valor especificado.",
						"A função gera um erro de compilação.",
						"A função retorna NULL.",
						"A função não pode ser usada para reduzir o tamanho de um bloco de memória."}
			));
		
	List<String> perguntasJava = new ArrayList(Arrays.asList(
			"Como você declara um array em Java?",
	        "O que é acoplamento em programação orientada a objetos?",
	        "Qual é a diferença entre throw e throws em Java?",
	        "O que é uma anotação @RequestMapping no Spring MVC?",
	        "Qual é a principal vantagem de usar enums em Java em vez de constantes ou tipos primitivos?",
	        "Qual é o modo de armazenamento padrão do H2 Database?",
	        "Uma classe pode herdar de múltiplas classes em Java?",
	        "O que é o Spring Initializr?",
	        "O que é uma classe concreta em Java?",
	        "O que é uma classe abstrata em Java?"
		));
		
	List<String[]> respostasJava = new ArrayList(Arrays.asList(
			new String[]{
					"int[] x;",
					"array x = new array();",
					"new array x[];",
					"create array x;"
					,"array[] x;"},
			new String[]{
					"Um conceito relacionado a fazer com que as classes dependam umas das outras.",
					"Um conceito relacionado a fornecer interfaces de usuário atraentes.",
					"Um conceito relacionado a evitar que as classes dependam umas das outras.",
					"Um conceito relacionado a criar classes sem métodos.",
					"Um conceito relacionado a criar classes sem atributos."},
			new String[]{
					"throw é usado para lançar uma exceção durante a execução do código, enquanto throws é usado para declarar uma exceção no método.",
					"throw é usado para declarar uma exceção no método, enquanto throws é usado para lançar uma exceção durante a execução do código.",
					"Ambos são usados para lançar exceções durante a execução do código.",
					"Ambos são usados para declarar exceções no método.",
					"throw e throws são usados de forma intercambiável em Java."},
			new String[]{
					"Uma anotação usada para mapear uma URL a um método de um controlador.",
					"Uma anotação usada para definir um modelo de dados.",
					"Uma anotação usada para definir uma visão no MVC.",
					"Uma anotação usada para definir um controlador no Spring MVC.",
					"Uma anotação usada para definir uma entidade de banco de dados."},
			new String[]{
					"Enums podem ter métodos e comportamentos associados.",
					"Enums ocupam menos espaço na memória.",
					"Enums podem ser modificados durante a execução do programa.",
					"Enums oferecem uma forma de armazenar valores numéricos em um tipo de dado.",
					"Não há vantagens significativas em usar enums em Java."},
			new String[]{
					"Armazenamento em memória.",
					"Armazenamento em disco.",
					"Armazenamento em nuvem.",
					"Armazenamento em cache.",
					"Armazenamento em SSD."},
			new String[]{
					"Não, Java não suporta herança múltipla, mas suporta interfaces múltiplas.",
					"Sim, Java suporta herança múltipla.",
					"Não, Java não suporta herança múltipla nem interfaces múltiplas.",
					"Sim, mas apenas se as classes pai estiverem no mesmo pacote.",
					"Sim, mas apenas se as classes pai estiverem em pacotes diferentes."},
			new String[]{
					"Uma ferramenta online para gerar um esqueleto de projeto Spring Boot personalizado com base nas dependências e configurações selecionadas.",
					"Uma ferramenta para remover automaticamente configurações desnecessárias de um projeto Spring Boot.",
					"Um servidor de aplicativos embutido fornecido pelo Spring Boot.",
					"Uma extensão do Eclipse para desenvolvimento de aplicativos Spring Boot.",
					"Uma ferramenta de análise estática de código para projetos Spring Boot."},
			new String[]{
					"Uma classe que pode ser instanciada e não tem métodos abstratos.",
					"Uma classe que não pode ser instanciada.",
					"Uma classe que pode ser instanciada e tem métodos abstratos.",
					"Uma classe que não pode conter atributos.",
					"Uma classe que só contém atributos estáticos."},
			new String[]{
					"Uma classe que pode conter tanto métodos abstratos quanto métodos concretos.",
					"Uma classe que não pode ser estendida.",
					"Uma classe que pode ser instanciada e não tem métodos abstratos.",
					"Uma classe que não pode conter métodos.",
					"Uma classe que só contém métodos estáticos."}
	));
	
	List<String> perguntasBanco = new ArrayList(Arrays.asList(
			"O que é um schema em um banco de dados Oracle?",
			"Qual é a diferença entre um trigger DML e um trigger DDL em um banco de dados Oracle?",
	        "O que é um trigger mutante em um contexto de banco de dados Oracle?",
	        "O que significa Isolamento no contexto do acrônimo ACID?",
	        "Como os cursores podem melhorar a eficiência em termos de uso de recursos em comparação com consultas SQL diretas?",
	        "O que é um Data Warehouse?",
	        "Por que a normalização é importante em um banco de dados?",
	        "Qual é a linguagem de consulta padrão utilizada no MongoDB?",
	        "Quando você usaria o MongoDB em vez de um banco de dados relacional?",
	        "Quais são as principais diferenças entre bancos de dados SQL e NoSQL?"
		));
		
	List<String[]> respostasBanco = new ArrayList(Arrays.asList(

			new String[]{
					"Uma coleção de objetos de banco de dados, incluindo tabelas, índices, procedimentos, etc., associados a um usuário específico.",
					"Uma consulta complexa que envolve várias tabelas.",
					"Uma linguagem de programação usada no Oracle Database.",
					"Um tipo de índice usado para melhorar o desempenho das consultas.",
					"Uma linguagem de consulta usada no Oracle Database."},
			new String[]{
					"Um trigger DML é acionado por eventos de manipulação de dados (como INSERT, UPDATE ou DELETE), enquanto um trigger DDL é acionado por eventos de definição de dados (como CREATE, ALTER ou DROP).",
					"Um trigger DML é acionado antes de executar uma instrução SQL, enquanto um trigger DDL é acionado depois de executar uma instrução SQL.",
					"Um trigger DML é acionado por comandos de manipulação de dados, enquanto um trigger DDL é acionado por comandos de definição de dados.",
					"Um trigger DML é acionado em operações de leitura no banco de dados, enquanto um trigger DDL é acionado em operações de gravação.",
					"Um trigger DML é acionado em transações de leitura e gravação, enquanto um trigger DDL é acionado em transações de leitura apenas."},
			new String[]{
					"Um trigger que tenta acessar a tabela na qual está definido, causando um erro Tabela Mutante.",
					"Um trigger que está em um estado de erro e não pode ser executado.",
					"Um trigger que foi desativado pelo administrador do banco de dados.",
					"Um trigger que faz referência a outras tabelas durante a execução, causando uma condição paradoxal.",
					"Um trigger que está em um estado de espera para ser executado em um momento posterior."},
			new String[]{
					"Garante que as transações sejam isoladas umas das outras e não interfiram umas nas outras.",
					"Garante que todas as transações sejam tratadas como uma única operação indivisível.",
					"Garante que as transações sejam atômicas.",
					"Garante que as transações sejam duráveis e permaneçam mesmo em caso de falha do sistema.",
					"Garante que as transações deixem o banco de dados em um estado válido, de acordo com as regras do banco de dados."},
			new String[]{
					"Permitindo o processamento linha por linha de um conjunto de resultados, economizando memória.",
					"Reduzindo a necessidade de operações de leitura e escrita no banco de dados.",
					"Armazenando em cache os resultados das consultas para acesso posterior.",
					"Evitando a necessidade de consultas SQL diretas, reduzindo o tráfego de rede.",
					"Não há diferença significativa em termos de eficiência de recursos entre cursores e consultas SQL diretas."},
			new String[]{
					"Um sistema de gerenciamento de banco de dados projetado para armazenar e analisar grandes volumes de dados para suportar decisões empresariais.",
					"Um banco de dados utilizado apenas para armazenar dados financeiros.",
					"Uma ferramenta para criar gráficos e visualizações de dados.",
					"Um tipo de servidor web para hospedar sites.",
					"Um software para edição de documentos de texto."},
			new String[]{
					"Para reduzir a redundância de dados e melhorar a integridade dos dados, facilitando a manutenção e evitando problemas como a atualização anômala.",
					"Para criar redundância de dados, garantindo assim a consistência das informações.",
					"Para acelerar consultas em bancos de dados relacionais.",
					"Para aumentar o espaço de armazenamento necessário para os dados.",
					"Para simplificar o processo de backup dos dados. "},
			new String[]{
					"MongoDB Query Language (MQL).",
					"SQL.",
					"NoSQL.",
					"JSON.",
					"BSON."},
			new String[]{
					"Quando você precisa de flexibilidade no esquema de dados e quer armazenar dados no formato de documentos.",
					"Sempre, pois o MongoDB é superior a todos os bancos de dados relacionais.",
					"Quando os dados são altamente estruturados e não mudam com frequência.",
					"Somente para pequenas aplicações.",
					"Quando você precisa de suporte nativo para transações ACID."},
			new String[]{
					"Bancos de dados SQL são sempre relacionais, enquanto bancos de dados NoSQL podem ter diversos modelos de dados, incluindo documentos, chave-valor e grafos.",
					"Bancos de dados SQL são amplamente utilizados para armazenar dados estruturados, enquanto bancos de dados NoSQL são adequados para dados não estruturados.",
					"Bancos de dados SQL são exclusivamente baseados em linguagem SQL, enquanto bancos de dados NoSQL não utilizam SQL.",
					"Bancos de dados SQL não suportam consultas complexas, enquanto bancos de dados NoSQL são otimizados para consultas complexas.",
					"Bancos de dados SQL são mais escaláveis do que bancos de dados NoSQL."}
	));
		
	List<String> perguntasTestes = new ArrayList(Arrays.asList(
			"O que é test-driven development (TDD)?",
			"Qual ferramenta Selenium é usada para gravar scripts de teste sem escrever código?",
	        "Qual é a principal diferença entre teste de caixa branca e teste de caixa preta?",
	        "Qual é a principal diferença entre assertEquals() e assertThrows() no contexto dos testes unitários em Java?",
	        "O que é uma aresta em um grafo de caminho básico?",
	        "O que é um caminho independente em um grafo de caminho básico?",
	        "Qual é o objetivo principal do teste de software?",
	        "Quais são os benefícios de investir na qualidade do software desde o início do ciclo de vida do projeto?",
	        "O que é o Cucumber em desenvolvimento de software?",
	        "Quais são alguns exemplos de artefatos de teste comuns em um projeto de desenvolvimento de software?"
		));
		
	List<String[]> respostasTestes = new ArrayList(Arrays.asList(
			new String[]{
					"Escrever testes antes de escrever o código para garantir que o código atenda aos requisitos.",
					"Escrever testes após o desenvolvimento do código para validar seu funcionamento.",
					"Não escrever testes, pois eles são desnecessários durante o desenvolvimento.",
					"Escrever testes apenas para as partes críticas do código.",
					"Escrever testes apenas no final do ciclo de desenvolvimento."},
			new String[]{
					"Selenium IDE.",
					"Selenium Grid.",
					"Selenium Server.",
					"Selenium WebDriver.",
					"Selenium Client."},
			new String[]{
					"Teste de caixa branca envolve conhecer a estrutura interna do código, enquanto teste de caixa preta não.",
					"Teste de caixa branca é manual, enquanto teste de caixa preta é automatizado.",
					"Teste de caixa branca testa funcionalidades, enquanto teste de caixa preta testa o código interno.",
					"Teste de caixa branca é usado apenas para aplicativos web, enquanto teste de caixa preta é usado para qualquer tipo de aplicativo.",
					"Não há diferença significativa entre eles."},
			new String[]{
					"assertEquals() é usado para verificar se dois valores são iguais, enquanto assertThrows() é usado para verificar se uma exceção específica é lançada durante a execução de um método.",
					"assertEquals() verifica se um método lança uma exceção, enquanto assertThrows() compara dois objetos para igualdade.",
					"assertThrows() é usado para comparar objetos, enquanto assertEquals() é usado para verificar exceções.",
					"assertEquals() é usado para verificar se um objeto é nulo, enquanto assertThrows() é usado para verificar se um objeto é não nulo.",
					"assertThrows() é usado para verificar se dois objetos são iguais, enquanto assertEquals() é usado para verificar se uma exceção é lançada."},
			new String[]{
					"Uma conexão entre dois nós indicando a possibilidade de transição de um para o outro.",
					"Uma linha de código no programa.",
					"Um operador lógico.",
					"Uma variável de controle de loop.",
					"Um método ou função chamado no programa."},
			new String[]{
					"Um caminho que não depende de outros caminhos no programa.",
					"Um caminho que não depende de um ponto de decisão.",
					"Um caminho que não tem nenhum nó de entrada.",
					"Um caminho que não passa por nenhum nó de saída.",
					"Um caminho que não depende de condições de entrada."},
			new String[]{
					"Certificar-se de que o software atenda aos requisitos e funcione conforme o esperado.",
					"Garantir que o código fonte seja escrito sem erros de sintaxe.",
					"Encontrar todos os defeitos no software.",
					"Minimizar o custo do desenvolvimento do software.",
					"Garantir que o software seja lançado no prazo estipulado."},
			new String[]{
					"Redução dos custos de desenvolvimento, aumento da satisfação do cliente, menor taxa de defeitos e maior confiança dos stakeholders.",
					"Aumento dos custos de desenvolvimento, redução da satisfação do cliente, maior taxa de defeitos e menor confiança dos stakeholders.",
					"Aumento dos custos de marketing, redução da complexidade do software, maior taxa de defeitos e menor confiança dos stakeholders.",
					"Redução dos custos de desenvolvimento, aumento da complexidade do software, maior taxa de defeitos e maior confiança dos stakeholders.",
					"Redução dos custos de marketing, aumento da complexidade do software, menor taxa de defeitos e menor confiança dos stakeholders."},
			new String[]{
					"Uma ferramenta de automação para testes de aceitação baseados em comportamento (BDD).",
					"Uma ferramenta de automação para testes de desempenho.",
					"Uma biblioteca para criar interfaces gráficas em Java.",
					"Um ambiente de desenvolvimento integrado (IDE) para programação em Python.",
					"Uma linguagem de programação para desenvolvimento web."},
			new String[]{
					"Plano de Testes, Casos de Teste, Relatórios de Execução de Testes, Matriz de Rastreabilidade.",
					"Diagramas de Classe, Diagramas de Sequência, Diagramas de Atividades, Diagramas de Caso de Uso.",
					"Requisitos do Cliente, Especificações Técnicas, Diagramas de Arquitetura.",
					"Código Fonte, Scripts de Automação, Documentação do Desenvolvedor.",
					"Planilhas de Dados, Capturas de Tela, Protótipos de Interface do Usuário."}
	));
	
	public List<String> getPerguntas(int disciplina){
		
		switch(disciplina) {
		case 0: return perguntasEstrutura;
		case 1: return perguntasJava;
		case 2: return perguntasBanco;
		case 3: return perguntasTestes;
		}
		return null;
	}
	
	public List<String[]> getRespostas(int disciplina){
		
		switch(disciplina) {
		case 0: return respostasEstrutura;
		case 1: return respostasJava;
		case 2: return respostasBanco;
		case 3: return respostasTestes;
		}
		return null;
	}
}
