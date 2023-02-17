import {Component, OnInit} from "@angular/core";
import {ActivatedRoute, Router} from "@angular/router";
import {HttpClient} from "@angular/common/http";
import {environment} from "../../../../../environment";


@Component({
    selector: 'app-sale-read',
    templateUrl: './sale.read.component.html',
})

export class SaleReadComponent implements OnInit {
    id: number;
    sale: any;
    constructor(private httpClient: HttpClient, private route: ActivatedRoute, private router: Router) {
      this.id = 0;
    }

    ngOnInit() {
        // this.route.params.subscribe(params => {
        //     this.id = params['id'];
        //     this.httpClient.get<any>(`${environment.apiUrl}/sales/${this.id}`).subscribe(
        //       {
        //         next: response => {
        //           this.sale = response.data;
        //         },
        //         error: error => {
        //           console.error('There was an error!', error);
        //           this.router.navigate(['/sales']);
        //         }
        //       });
        // });
    }

    updateSale() {

    }
}
