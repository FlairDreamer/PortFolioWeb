"use strict";
class Operacion {
    constructor() {
        this.valorA = 0;
        this.valorB = 0;
        this.resultado = 0;
    }
    set ValorA(value) {
        this.valorA = value;
    }
    set ValorB(value) {
        this.valorB = value;
    }
    get Resultado() {
        return this.resultado;
    }
}
class Suma extends Operacion {
    Sumar() {
        this.resultado = this.valorA + this.valorB;
    }
}
class Resta extends Operacion {
    Restar() {
        this.resultado = this.valorA - this.valorB;
    }
}
let operacionS = new Suma();
operacionS.ValorA = 45;
operacionS.ValorB = 10;
operacionS.Sumar();
console.log("El resultado de la suma es " + operacionS.Resultado + ".");
let operacionR = new Resta();
operacionR.ValorA = 45;
operacionR.ValorB = 10;
operacionR.Restar();
console.log("El resultado de la resta es " + operacionR.Resultado + ".");
// Otra cosa.
class Turbina {
    constructor(n) {
        this.numTurbinas = 0;
        this.numTurbinas = n;
    }
    toString() {
        return this.numTurbinas + " Turbina/s";
    }
}
class Cubierta {
    constructor(pCabinaTripulacion, pCabinaVuelo, pSistemaEmergencia, pTanquesCombustible, pPuertasSalidas) {
        this.cabinaTripulacion = false;
        this.cabinaVuelo = false;
        this.sistemaEmergencia = false;
        this.numTanquesCombustible = 0;
        this.numPuertasSalidas = 0;
        this.cabinaTripulacion = pCabinaTripulacion;
        this.cabinaVuelo = pCabinaVuelo;
        this.sistemaEmergencia = pSistemaEmergencia;
        this.numTanquesCombustible = pTanquesCombustible;
        this.numPuertasSalidas = pPuertasSalidas;
    }
    toString() {
        let mensaje = "Cubierta compuesta de: ";
        if (this.cabinaVuelo) {
            mensaje += " Cubierta de vuelo, ";
        }
        if (this.cabinaTripulacion) {
            mensaje += " Cubierta de Tripulación, ";
        }
        if (this.sistemaEmergencia) {
            mensaje += " Sistema de Emergencia, ";
        }
        mensaje += this.numTanquesCombustible + " Tanques de Combustible, ";
        mensaje += this.numPuertasSalidas + " Puertas de Salida.";
        return mensaje;
    }
}
// Código puesto entre comentarios por estar incompleto.
/*
class Aeroplano{
  private helice:Helice;
  private trenAterrizaje:TrenDeAterrizaje;
  private alas:Alas;
  private cubierta:Cubierta;

  constructor(pHelice:Helice, pTrenAterrizaje:TrenDeAterrizaje, pAlas:Alas, pCubierta:Cubierta){
    this.helice = pHelice;
    this.trenAterrizaje = pTrenAterrizaje;
    this.alas = pAlas;
    this.cubierta = pCubierta;
  }

  public toString(){
    let mensaje = "Aeroplano compuesto por: ";
    mensaje += this.helice.toString();
    mensaje += this.alas.toString();
    mensaje += this.trenAterrizaje.toString();
    mensaje += this.cubierta.toString();
    return mensaje;
  }
}
*/
