const { Sequelize } = require('sequelize');
const sequelize = new Sequelize('postgres://test_user:password@localhost:5432/testdb')

async function SelectOne() {
    let q = 'select 1 as x'
    const [results, metadata] = await sequelize.query(q)
    return results
}

async function SelectAll() {
    let q = 'select * FROM xschema.xtable'
    const [results, metadata] = await sequelize.query(q)
    return results
}

module.exports = {SelectOne, SelectAll, sequelize}