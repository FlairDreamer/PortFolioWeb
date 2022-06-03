import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AudioService {

constructor() { }

  playSelect(): void {
    const audio = new Audio();
    audio.src = "../../assets/Sonidos/select.ogg"
    audio.load();
    audio.play();
  }

  playHover(): void {
    const audio = new Audio();
    audio.src = "../../assets/Sonidos/hover.ogg"
    audio.load();
    audio.play();
  }

}
