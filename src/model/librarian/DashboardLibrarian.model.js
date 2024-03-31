const { pool } = require('mssql');
const { conn, sql } = require('../../config/db/index')

class DashboardLibrarianModel {
    async getTranS(result) {
        const pool = await conn;

        const sqlString = 'SELECT * FROM TRANSACTIONS T JOIN USERS U  ON T.CLI_ID = U.ID WHERE [STATE] = @state'

        await pool.request()
        .input('state', sql.VarChar, 'BORROW')
        .query(sqlString, (err, data) => {
                if (err) {
                    result(true, data)
                }
                else result(null, data.recordsets[0])
            })
    }

    async getConfirmTrans(TID, result){
        const pool = await conn;

        const sqlString = 'SELECT * FROM TRANSACTIONS T JOIN USERS U  ON T.CLI_ID = U.ID JOIN DETAILED_TRANS DT ON DT.TID = T.TID JOIN BOOK B ON B.BID = DT.BID WHERE T.[STATE] = @state AND T.TID = @TID'

        await pool.request()
        .input('TID', sql.VarChar, TID)
        .input('state', sql.VarChar, 'BORROW')
        .query(sqlString, (err, data) => {
                if (err) {
                    result(true, data)
                }
                else result(null, data.recordsets[0])
            })
    }
}
module.exports = new DashboardLibrarianModel