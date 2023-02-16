import {Component, OnInit} from '@angular/core';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import AuthService from "../../services/auth.service";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(private authService: AuthService) {
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
    this.authService.login({
      email: email,
      password: password
    }).subscribe((res) => {
      console.log(res);
    });
  }
}
