import {Component, OnInit} from '@angular/core';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import {HttpClient} from "@angular/common/http";
import {environment} from "../../../environment";
import {UserRepository} from "../../store/user.store";
import {User} from "../../models/user.model";
import {Router} from "@angular/router";


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(
    private httpClient: HttpClient,
    private userRepository: UserRepository,
    private router: Router,
  ) {
  }

  signInForm = new FormGroup({
    email: new FormControl('', [Validators.required, Validators.email],),
    password: new FormControl('', [Validators.required, Validators.minLength(6)])
  });

  ngOnInit(): void {

  }

  onSubmit() {
    const email: string = String(this.signInForm.get('email')?.value);
    const password: string = String(this.signInForm.get('password')?.value);
    this.httpClient.post<any>(`${environment.apiUrl}/auth/sign_in`, {
      email: email,
      password: password
    }, {
      observe: 'response',
    }).subscribe(
      response => {
        const user: Omit<User, "password"> = new User();
        user.setId(response.body.data.id);
        user.setEmail(response.body.data.email);
        this.userRepository.setUser(user);
        this.router.navigate(['/dashboard']);
      });
  }
}
