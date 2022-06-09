import { Component, OnInit } from '@angular/core';
import { PortfolioService } from 'src/app/servicios/portfolio.service';

@Component({
  selector: 'app-educacion',
  templateUrl: './educacion.component.html',
  styleUrls: ['./educacion.component.css']
})
export class EducacionComponent implements OnInit {
  apList:any;
  educacion:any;
  constructor(private datosPortfolio:PortfolioService) { }

  ngOnInit(): void {
    this.datosPortfolio.obtenerDatos().subscribe(datos => {
      this.apList = datos.educacion;
    })

    this.datosPortfolio.obtenerDatos().subscribe(datos => {
      this.educacion = datos;
    })
  }

}
