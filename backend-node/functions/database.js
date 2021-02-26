const admin = require('firebase-admin');

// Llave para establecer conexión con la base de datos
const serviceAccount = require('./training-flutter-personalsoft-firebase-adminsdk-631ch-de59c6d686.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL:
    'https://training-flutter-personalsoft-default-rtdb.firebaseio.com',
});

// Conexión para consultas a la base de datos
module.exports = admin.database();
