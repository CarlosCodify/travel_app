import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {SalesComponent} from "./sales.component";
import {SaleNewComponent} from "./components/new/sale.new.component";
import {SaleReadComponent} from "./components/read/sale.read.component";

const routes: Routes = [
  {
    path: '',
    component: SalesComponent,
  },
  {
    path: ':id',
    component: SaleReadComponent,
  },
  {
    path: 'new',
    component: SaleNewComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SalesRoutingModule { }
