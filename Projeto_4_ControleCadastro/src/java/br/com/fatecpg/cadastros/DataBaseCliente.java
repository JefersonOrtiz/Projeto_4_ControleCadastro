package br.com.fatecpg.cadastros;

import java.util.ArrayList;

public class DataBaseCliente {
    private static ArrayList<Cliente> clientes;
    public static ArrayList<Cliente> getClientes(){
        if (clientes == null){
            clientes = new ArrayList<>();
            Cliente c1 = new Cliente();
            c1.setNome("");
            c1.setCpf("");
            c1.setRg("");
            c1.setEmail("");
            c1.setTelefone("");
            c1.setEndereco("");
            clientes.add(c1);
        }
        return clientes;
}
}