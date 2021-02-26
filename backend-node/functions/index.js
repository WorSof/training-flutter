const functions = require('firebase-functions');
const app = require('express')();

app.post('/save', async (request, response) => {
  const userData = request.body;

  const serviceResponse = {
    code: '200',
    data: await require('./save')('users', userData),
  };

  response.status(serviceResponse.code).json(serviceResponse);
});

exports.server = functions.https.onRequest(app);
