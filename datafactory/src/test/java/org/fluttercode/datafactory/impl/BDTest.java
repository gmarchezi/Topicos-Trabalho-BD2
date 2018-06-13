/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fluttercode.datafactory.impl;

import java.io.*;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pichau
 */

public class BDTest {
    DataFactory df;

    
    public enum Cargos {

    /**
     *
     */
    motorista(2040f,450f), auxiliarcarga(1100f,250f);
    
    public float salario;
    public float refeicao;
    
    Cargos(float salario,float refeicao){
        this.salario = salario;
        this.refeicao = refeicao;
    }
    
    
    }

    public BDTest() {
        df= new DataFactory();
        
        
    }
        
    //
    
    public String GeraUsuarios(int cont,String[] tipo_usuario) throws IOException{
        FileWriter  fileWriter;
        fileWriter = new FileWriter ("Scripts/usuario.sql");
        
        
        String sql = "";
        sql=sql.concat("INSERT INTO usuario(email, status, senha, tipo_usuario)\n VALUES");
        for(int j = 0;j<tipo_usuario.length;j++){
            if(j>0) sql = sql.concat(",\n");
            sql=sql.concat("('"+df.getEmailAddress()+"',1,'"+df.getRandomWord(5,15)+"','"+tipo_usuario[j]+"')");
            for (int i = 1; i < cont; i++) {          
            
                sql = sql.concat(",\n");
                sql = sql.concat("('"+df.getEmailAddress()+"',1,'"+df.getRandomWord(5,15)+"','"+tipo_usuario[j]+"')");
                        
            }
        }
        fileWriter.write(sql);
        fileWriter.close();
        return sql;
    }
    
