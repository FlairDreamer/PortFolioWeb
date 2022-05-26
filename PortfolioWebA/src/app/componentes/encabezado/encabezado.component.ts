import { PortfolioService } from './../../servicios/portfolio.service';
import { LoginComponent } from './login/login.component';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-encabezado',
  templateUrl: './encabezado.component.html',
  styleUrls: ['./encabezado.component.css']
})
export class EncabezadoComponent implements OnInit {
  encabezado:any;
  constructor(private datosPortfolio:PortfolioService) { }

  ngOnInit(): void {
    this.datosPortfolio.obtenerDatos().subscribe(datos => {
      this.encabezado = datos.encabezado;
    });
  }
}
