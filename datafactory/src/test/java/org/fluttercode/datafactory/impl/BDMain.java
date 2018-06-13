/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fluttercode.datafactory.impl;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pichau
 */
public class BDMain {
    public static int QUANTGERADO = 10000;
    public static void main(String[] args) throws IOException, Exception {

    /**
     *
     */
        
        BDTest bd = new BDTest();
        String sql;
        String[] tipo_usuario = {"cliente","funcionario"};
        System.out.println("Iniciando Usuários");
        sql = bd.GeraUsuarios(QUANTGERADO,tipo_usuario);
        System.out.println("Iniciando Cliente");
        sql = bd.GeraCliente(QUANTGERADO);
        System.out.println("Iniciando Funcinario");
        sql = bd.GeraFuncionario(QUANTGERADO);
        System.out.println("Iniciando Veiculo");
        sql = bd.GeraVeiculo(QUANTGERADO);
        System.out.println("Iniciando Veiculo_Motorista");
        sql = bd.GeraVeiculoMotorista(QUANTGERADO);
        System.out.println("Iniciando Servico");
        sql = bd.GeraServico(QUANTGERADO);
        System.out.println("IniciandoVeiculo_Servico");
        sql = bd.GeraVeiculoServico(QUANTGERADO);


        
    }
}
