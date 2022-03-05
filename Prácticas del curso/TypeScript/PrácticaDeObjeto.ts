let añoActual:number = 2021;

function DecoradorPersona(target:Function){
  console.log(target);
}

@DecoradorPersona
class Persona{
  readonly nombre:string;
  readonly apellido:string;
  private añoNac: number;
  constructor(nombre:string, apellido:string, añoNac:number){
    this.nombre = nombre;
    this.apellido = apellido;
    this.añoNac = añoNac;
  }
  public edad(añoActual:number){
    return (añoActual - this.añoNac)
  }
}
