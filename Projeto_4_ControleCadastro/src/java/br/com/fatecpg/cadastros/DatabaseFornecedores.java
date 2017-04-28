package br.com.fatecpg.cadastros;
import java.util.ArrayList;

public class DatabaseFornecedores {
    private static ArrayList<Fornecedor> fornecedor;
    public static ArrayList<Fornecedor> getFornecedor(){
        if(fornecedor == null){
            fornecedor = new ArrayList<>();
            Fornecedor c1 = new Fornecedor();
            c1.setNome("");
            c1.setEmail("");
            c1.setTelefone("");
            c1.setEndereco("");
            c1.setCnpj("");
            c1.setRazao("");
          
            
            fornecedor.add(c1);
        }
        return fornecedor;
    }
}