const { conn, sql } = require('../../config/db/index')

class ViewBookInforLibrarianModel{
    async ViewBookInforLibrarianDelete(BID, result){
        console.log(BID)
        const pool = await conn;
        const sqlString = 'DELETEBOOK'

        await pool.request()
        .input('BID', sql.VarChar, BID)
        .execute(sqlString, (err, data)=>{
            if(err){
                result(true, null)
            }
            else
            result(null, null)
        })

    }
}
module.exports = new ViewBookInforLibrarianModel