import { Component, OnInit } from '@angular/core';
import { PortfolioService } from 'src/app/servicios/portfolio.service';
import { AudioService } from './../../servicios/audio.service';

@Component({
  selector: 'app-error404',
  templateUrl: './error404.component.html',
  styleUrls: ['./error404.component.css'],
})
export class Error404Component implements OnInit {
  error: any;
  constructor(
    private datosPortfolio: PortfolioService,
    private audioService: AudioService
  ) {}

  ngOnInit(): void {
    this.datosPortfolio.obtenerDatos().subscribe((datos) => {
      this.error = datos.error;
    });
  }

  PlaySelect() {
    this.audioService.playSelect();
  }

  PlayHover() {
    this.audioService.playHover();
  }
}
