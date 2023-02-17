import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SalesRoutingModule } from './sales-routing.module';
import { SalesComponent } from './sales.component';
import {NavbarModule} from "../../components/navbar/navbar.module";
import {SaleEditComponent} from "./components/edit/sale.edit.component";
import {SaleReadComponent} from "./components/read/sale.read.component";
import {SaleNewComponent} from "./components/new/sale.new.component";
import {ReactiveFormsModule} from "@angular/forms";



@NgModule({
  declarations: [
    SalesComponent,
    SaleEditComponent,
    SaleReadComponent,
    SaleNewComponent
  ],
  imports: [
    CommonModule,
    SalesRoutingModule,
    NavbarModule,
    ReactiveFormsModule
  ]
})
export class SalesModule { }
