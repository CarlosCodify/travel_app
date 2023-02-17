import {Component, Input, OnInit} from "@angular/core";
import {ActivatedRoute, Router} from "@angular/router";
import {HttpClient} from "@angular/common/http";
import {environment} from "../../../../../environment";


@Component({
    selector: 'app-sale-edit',
    templateUrl: './sale.edit.component.html',
})

export class SaleEditComponent implements OnInit {
    @Input() saleId: number;
    sale: any;
    constructor(private httpClient: HttpClient, private route: ActivatedRoute, private router: Router) {
      this.saleId = 0;
    }

    ngOnInit() {
        this.route.params.subscribe(params => {
            this.httpClient.get<any>(`${environment.apiUrl}/sales/${this.saleId}`).subscribe(
              {
                next: response => {
                  this.sale = response.data;
                },
                error: error => {
                  console.error('There was an error!', error);
                  this.router.navigate(['/sales']);
                }
              });
        });
    }

    updateSale() {

    }
}
