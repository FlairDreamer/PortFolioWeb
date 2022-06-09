import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  constructor(private enrutador: Router) {}

  tieneRuta(ruta: string) { // Esconde los componentes si la ruta es igual a la provista.
    return this.enrutador.url !== ruta
  }
}