    public String GeraCliente(int cont) throws IOException, Exception{
        FileWriter  fileWriter;
        fileWriter = new FileWriter ("Scripts/cliente.sql");
        GeradorCPF geradorcpf = new GeradorCPF();
        GeradorCnpj geradorcnpj = new GeradorCnpj();
        String sql = "";
        String name;
        sql=sql.concat("INSERT INTO cliente(id_usuario,nome,cnpj_cpf,tipo_cliente)\n VALUES");
        sql=sql.concat("("+1+",'"+df.getFirstName() + " "+ df.getLastName()+"',"+geradorcpf.geraCPF()+",1)");
        for (int i = 2; cont >= i; i++){
            name = df.getFirstName() + " "+ df.getLastName();
            int aux = df.getNumber();
            if (aux%2==0){
            //trata criação de usuário do tipo pessoa fisica.  tipo_cliente=1
            
                try {
                    sql = sql.concat(",\n");
                    sql=sql.concat("("+i+",'"+name+"',"+geradorcpf.geraCPF()+",1)");
                } catch (Exception ex) {
                    Logger.getLogger(BDTest.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }
            else{
            //trata criação de usuário do tipo pessoa juridica tipo_cliente=0
                try {
                    sql = sql.concat(",\n");
                    sql=sql.concat("("+i+",'"+name+"',"+geradorcnpj.geraCNPJ()+",0)");
                } catch (Exception ex) {
                    Logger.getLogger(BDTest.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }
            
        }
        
        fileWriter.write(sql);
        fileWriter.close();
        return sql;
    }
    
    
    public String GeraFuncionario (int Cont) throws IOException, Exception{
        FileWriter  fileWriter;
        fileWriter = new FileWriter ("Scripts/funcionario.sql");
        String sql = "";
        String name;
        GeradorCPF geradorcpf = new GeradorCPF();

        sql=sql.concat("INSERT INTO Funcionario(id_usuario,nome,cpf,cargo,salario,refeicao,endereco)\n VALUES");
        sql=sql.concat("("+(Cont+1)+",'"+df.getFirstName() + " "+ df.getLastName()+"',"+geradorcpf.geraCPF()+",'motorista',"+Cargos.motorista.salario+","+Cargos.motorista.refeicao+",'"+df.getAddressLine2()+"')");
        for (int i=2; i<=Cont; i++){
            sql = sql.concat(",\n");
            if (i<10){
            sql=sql.concat("("+(i+Cont)+",'"+df.getFirstName() + " "+ df.getLastName()+"',"+geradorcpf.geraCPF()+",'motorista',"+Cargos.motorista.salario+","+Cargos.motorista.refeicao+",'"+df.getAddressLine2()+"')");
            }
            else{
                sql=sql.concat("("+(i+Cont)+",'"+df.getFirstName() + " "+ df.getLastName()+"',"+geradorcpf.geraCPF()+",'Ajudante',"+Cargos.auxiliarcarga.salario+","+Cargos.auxiliarcarga.refeicao+",'"+df.getAddressLine2()+"')");
            }
        }
        fileWriter.write(sql);
        fileWriter.close();
        return sql;
    }
    
    public String GeraVeiculo (int Cont) throws IOException{
        FileWriter  fileWriter;
        fileWriter = new FileWriter ("Scripts/Veiculo.sql");
        String sql = "";
        char[] letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
        Random rand = new Random();
        String placa = "";
        placa = placa.concat(String.valueOf(letras[rand.nextInt(letras.length)]));
        placa = placa.concat(String.valueOf(letras[rand.nextInt(letras.length)]));
        placa = placa.concat(String.valueOf(letras[rand.nextInt(letras.length)]));
        placa = placa.concat("-");
        placa = placa.concat(df.getNumberText(4));
        sql=sql.concat("INSERT INTO veiculo(chassi, placa, id_modelo, status,id_tipo)\n VALUES");
        sql=sql.concat("('"+df.getNumberText(17)+"','"+placa+"',"+(1+rand.nextInt(10))+",1,4)");
        for (int i=2; i<=Cont; i++){
            placa = "";
            placa = placa.concat(String.valueOf(letras[rand.nextInt(letras.length)]));
            placa = placa.concat(String.valueOf(letras[rand.nextInt(letras.length)]));
            placa = placa.concat(String.valueOf(letras[rand.nextInt(letras.length)]));
            placa = placa.concat("-");
            placa = placa.concat(df.getNumberText(4));
            sql = sql.concat(",\n");
            sql=sql.concat("('"+df.getNumberText(17)+"','"+placa+"',"+(1+rand.nextInt(10))+",1,4)");
        }
        fileWriter.write(sql);
        fileWriter.close();
        return sql;
    }
    public String GeraVeiculoMotorista (int Cont) throws IOException{
        FileWriter  fileWriter;
        fileWriter = new FileWriter ("Scripts/VeiculoMotorista.sql");
        String sql = "";
        sql=sql.concat("INSERT INTO veiculo_motorista(id_veiculo,id_funcionario)\n VALUES");
        sql=sql.concat("(1,1)");
        for(int j = 1;j<11;j++){
            for(int i=1;i<(Cont+1);i++){
                if(!((i==1)&&(j==1))){
                sql = sql.concat(",\n");
                sql = sql.concat("("+i+","+j+")");
                }
            }
        }
        fileWriter.write(sql);
        fileWriter.close();
        return sql;
    }
    public String GeraServico(int Cont) throws IOException{
        FileWriter  fileWriter;
        fileWriter = new FileWriter ("Scripts/Servico.sql");
        Random rand = new Random();
        String sql = "";
        Date maxDate = df.getDate(2030, 1, 1);
        Date minDate = new Date();
        Date start = df.getDateBetween(minDate, maxDate);
        Date end = df.getDateBetween(start, maxDate);        
        sql=sql.concat("INSERT INTO servico(id_cliente,data_ini,data_fim,valor_contrato,origem,destino,status)\n VALUES");
        sql=sql.concat("(1,'"+start+"','"+end+"',"+(rand.nextFloat()*100)+",'"+df.getAddress()+"','"+df.getAddress()+"',1)");
        for(int j = 1;j<=150;j++){
            for(int i=1;i<(Cont+1);i++){
                if(!((i==1)&&(j==1))){
                    System.out.println("Gera Servico : "+j +" "+ i);
                    start = df.getDateBetween(minDate, maxDate);
                    end = df.getDateBetween(start, maxDate);
                    
                    sql = sql.concat(",\n");
                    sql=sql.concat("("+i+",'"+start+"','"+end+"',"+(rand.nextFloat()*100)+",'"+df.getAddress()+"','"+df.getAddress()+"',1)");
                }
            }
            fileWriter.write(sql);
            sql = "";

        }
        fileWriter.close();
        return sql;
    }
    
    public String GeraVeiculoServico(int Cont) throws IOException{
        FileWriter  fileWriter;
        fileWriter = new FileWriter ("Scripts/veiculo_servico.sql");
        String sql = "";
        sql=sql.concat("INSERT INTO veiculo_servico(id_veiculo_motorista,id_servico)\n VALUES");
        int id_veiculo =1;
        int id_servico =1;
        sql=sql.concat("("+id_veiculo+","+id_servico+")");

        for(int j = 1;j<=150;j++){
            for(int i=1;i<(Cont+1);i++){
                if(!((i==1)&&(j==1))){
                    System.out.println("Gera Veiculo_Servico : "+j +" "+ i);
                    id_veiculo++;
                    id_servico++;
                    if (id_veiculo>100) id_veiculo=1;
                    sql = sql.concat(",\n");
                    sql=sql.concat("("+id_veiculo+","+id_servico+")");
                }
            }
            fileWriter.write(sql);
            sql = "";

        }
        fileWriter.close();
        return sql;
    }
}


