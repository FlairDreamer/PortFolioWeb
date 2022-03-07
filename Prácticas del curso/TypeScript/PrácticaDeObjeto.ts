class Persona{
  readonly nombre:string;
  readonly apellido:string;
  private añoNac:number;
  constructor(nombre:string, apellido:string, añoNac:number){
    this.nombre = nombre;
    this.apellido = apellido;
    this.añoNac = añoNac;
  }

  public toString():string{
    return this.nombre + " " + this.apellido;
  }

  public edad(añoActual:number):number{
    return (añoActual - this.añoNac);
  }

}

let FD = new Persona("Flair", "Dreamer", 1994);

console.log(FD.edad(2022));

function OtroDecoradorPersona(data:string){
  return function <T extends { new(...args: any[]): {} } >(constructor:T){
    return class extends constructor {
      array = data.split(",");
      nombre = this.array[0];
      apellido = this.array[1];
    }
  }
}

@OtroDecoradorPersona("Cosme,Fulanito")
class OtraPersona{
  public nombre:string = "";
  public apellido:string = "";
  public añoNac:number = 0;

  constructor(nombre:string, apellido:string){
    this.nombre = nombre;
    this.apellido = apellido;
  }
}

let persona = new OtraPersona("Otro", "Nombre");
console.log(persona.nombre + " " + persona.apellido);
