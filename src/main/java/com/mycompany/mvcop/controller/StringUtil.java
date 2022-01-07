/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mvcop.controller;

/**
 *
 * @author b.ashok
 */
public class StringUtil {
public static String toCommaSeperatedString(Object[] items)    {
    StringBuilder stringB = new StringBuilder();
    for(Object item:items){
       stringB.append(item).append(",");
    }
    if(stringB.length()>0){
        stringB.deleteCharAt(stringB.length()-1);
    }
    return stringB.toString();
}
}
