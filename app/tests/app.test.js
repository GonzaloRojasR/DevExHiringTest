const request = require('supertest');
const app = require('../src/index');

describe('GET /desafio', () => {
  it('debe responder con "¡Hola Mundo!"', async () => {
    const res = await request(app).get('/desafio');
    expect(res.statusCode).toBe(200);
    expect(res.text).toBe('¡Hola Mundo!');
  });
});
