import { PortfolioService } from './../../servicios/portfolio.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-habilidades',
  templateUrl: './habilidades.component.html',
  styleUrls: ['./habilidades.component.css']
})
export class HabilidadesComponent implements OnInit {
  habilidadesDuras:any;
  habilidadesBlandas:any;
  idiomas:any;
  constructor(private datosPortfolio:PortfolioService) { }

  ngOnInit(): void {
    this.datosPortfolio.obtenerDatos().subscribe(datos => {
      this.habilidadesDuras = datos.habilidadesDuras;
    })
    this.datosPortfolio.obtenerDatos().subscribe(datos => {
      this.habilidadesBlandas = datos.habilidadesBlandas;
    })
    this.datosPortfolio.obtenerDatos().subscribe(datos => {
      this.idiomas = datos.idiomas;
    })
  }

}
