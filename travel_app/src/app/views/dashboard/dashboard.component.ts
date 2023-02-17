import {Component, OnInit} from '@angular/core';
import {UserRepository} from "../../store/user.store";
import {User} from "../../models/user.model";
import {Router} from "@angular/router";

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  constructor(private userRepository: UserRepository, private router: Router) {

  }

  ngOnInit(): void {
    const user: User = localStorage.getItem('user') ? JSON.parse(localStorage.getItem('user') as string) : null;
    if (user) {
      this.userRepository.setUser(user);
    }else {
      this.router.navigate(['/login']);
    }
  }
}
