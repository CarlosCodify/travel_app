import {createStore, withProps} from '@ngneat/elf';
import {User} from "../models/user.model";

interface UserProps {
  token: string | null;
  user: Omit<User, "password"> | null;
}

const userStore = createStore(
  {
    name: 'user'
  },
  withProps<UserProps>({token: null, user: null})
);
