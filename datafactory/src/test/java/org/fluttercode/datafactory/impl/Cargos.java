/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fluttercode.datafactory.impl;

/**
 *
 * @author Pichau
 */
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
