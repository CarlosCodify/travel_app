import {createState, createStore, select, setProp, withProps} from '@ngneat/elf';
import {User} from "../models/user.model";
import {Injectable} from "@angular/core";

interface UserProps {
  user: Omit<User, "password"> | null;
}


const userStore = createStore(
  {name: 'user'},
  withProps<UserProps>({
    user: null
  }),
);

@Injectable({
  providedIn: 'root'
})

export class UserRepository {
  addUser(user: User) {
    userStore.update(setProp('user', user));
  }

  getUser() {
    return userStore.getValue().user;
  }

  setUser(user: Omit<User, "password">){
    userStore.update(setProp('user', user));
    this.saveToLocalStorage(user);
  }
  clearUser() {
    userStore.reset();
  }

  updateUser(user: User) {
    userStore.update((state) => ({
        ...state,
        user
      })
    );
  }

  isEmpty() {
    return userStore.getValue().user === null;
  }

  private saveToLocalStorage(user: Omit<User, "password">) {
    localStorage.setItem('user', JSON.stringify(user));
  }

  private saveToCookie(user: Omit<User, "password">) {
    document.cookie = `user=${JSON.stringify(user)}`;
  }
}

