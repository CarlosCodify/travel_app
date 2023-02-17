import {Component, OnInit} from '@angular/core';
import {UserRepository} from "../../store/user.store";
import {HttpClient} from "@angular/common/http";
import {environment} from "../../../environment";
import {Router} from "@angular/router";
import {User} from "../../models/user.model";

@Component({
  selector: 'app-sales',
  templateUrl: './sales.component.html',
  styleUrls: ['./sales.component.css']
})
export class SalesComponent implements OnInit{
  sales: any = [];
  displayNewForm: boolean = false;
  displayEditForm: boolean = false;
  saleId: number = 0;

  constructor(private httpClient: HttpClient, private userRepository: UserRepository, private router: Router) {
  }

  ngOnInit() {
    const user: User = localStorage.getItem('user') ? JSON.parse(localStorage.getItem('user') as string) : null;
    if (user) {
      this.userRepository.setUser(user);
    }else {
      this.router.navigate(['/login']);
    }

    this.httpClient.get<any>(`${environment.apiUrl}/sales`).subscribe(
      response => {
        this.sales = response.data;
      });
  }

  editSale(id: number) {
    this.saleId = id;
    this.displayEditForm = true;
    this.displayNewForm = false;
  }

  deleteSale(id:number) {
    this.httpClient.delete<any>(`${environment.apiUrl}/sales/${id}`).subscribe(
      response => {
        this.router.navigate(['/sales']);
      });
  }

  newSale() {
    this.displayNewForm = true;
    this.displayEditForm = false;
  }
}
