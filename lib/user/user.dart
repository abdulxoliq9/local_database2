class User{
   String? email;
   String? password;
   String? number;
   String? address;

   User({this.email,this.password,this.number,this.address});

   Map <String,dynamic> toJson() =>{
      'email':email,
      'password':password,
      'number':number,
      'address':address,
   };

   User.fromJson(Map<String,dynamic> json)
   : email=json['email'],
     password=json['password'],
     number=json['number'],
     address=json['address'];
}