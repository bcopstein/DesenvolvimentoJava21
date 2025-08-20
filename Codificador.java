import java.time.LocalDate;

public interface Codificador {
    // Retorna o nome do codificador
    public String getNome();

    // Retorna a data de imlementação do codificador (pode ser usado como versao)
    public LocalDate getDataCriacao();

    // Retorna o nivel de segurança do codificador (1 = muito baixo, 100 = muito alto)
    public int getNivelSeguranca();

    // Recebe um string e retorna o correspondente codificado
    public String codifica(String str);

    // Recebe um string codificado e retorna o correspondente decodificado
    public String decodifica(String str);
}