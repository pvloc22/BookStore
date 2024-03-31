const {conn, sql} = require('../../config/db/index')

class historyModel{
    async showHistory(UID, result){
        const pool = await conn;
        
        const sqlString = 'READ_HISTORY'

        await pool.request()
        .input('ID', sql.VarChar, UID)
        .execute(sqlString, (err, data) =>{
            if(err){
                console.log(err)
                result(true, data)
            }
            else result (null, data.recordsets[0])
        })
    }
}

module.exports = new historyModel