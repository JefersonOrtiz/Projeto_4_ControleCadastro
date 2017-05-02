package br.com.fatecpg.cadastros;

import java.util.ArrayList;

public class DataBaseCliente {
    private static ArrayList<Cliente> clientes;
    public static ArrayList<Cliente> getClientes(){
        if (clientes == null){
            clientes = new ArrayList<>();
            Cliente c1 = new Cliente();
            c1.setNome("Eder Cirino");
            c1.setCpf("111.222.333-44");
            c1.setRg("12.345.678-9");
            c1.setEmail("eder@servidor.com");
            c1.setTelefone("(13) 9 9988-7766");
            c1.setEndereco("Rua 1, SP");
            System.out.println("");
            clientes.add(c1);
        }
        return clientes;
    }

    static Object getCliente() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}