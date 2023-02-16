import { NgModule } from '@angular/core';
import { ServerModule } from '@angular/platform-server';

import { AppModule } from './app.module';
import { AppComponent } from './app.component';
import {LoginModule} from "./login/login.module";
import {DashboardModule} from "./dashboard/dashboard.module";

@NgModule({
  imports: [
    AppModule,
    ServerModule,
    LoginModule,
    DashboardModule
  ],
  bootstrap: [AppComponent],
})
export class AppServerModule {}
