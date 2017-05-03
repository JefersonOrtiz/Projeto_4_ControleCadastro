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
            Cliente c2 = new Cliente();
            c2.setNome("Felipe Bruno");
            c2.setCpf("555.666.777-88");
            c2.setRg("13.456.789-0");
            c2.setEmail("felipe@servidor.com");
            c2.setTelefone("(13) 9 5554-3322");
            c2.setEndereco("Rua 2, SP");
            Cliente c3 = new Cliente();
            c3.setNome("Jeferson Ortiz");
            c3.setCpf("999.000.111-22");
            c3.setRg("14.567.890-1");
            c3.setEmail("jeferson@servidor.com");
            c3.setTelefone("(13) 9 4443-2211");
            c3.setEndereco("Rua 3, SP");
            clientes.add(c1);clientes.add(c2);clientes.add(c3);
        }
        return clientes;
    }

    static Object getCliente() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}