import {Component, OnInit} from "@angular/core";
import {ActivatedRoute, Router} from "@angular/router";
import {HttpClient} from "@angular/common/http";
import {environment} from "../../../../../environment";
import {Validators} from "@angular/forms";
import {UserRepository} from "../../../../store/user.store";


@Component({
  selector: 'app-sale-new',
  templateUrl: './sale.new.component.html',
})

export class SaleNewComponent implements OnInit {
  sale: any = {};
  formGroup: any;
  formBuilder: any;
  customers: any = [];

  constructor(private httpClient: HttpClient, private route: ActivatedRoute, private router: Router, private userRepository: UserRepository) {
  }

  ngOnInit() {
    this.formGroup = this.formBuilder.group({
      customerId: ['', Validators.required],
      // salePersonId: ['', Validators.required],
      travelId: ['', Validators.required],
      unitPrice: ['', Validators.required],
      totalAmount: ['', Validators.required],
    });

    this.httpClient.get<any>(`${environment.apiUrl}/customers`).subscribe(
      {
        next: response => {
          this.customers = response.data;
        },
        error: error => {
          console.error('There was an error!', error);
          // this.router.navigate(['/sales']);
        }
      });
  }

  onSubmit() {
    if (!this.formGroup.valid) {
      this.sale.salePersonId = this.userRepository.getUser()?.getId();
      this.httpClient.post<any>(`${environment.apiUrl}/sales`, this.sale).subscribe(
        {
          next: response => {
            this.router.navigate(['/sales']);
          },
          error: error => {
            console.error('There was an error!', error);
          }
        });
    }
  }
}
