class GetString {
  String id;
  String name;
  String tanggal_lahir;
  String username;
  String email;
  String password;

  String get str_id {
    return id;
  }

  void set str_id(String id) {
    this.id = id;
  }

  String get str_name {
    return name;
  }

  void set str_name(String name) {
    this.name = name;
  }

  String get str_tanggal_lahir {
    return tanggal_lahir;
  }

  void set str_tanggal_lahir(String tanggal_lahir) {
    this.tanggal_lahir = tanggal_lahir;
  }

  String get str_username {
    return username;
  }

  void set str_username(String username) {
    this.username = username;
  }

  String get str_email {
    return email;
  }

  void set str_email(String email) {
    this.email = email;
  }

  String get str_password {
    return password;
  }

  void set str_password(String password) {
    this.password = password;
  }
}

class DIID{
  String id;
  String get str_id {
    return id;
  }

  void set str_id(String id) {
    this.id = id;
  }
}

class AddDescrip {
  String id;
  String name;
  String description;
  String date;

  AddDescrip({this.id, this.name, this.description, this.date});

  factory AddDescrip.fromJson(Map<String, dynamic> map) {
    return AddDescrip(
        id: map["ID"],
        name: map["name"],
        description: map["description"],
        date: map["date"]);
  }

  Map<String, dynamic> toJson(){
    return{
      "ID":id,
      "name": name,
      "description": description,
      "date": date
    };
  }
  String toString() {
    return "AddDescrip{id : $id, Name: $name, description: $description, Username : $date}";
  }
}

class Account {
  String id;
  String name;
  String tanggal_lahir;
  String username;
  String email;
  String password;

  Account(
      {this.id,
      this.name,
      this.tanggal_lahir,
      this.username,
      this.email,
      this.password});

  factory Account.fromJson(Map<String, dynamic> map) {
    return Account(
        id: map["id"],
        name: map["name"],
        tanggal_lahir: map["tanggal_lahir"],
        username: map["username"],
        email: map["email"],
        password: map["password"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "Name": name,
      "Date Birth": tanggal_lahir,
      "Username": username,
      "Email": email,
      "Password": password
    };
  }

  String toString() {
    return "Account{id : $id, Name: $name, Date Birth: $tanggal_lahir, Username : $username, Email : $email,Password : $password}";
  }
}
