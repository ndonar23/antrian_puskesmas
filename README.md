# antrian_puskesmas
Sistem Antrian Puskesmas Digital Untuk memudahkan Pelayanan dalam Puskesmas
<div align="center">

</div>

<div align="center">
   Recipe App
</div>


<br>
<table align="center">
    <tr>
<!--         <th style="text-align:center">
            <a href="">
                <img src="https://cdn.svgporn.com/logos/youtube-icon.svg" width="40">
            </a>
        </th> -->
        <th style="text-align:center">
            <a href="https://https://www.instagram.com/ndonar_23/">
                <img src="https://github.com/aritraroy/social-icons/blob/master/instagram-icon.png?raw=true" width="40">
            </a>
        </th>
<!--         <th style="text-align:center">
            <a href="#">
                <img src="https://cdn.svgporn.com/logos/google-gmail.svg" width="30">
            </a>
        </th> -->
    </tr>
</table>
<br>

## Requirements

### TOOLS
- Flutter
- Node JS
- Firebase

### FIRST
```
  Create new flutter project
```
```
  Copy and paste file into your project
```
### Edit pubspec.yaml
```
  dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  get: ^4.6.6
  curved_navigation_bar: ^1.0.4
  cloud_firestore: ^4.17.5
  firebase_core: ^2.32.0
  firebase_auth: ^4.20.0
  flutter_easyloading: ^3.0.5
  random_string: ^2.3.1
  shared_preferences: ^2.2.3
  image_picker: ^1.1.2
  firebase_storage: ^11.7.7
  http: ^1.2.1
  awesome_dialog: ^3.2.1
```
```
  assets:
    - images/
```

### Install Flutter Package
```
flutter pub get
```

### Install Firebasetools
``` 
  npm install -g firebase-tools
```

### Login Firebase in your VS Code
``` 
  firebase login
```

## Setting Firebase Console
- Go to [Firebase Console](https://firebase.google.com)
- Add new Project
- Create Authenthication -> Email/Password
  <img src="https://raw.githubusercontent.com/2030XMQiu/RECIPE-APP-FLUTTER-WITH-ADMIN-PANEL/main/Screenshot/Screenshot%202024-06-11%20104740.png"/>
- Create Firestore Database -> set rules ->  allow read, write: if true;
- Create Firestore Storage -> set rules ->  allow read, write: if true;
- <img src="https://raw.githubusercontent.com/2030XMQiu/RECIPE-APP-FLUTTER-WITH-ADMIN-PANEL/main/Screenshot/Screenshot%202024-06-11%20105106.png"/>
- Create Collection Firestore Database
- <img src="https://raw.githubusercontent.com/2030XMQiu/RECIPE-APP-FLUTTER-WITH-ADMIN-PANEL/main/Screenshot/Screenshot%202024-06-11%20213441.png" />
- <img src="https://raw.githubusercontent.com/2030XMQiu/RECIPE-APP-FLUTTER-WITH-ADMIN-PANEL/main/Screenshot/Screenshot%202024-06-11%20213555.png" />

### Add Firebase Project to Flutter
``` 
  flutter pub global activate flutterfire_cli
```
``` 
  flutterfire configure
```
- Select your Firebase Project

### Run Your Flutter Project
``` 
  flutter run
```
## Admin Panel Or User
- Go to lib/main.dart
- For Admin Panel -> home: AdminLogin()
- For User -> home: Onboarding()

## Screenshot

<table align="center">
    <tr>
        <th style="text-align:center">
            <a href="">
                <img src="https://github.com/ndonar23/antrian_puskesmas/blob/main/Gambar%20WhatsApp%202024-06-14%20pukul%2021.18.18_b252bbf3.jpg" height="500" width="600" />
            </a>
        </th>
        <th style="text-align:center">
            <a href="#">
                <img src="https://github.com/ndonar23/antrian_puskesmas/blob/main/Gambar%20WhatsApp%202024-06-14%20pukul%2021.18.41_58a32553.jpg" height="500" width="600" />
            </a>
        </th>
       <th style="text-align:center">
            <a href="#">
                <img src="https://github.com/ndonar23/antrian_puskesmas/blob/main/Gambar%20WhatsApp%202024-06-14%20pukul%2021.18.41_b4f096bf.jpg" height="500" width="600" />
            </a>
        </th>
    </tr>
</table>




---

## DBAD license

```sh
  > Version 1.0, June 2024

  > Copyright (C) [2024] [Mqiu Developers]

  > M. Andon Arifin
  > Silviana Agustin
  > Zainal Arifin
  > Diah Fitriani

  Everyone is permitted to copy and distribute verbatim or modified
  copies of this license document.

```

