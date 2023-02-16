import {HttpClient} from "@angular/common/http";
import {Injectable} from "@angular/core";
import {environment} from "../../environment";

@Injectable()
export default class AuthService {
  constructor(private httpClient: HttpClient) {

  }

  login({email, password}: { email: string | null, password: string | null }) {
    return this.httpClient.post(`${environment.apiUrl}/login`, {email, password});
  }
}
