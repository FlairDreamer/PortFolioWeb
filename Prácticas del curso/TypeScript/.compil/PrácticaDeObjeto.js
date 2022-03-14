"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
class Persona {
    constructor(nombre, apellido, añoNac) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.añoNac = añoNac;
    }
    toString() {
        return this.nombre + " " + this.apellido;
    }
    edad(añoActual) {
        return (añoActual - this.añoNac);
    }
}
let FD = new Persona("Flair", "Dreamer", 1994);
console.log(FD.edad(2022));
function OtroDecoradorPersona(data) {
    return function (constructor) {
        return class extends constructor {
            constructor() {
                super(...arguments);
                this.array = data.split(",");
                this.nombre = this.array[0];
                this.apellido = this.array[1];
            }
        };
    };
}
let OtraPersona = class OtraPersona {
    constructor(nombre, apellido) {
        this.nombre = "";
        this.apellido = "";
        this.añoNac = 0;
        this.nombre = nombre;
        this.apellido = apellido;
    }
};
OtraPersona = __decorate([
    OtroDecoradorPersona("Cosme,Fulanito")
], OtraPersona);
let persona = new OtraPersona("Otro", "Nombre");
console.log(persona.nombre + " " + persona.apellido);
