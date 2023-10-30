package preparador;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class PreparaDisciplinas {
	
	private List<List<String>> perguntasDisciplinas = new ArrayList<>();
	private List<List<String[]>> respostasDisciplinas = new ArrayList<>();

	
	public PreparaDisciplinas() {
		
		GeraQuestoes pr = new GeraQuestoes();	
				
		for(int i = 0; i < 4; i++) {
			perguntasDisciplinas.add(new ArrayList<>());
			respostasDisciplinas.add(new ArrayList<>());
			final int indice = i;
			pr.getPerguntas(indice)
			.stream()
			.forEach((e) -> perguntasDisciplinas.get(indice).add(e));
			
			pr.getRespostas(indice)
			.stream()
			.forEach((e) -> respostasDisciplinas.get(indice).add(e));
		}
	}
	
	public List<List<String>> getPerguntasDisciplinas(){
		return perguntasDisciplinas;
	}
	
	public List<List<String[]>> getRespostasDisciplinas(){
		return respostasDisciplinas;
	}
	
}
