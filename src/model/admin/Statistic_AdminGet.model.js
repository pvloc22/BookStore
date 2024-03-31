const {conn, sql} = require('../../config/db/index')
class Statistic_AdminGetModel {
    async GetTransaction(result){
        const pool = await conn;
        const sqlString = 'SELECT * FROM TRANSACTIONS'

        await pool.request()
        .query(sqlString, (err, data) => {
                if (err) {
                    console.log(err)
                    result(true, data)
                }
                else result(null, data.recordsets[0])
            })
    }

}

module.exports = new Statistic_AdminGetModel