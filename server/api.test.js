const api = require('./api')

describe('My Test Suite', () => {
    test('Test value is 2', () => {
      expect(2).toBe(2)
    });

});

// describe('API Calls', () => {
//     afterAll( async() => {
//         const x = await api.sequelize.close()
//         console.log(x)
//     });
  
//     test('check is one', async() => {
//         const results = await api.SelectOne()
//         let x = results[0]['x']
//         console.log(x)
//         expect(x).toBe(1)
//     })
// });