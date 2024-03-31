const { conn, sql } = require('../../config/db/index')
class ConfirmReturnLibrarianModel {
    async UpdateConfirm(TID, result){
        const pool = await conn;

        const sqlString = 'UPDATE TRANSACTIONS SET [STATE] = @state WHERE TID = @TID'

        await pool.request()
        .input('TID', sql.VarChar, TID)
        .input('state', sql.VarChar, 'CONFIRM')
        .query(sqlString, (err, data) => {
                if (err) {
                    result(true, data)
                }
                else result(null, data)
            })
    }
}
module.exports = new ConfirmReturnLibrarianModel