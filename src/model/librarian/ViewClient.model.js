const { conn, sql } = require('../../config/db/index')

class DashboardLibrarianModel {
    async getUsers(result) {
        const pool = await conn;

        const sqlString = 'SELECT * FROM USERS WHERE TYPE_USER = @typeUser'

        await pool.request()
        .input('typeUser', sql.VarChar, 'CLIENT')
        .query(sqlString, (err, data) => {
                if (err) {
                    console.log(err)
                    result(true, data)
                }
                else result(null, data.recordsets[0])
            })
    }
    async updateIsActive_model(UID, isActive, result){
        const pool = await conn

        const sqlString = 'UPDATE USERS SET ISACTIVE = @ISACTIVE WHERE ID = @UID'
        await pool.request()
        .input('ISACTIVE', sql.Int, isActive)
        .input('UID', sql.VarChar, UID)
        .query(sqlString, (err, data)=>{
            if(err){
                console.log(err)
                result(true, null)
            }
            else result(null, data.recordsets[0])
        })
    }
}

module.exports = new DashboardLibrarianModel