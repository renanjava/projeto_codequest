package preparador;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class PreparaDisciplinas {
	
	private List<List<String>> perguntasDisciplinas = new ArrayList<>();
	private List<List<String[]>> respostasDisciplinas = new ArrayList<>();

	
	public PreparaDisciplinas() {
		
		GeraQuestoes gq = new GeraQuestoes();	
				
		for(int i = 0; i < 4; i++) {
			perguntasDisciplinas.add(new ArrayList<>());
			respostasDisciplinas.add(new ArrayList<>());
			final int indice = i;
			gq.getPerguntas(indice)
            .forEach((e) -> perguntasDisciplinas.get(indice)
            .add(e.replaceAll(",", "-")));
			
			gq.getRespostas(indice)
	        .forEach((e) -> {
	            List<String> updatedList = Arrays.stream(e)
	                    .map(u -> u.replaceAll(",", "-"))
	                    .collect(Collectors.toList());
	            respostasDisciplinas.get(indice).add(updatedList.toArray(new String[0]));
	        });

		}
	}
	
	public List<List<String>> getPerguntasDisciplinas(){
		return perguntasDisciplinas;
	}
	
	public List<List<String[]>> getRespostasDisciplinas(){
		return respostasDisciplinas;
	}
	
}
