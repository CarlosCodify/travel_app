import {Component, OnInit} from '@angular/core';
import {UserRepository} from "../../store/user.store";
import {Router} from "@angular/router";
import {select} from "@ngneat/elf";
import {state} from "@angular/animations";
import {User} from "../../models/user.model";

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {
  email: string | undefined;
  constructor(private userRepository: UserRepository, private router: Router) {
  }

  ngOnInit(): void {
    let user = localStorage.getItem('user') ? JSON.parse(localStorage.getItem('user') as string) : null;
    if (user) {
      if (this.userRepository.getUser()) {
        this.email = this.userRepository.getUser()?.email;
      }
    }
  }
}
