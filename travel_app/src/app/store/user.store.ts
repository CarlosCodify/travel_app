import {createStore, setProp, withProps} from '@ngneat/elf';
import {User} from "../models/user.model";
import {Injectable} from "@angular/core";

interface UserProps {
  user: Omit<User, "password"> | null;
}

const store = createStore(
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
    store.update(setProp('user', user));
  }

  getUser() {
    return store.getValue().user;
  }

  setUser(user: Omit<User, "password">){
    store.update(setProp('user', user));
  }
  clearUser() {
    store.reset();
  }

  updateUser(user: User) {
    store.update((state) => ({
        ...state,
        user
      })
    );
  }
}

