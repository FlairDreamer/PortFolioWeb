import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { AcercaDeMiComponent } from './componentes/acerca-de-mi/acerca-de-mi.component';
import { EducacionComponent } from './componentes/educacion/educacion.component';
import { Error404Component } from './componentes/error404/error404.component';
import { ExperienciaComponent } from './componentes/experiencia/experiencia.component';
import { HabilidadesComponent } from './componentes/habilidades/habilidades.component';
import { ProyectosComponent } from './componentes/proyectos/proyectos.component';

const routes: Routes = [
  { path: '', redirectTo: 'inicio', pathMatch: 'full' },
  { path: 'inicio', component: AcercaDeMiComponent },
  { path: 'experiencia', component: ExperienciaComponent },
  { path: 'educación', component: EducacionComponent },
  { path: 'habilidades-blandas-y-duras', component: HabilidadesComponent },
  { path: 'proyectos', component: ProyectosComponent },
  { path: 'error404', component: Error404Component },
  { path: '**', redirectTo: 'error404', pathMatch: 'full' } // Ponerlo primero hace que se muestre siempre. Mejor dejarlo último.
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
